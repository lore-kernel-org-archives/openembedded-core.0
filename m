Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 28E5E6066A;
	Thu, 30 May 2013 02:22:55 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id at1so26822715iec.35
	for <multiple recipients>; Wed, 29 May 2013 19:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Uxvh+ezCQUg7C5WrGuKmmxJSOrNfalJGh0QAoh+PG1M=;
	b=VdQopOiye6M9FaDuXDc/IyXsNug4rBJ6pM/2LWd97RlDRV3S5VH+5ygGmwIaI/W0xb
	EYQ9OSA23SWiRvA+tbmg9Pe68nFYO8YELcHzJzUU1Rw5N+YrQ7XAQi5weK7grvifzw+m
	sKD7vxJNvAwnZVIM1M0vVc3eFAaKRH3Je0d9k1N38wOR/BGVK5TLYkkTyySb7EqlG76X
	vZsfe/XvzPdhpGe6JYU/DGTGg9EKvIEr1phZQDgMiAcUyinS20Og8FY1+4z7TSVCM/FF
	fQjm+7Qwk7eICu3YeEW1bESFtmLUH//KyqGJwtMEWMIQBgJBNrEcdoiLM9Pt63j/Roza
	qeGA==
X-Received: by 10.50.7.97 with SMTP id i1mr9563529iga.82.1369880575846; Wed,
	29 May 2013 19:22:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.108.45 with HTTP; Wed, 29 May 2013 19:22:25 -0700 (PDT)
In-Reply-To: <e349520e-8fb7-4ad6-b588-535dc997e6d5@DB8EHSMHS008.ehs.local>
References: <F001008B-B137-40CA-B102-2FFBC49C2302@gmail.com>
	<e349520e-8fb7-4ad6-b588-535dc997e6d5@DB8EHSMHS008.ehs.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 May 2013 19:22:25 -0700
Message-ID: <CAMKF1sr5LaBMCEgnMTXPx8Z+0Vma=AVKTQhYLMfOxutyABzVNw@mail.gmail.com>
To: Sipke Vriend <sipke.vriend@xilinx.com>
Cc: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	meta-xilinx Mailing List <meta-xilinx@yoctoproject.org>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	David Holsgrove <dholsgrove@xilinx.com>,
	OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>,
	John Williams <jwilliams@xilinx.com>, Nathan Rossi <nrossi@xilinx.com>,
	Mike Matera <matera@xilinx.com>
Subject: Re: [yocto] meta-xilinx moved to meta-xilinx-community
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
X-List-Received-Date: Thu, 30 May 2013 02:22:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sipke


On Wed, May 29, 2013 at 5:14 PM, Sipke Vriend <sipke.vriend@xilinx.com> wro=
te:
> Hi,
>
> yoctoproject.org is now hosting meta-xilinx from Xilinx.
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx/
> This repository was previously at www.github.com/Xilinx/meta-xilinx.git, =
and will remain there as a mirror.
>
> This layer contains Xilinx hardware support metadata for Zynq and Microbl=
aze architecture, currently with bsp layers targeting the evaluation boards=
 zc702, zedboard and kc705. The layer is under development and further info=
rmation is available in README files within the layer.
>

How does it relate to meta-xilinx-community layer ?

eg.
http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx-community/tree/conf/m=
achine

contains

zc702 zc706 and zedboard machines among others.

and the new meta-xilinx layer contains bsps for zc702 and zedboard as well.

I do not know much about xilinx family of chips. But say if I were to
use zeboard
which layer would I choose ?

and how are development of these two layers related if at all


> Regards
> Sipke Vriend
>
> -----Original Message-----
> From: Elvis Dowson [mailto:elvis.dowson@gmail.com]
> Sent: Friday, 24 May 2013 1:53 PM
> To: Yocto Discussion Mailing List; OpenEmbedded Developer Mailing List; O=
penEmbedded Core Mailing List; meta-xilinx Mailing List
> Cc: Sipke Vriend; Nathan Rossi
> Subject: meta-xilinx moved to meta-xilinx-community
>
> Hi,
>       The existing meta-xilinx repo has moved to meta-xilinx-community
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx-community/
>
> This layer will contain community support for the Xilinx platforms, inclu=
ding legacy boards (ML507) and other soft-processor architectures.
>
> This paves the way for an officially supported meta-xilinx layer, the det=
ails of which will be officially announced by Xilinx.
>
> Best regards,
>
> Elvis Dowson
>
>
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto

