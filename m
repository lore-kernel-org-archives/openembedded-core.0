Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BA4C76B6F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uASDjb55023200; Mon, 28 Nov 2016 13:45:45 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WZXiNqWR14m5; Mon, 28 Nov 2016 13:45:45 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uASDjgNQ023207
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Nov 2016 13:45:43 GMT
Message-ID: <1480340742.28508.172.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Mon, 28 Nov 2016 13:45:42 +0000
In-Reply-To: <1480339031.6873.181.camel@intel.com>
References: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
	<1480334664.28508.167.camel@linuxfoundation.org>
	<1480339031.6873.181.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: ASSUME_PROVIDED versus SANITY_REQUIRED_UTILITIES versus "The Build Host Packages"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Nov 2016 13:46:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-11-28 at 14:17 +0100, Patrick Ohly wrote:
> I recently ran into a third usage of "file-native": swupd-server
> links against libmagic from file and therefore has a DEPENDS =
> "file". But building swupd-server-native didn't actually build file
> because of ASSUME_PROVIDED and because I hadn't installed libmagic-
> dev on my build host, the build was failing.
> 
> Is there a way to declare that ASSUME_PROVIDED does not apply to this
> case? It sounds like there is a way (based on your comments about
> building file-native when building file and the libbz2-devel
> example), but it did not become clear to me how that works in
> practice.

If you look at the file recipe, you'll see:

DEPENDS = "zlib file-replacement-native"


> Or is it just a case of educating the developer that libmagic-dev
> needs to be installed on the build host in addition to the file
> command?

No, DEPENDS on file-replacement-native.

Cheers,

Richard

