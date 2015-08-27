Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 600A976DB0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 07:57:07 +0000 (UTC)
Received: by qkch123 with SMTP id h123so6181424qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 00:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4TSciuL92W9c0JVP3sjl4mt+m6fiU2jAAws2oaTjgio=;
	b=i4Ykf24FN8l8Rs0QD9YATiRMRstvYkRfbLJCRjp8eNybOs1NMuq9sDclvut/QaQ3C8
	CfREUHLnJB0bYmd1E4AGw//roB0YC3tDlC5U9ImxmnulmaFdJBbbOXF7XJ/5PKr42zTw
	4eIXDYO4nxcXJ4WP5EvHbmI+KG3+3vNLiYs917X6vi3MYGqT5e+tvzEIXuPHxGFmkwYZ
	qQz3cG9yYxBi+mRdE3KUkgOezBY6hNyXjwyq8FDcw10rNRob7Et31yiyvJ48GSzykKC+
	axvJzq4X1y34tU0w1sJi4U56QDCr1PiTDMMBELLapgLij59serwSDekpVJ0/qIwxEq3U
	e5jw==
X-Gm-Message-State: ALoCoQlRYGrqy54qHe/7D5z7AaHECAyGpOUmNhkgK0LBHrWWTlPlEJxlH7WrAl4jAA6oRryO25e7
X-Received: by 10.55.195.66 with SMTP id a63mr4210325qkj.67.1440662227261;
	Thu, 27 Aug 2015 00:57:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.9 with HTTP; Thu, 27 Aug 2015 00:56:47 -0700 (PDT)
In-Reply-To: <CAJ86T=UEPqUz2ACbRpGkOkmxB7Z_U88iPEeoJfpA4Ox+pRbr2Q@mail.gmail.com>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
	<1440604110-4306-3-git-send-email-nicolas.dechesne@linaro.org>
	<CAJ86T=UEPqUz2ACbRpGkOkmxB7Z_U88iPEeoJfpA4Ox+pRbr2Q@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 27 Aug 2015 09:56:47 +0200
Message-ID: <CAP71WjwS88zC0rMnaeNe9+bC+3tdFrHDTPhepEMXyGdztQ8nzg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 2/2] image_types.bbclass: add support for fastboot image type
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
X-List-Received-Date: Thu, 27 Aug 2015 07:57:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 26, 2015 at 10:31 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>
> > +IMAGE_CMD_ext4.fastboot () {
> > +       if [ ${ROOTFS_SIZE} -lt ${FASTBOOT_PARTITION_SIZE} ]; then
> > +               make_ext4fs -l `expr ${FASTBOOT_PARTITION_SIZE} \* 1024` \
> > +                       ${EXTRA_IMAGECMD} \
> > +                       ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.fastboot \
> > +                       ${IMAGE_ROOTFS}
> > +       else
> > +               bbfatal "Rootfs is too small for partition (Rootfs Actual Size: ${ROOTFS_SIZE}, Partition size: ${FASTBOOT_PARTITION_SIZE})"
>
> Should the error be "Rootfs is too LARGE for partition" ?

you're right.. wrong copy/paste, will fix.

