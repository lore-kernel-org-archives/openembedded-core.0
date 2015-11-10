Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0822F766B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:39:19 +0000 (UTC)
Received: by iofh3 with SMTP id h3so4458443iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 07:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=MNq4LPKW6g0niVTOycYi9vM8jblBEk/H9GRz42dzBUg=;
	b=e4NAIzXRfi8hjfW6QugW/fo8pjq7kZt4Cti4RRjKUosf6w3nAnCUH4juJAXa8UTpLB
	8eo1zzkiDP7wlRkQ9I3g9D1DH38u4awgW66XQpnnPyemlh+bU4NrpyYPsV9luhrTY72A
	hjwkJ65iDNi670lbnEREDEQvubVGtzwQFPwtdsvFpcUYdyoUZy9oBF6vm85pmIxvbcSR
	EgizA3w40WHpuEPB/BUFs+MPrsYtJmP/oOb0CSGsBOjOjocg+pqGTfF7EOgiML3craG8
	KMGI6HhrUxp8sfKP5joSrhDKkiHBUTn0cskpQwoT5GIitnf0m80SgylWuO03qneNbcxh
	Ubiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=MNq4LPKW6g0niVTOycYi9vM8jblBEk/H9GRz42dzBUg=;
	b=LSAS96JNH5/JyvdXgzJYPeNcU13CEANLchf7BNPB0h4Uf2QLPXO8+6sCgwvuI/ixlB
	1w6n9QFeiYZ1OSsFcAfJkyUyR07gfR96fQw8PeHMrBou1s8N5iOAKgW5ppvREH4Z5YmY
	JczZ4Vg/Olk05S4VZAVaA6kNfoNgwAv9uNMtrInHICuYBVfjZ0lRyqWbrQ4LhNtlb6Pg
	DFwh9ekZoCpc271Qf4MB5Svm4/lmTqIlOcCyRME/1uV7ixWpKVOuqPSmmH2YZTxGTuHs
	ynCA5eLcNBSLeAEZJMaUk0dYNmnt8MDivYVrI2KOuEW4Z+1ywDmLvWAt1qA6WgolFFHS
	2m6A==
X-Gm-Message-State: ALoCoQmUsWQaAKAa8gozAR/ltL1s04mHb7/xMo4zypLF9GcTLqo0/XNN1WVoY6Ud93DLHkABbHRx
X-Received: by 10.107.32.17 with SMTP id g17mr5132589iog.55.1447169959814;
	Tue, 10 Nov 2015 07:39:19 -0800 (PST)
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com.
	[209.85.223.172])
	by smtp.gmail.com with ESMTPSA id xg6sm6896190igb.6.2015.11.10.07.39.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 07:39:18 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodd200 with SMTP id d200so4627313iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 07:39:18 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.107.160.198 with SMTP id j189mr4130502ioe.37.1447169958349; 
	Tue, 10 Nov 2015 07:39:18 -0800 (PST)
Received: by 10.36.15.197 with HTTP; Tue, 10 Nov 2015 07:39:18 -0800 (PST)
In-Reply-To: <56420F4A.9030507@linux.intel.com>
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
	<5641FF6D.7000508@linux.intel.com>
	<3967262.YS5vrjTqP1@peggleto-mobl.ger.corp.intel.com>
	<564207E6.9090409@linux.intel.com>
	<CAJTo0LYdyoLGS6ws1nKzagF=osJ7d1hdc+FdTOh_bAoeD2sqSQ@mail.gmail.com>
	<56420AE4.1090500@linux.intel.com>
	<CAP9ODKoMdtxRCAhsOHoJoV9wkmr=sUaHgTb5X3zY9h2YpfnDUw@mail.gmail.com>
	<56420F4A.9030507@linux.intel.com>
Date: Tue, 10 Nov 2015 13:39:18 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo1o+FAk+_B0pgSvCdU1AYQ-Bn+m5Sp1kNfbyQ=71E+vA@mail.gmail.com>
Message-ID: <CAP9ODKo1o+FAk+_B0pgSvCdU1AYQ-Bn+m5Sp1kNfbyQ=71E+vA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 15:39:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2015 at 1:37 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/10/2015 05:29 PM, Otavio Salvador wrote:
>
>>> PACKAGECONFIG alone is not sufficient; to build the bindings properly,
>>> the
>>> package also needs to inherit vala.bbclass:
>>>
>>>
>>> https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/tree/meta/classes/vala.bbclass?h=akanavin/gobject-introspection-experimental
>>
>>
>> and this belong to meta-vala (or other). This reduces the core and
>> this is something we really should to push for.
>
>
> If this class is moved to meta-vala, how do you make packages in oe-core
> inherit it, or otherwise do what it does?

bbappend files? :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

