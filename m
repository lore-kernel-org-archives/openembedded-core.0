Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4E77C6C10B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 11:23:34 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id b141so8480762oii.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2018 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pCroqg2VIEgh7XM1IdP5wGcah8xka24Ki7Ioe3g1Bds=;
	b=NQIA6W5vS5KPtwBGHZvQ6ISOw2XaemTms+1Wa8wG9ka81k5qPU3PTgu4CY+1+37L4V
	U/UpwZhKzC66fn+sP9ZyLO5RD9d74GdUrd5QJI0kXfGlCb5s/sErnKWuwaWVPk98j7po
	8nD5VLuB+folAag2S+XWJcVMPVxL5qArXzeCQS881KZPIS4+fqRJtWb6RHs2EnIMIbjD
	zm+6Y3QlTrd4GfdS7nyDgAdaA/Xp4uI6zMZvN8uyO6EvJsRvNfL1hTAV1kfjyj+xDFV8
	cbm9/l48om4FGYMUyEMR/yMTwJcDLj6IbrFLFP6LzFTG92XdkseW00b9E/XtJKnqlWu2
	Jj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pCroqg2VIEgh7XM1IdP5wGcah8xka24Ki7Ioe3g1Bds=;
	b=eY4Bs/hROKVev4HFxplIeeAag107rYKBItPY2kAbn5/GDi2QlvsdHFMC+qx8YVfA7k
	jDcd93QpSkNLbjtiT21gFe4B1qB9YLxg0Blcsw8URmjOfuPCNo9M3EdvR78HRsATqQI3
	VdZ4r/x8D/+XtQMoy/nj8tVQgzRj6qNCBokfpUq6e2eULwWWQDOA+oTTg5AA1Epgj7Z6
	ELmodiFK/Mrw0yaa3SsvNeq4y4+jY6N+OvKdNqtYna1Ep8gt9b0Y4ZPPu6TI+dfr3kjD
	2fOZ0ss5d8Xft/1B6D5qWK5NnbEkm/H7AE4KAchQjvxmfmkJAwFPygim5koZw8kUMdfd
	N1Bg==
X-Gm-Message-State: AA+aEWaSCr74ZkOKsU+3J3FgV+PL3YXkSthZpSzdyy0pB5Pnf9tY2ORW
	J9b1dEkfXBk2xekCh3JKAVPUFYJQsgKyC0B37is=
X-Google-Smtp-Source: AFSGD/UwfMpnWdpfkkGvmuM9G55+MXdf0Pz/JmswAyx2BO4R07/N/Z3YSJT5Ic5Rhy4cveiyTpUEv/G4hle9GR6pe6k=
X-Received: by 2002:aca:51c6:: with SMTP id f189mr7093263oib.281.1543749816068;
	Sun, 02 Dec 2018 03:23:36 -0800 (PST)
MIME-Version: 1.0
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
	<CAMKF1sqst3bNey6Gwf2bTa_oKOVrFjKsWcPcM4sbAYTp3SxA3g@mail.gmail.com>
	<CANNYZj_H=i+Oa9JKaXaAVW6_vy-9o5YgDOHE76g1Q9L5=K5Jog@mail.gmail.com>
	<CAMKF1sr7mXJzgwbzer0=UUbUoEYgXM7x=0ZUjTQn6_c-3ZC3Vw@mail.gmail.com>
	<CAMKF1spTysVajGbSQrSAafq1zomuK+WbPwJZCmjFr1x9sO3Rig@mail.gmail.com>
In-Reply-To: <CAMKF1spTysVajGbSQrSAafq1zomuK+WbPwJZCmjFr1x9sO3Rig@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 2 Dec 2018 12:23:24 +0100
Message-ID: <CANNYZj_mcJf2wLugm4t9qTbrmK5+fVD62hyiR1q1__NP7UzzjA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/16] gobject-introspection: update to 1.58.1
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
X-List-Received-Date: Sun, 02 Dec 2018 11:23:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Nov 2018 at 20:00, Khem Raj <raj.khem@gmail.com> wrote:
>
> and here is another qemu crash on qemumips seen lately after these updates.
>
> http://errors.yoctoproject.org/Errors/Details/202380/
>
> look for "Segmentation fault"
>

I just tried this on qemumips with poky master, and couldn't
reproduce. Qemu works without crashing.

Alex

