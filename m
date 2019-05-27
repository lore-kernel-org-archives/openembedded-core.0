Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id EBA4E6C466
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 09:54:58 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id h13so11610396lfc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 02:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jbH32CFy2dVOOeggRUhARnQXFnkkD6uuKhMRI8xBCGU=;
	b=Ertzd4g75iZmXhZBiA4eD03s4HeMFRFLgBmAht+dPjRimViHW2cYvK+67hsZrRnU0l
	U+kKNboADa2IBd3qV3cbN6TQIaVrtnHCvf7ZVj7onnNOZRxClFoYm2IFCN/u5vfs2a6Q
	z4/MLAW/szaC9BzUv4T6lh3qdmoMwKscpnZbLh/iIPaoQNz1JgnJD8m28z0Hvm8xlDft
	wDq136iJ0l2klySkfw1eSdMDoy93ZTxCP4RmdZ2BtlDHZ1hboSbbi5UmxTZHoN/1jtuM
	lymyTrq9hf5EwoxYXdae9pqz6d4gmDS1F2mc9G1Fv55+A4pY+zO9VAFjmCOyBIDh6gSi
	tjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jbH32CFy2dVOOeggRUhARnQXFnkkD6uuKhMRI8xBCGU=;
	b=ePSBtn75bZTcCtm8fcq64Z8079VO8zGfzYg6jdghOYNq2fDupDWS8mGaELb3nTsRCd
	kLv+L1Nd7m8IIMFCFpcJd0+NkS9L/wwNSZBSjrZ9HkOjqI9vjpRz2eOrLAfJxBDQGrYg
	z6RVP6i+d8ug96a4rY8ftvlb2SdiTmy21wNwp5lml+/yjs+9gMe8SHmLysWajDO5QHFG
	kAd2qAa6X/Cz8EeRWOTBVzoXgwvdEi15ZdM+JHCO46PxFh3J+xeclZd3VBwYznmc/eKg
	5C60IW4ZKO5VnJV0XnM8w7jJoQPnK+gqvjLL7gkISV5tVU6OuERcGtegyHv4mwARdoi2
	SLqg==
X-Gm-Message-State: APjAAAUD0WxPZNBIKrbxx8jkpjjRDHtboWCWwzYRfurCKf3OgPTxltTE
	H69lFf5E5yX1FqgL8eyd+sTXa/oiWwx8yzqL9o95Wg==
X-Google-Smtp-Source: APXvYqwtPwa1jlN+I9CKyc16eVOYmP0aZDcQgV6Gu+mUHB4GK1uHXj7U07KBRoYHeDpRQK6+dkaSQygZZrBmKZn+0Nw=
X-Received: by 2002:a19:6517:: with SMTP id z23mr6885113lfb.98.1558950899459; 
	Mon, 27 May 2019 02:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190524144447.24103-1-nick83ola@gmail.com>
	<a2d506ec-aede-294e-e673-01bf30bbe30f@windriver.com>
In-Reply-To: <a2d506ec-aede-294e-e673-01bf30bbe30f@windriver.com>
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 27 May 2019 10:54:48 +0100
Message-ID: <CABPh3UMy+B=0b8XWFUmKcmhdeFmEKw0nk+c2H-HTd_GYQcsqBw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe][meta-webserver][PATCH 1/2] nginx: update to version 1.17.0
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
X-List-Received-Date: Mon, 27 May 2019 09:54:59 -0000
Content-Type: text/plain; charset="UTF-8"

Done

Thanks
Nicola Lunghi

On Fri, 24 May 2019 at 17:14, Randy MacLeod <randy.macleod@windriver.com> wrote:
>
> Nicola,
>
> Please re-send to:
>     openembedded-devel@lists.openembedded.org
> rather than:
>     openembedded-core@lists.openembedded.org
>
> Did you read:
>   https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> If so maybe we need to improve the howto.
>
> Thanks.
> ../Randy
>
> On 5/24/19 10:44 AM, Nicola Lunghi wrote:
> > Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> > ---
> >   meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ------
> >   meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb | 6 ++++++
> >   2 files changed, 6 insertions(+), 6 deletions(-)
> >   delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> >   create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > deleted file mode 100644
> > index 5e6dc33e9..000000000
> > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -require nginx.inc
> > -
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
> > -
> > -SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
> > -SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > new file mode 100644
> > index 000000000..8774a87ff
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > @@ -0,0 +1,6 @@
> > +require nginx.inc
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
> > +
> > +SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
> > +SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux

