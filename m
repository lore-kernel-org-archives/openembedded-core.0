Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0FDBC60268
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2016 18:17:32 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161106181732844_0684;
	Sun, 06 Nov 2016 18:17:32 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=52520 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c3S0T-0001bc-Pu; Sun, 06 Nov 2016 13:17:25 -0500
Date: Sun, 6 Nov 2016 13:16:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Tim Orling <ticotimo@gmail.com>
In-Reply-To: <CANx9H-DKBM9qaLr9+d0pa7YgoBs6qz6SqoJrG8L_hN0ua0xQDQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1611061315380.20227@localhost.localdomain>
References: <alpine.LFD.2.20.1611060625550.19174@localhost.localdomain>
	<CANx9H-DKBM9qaLr9+d0pa7YgoBs6qz6SqoJrG8L_hN0ua0xQDQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "Can't install perl-soap-lite-1.20-r0@all: no package provides /bin/env" ??
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
X-List-Received-Date: Sun, 06 Nov 2016 18:17:34 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-793639616-1478456184=:20227"

--8323328-793639616-1478456184=:20227
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 6 Nov 2016, Tim Orling wrote:

> https://github.com/redhotpenguin/soaplite/search?utf8=✓&q=%2Fbin%2Fenv
>
> It's only for the tests (in the ${S}/t directory by convention for
> perl modules). I would try just doing sed to /usr/bin/env on all
> those.

  that's what i did, fixed the problem.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-793639616-1478456184=:20227--
