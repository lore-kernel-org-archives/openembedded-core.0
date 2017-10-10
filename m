Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9476077BC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 20:31:12 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id z19so9677395qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 13:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=iwChFd+Zaq7UT5UBgSPtkpn5aKx4CXVNOdCuDod2FPU=;
	b=DYJ3taB3U8eZAfUCBgyCxb2Iy3kKnMwL5UNj/qM4l6/ncGOOgmJFRzIgtOW9t3W8Dy
	Nsj3koEIYYgq4skUQmNX6PtsnpywBwqehOiBYMo61QM9W3dELGLVXnwlnWut2p3VmyOp
	QNYmw1M92WwPzRm3qk4vwhVcB+xFnfNpzyi/yinwEhx1X/v/bdD1F3qsFtseNDhvjGaA
	CzklqJklMc7PIXFwL6SNlXD9koYyNbJlMjPSpsnmannTEVEEFSo36EOiBJTKDXv3j476
	BZWKJhj2LadWcKd9HElHIjxyV8SbMukAO0dfNzhjkq+tSZA5PCNJr3grMrMHVqKTZC/9
	BosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=iwChFd+Zaq7UT5UBgSPtkpn5aKx4CXVNOdCuDod2FPU=;
	b=XVWGlxu+L0f7P56lEt3+hNqzKPdM3YEI6B8EgcLjJhtRizwx43BdEH/tvyHM9TL4Qs
	wWGOYMLY/VTHW/C5vgIS7ZQ4gw+wD8VDp9qvdQWJX9NHX/EioPM1Nf6hNZlOLUHZimTh
	rxdHwj0B9CC9YxzcTXwO/4cjOjmwdgbWvoBr5wITVombW/tGD54NL41zvJkrQrk0iDLB
	vcBaHaT1FUPKzzUX8cMGCpb9U7o80S/tPtXaYuhuAubUvfD3mUEKkTqjcVdNkE0ZGimI
	l6bs0pRNEZlcKxmZGDTaFvA8C7SU/3SGpA+bvhMa2rkV8a1GFjPVUmoKVvCzdDJ4YBbK
	u8YQ==
X-Gm-Message-State: AMCzsaVzM1ChmDC1+6K8sIkPlddTt2XIk+qr0jwO0/JcxtGNenYPYz+2
	G1Z3RrIq5Trq0GlIQMCXDngRzfH2
X-Received: by 10.37.1.7 with SMTP id 7mr2872575ybb.419.1507667472977;
	Tue, 10 Oct 2017 13:31:12 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	f200sm3993120ywb.23.2017.10.10.13.31.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 13:31:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id p126so47317301oih.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 13:31:10 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCW/k8lV4WJZlBUn+h7iHjvr+89BZW90IaaZdWEb67yO/4l4vAcMSbAV/2uVn6Ki+9ViXHgel4IJlkDTsRhlqw=
X-Received: by 10.157.41.100 with SMTP id d91mr2394699otb.426.1507667470249;
	Tue, 10 Oct 2017 13:31:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Tue, 10 Oct 2017 13:31:09 -0700 (PDT)
In-Reply-To: <CAMKF1sr-L-pescBejaL7hYOrXMr4ryb-p892QZ7QcnxdUhw-FQ@mail.gmail.com>
References: <20171007172923.36429-1-raj.khem@gmail.com>
	<CAJ86T=X78ockUQ_9tVizxo4JZwbDQu9s0B2dG2ud50Xg6q=28A@mail.gmail.com>
	<CAMKF1sobsTEyLA+8ade5ti8dZ5QeH-87qWw1Ot6fwb0Cw8oSRQ@mail.gmail.com>
	<CAJ86T=Xw2VTOFKODCXR+UpMmUuTT-TaT75h4i9LiVz7mNiRt1Q@mail.gmail.com>
	<CAMKF1sr-L-pescBejaL7hYOrXMr4ryb-p892QZ7QcnxdUhw-FQ@mail.gmail.com>
Date: Tue, 10 Oct 2017 17:31:09 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpv2Gh1_Kcm0c=fHMTeZxePni5ztfPtBDPR-Ya_NOX0EA@mail.gmail.com>
Message-ID: <CAP9ODKpv2Gh1_Kcm0c=fHMTeZxePni5ztfPtBDPR-Ya_NOX0EA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-6.3: Backport patch to fix ICE on ARM
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
X-List-Received-Date: Tue, 10 Oct 2017 20:31:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 5:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Oct 10, 2017 at 12:55 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Just having the upgrade available to the community is useful, even if
>> there are no guarantees or testing. I've backporting gcc 6.3 into my
>> morty branch as it fixes build issues with musl. Morty with gcc 6.3 is
>> not a combination which was ever officially supported or tested
>> upstream, but I very much appreciate the fact that upgrading gcc 6.2
>> to 6.3 in morty only requires a few cherry-picks :-)
>
> I am open for if there are more like minded folks who think this will be a good
> thing to have. so all listening please chime in

I'd prefer for 2.5 time frame to drop gcc 6 as 2.4 can be seen as an
upgrade path to it.

If possible I'd prefer to add clang to oe-core than support multiple
versions of gcc.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

