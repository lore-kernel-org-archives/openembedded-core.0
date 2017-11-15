Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id B873A7865E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 19:59:21 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id g104so8522384otg.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 11:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=IS8PD0bvhlfWaanjMCfxeqx3WoIrXQH6iMRgXAD07p4=;
	b=uktFIEUZ2nq4ZwNiH0fq1OPEyakl2kcp+NIyI8e4K6DLZt/mmAPWnCr2ogwrD2fOFM
	UUgMC40YlBqChPK8tqDNFAMf3ebyQszLWL7P49bDozi93pn8f0kGkqy8F36L466Gbaqp
	o4klXc8VnFwoLrfF5QLhC0d8CIty6W0KoKrKhSSjsX/1R5+oYeT6QZTkhnbObtlmBo4i
	EmvuJXmplizTxmIzPFOy9LBPE2l7F1rCgweKVVxIqXzAkB8Kld76aqB2l4ku7h+k59j4
	KC/TNzy78fMRAPjE5ttQK9sGUcpetA0JCfmGk05Jjupoa88AzQqK2ZAFWoHDFvUqNCDW
	c/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=IS8PD0bvhlfWaanjMCfxeqx3WoIrXQH6iMRgXAD07p4=;
	b=n861fFnLo/7VGU5ei0qJh1icxE++iC/kNn8JqTxFufVw/OcAfAeSKCO3ZvpGXFCVco
	9FLq+ym6LpKfaZWXHEUZxz31JzaiAQ+GXKHvkbT1uwA0+akG/1lA6p7iQ1jVYXr6jmEF
	lgeQJTjHIBQ1vvfRRtOw5/lK0/OFobJJH8iHzksme9Ak4ZFtW9Sg+hp4wiQYmb/CvAMi
	FuwNTM5QqT+8a0fOfv8XLq4ax0ISWgozyv0VRI++kAyQoU+pnDOpQ5cHhHclL/cHc1Wd
	N4rCJaSQkhFJJeJbt0qIUbFOLnMoBJfA/QZ6cpqu60/T7sDOETkEP3Rvsvurg08+xaha
	k1sQ==
X-Gm-Message-State: AJaThX5uzL3WN0H2mgHzCLE7rb4iuIWskroElcT5gbDJrfwqt3LKggEX
	VDuQKWNb0kI2Wne2rgMLMlE136+t
X-Google-Smtp-Source: AGs4zMa0OzSk+Pnl4guzm1rrQ6aIkW0Zq4zVoBnpYOx2gapGDxG+vSipearuacowYgec0ngGEMrVdg==
X-Received: by 10.157.28.131 with SMTP id l3mr11311409ota.326.1510775962539;
	Wed, 15 Nov 2017 11:59:22 -0800 (PST)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	w83sm5635711oif.28.2017.11.15.11.59.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 11:59:21 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id l138so6766243oib.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 11:59:21 -0800 (PST)
X-Received: by 10.202.217.6 with SMTP id q6mr10694312oig.37.1510775960765;
	Wed, 15 Nov 2017 11:59:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Wed, 15 Nov 2017 11:59:19 -0800 (PST)
In-Reply-To: <CAJTo0LYfAYZruf=9WYFqD2ae2==LdTGwayFeXPxtQ7ROPm-T2w@mail.gmail.com>
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
	<CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
	<CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
	<CAJTo0LYfAYZruf=9WYFqD2ae2==LdTGwayFeXPxtQ7ROPm-T2w@mail.gmail.com>
Date: Wed, 15 Nov 2017 17:59:19 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqxjDsS34yZ1G0h1wRvZ2QGfOD2rr=+2DG1KGuwcePmTQ@mail.gmail.com>
Message-ID: <CAP9ODKqxjDsS34yZ1G0h1wRvZ2QGfOD2rr=+2DG1KGuwcePmTQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Drop rng-tools
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
X-List-Received-Date: Wed, 15 Nov 2017 19:59:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 10:26 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 14 November 2017 at 17:16, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> Hello Ross,
>>
>> On Mon, Nov 13, 2017 at 5:55 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> > Can you explain why?
>>
>> We are using QEMU ARM for runtime tests on CI for updatehub, on this,
>> when we run something that required entropy just after boot and
>> especially if running inside of a Docker, it fails badly for 140s.
>> Adding rng-tools solves it :-)
>
>
> Are you enabling the virtio-rng driver so qemu can bridge the host entropy
> into the guest?

I am not. Do you have an example of command line for it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

