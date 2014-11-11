Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB9A65CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 10:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sABAt4KA001657; Tue, 11 Nov 2014 10:55:04 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ka8ubtkiAJCJ; Tue, 11 Nov 2014 10:55:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sABAsmO2001653
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 11 Nov 2014 10:54:59 GMT
Message-ID: <1415703324.2820.37.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Tue, 11 Nov 2014 10:55:24 +0000
In-Reply-To: <1415457765.2820.21.camel@linuxfoundation.org>
References: <cover.1415390286.git.peter.seebach@windriver.com>
	<d2ce73488a8afb7a8d10286da138810d30b4a4be.1415390286.git.peter.seebach@windriver.com>
	<1415457765.2820.21.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] eglibc-use-option-groups.patch: Several fixups
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
X-List-Received-Date: Tue, 11 Nov 2014 10:55:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-11-08 at 14:42 +0000, Richard Purdie wrote:
> On Fri, 2014-11-07 at 13:59 -0600, Peter Seebach wrote:
> > This incorporates suggested changes for issues 6797 and 6809 from
> > bugzilla, and a proposed change for 6796. For 6796, the issue is
> > that you can't just include <gnu/option-groups.h> in libc-symbols,
> > so we may not always have the option group defines available. The
> > workaround is to just leave the HAVE_MBSTATE_T definition visible;
> > the obvious relevant usage is already also conditionalized on
> > the option group locale define by this patch. This might not fix
> > all the cases if the locale group isn't enabled, but it eliminates a
> > pretty large raft of -Wundef warnings.
> > 
> > The reason HAVE_MBSTATE_T wasn't conditionalized in 2.19 is that
> > it didn't exist in 2.19.
> > 
> > Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> 
> Whilst I haven't 100% confirmed it,
> https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/102/steps/BuildImages/logs/stdio
> looks like it may well be as a result of this change (which was included
> in the master-next build in question)...

It is 100% confirmed now, with the patch reverted there was a green
build.

Cheers,

Richard


