Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 532066F778
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:33:22 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id lx4so9558814iec.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=H2OQV2wfoaRkWDdny7h8iwdZNO8QgQmF2mmHwu86tVQ=;
	b=CHH0W71wCxcx/KYSu9QLoXTOXYcnb3k4OeXn8iyW5d4JyiNdyqhQohccM/G9fFeGWs
	/rOAt8HvE1t8fpFA26U0kDxfrPMTTlJNW5GbzWrUCewUve1jjyUUYOtX2Ev05skicGuc
	8Kb+tt440HYIK2nVx8tlJu1r0Zvl+ducOGLkTNrcksoJ1s/uxadOK0X0ZYfd1+kXRqcS
	H+ZB7mE1KXMMbnJTeyW4bVVA6yVsjOZwVEjoSYH/1GQIZn2OD24tLVDsWwKNCRywoczR
	HHJBULHlU2Zt7hOWmYSfGJZz7yiyAuTsaeDKhyHZoIK3v2tOj2FrGM25j6pKRSKYs5aG
	B/Nw==
X-Gm-Message-State: ALoCoQmWFvDV08xIx9+F9g1BBO8sr3hv0uL3PXEnmZjdfq8zzYTgyqrZY34NXqNDK1Lp6VLN1763
X-Received: by 10.43.141.12 with SMTP id jc12mr44381040icc.21.1396373603355;
	Tue, 01 Apr 2014 10:33:23 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id y9sm33395549igl.7.2014.04.01.10.33.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Apr 2014 10:33:22 -0700 (PDT)
Message-ID: <533AF862.5000201@linaro.org>
Date: Tue, 01 Apr 2014 13:33:22 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: OE/TSC monthly IRC meeting notes - Apr 1 2014
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
X-List-Received-Date: Tue, 01 Apr 2014 17:33:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Here are my notes from today's monthly OE/TSC meeting which takes place
the first Tuesday of every month on freenode's #oe channel.

attendees: bluelightning, Jefro, RP, denix, tlwoerner, fray, nerdboy,
kergoth

topic #1: upcoming release
- schedule: https://wiki.yoctoproject.org/wiki/Yocto_1.6_Schedule
- check RP's email
http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091378.html
- test report for rc1 is available:
https://wiki.yoctoproject.org/wiki/WW13_-_2014-03-26_-_Full_Pass_Release_1.6_M5.rc1
- optimism for a good 1.6 release
- enhancements such as READMEs still being accepted
- bug fixes (such as work on SOBBW issues) still being accepted
- bug metrics showing downward trend:
https://wiki.yoctoproject.org/charts/combo.html

topic #2: SOBBW (state of bitbake world) or world build status
- http://www.openembedded.org/wiki/Bitbake_World_Status
- fixing items on the list still needs lots of help, helpers needs a way
to organize themselves to avoid duplication (email, wiki, irc, ...)
- one cause/issue is people sending patches then disappearing, lots of
unmaintained recipes
- possible solutions: meta-nonworking, blacklist.bbclass, smaller "core"
layer

topic #3: website infrastructure and updates
- at ELCE2013 plans were made for a new
http://www.openembedded.org/wiki/Main_Page
- no plans yet for OE wiki cleanup
- unfortunately the people working on this weren't available to provide
an update

open topics
- please make sure any requests for 1.7 are in bugzilla
- recipe style unification between OE and Yocto Project

action items:
- RP to look for remnants of BROKEN = "1" (?)
- fray to move blacklist issue forward with JaMa
- tlwoerner to sync style guides

next meeting: May 6th 2014, same time, same place

