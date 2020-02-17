Return-Path: <wallinux@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id D7C45608AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 13:32:30 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s24so18420288iog.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=nuRMzw9nGr+VmTQ4zg+i5RDYp8sigL6M3m6stqGgdxE=;
	b=ESSRO3XOG4+p3arBeX2T8KQD6ed+BTF2S7VIVjS22Jij913B8CdccJQZ3lNY5UN2E5
	itySRROqmbK+vdJuYEw37orDCSYIPLV0xBgLjB2xH6dbdsScTVj7/XZXfEPuvZxcVeiE
	zpA0bEZG/plZfa6cg/LvtbpmdIXrnQ2/p250WlDImW1yuiNhMoUcQ03DV+RR/2ZT8kTi
	d5SsxiKSFPP9qnbY892P7BJm7BZCKjR9ViNCbfMhvIrttCFNm3PfAGR6Mxci6JAS+GQg
	oVksrXGgiSzalxa4XzKJnXGO5qn9yptaieiQp0rt6UtMf8+rnH2qtygLzT3uODhVwFTo
	vM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nuRMzw9nGr+VmTQ4zg+i5RDYp8sigL6M3m6stqGgdxE=;
	b=EQiPCxEwvstgY27Ha3aNkWkS7Hs8sHYi74L5u1KmjKUEtB+kTR3PqcaYlG+9pBq1DS
	CAzYLAScX7sSFDY4vn4yxVMX738RxWZHerbfvYdsHLTaH23Jap7DWt0S0vX+5vj9fyHX
	2QTPM0BoW6gBg/Z8nqBxrLN/f87KprNk5caeYlGj7xyeokt/p8fwih0/jSy7Yy9g+VMi
	/p9q5c0AiGn/iPeEJGM3QX/7xE2OJzBNuzJi2kc0L9wuRV36oN1Icjo+nVRuzGP1m6Ht
	N+QR3qvRroOT/eSzJAOGd/Tys2aJgBYa29w1CWziIBFLNXvR6jK8L+EBzzK5SaRgQBhe
	z3hg==
X-Gm-Message-State: APjAAAVAh9mscs1f70UM9HG7xyM86cwWr2x1gWxUwsOoFSsC+q1XodNl
	cowR4I2okiw8+hy1jaFt/qxi+Y5vL9UDoMyvLHfDKm1o
X-Google-Smtp-Source: APXvYqw2EisMRF95nHsRekGzb8/FkhmNyj5nlc04S66AI5Z1oOcGSkqICFL2Nz3aK73RtA2+ZfNPLPGQDZ+ZOX7y0LY=
X-Received: by 2002:a05:6638:76f:: with SMTP id
	y15mr12712958jad.5.1581946350716; 
	Mon, 17 Feb 2020 05:32:30 -0800 (PST)
MIME-Version: 1.0
From: Anders Wallin <wallinux@gmail.com>
Date: Mon, 17 Feb 2020 14:32:19 +0100
Message-ID: <CAF2baFd0bA5ePtywQH5ZW0aSE=UH+e8r2V4SpUBgD8Ms5V3E=w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] babeltrace: update to 1.5.8
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
X-List-Received-Date: Mon, 17 Feb 2020 13:32:31 -0000
Content-Type: multipart/alternative; boundary="00000000000049cc2f059ec59689"

--00000000000049cc2f059ec59689
Content-Type: text/plain; charset="UTF-8"

1. I will create a new version with 1.5.7 removed

2. Babeltrace and Babeltrace2 are different and can coexist. I have a
recipe for babeltrace 2.0.1 ready to be submitted, but I wanted to make one
more test.

Regards
Anders Wallin

--00000000000049cc2f059ec59689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">1. I will create a new version with 1.5.7 removed<div><br>=
</div><div>2. Babeltrace and Babeltrace2 are different and can coexist. I h=
ave a recipe for babeltrace 2.0.1 ready to be submitted, but I wanted to ma=
ke one more test.</div><div><br></div><div>Regards<br clear=3D"all"><div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
>Anders Wallin</div></div></div></div>

--00000000000049cc2f059ec59689--
