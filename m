Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE26771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 08:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8D8YxhY018700; Tue, 13 Sep 2016 09:34:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fmtg9IcptqIa; Tue, 13 Sep 2016 09:34:59 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8D8Yt7n018697
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 13 Sep 2016 09:34:57 +0100
Message-ID: <1473755695.7207.26.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2016 09:34:55 +0100
In-Reply-To: <7df73b67-6880-ee6c-a18a-1e2a6ac9e5b7@windriver.com>
References: <7df73b67-6880-ee6c-a18a-1e2a6ac9e5b7@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: "LOCK, JOSHUA" <joshua.g.lock@intel.com>
Subject: Re: About runqemu's use cases
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
X-List-Received-Date: Tue, 13 Sep 2016 08:35:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-09-13 at 10:53 +0800, Robert Yang wrote:
> Hello,
> 
> We have a new oe-core/scripts/runqemu now, and I'd like to add
> something
> like "runqemu test" in the future to avoid regressions. It would help
> a
> lot if you can provide the info about how do you use runqemu. There
> is
> a bug tracking this:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10249
> 
> You can reply here or reply in the bug.

Wouldn't this be a case for "oe-selftest -r runqemu" and create a
runqemu test suite within oe-selftest like we do for other components?

Cheers,

Richard



