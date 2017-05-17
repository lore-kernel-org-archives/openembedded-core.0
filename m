Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 809ED77E46
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 22:37:08 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d127so6893436wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=f6TeKdp0goSjvyX2yqr8YgXKny78i961WGjhxZL/Tt4=;
	b=guQs0/rKYpy7R9xKAFrei+HqYArvraR+Jq6o8JOIRWZ1jqHwzvuJ7I3NXkTHOKxgDI
	wbLwMYnuJViNI6cODl5z31sD/D4F4ew3NiytanOoCzQBt5ZqzUPw/+aAkU9SaYiOuXlf
	sHxXRPDV19gHjY7VcGTI+U/ES1wN/5HEiFIKR3eGXoWpDI2KQCJbbcYt/uRvpOatppS7
	ijbiCo1/gHPqUG8DD5MyaRd9eqRiGPAScS//S6zuiAJjP5dteDak70j/rPW3HPJriu5T
	GVp83FFrBpYMfFNHK+CI6MO7fULYrtYjmJS8CfaAl6fCHAqeE7sdhzSpFrKElo4o9Re7
	gzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=f6TeKdp0goSjvyX2yqr8YgXKny78i961WGjhxZL/Tt4=;
	b=J1ffE8y1w76fReHLUeHexRxk7gHULlNvm0M6QslWG9JtILqP45D3hlfzwnvju73Kbu
	56lLlDL7Mphf1Kq9qaYuhqI1m48MDMpD9Sn3y0hdoF+Lw8Tdqtn8s2IfRDoXtK47bLTW
	c41CxpB0QaQflziZMqMaJqb8a0FODQHytvAg5AnRKzuguAxv2WV0DEmoLy/XesBIQuyD
	R+nugYuqbYZr8sJrM0MowBih78LuVMRRR2ED0dMLYCyxzYuF/clb1dEXOELHy+uNtIxK
	sruLNj8LsjdOWy0oIzco8N9V14RhLvxyhDyAR5XHBb2TH0TXQblXCm6Ki4VXcPlRjhzP
	ta7g==
X-Gm-Message-State: AODbwcAfpahDxQAysNfg009E7qOaIqwzDxW2UkSjuJke95DDPd9uRF2y
	sQpn/lEGAtsz/A==
X-Received: by 10.80.184.129 with SMTP id l1mr721415ede.88.1495060629874;
	Wed, 17 May 2017 15:37:09 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138]) by smtp.gmail.com with ESMTPSA id
	h29sm1655970eda.45.2017.05.17.15.37.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 15:37:09 -0700 (PDT)
Message-ID: <1495060628.9242.2.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>
Date: Thu, 18 May 2017 00:37:08 +0200
In-Reply-To: <CAJ+vNU1kh56xNCvy77zMM2Pc5hnaM+jFBhzdvip5h2dQ_+YMNA@mail.gmail.com>
References: <CAJ+vNU02n6DavkhuwM8gU7daWLyyd4QHgd0N5topHJQiO2_6RA@mail.gmail.com>
	<1495052131.7502.1.camel@gmail.com>
	<CAJ+vNU1kh56xNCvy77zMM2Pc5hnaM+jFBhzdvip5h2dQ_+YMNA@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: populate sdk broken for u-boot-mkimage
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
X-List-Received-Date: Wed, 17 May 2017 22:37:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 17.05.2017, 14:29 -0700 schrieb Tim Harvey:
> On Wed, May 17, 2017 at 1:15 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> > Hi Tim
> > 
> > Just sent a patch which may fix what you see.
> > 
> > Regards
> > Max
> > 
> > Am Mittwoch, den 17.05.2017, 12:36 -0700 schrieb Tim Harvey:
> > > Greetings,
> > > 
> > > I'm running into the following build error when trying to create an
> > > SDK for an image that includes u-boot-mkimage-native.
> > > 
> > > The nativesdk-u-boot-mkimage do_package task fails with:
> > > ERROR: nativesdk-u-boot-mkimage: chrpath command failed with exit code 7:
> > > b'/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u
> > > -boot
> > > -mkimage/1_2017.01-r0/package/opt/fslc-x11/2.3/sysroots/x86_64-fslcsdk-linux/usr/bin/uboot
> > > -mkimage:
> > > RPATH=/usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk
> > > -u
> > > -boot-mkimage/1_2017.01-r0/recipe-sysroot-native/usr/lib:/usr/src/ventana/yocto/pyro
> > > -2.3/build/tmp/work/x86_64-nativesdk-fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01
> > > -r0/recipe
> > > -sysroot-native/lib\n'b"new
> > > rpath '$ORIGIN/../../../../../../../usr/src/ventana/yocto/pyro-2.3/build/tmp/work/x86_64
> > > -nativesdk
> > > -fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot
> > > -native/usr/lib:$ORIGIN/../../../../../../../usr/src/ventana/yocto/pyro
> > > -2.3/build/tmp/work/x86_64
> > > -nativesdk-fslcsdk-linux/nativesdk-u-boot-mkimage/1_2017.01-r0/recipe-sysroot-native/lib'
> > > too large; maximum length 287\n"
> > > DEBUG: Python function perform_packagecopy finished
> > > DEBUG: Python function do_package finished
> > > ERROR: Function failed: perform_packagecopy
> > > 
> > > I'm guessing this has something to do with the long list of args in
> > > EXTRA_OEMAKE_class-nativesdk from
> > > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.
> > > bb
> > > 
> > > Any ideas?
> > > 
> > > Regards,
> > > 
> > > Tim
> 
> Max,
> 
> indeed your patch '[OE-core] [PATCH] u-boot-mkimage: fix nativesdk
> build' resolves my problem.
> 
> This should be backported to at least the pyro branch as well I would assume?

Yes, I expect that pyro has the same issue, morty likely does not though.

Max


