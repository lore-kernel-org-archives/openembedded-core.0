Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id CFDF371C96
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 20:58:16 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 20so5080452uak.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2016 12:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lkDZG33NNvdKSE07ih5miZg54Kn9pPwCP/mA1ly5ikw=;
	b=hiHbLBmqx+gXVLqGgFtnlBl9Mw8wSf6YXl+nMpL08XtOxy2xVnFrMRiQEl45RblB8Y
	J4wHl5P62HpbKKpLeSycziH5iuc6lDRwMo3GoiNwc/ywJ46NaN3g2hnlzrp36PJdA5br
	kcPNOsFtaorjStiOhrff6gG99s/yBqHPWkKoUJ6hhGOWBF7A5wii+lZrBNpFyGWyECNI
	C0WDxtBxRhny30BG3RSfDlQDUEB6uHWtqcOMimggCRdKm4vHDoa5g+35LbB98iS7pXni
	bTxaF7sGAygkL7Mwo+eCLomDokPPd7gARl4Nkvj3yPKmHrjbuuCW8LOlDz64qEX0F0WF
	jBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lkDZG33NNvdKSE07ih5miZg54Kn9pPwCP/mA1ly5ikw=;
	b=E1Mw3e31xFVpMKCo0tw6orZI942gD48cN3UOAxfKGmvAnnlZXs4qUx6EvVPRviDkrX
	y0Nxqa0Vr6KpQiiiHIkgsLRfJjenopk8agTsHICB4T3NY5AnyXal6KDJLPXPxL1d4xqg
	9n4TzFVCflGgztEh2YvrqzoIEaqsdGH/cFjOpE5UemeDEqbEg/A9wgT8iG7rczNuQaU3
	bTXRy6q6h8230i9nqtAp1WzwyWKIX7Fy//W2+PV/lDjBRqPcZEqLNDnO2W6Af/L3jZQX
	WSTQYUCHx+wP4+r/AbXedWVQkeKPqHJts4S6dH6vaX4L5Qzus0TTzvGcIEpGkEazrz6L
	DjOA==
X-Gm-Message-State: AKaTC02tgyHIT27UKV6LEP9SvJNMEmitHU7SwQtOelM6kEHNVHqhWj6Vrfb2vulxCZ6enVgchozeuDpYdBNiCg==
X-Received: by 10.159.55.142 with SMTP id q14mr69910258uaq.107.1481403498406; 
	Sat, 10 Dec 2016 12:58:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sat, 10 Dec 2016 12:57:48 -0800 (PST)
In-Reply-To: <CABcZANk5QnzFAWwAjbaHAQvCw=XXViOnh5jg=cvRiD_B=mEpKA@mail.gmail.com>
References: <1481305586-11873-1-git-send-email-ed.bartosh@linux.intel.com>
	<CABcZANk5QnzFAWwAjbaHAQvCw=XXViOnh5jg=cvRiD_B=mEpKA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Dec 2016 12:57:48 -0800
Message-ID: <CAMKF1sqeW4cxaj1yK_TbpyyZriuL3z3N4QY=nrpy4JV=tNRPCQ@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] edgerouter.conf: enable generation of wic.bmap
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
X-List-Received-Date: Sat, 10 Dec 2016 20:58:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 10, 2016 at 10:40 AM, Christopher Larson
<clarson@kergoth.com> wrote:
>
> On Fri, Dec 9, 2016 at 10:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
>>
>> Enabled generation of block map(bmap) files for wic images
>> built for edgerouter machine. This should simplify flashing
>> images with bmaptool.
>>
>> [YOCTO #10621]
>>
>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>
>
> I think this is more of a distro decision than machine, whether they want=
 to
> support use of bmaptool for their users/customers. It=E2=80=99d be nice i=
f it was
> easier to control compression from the distro, too. For example, if we wa=
nt
> to distribute wic.bz2+wic.bmap in our installers, it=E2=80=99d be nice to=
 be able to
> switch to that for all machines that use wic. I=E2=80=99m not sure how be=
st to pull
> that off, however. Something to think about for the future.

I think thats a good point, however, distro should be able to define
something like
if machine is capable of supporting feature X then lets enable it. I
dont think we
should add machine knowledge into distros either.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

