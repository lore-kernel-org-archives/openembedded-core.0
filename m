Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1445C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 15:33:53 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.8968.1652801626416573789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 08:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CJPwlNWM;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id jt15so14614661qvb.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 08:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j35K4LTqx8VL0YFhk96DFnosqITizW5cLAQLp2uHJqQ=;
        b=CJPwlNWMwgw2hS/wq5/fbAO/l7HVRA4QCC29U6elMcM4+3+SuZcARx/Ls6VMFDcvwQ
         RIkfy9uHofLNVgjgpt7fUtsdtAj/qlm8hHQD/z6DFsdNswKYzpS3KS527F7SQ9P7bSxS
         xax8svCFrfVFCTYK6ddEFMYeXGDpZUnkygIJ78JbsZbd3wVbYp08xnv8gwmlP6TEq08f
         Fb5mmSbmb8aUakhAfgms6AKEJBlBAy6Efx+jGYrlCpWFgO3LL9YFBmy0c1Vl1QUpPj79
         u0uhq799b40qkIPUWa8Xm4cJiBXhcRXsa3Hf0iaeA12dJJgo+qOiC3DZX1i2bXIw0e7W
         ko0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j35K4LTqx8VL0YFhk96DFnosqITizW5cLAQLp2uHJqQ=;
        b=mZb80VoWqEUP3/dVg5Bnt9eV/wbSHg2vk6+kzr8vFjHAQ3QXOnL5k/Z77b8k+kKtnL
         R6va3UxAf5ylP5E5TcV+gr3m99GeIfgzToCDcg42IgcgmdRop5aMqKHTWSRx/hdoG2fc
         Utyo3UgyN+8RpHafhmpx4K+ioYfGBB7zWjx1Uzk8zGBBOG8xsbcLo5T+cc5P08qDlx5N
         d7/S3apbTUmi6ys3fmhMlS0HhB/XN7GEVlfFpLs5IgxtO4G49NU2l0uqOsAJggCg/iBs
         FwpNAovq64U2JxxPCHn3HnMdzECc32ajC4lM9OSOd4ZKeQhF/X75T1/+HQv+xQB3zfIz
         Jpgg==
X-Gm-Message-State: AOAM5303DU92B2BVo61WN0W+on23Kwtk0YCUpQMLxCCd5dl7X2+dRMIm
	Wee40CKXbQOONbE84SWQ9gIr/QagdqcpFTBYd7Y=
X-Google-Smtp-Source: 
 ABdhPJzp0rTjjKsYr/N7mKUv0iX3UsKPqK80mrEAyIbQfbBK8rAfwZ0TYJPlemGk/jlTlGF3FFSKuE3AeZQ4OmqRPQM=
X-Received: by 2002:a05:6214:e6b:b0:45b:1ee:86ec with SMTP id
 jz11-20020a0562140e6b00b0045b01ee86ecmr20515012qvb.36.1652801625442; Tue, 17
 May 2022 08:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220516104506.3d383183@melee>
 <20220517081633.2992360-1-mingli.yu@windriver.com>
 <20220517081633.2992360-7-mingli.yu@windriver.com>
In-Reply-To: <20220517081633.2992360-7-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 May 2022 08:33:19 -0700
Message-ID: 
 <CAMKF1srOnoeWdwHg38dS-AiVOCEzr7MQ9HGnVn9u+iDwePPdfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] python3-tornad: move from meta-python
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 15:33:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165739

don't forget to send a patch to delete it from meta-python once merged
into core.

On Tue, May 17, 2022 at 1:16 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Tornado is a Python web framework and asynchronous networking
> library, originally developed at FriendFeed.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../python/python3-tornado_6.1.bb             | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-tornado_6.1.bb
>
> diff --git a/meta/recipes-devtools/python/python3-tornado_6.1.bb b/meta/recipes-devtools/python/python3-tornado_6.1.bb
> new file mode 100644
> index 0000000000..1dedc51029
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-tornado_6.1.bb
> @@ -0,0 +1,28 @@
> +SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
> +DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
> +By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
> +polling, WebSockets, and other applications that require a long-lived connection to each user."
> +HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI[md5sum] = "f324f5e7607798552359d6ab054c4321"
> +SRC_URI[sha256sum] = "33c6e81d7bd55b468d2e793517c909b139960b6c790a60b7991b9b6b76fb9791"
> +
> +inherit pypi setuptools3
> +
> +# Requires _compression which is currently located in misc
> +RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
> +                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
> +                   ${PYTHON_PN}-ctypes ${PYTHON_PN}-misc"
> +
> +RDEPENDS:${PN}-test += "${PN} ${PYTHON_PN}-unittest"
> +
> +PACKAGES =+ "\
> +    ${PN}-test \
> +"
> +
> +FILES:${PN}-test = " \
> +    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
> +    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
> +"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165718): https://lists.openembedded.org/g/openembedded-core/message/165718
> Mute This Topic: https://lists.openembedded.org/mt/91159238/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

