Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id CBEC5601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 19:25:06 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id v199so99658893wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 12:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jEbRrvzakMTjSFcEK+fIKB/JQVAzpcgxCcWyt03mPY0=;
	b=iBXqQC21PzsgHFns+5OMjD7G5Yt/29Fmu5ds8rNENPN1A1C9+uzud9ad6ucN8KBi7G
	2Y6GJGuxf7CjxK3q5qiBKtEwye1bucIdhnawx5F0wkq2q+V1qS8gp2KCbR5TRE0tr43h
	v8feURQ1otcNCKPl6OVt8ukdy/2+byUT1uR9mHxN2R0m/em80UsrBLdF+LfqBDa5epgh
	VgbM5Q4bKCD/OX/cHsRzNwRqlr58LPsNxdO4vQtghD2YvqLuhargRjMuAo59/1QyywyQ
	VFyW+B0Cbl00S9qd6NzC6ZijT57Xp82bIJiWpQg/tuS3RDt30q2yHD4J2mLklwiyff+c
	vqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jEbRrvzakMTjSFcEK+fIKB/JQVAzpcgxCcWyt03mPY0=;
	b=C9/Lw7VrepD4fbuWQviJBUu4pfHYEzr3pkK3qr8/2CqxWdRKqbzg+SkA+KWN1Grb2V
	qz6NlGZstA99ysEyRqZkM7/V3URCXLIcldxWZM90wGA/atkPil+yH4PBuRbHbTlPpZPJ
	wuyKkCUGpUwGBMk0T8gXldFzKfPMJySlhRouETMna+yIwfWjIQ9LmC7NSKVsepoJQZYI
	xDTn91DHEswU50b2G1/jHide0eR5ITQCdiEP8yN317xUVKI3mHFTYa2smNTcXMaWaA2u
	w1p7c9qFgZk7aUNLvQidB92hXeu8Ze4pE/zEZUGjVejz9Fu+Ce7L6PhwvVTtD/SAZSSJ
	YAVQ==
X-Gm-Message-State: ALyK8tLnoD4EZeXUbz/idzo6/1XvgYpZ1/+ttIxMKwzGLEGhg/tk915LzWoMVHMrYYMuhA==
X-Received: by 10.194.178.199 with SMTP id da7mr26252681wjc.123.1466623505177; 
	Wed, 22 Jun 2016 12:25:05 -0700 (PDT)
Received: from Saturn.local.all (212-41-115-162.adsl.solnet.ch.
	[212.41.115.162])
	by smtp.gmail.com with ESMTPSA id b4sm773062wjd.16.2016.06.22.12.25.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jun 2016 12:25:04 -0700 (PDT)
Message-ID: <1466623503.2906.1.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Jun 2016 21:25:03 +0200
In-Reply-To: <CAJTo0LbtjhRL+ugz9sNjszXTePZ=R=R19vA1fQG-A5R1b7uDQg@mail.gmail.com>
References: <1466329971.20368.18.camel@gmail.com>
	<CAJTo0LbtjhRL+ugz9sNjszXTePZ=R=R19vA1fQG-A5R1b7uDQg@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: packageconfig, add depends if feature is disabled
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
X-List-Received-Date: Wed, 22 Jun 2016 19:25:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ross

Am Sonntag, den 19.06.2016, 20:51 +0100 schrieb Burton, Ross:
> On 19 June 2016 at 10:52, Max Krummenacher <max.oss.09@gmail.com>
> wrote:
> 
> >     PACKAGECONFIG ?= "gtk3"
> >     PACKAGECONFIG[gtk2] = ",,gtk+"
> >     PACKAGECONFIG[gtk3] = "--enable-gtk3,,gtk+3"
> > 
> 
> PACKAGECONFIGs are meant to be explicit so "thing which is enabled
> when
> something else is disabled" is obvious unless you write log comments
> explaining the options.
> 
> For example, what if PACKAGECONFIG was set to "" but gtk+ was already
> in
> the sysroot.  By the logic you've described that would result in your
> recipe being built with gtk+ despite being told not to, or maybe if
> gtk3 is
> autodetected first and that's also in the sysroot then gtk3 gets used
> instead.  You literally can't tell, and if bitbake can't tell then
> you'll
> have binary packages changing when they shouldn't be.
> 
> Idiomatically you'd have - or expect - something like
> 
>     PACKAGECONFIG ?= "gtk3"
>     PACKAGECONFIG[gtk2] = "--enable-gtk2,--disable-gtk2,gtk+"
>     PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
> 
> If the upstream doesn't support this then you're hoping that they
> don't
> change the default values, or the configure doesn't attempt to auto
> -detect,
> or various other ways that having options with no enable or disable
> values
> can break.  At that point I'd actually fix upstream's configure and
> send a
> patch instead of attempting to work around it.
> 
> Ross

Understood. Will have a look into configure of the packages.

Thanks
Max


