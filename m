Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0A460110
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 15:39:55 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id ho8so99356290pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 07:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=VWwHCRBn3DCWodZmwQG43W77d2SXCiwFPjIra+A1AAg=;
	b=pDWAnDzojXc0ZDo87LbSHWY0t3vUXzlXt1d+5OZ8FWcnRtaF1pDiJjzgdLu+nSpDlI
	DuuV1jEm3uEBA0UaRycanRLdj2kyPBpneA9a6I3GMFFc1vr4s843hrbschC8T6qhj9NM
	zrK1gp2QsICXxWufTxV0LIOx8zmzZhPYcNA3TkU7P4pVm8X+5/Jhd8rKL2I6IkGUjhrh
	bU/wgdv95vzE9Z3uqutEMI7T5s6HmT8UErZveCq+qLdupNFcTrSc8tYXtIg41alaGync
	nTX2v1Dtq93FCw5O3lj4553FwvQ1GpeCQNTiBUoguwACwG29HTgoR7Kmb4gmD24bb2bm
	yptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=VWwHCRBn3DCWodZmwQG43W77d2SXCiwFPjIra+A1AAg=;
	b=aNP9WF8mn/eKu0yTo2kNDvujCFY157IeYExl/sUD23nQeNpbiZxSR68ypBmbuyB45k
	105hTY/pF+UjzW9YDQX76TZK1nPNVU8wP9+EJyYpim55M3PD85kIe2jC3IBE5+P2moYq
	oZeEqvPtBriheghMON35/mLzpX7nbBPKdVuiNMfOcOiAMvMwemtdHM4P68O8gzVKRj8c
	wxw/DW5xYC6Me/bA3AJHk/+Sub4l0ghId00HwbMVgJUUmno9AH/uijNJ6Kdax0NKt2AV
	+MgA5fLi3G93IFQVl2pFljMKAgw6btvLItRerycTmfQKmZGzxi3Z6h0UmcYRsoUv+DYD
	/jLQ==
X-Gm-Message-State: ALoCoQnYCZEt52syMyR6cs0/l2J2WckbL28CnsMBJn5QgitzGSLJdCOSCCe1DCAZbX03Br4fEpMJRzZ0GZVDann4pTCAjDdKaA==
X-Received: by 10.67.15.73 with SMTP id fm9mr166824223pad.130.1452699596611;
	Wed, 13 Jan 2016 07:39:56 -0800 (PST)
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com.
	[209.85.192.173]) by smtp.gmail.com with ESMTPSA id
	r89sm3457161pfa.57.2016.01.13.07.39.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2016 07:39:55 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f173.google.com with SMTP id e65so83279625pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 07:39:54 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.31.84 with SMTP id f81mr43417487pff.98.1452699594043;
	Wed, 13 Jan 2016 07:39:54 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 13 Jan 2016 07:39:53 -0800 (PST)
In-Reply-To: <201601131534.58933.marex@denx.de>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<CAP9ODKr1iOkB-n7yfyOGk0dYnuni1V5=84k1CK1eG+TPFsFLuA@mail.gmail.com>
	<201601131534.58933.marex@denx.de>
Date: Wed, 13 Jan 2016 13:39:53 -0200
X-Gmail-Original-Message-ID: <CAP9ODKohVDvN=bnowqXaHa_3yNvOf70EevWwV6T9rrNLbEHxOA@mail.gmail.com>
Message-ID: <CAP9ODKohVDvN=bnowqXaHa_3yNvOf70EevWwV6T9rrNLbEHxOA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Wed, 13 Jan 2016 15:39:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador wrote:
>> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
>> > Upgrade U-Boot to latest version and drop upstreamed patches.
>> >
>> > Repair configuration of U-Boot during build. It is no longer
>> > possible to run "make foomachine" in U-Boot. Instead, it is
>> > necessary to do "make foomachine_defconfig ; make". Fix this
>> > in u-boot.inc and u-boot-fw-utils*.bb .
>>
>> Please drop this config suffix, from u-boot.inc. The config value
>> should be used as is and the respective BSP ought to be fixed to
>> change _config to _defconfig.
>
> If I don't have the _defconfig there AND I define UBOOT_MACHINE in my machine
> file, it will call "make machine", which no longer works.

I know and the right fix is to use the right value to UBOOT_MACHINE as
we do for KERNEL_DEVICETREE.

Doing this 'under the hood' change hides wrong settings and I think we
should no do this. the defconfig is in use for a while (2 release,
from YP point of view) and people had time to move the BSP to use
proper values.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

