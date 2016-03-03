Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6AF77025
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 14:59:31 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n186so135558537wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2016 06:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gd8nNI/bKbOKnXn7exNJiob6d0TVA9lhyUjmHc43e7k=;
	b=AnEvkFc46gr6GmHWeMqFH6n+wMJc4BtVYErRDhYOF49GUckwVJXqZpoH4Wc96YzZFb
	naX7Jt79XgJBxtThxaEnRyeZQcEbrgYpm6DzspzzAnX12P6KpuWmzLSKkBmJavBloEZp
	xFkfyDFaBXPCjIiHkBFuD2wSry+mPRuVpSCG1xXhobq5lvgrPyI1ZhyrV3JHc8GMj2cB
	kMywWhUfoPW6sZ9qlWLeN0NumKSqu5I+lT6h5WfkbC39TClqakeu41bhOm7LIUkTwQkX
	XyLfAbnuLNOQZzc4VER5oIDrYmx780nDTnXriB8vqeEJPPtfivzLsh5OeK5WX2UGBTJU
	0MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gd8nNI/bKbOKnXn7exNJiob6d0TVA9lhyUjmHc43e7k=;
	b=Plpt0QUHnMfsS7Mbeyd2flsXNMme6g2Vl/kGUoFe3xBWlT8QKdrW+fp1DwsnyFcKRu
	D6e25hiXMAUaWyGtAn92sEOtZM4stfuIijXV2On8MXWPb2idy/lz9yLCrbi+zyDhOcnH
	1RckvpN/7fDA92hq3JsH4ddBMZMEV2xGfbKIAl8UuKiwMI3bq6xM4oshYKH5sWQp7nWm
	tktJaSSZrsGEfojoEDc0OYmydzdHdtUrTeSUJXl9uHvmLBtf719ArekhiwLfPn2j5KiC
	BT0/seMpR397espMLyuyOpIJU+svgmNFof5em3UE3Su+9QISPKichi7N/LiZZEn3900q
	O3wg==
X-Gm-Message-State: AD7BkJIhxfNXTc7yJhwMcZxmgzoAkPtXIB8TbwSgS96egp2rAfC9PPvYj9HvVx6/DfWa+w==
X-Received: by 10.28.19.130 with SMTP id 124mr4279180wmt.2.1457017171259;
	Thu, 03 Mar 2016 06:59:31 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s206sm7786380wmf.23.2016.03.03.06.59.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 06:59:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Mar 2016 16:01:35 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20160303150135.GF2569@jama>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
	<CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Thu, 03 Mar 2016 14:59:33 -0000
X-Groupsio-MsgNum: 79073
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fwqqG+mf3f7vyBCB"
Content-Disposition: inline

--fwqqG+mf3f7vyBCB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 29, 2016 at 12:50:03PM -0800, Andre McCurdy wrote:
> On Mon, Feb 29, 2016 at 12:43 PM, Burton, Ross <ross.burton@intel.com> wr=
ote:
> >
> > On 29 February 2016 at 20:40, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> I'm a bit puzzled as our autobuilders build this all the time and we
> >> don't see failures. Any idea what the configuration difference might
> >> be?
> >
> > Since oe-core 94e1b917078bedf73830e54278af77f742c93581 gdb has a
> > packageconfig for system readline, which is enabled by default (and has=
 been
> > enabled explicitly for a long time).  Do you have some local patches ad=
ding
> > more PACKAGECONFIG options but not enabling readline?
>=20
> gdb 7.10.1 depends on readline features which are not present in
> readline 5.2 (ie the GPLv2 version). Using the gdb internal readline
> is a workaround for people who don't want to switch to the GPLv3
> version of readline.

Thanks!

After fixing the default in meta-qt5 I've started to see this issue in
other builds which were indeed built with
PREFERRED_VERSION_readline ?=3D "5.2"
to prevent GPLv3 readline being used by other components.

For gdb which isn't part of our release builds we can use bundled
readline, so I had to apply this no-static-libs.inc change and
explicitly remove readline from gdb's PACKAGECONFIG.

So to recap, meta-qt5 change fixed my jenkins "bitbake world" builds by
enabling system readline.
For internal builds (without GPLv3 where possible) on the other hand I
need to remove readline from PACKAGECONFIG and apply this fix to build
static readline inside gdb's build.

> (Although gdb is itself GPLv3, it's self contained and easy to exclude
> from release builds).
>=20
> > Ross
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fwqqG+mf3f7vyBCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbYUc4ACgkQN1Ujt2V2gBzsEQCghQenijxrmvuWHkg+LWhkjtOM
6bEAn2uJkuHZSOXHRqHSWGsNS6OmoV11
=tbUR
-----END PGP SIGNATURE-----

--fwqqG+mf3f7vyBCB--
