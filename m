Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4F44D605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 16:40:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id m28so36749317pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+c1fwwraXZvFs2GYdU3lXnRxRgkoZLpKa48DZtGtkrw=;
	b=R4ir+NIBodjpAxMWdt8cULo7KweGUZhrZUQKsrhRy/q9BitR4AhyJUxH9DpSP+veJb
	4+jZB54HZcDfgWMdj1PZaqyPfGn0R6pUZD8YY2KVQ180mscJHff9qDjrCzyeo9p7qjYt
	1RFQ4r+2EkRUd+pV0JBW2tmotkBrqyDy98OZuLWEGwnE1XnkPQraEwZyld0Jy4e2fZuc
	/kRNTimpaPyd4SqIYTPQy6kSJvOHUP3XW4FgWPKifvah2gwl/IKginoVJPpbFlGajzro
	7EnxKXZmbPfSmr+AIst/0ghDxES26cvZwF3RL6PPV3FVZZP/VpNHBu4HGKiS5MUy2Kwg
	UTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+c1fwwraXZvFs2GYdU3lXnRxRgkoZLpKa48DZtGtkrw=;
	b=dLDkd2HV0RhC2MV9R2X6cFj3Kf/UCTHkznGuYN87HNrFGgDlESndO/IN8mh7/GP0fe
	eZo1TfKyl7+nEgVUxoQqgesf0H6YcO8BVPq6LSRIjeqg82j7+hqUthPLCebyz0nadczZ
	ST8Ig/K5i1jifveAiEZNSZpr3iSkSiyn3FbwsB6+3H6QuK55jDEWt4z6tBozYve8+udD
	wJNF8vNJy1fmIj0unOisYnWFqZQQ/N0BoMsHS1wR1HBJdTjcBgRu9fzX396GW0vVMFRi
	L2OqxjZakIEO8C6uFIpJtjFE/XtD+Wccvkbi1mfBl+9FmrgpnSis+Oxo9TIa08ChA7MT
	UsGA==
X-Gm-Message-State: AMCzsaViLDTN9MRfhoms/TP2gqQ9QhSOdnoWAtUmxneGtnnGCIy3kmp5
	dxHzjIOjcUheVC/u9UhDjOU1CeCKVJll1jFjRt8=
X-Google-Smtp-Source: AOwi7QArGRAawIMju7AdHHKVZCoHTgIOT9AFCJZ5Hb+x2z0nBM7DJH4CCCC8FsAQqxvk/TNd6dYj0yDMY73XtwyaJ/U=
X-Received: by 10.99.152.17 with SMTP id q17mr12682357pgd.287.1507653658367;
	Tue, 10 Oct 2017 09:40:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 10 Oct 2017 09:40:27 -0700 (PDT)
In-Reply-To: <CAJTo0LagJFdtet2W7QGyGUcr19=z+q2mk4yNY64QNuCZDmcFaQ@mail.gmail.com>
References: <1507633512-30719-1-git-send-email-matt@madison.systems>
	<CAJTo0LagJFdtet2W7QGyGUcr19=z+q2mk4yNY64QNuCZDmcFaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Oct 2017 09:40:27 -0700
Message-ID: <CAMKF1srOAF=5gtovmFypykLfbUut6AJcCsZUu_f58qesV7SUdQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go: update to go1.9.1
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
X-List-Received-Date: Tue, 10 Oct 2017 16:40:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 10, 2017 at 9:28 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 October 2017 at 12:05, Matt Madison <matt@madison.systems> wrote:
>>
>> +PV = "1.9.1"
>
>
> Surely having a go-1.9.bb which then sets PV=1.9.1 is confusing at best?
> Why not just update the checksums and rename the files?
>

I think its in line with what we do with rest of toolchain. Probably

MINOR = ".1"

PV = "{BASE_PV}${MINOR}"

might be better.

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

