Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 42448771BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 09:33:22 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id m1so49916106lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 01:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:organization:user-agent;
	bh=djPo04z31o1YzEpQlyU81ARTGnhMKDU9iKRi5dlV5K8=;
	b=xSYKtsQbPXMCjTRDXhoaYKaW1GUb9XfLD0wE19MmKYJTHCJIQFoIFt4pdJatytRjUm
	tKUHN28pP30WpBxh9YrM9VluPeur967/vpbp6nIWibEuS66FnGcqZ+iWQrkd6Jq4NbsZ
	NpbrRid6wMXeXCF/hHe3X9BzyrMff++CLHJ3CY2LenLgnYoknfvp6vgJ5A7YTlg0HWVO
	tgenNrHiEvjnFZl8WNHFnAd2LRXjvUWmRg3PQuzVSCjVk0aqlBS4pMnXPXg7zjfTTZTK
	Q3THxrTq8yRR9lzNl2bWjWGwFcoCzEM6lWlqnXsEemOu09zsbcB2aOL45Bw2jpw5ZaVX
	TJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:organization:user-agent;
	bh=djPo04z31o1YzEpQlyU81ARTGnhMKDU9iKRi5dlV5K8=;
	b=bCY3BIk38NHLCyulHwPIx9NOiTmG1iWGSYdEpjpOk488gct0A095ROtDnwzwD2/cXb
	3JVYU+hxaB8KQ66tYMgRYapWkNqY5DcRWX1kzlLRSr82s5pHuJWAj3cdNweGuYxk83T6
	yt3d+ulCDVEI3IJ33UoHWByGLfq/nXbygqIqJsyZHkeGCyyZwod4tJ88TZqtgC1ui/vR
	nrcHrx4dYogXO0PvJpMBlNQ1xrXiI7Vbp+YlwfzGIpG4f63t/vqvxAstnRYLpdYMrnr5
	nCS7L4GxqXxizhSy/Vr1+20XHdMZ4quEJ9BtMLAHGGiDMmMY0kICohp132BrFjbijjog
	vJ1w==
X-Gm-Message-State: AD7BkJLKF2WqXC9mNOHvNnJYE9zdXt13nCJqnhR79AV7WXsRgJoCMVN8rw2r92xCtU4gxA==
X-Received: by 10.25.157.79 with SMTP id g76mr240084lfe.93.1456479202132;
	Fri, 26 Feb 2016 01:33:22 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	f196sm1715799lfb.49.2016.02.26.01.33.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Feb 2016 01:33:21 -0800 (PST)
Date: Fri, 26 Feb 2016 10:33:19 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org,
	yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>
Message-ID: <20160226093319.GA4329@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org,
	yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>
References: <AB28D54196164B23BA942EBCF3204741@RD3>
	<20160224141143.GB2892@mbabyjoh-mobl.fi.intel.com>
	<2CD39F82881F465AAD78DBB61BCA369E@RD3>
	<CAJTo0LYMO4C9+rd1NG7mMmn4YfU6vRhuOYni4vvPAugoru=uwA@mail.gmail.com>
	<E744C7D53BB7428AB0FD15C117627D11@RD3>
MIME-Version: 1.0
In-Reply-To: <E744C7D53BB7428AB0FD15C117627D11@RD3>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: How to integrate third party application software to yocto image
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
X-List-Received-Date: Fri, 26 Feb 2016 09:33:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please, don't top post.

* winiston@futuraautomation.com <winiston@futuraautomation.com> [160226 06:=
41]:
> I copied "recipes-navigation" folder from meta-oe (Open embedded build tr=
ee) to "/poky/meta "

> I have appended  in =E2=80=9Cconf/local.conf=E2=80=9D  as given below

> IMAGE_INSTALL_append =3D " navit"

> While creating the image, it spits out the following error,

> winiston@winiston-VirtualBox:~/poky/build$ bitbake qt4e-demo-image
> Loading cache: 100% |##########################| ETA:  00:00:00
> Loaded 1510 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'navit' (but /home/winiston/poky/meta/recipes-qt=
/images/qt4e-demo-image.bb RDEPENDS on or otherwise requires it)
> ERROR: navit was skipped: Recipe is blacklisted: bluez5 conflicts with bl=
uez4 and bluez5 is selected in DISTRO_FEATURES

This is the error. You have bluez5 in your DITRO_FEATURES, and I assume
that navit requires bluez4? Anywya, it's blacklisted.

> NOTE: Runtime target 'navit' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['navit']
> ERROR: Required build target 'qt4e-demo-image' has no buildable providers.
> Missing or unbuildable dependency chain was: ['qt4e-demo-image', 'navit']

> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
> winiston@winiston-VirtualBox:~/poky/build$=20

> Should I make any other setting to add the =E2=80=9Cnavit=E2=80=9D recipe=
 to my image?
> Is this the correct method of copying  "recipes-navigation" folder  to
> "/poky/meta "  ?=20

Well, it works. If you don't mind the rest of meta-oe, I'd rather add
that layer to conf/bblayers.conf. That would make it easier to get
updates to e.g. navit.

Cheers,
Anders

--=20
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

