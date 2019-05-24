Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id BD41C60685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 12:42:26 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id m3so15501932itl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 05:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t7XLqw++Dv17ogXMjQPKBxLR8WAFBi3N3IzghWyvg5c=;
	b=jKVd8OuYOguhvM2Zxoej6tB1Im8+bunSBcJvWcD+DXceA6kGQ+gDgnRj59clZOBnZ4
	6Nle1Zds6YrRlQLnXD/0Zg5CfuvWy8kVhEAfvVaj/J/BXii6M9DNYys8QpCIeA+Wov0p
	oNDzdYNInqp4+AG+SIatWhXzTnpO37ot2dpdVKo/E26OELx6IQAG3T6P/P2TTCKiStkv
	kQuT/M3L6GyaEhXwGqyTcJnfYNi3+0O20uZo5LL5t3k6vHbKhZnP5gyrdDwSmuJL1Xbz
	F9OzUemw6/LbmGo4yTsY11A3mQ2Poeotwog8b/ZPHPvtYvyavqMSPWznbQFm/QN9kZ1e
	fFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t7XLqw++Dv17ogXMjQPKBxLR8WAFBi3N3IzghWyvg5c=;
	b=gd+ZVyWQrVPahHGrkPJ7dyxO1hpbyY25OALv0ZoPh7eXr/iXpDGee2fDm4LzF15p1P
	S43D4EJjOYvKRKI5x1S1804Pypbbylmgpgw/ojRQoHTW+w0mQWkmVx7jim5qmERNl/OJ
	REH5Ni6dODcnqSu+ZPXdxz2EXztBF2w04zBdlqpgjmGZB0IuwNXuDkEJxMG1v7WwwHsE
	CpBrfQG0N+15neoZiIFRmCEPeDVv4HOOJeqixI3KsQkX2K3zei/9By99l3tbCIg9Mspc
	c3crut6uxD4jyUK8A14OBMAWx3GcQJB1wneHyzQvL9Oe5akoZGYz0ESegK5di5JOdpQj
	3JqA==
X-Gm-Message-State: APjAAAXH0e8rkqGFS0So3iFOO7/XZjpcjUgVoZHPiaf7pH7kMbBqeTcd
	y7jfLzOiap2V9G1trev2HyQ1JUHRasC6f7OsChC1tQ==
X-Google-Smtp-Source: APXvYqy/1acZp1XAXPtYvHsquTatOTZqd5SyV0nz0eiLReWTPKO/2viE02P/Dx+O21DNmUPQ/PbMT6m6gWrfeDEp7lU=
X-Received: by 2002:a24:2c48:: with SMTP id i69mr16598626iti.133.1558701747765;
	Fri, 24 May 2019 05:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <1558679856-10339-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1558679856-10339-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 May 2019 13:42:15 +0100
Message-ID: <CAJTo0LbEXnKfSfOtpj3QVL9xsjsQJTuiZAGarPEFNz4v7q7_8w@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] alsa-utils: fix multilib names
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
X-List-Received-Date: Fri, 24 May 2019 12:42:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 May 2019 at 07:38, <liu.ming50@gmail.com> wrote:
> -SUMMARY_alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
> +SUMMARY_${MLPREFIX}alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"

Why not replace alsa-utils-alsabat with ${PN}-alsabat?

Ross

