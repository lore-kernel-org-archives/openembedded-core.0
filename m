Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXJmQ-0007wH-Sp
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 00:11:43 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 23 May 2012 15:00:53 -0700
Received: by dano14 with SMTP id o14so10446304dan.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 15:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=enL3Fkk6CUHFIKfjsYC57FU649k2yDqTLKgBhleAOfw=;
	b=ZjmosWEKOlSruDrxIXD0ELiE1SZcGkwWyD87NPWIgXGt6tKOFV577WeLYKhLWdcdLF
	mRKEdB70Zm08xgnOgtc6iRs93otWCxLHYOayTjR6rS6Pw3fasF5roPOlAfZqqyTygVU4
	wxliP9BgNZdxgfZTDS8rFpuxMitTUM7nm6X7jubt7DVAiWTGRna23VaZmWOlJ/L2UPkR
	eB2sW1F/r3YKTrTuAEBygX7P2vKAD0zrhvwz83Exy0ep/S6oA+IFngt/gJH2dWeaBNPP
	+0YdZlo6ULSmH8KgtK4RLon+EUoE32HFlL67h8pG9RgTmjMgrA+AXq8dSYDjVifueI1I
	/UzQ==
Received: by 10.68.234.129 with SMTP id ue1mr10549223pbc.140.1337810453264;
	Wed, 23 May 2012 15:00:53 -0700 (PDT)
Received: from [192.168.1.105] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id x1sm3106639pbp.50.2012.05.23.15.00.50
	(version=SSLv3 cipher=OTHER); Wed, 23 May 2012 15:00:51 -0700 (PDT)
Message-ID: <4FBD5E10.3070403@intel.com>
Date: Wed, 23 May 2012 15:00:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlcJ2BifDbHDZhWiN3EYosKZzv6mhaMcFcvMa5nyHtmrJmPCKEvIGZA4GmEycZEJAwqtPJR
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, poky@yoctoproject.org
Subject: RFC: Merging commits from into the main denzil branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2012 22:11:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

As most of you know, I've been pulling commits into a pair of 
sgarman/denzil-next branches which are intended to eventually become the 
next Denzil point-release, 1.2.1.

oe-core based branch:
http://git.openembedded.org/openembedded-core-contrib/log/?h=sgarman/denzil-next

poky based branch:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgarman/denzil-next

So far I haven't merged or requested to merge any of these commits into 
the main denzil branches of oe-core and poky, for two main reasons:

1. I've only performed the most basic build testing of these branches on 
a desktop system, building core-image-minimal and core-image-sato for 
our 5 qemu machines.

2. To date, we haven't had a clear process on how to transition from the 
maintainer's personal branch into the official repo branch. I'd like to 
develop a clear and documented process on doing this that involves 
community feedback on the commits.

Just this week I've been able to start using the Yocto autobuilder to do 
more comprehensive testing of my denzil-next branch, so issue #1 is 
finally resolved, and I've got a green build to raise my confidence level:

http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/462

So now to address issue #2. The goal is to incorporate community 
feedback, so I'm looking to get ACKs or NAKs for these commits before 
they go into the main denzil branch.

My proposal is to send denzil pull requests to the appropriate mailing 
lists, and Richard can merge them into the main repo denzil branches 
once they've received review by the community.

My goal is to send these pull requests about once per week, once I've 
managed to get a green build out of the Yocto autobuilder for my contrib 
branch.

What do folks think about this? Now's your opportunity to offer feedback 
and influence this process.

Thanks!

Scott

Yocto 1.2.1 release maintainer

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


