Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id E41D878439
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:17:34 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id y75so12993222oie.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=u+ZpB2q3L3BPWfEKI3uoQdMF8ht/z5rf6e2aG4kuAgc=;
	b=icsLGugAvrsyV7V6qTVEanqvNH7fCXq+L7BUTNz657jbZliFru47mG5v95dY3bPAkt
	+dZXV2cYBiCmMVDL9yS0NmKAqfY+tZ2XStY6TErqARYyW22v0e1axvqQx+Hv0+fxaYCE
	eFn7dDx5qKp35Bn6rlIiE6Syul1EQMNo2UjGcd0QrvevDxGuP5RJR5Panmfxq4iAqZs8
	XgOobOZ4QLkYgq2iNyYr7pxDItVuYl/rBc4uELFXzlFJeZTOij1seRfQ/aOzDAdkKAyB
	BCiHWSURCaoW5c84opungPiBmjVV9hRUMvQfZ55PbqVyVfa7MFk6HXlNe9u93DujaBfF
	QiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=u+ZpB2q3L3BPWfEKI3uoQdMF8ht/z5rf6e2aG4kuAgc=;
	b=sF94h4HTaRtFZS2G5XOdercYH4Tv5hNDjWtS80xen8iIZPY3sGWIhiGG27FfBP+DsL
	IsPVD3cPmWBPlD+Y0C25vQqDI9UHxdBudY0EsLiIBdLxGdj7WapFm8WmYk5wNox+pMaN
	PBTI3+MyTq+cwr/ZxoZ4t8klIO1NEs/co9i8bqBMt2b0F6t7w1MoIf2XkToIV/nPWJxq
	QgRTeE8yx5pP4msJxvMHBey9SE3u6AuRlB0YUpn+cQKMlHigBujW/KZr7OOSqZkrdGYM
	2xIplyqSFyWcKQA5z3HzIldk8qanUqftFGZCg1Hqabfgm192pl2nBcmKZ0r6mohV7/ae
	X/gA==
X-Gm-Message-State: AKGB3mLc5lNMrJqG98lV9RlUeJ6lgfs94cdqaOFg9Ex3thqwI26CR+b1
	U4r0aBzWNTYXh2V/oR+xLul3Hv1t
X-Google-Smtp-Source: ACJfBov2aiXuhfG5xZs5p4ncg5szOmuVLuFVCKFok1YLCWsK/TLYGv5IYyuLbw6eAEzDA3N6I897wA==
X-Received: by 10.202.236.205 with SMTP id k196mr2830589oih.6.1513707455661;
	Tue, 19 Dec 2017 10:17:35 -0800 (PST)
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com.
	[74.125.82.178]) by smtp.gmail.com with ESMTPSA id
	n130sm6948116oia.12.2017.12.19.10.17.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Dec 2017 10:17:34 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f178.google.com with SMTP id e74so17516228ote.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:17:34 -0800 (PST)
X-Received: by 10.157.65.235 with SMTP id v40mr3188292oti.392.1513707454138;
	Tue, 19 Dec 2017 10:17:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.41.233 with HTTP; Tue, 19 Dec 2017 10:17:33 -0800 (PST)
In-Reply-To: <1513706870.16507.68.camel@linuxfoundation.org>
References: <20171219171706.396-1-otavio@ossystems.com.br>
	<1513704140.16507.66.camel@linuxfoundation.org>
	<CAP9ODKr8jOy7cWdAG4Trhv++X2V3HP7-NO=Ksums0M4ybZf4oA@mail.gmail.com>
	<1513706870.16507.68.camel@linuxfoundation.org>
Date: Tue, 19 Dec 2017 16:17:33 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpnacmHyXs1-JM_2GwkaFLGTYuD0F4-EdWTGpaGav3X3A@mail.gmail.com>
Message-ID: <CAP9ODKpnacmHyXs1-JM_2GwkaFLGTYuD0F4-EdWTGpaGav3X3A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types_wic.bbclass: Ensure '-c image_wic' works
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
X-List-Received-Date: Tue, 19 Dec 2017 18:17:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 19, 2017 at 4:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2017-12-19 at 15:38 -0200, Otavio Salvador wrote:
>> On Tue, Dec 19, 2017 at 3:22 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Tue, 2017-12-19 at 15:17 -0200, Otavio Salvador wrote:
>> > >
>> > > The 'wic' image may use files which has been deployed (e.g in
>> > > do_deploy) for some partitions that may need to be copied in a
>> > > specific partition or filesystem (e.g a bootloader).
>> > >
>> > > When using 'bitbake <image> -c image_wic', from a clean build,
>> > > the
>> > > contents of do_deploy must also be available so we need to ensure
>> > > all
>> > > do_build of the image dependencies has been complete.
>> > >
>> > > Reported-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> > > ---
>> > >
>> > >  meta/classes/image_types_wic.bbclass | 3 +++
>> > >  1 file changed, 3 insertions(+)
>> > >
>> > > diff --git a/meta/classes/image_types_wic.bbclass
>> > > b/meta/classes/image_types_wic.bbclass
>> > > index 222ae00433..4d7305a3a3 100644
>> > > --- a/meta/classes/image_types_wic.bbclass
>> > > +++ b/meta/classes/image_types_wic.bbclass
>> > > @@ -41,6 +41,9 @@ WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
>> > > os.path.exists('${WKS_FULL_PATH}
>> > >  do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
>> > >  do_image_wic[depends] += "${@' '.join('%s-
>> > > native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk',
>> > > 'dosfstools', 'mtools'))}"
>> > >
>> > > +# We ensure all artfacts are deployed (e.g virtual/bootloader)
>> > > +do_image_wic[recrdeptask] += "do_build"
>> > Shouldn't that be do_deploy instead of do_build?
>> Not all recipes has do_deploy. Wouldn't it cause problems?
>
> No, its designed to handle that:
>
> $ grep recrdep * -R | grep deploy
> meta/classes/populate_sdk_ext.bbclass:do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
> meta/classes/archiver.bbclass:do_deploy_all_archives[recrdeptask] = "do_deploy_archives"
> meta/classes/populate_sdk_ext.bbclass.orig:do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
> meta/classes/base.bbclass:do_build[recrdeptask] += "do_deploy"

Thanks for clarifying it. I sent a v2 adjusting that.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

