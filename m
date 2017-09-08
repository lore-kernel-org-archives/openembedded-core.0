Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id E9D5577CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 20:20:21 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id b9so1690554wra.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 13:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YUBJIKU2LVYF+1B2FRpRaCD6zK8GxiRVArt+PMr5r4U=;
	b=b3MQxQ1Qfst0rxtjOHnw6be277wsdNke6DsbWKmssg3GV/yu9rlM9Vc/sxUj26yRTh
	JZD71VoOrt4zqmrd5B8/S7tMg7BY0x5IdqTPZzXr4kuerhlTLg4FG5JcRvpuarsEHmDD
	Cs15sllwmsXuX5YdnNAQ9zOKLoNdthQ7MfzRI1rmmJjcYpxH5p/X3A65vZznSFsGhhZ8
	l7T73zGXZddy0WSVeKqBNmw/4UBx+vTZzfrqsw4muTb0igW+atHugGrAzMT/GIAOOZS+
	ZUUKKZslnx3zAnyQZ1Pl0XWDd7bHqAEvfYY6mQL+YVgyNZvRKyVTLWxPcT/MX1z2/l6m
	WwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YUBJIKU2LVYF+1B2FRpRaCD6zK8GxiRVArt+PMr5r4U=;
	b=QgBbWSrFwOBsZBzInzbkFliKj0gemCpRSNnUkaGl0BdgGX3zjho46igKYuXwV0e/Kx
	upMD9y/wZOBWnZ0buN0xT5nNS+aiRxMgYP9HMB4iRvB3SgPPpFej2Vby1SgiLXv5szJH
	bseLP9kwuHGAoCSEeF7jjeUVqQ/M1/UWaG07AlqQnLezCLLW7AcT+iNfXk1cTyQdXgLH
	y2INS3MglqieWtacp90VzCgJmtSRMARaVp9awr2qA454mlKNdL8gemOTNx6QJ3rpi44c
	v1Zslp5hIH6I5Pu+nGRGyI+rNekZ1r1H+evRV0Jso0JkZnohsmpASn2ob2eWuMksV8OY
	rkCA==
X-Gm-Message-State: AHPjjUjeRQO/+i7HbR6V/lQylKI6ihbPr/r+JBbNxxmpV4K67+x+SGSM
	3992K5upSvGd4oovBm6GqFmRweetJg==
X-Google-Smtp-Source: ADKCNb57x2VPgsNWDGjwPX51gYSdKhLy0iEiW/6dKH08JdV9DaraYxiSI6/4wI6x/4c7bw/VpY9WJtBmjwFSKUb9SsI=
X-Received: by 10.223.128.137 with SMTP id 9mr3337001wrl.235.1504902022722;
	Fri, 08 Sep 2017 13:20:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Fri, 8 Sep 2017 13:20:22 -0700 (PDT)
In-Reply-To: <CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
References: <20170821083946.4493-1-mnhu@prevas.dk>
	<20170821092134.6329-1-mnhu@prevas.dk>
	<CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 8 Sep 2017 13:20:22 -0700
Message-ID: <CAJ86T=Wwp5YcbDk1CzaLPeGrgMrge6=iQb1KeQniU5cYqosoPg@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-module-split: rrecommend kernel-image instead of rdepend
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
X-List-Received-Date: Fri, 08 Sep 2017 20:20:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2017 at 1:06 PM, Paul Barker <pbarker@toganlabs.com> wrote:
>
> This breaks the method described in the kernel dev FAQ to omit the
> kernel image from the rootfs which is to set the following in a conf
> file:
>
>     RDEPENDS_kernel-base =3D ""
>
> See http://www.yoctoproject.org/docs/2.3.1/kernel-dev/kernel-dev.html#idm=
45690538384880.
>
> By recommending kernel-image directly instead of recommending the
> top-level kernel-<version> package which was actually removed from
> extra_depends, we skip the inclusion of the kernel-base package. I'm
> not familiar enough with the details of kernel module loading to know
> if the 2 files in kernel-base (modules.builtin and modules.order) are
> strictly needed but I think they should at least be included in via
> recommendation.
>
> As we already have a documented way to omit the kernel image, can we
> revert this?

I think reverting would be preferred. I have multiple machine configs
etc which rely on the existing approach.

> As an alternative I can send in a patch which changes the recommend to
> the top-level kernel-<version> package instead of kernel-image.
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

