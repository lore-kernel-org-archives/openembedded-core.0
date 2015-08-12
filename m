Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id DBFFF76758
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 09:33:59 +0000 (UTC)
Received: by iodt126 with SMTP id t126so14083276iod.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 02:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=3YsqbBVm+cQ2rvrWOynWkBNVb9/9CQKyVJJp2y9NsmA=;
	b=K+x/VR3rbtf6SaczNQHQ9neCx4EsPMdoqIk/2C3QtOA4TJAov3DxZEOugrT0KeZ6t1
	+9ep0KuJxCdZQvYkDIKcOVphEKvn6upJvqWJNl5YyVP5r/wWj8APVCrNhBAjedel008v
	QwQITqLh/eheGRMij/Tezm0xNQQWOkBEQL6m8ornuFYVfHLZzHPJlSHjwZf3SgUmbrUO
	CHMFDwYd4tJJ/Ezk1YvkHxAMX/7DJAgqTVXBSc0uSx5Bt5RKqaK0rDWy/UIHLOCeqkAl
	GtlHYTVXRnkSYjEpxVWpeTLzo3XYEtD856XZtaJr9HwONIhqmyOvYhxyBDoHUEYRZYvj
	a9Mg==
X-Gm-Message-State: ALoCoQltsZn2keha3N5Sl5SGPw9Kzsd55nYR+YUSgs4mzNHIaFmzUrlz25q+mA6XKXv4egGNnvFb
X-Received: by 10.107.7.214 with SMTP id g83mr34747662ioi.28.1439372039486;
	Wed, 12 Aug 2015 02:33:59 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D086.dip0.t-ipconnect.de. [93.232.208.134])
	by smtp.gmail.com with ESMTPSA id
	lp3sm3483878igb.12.2015.08.12.02.33.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2015 02:33:59 -0700 (PDT)
Message-ID: <1439372036.28153.29.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Aug 2015 11:33:56 +0200
In-Reply-To: <CAJTo0LbMmZ9rf-Jq_XoGJzTCj_0E=1qene_ooyf_T_nWsH60Jw@mail.gmail.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<6af40fe1752b8cf25efca4a906361c4437249841.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LbMmZ9rf-Jq_XoGJzTCj_0E=1qene_ooyf_T_nWsH60Jw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] mtd-utils: keep xattr support enabled
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
X-List-Received-Date: Wed, 12 Aug 2015 09:34:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-11 at 15:33 +0100, Burton, Ross wrote:
> 
> On 11 August 2015 at 09:45, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
>         -EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}'
>         'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=
>         ${S}'"
>         +EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}'
>         'CFLAGS=${CFLAGS} -I${S}/include' 'BUILDDIR=${S}'"
> 
> 
> There's a "xattr" DISTRO_FEATURE that should be respected here for
> target builds (and explicitly enabled for native I guess).

I can add that check, if you want.

> Does enabling xattr mean adding build dependencies?

No, the conditional code uses lgetxattr and llistxattr, which are in
glibc.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




