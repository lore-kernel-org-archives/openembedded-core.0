Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F14E3776C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 15:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2EFEFS3010553; Tue, 14 Mar 2017 15:14:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D7smabUewZiU; Tue, 14 Mar 2017 15:14:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2EFEBNn010537
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Mar 2017 15:14:12 GMT
Message-ID: <1489504451.13980.41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org, Mark Hatle
	<mark.hatle@windriver.com>, Burton Ross <ross.burton@intel.com>
Date: Tue, 14 Mar 2017 15:14:11 +0000
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/44] Replace Smart package manager with DNF package manager
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
X-List-Received-Date: Tue, 14 Mar 2017 15:14:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-03-10 at 13:23 +0200, Alexander Kanavin wrote:
> This patchset replaces the outdated, unsupported Smart package
> manager with DNF package manager (Fedora's successor to yum). This is
> not a trivial change and there are many consequences:

I've been pondering this for a while, whether it should go into 2.3 or
not. For better or worse, I've ended up deciding to push it in.

I'm not 100% sure every piece of this is ready. In particular:

* the /bin/sh nativesdk hack - really need to find a better way of 
  doing that
* the packagegroup change makes me nervous
* the rpm package naming also makes me nervous although I don't mind 
  being different to the rest of the world if that works for us 
  (unlike Mark who has more concern with that)
* I found relocation issues in my own testing

Despite this I merged it on the basis that I'd rather have this in pyro
rather than waiting another 6 months to get this in and having to tell
people we were changing soon and having to deal with any more smart
issues.

This could mean more work in backporting to fix issues in the stable
release and point releases but so be it.

Lets hope I've made the right call! :)

Cheers,

Richard

