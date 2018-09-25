Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C786279480
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:54:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j15-v6so19383294wrt.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fFUqo3tHlznIL85E46oJSTuaYV+MxuEfzC42BQ6dzYg=;
	b=iC/YJATB3CypTFR9tVpqI2loLNSfTN/LJpqTnRsF/USdWlOdOZMuekGPOeIca+uFuy
	1TEkpMpOpMerFEpJXcIbE5pdXd4Nbnb+AhMYrC+Bh8yITrXmUbw7G98stdvZLj1bLNdd
	IiALYGLAGsVNycA0TNiGLsWuis8zcumdeyUo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fFUqo3tHlznIL85E46oJSTuaYV+MxuEfzC42BQ6dzYg=;
	b=Wx5HpFWIw7BI6rx40daQDgKqO2WBvtwFrsR/Wa/aIinp5JDVG9Ijirz5vGcoerc1th
	hpHQ2UZlTkdVDmlka/g1hB/EfVlNuJQmoeQYc87nYxnsZov5gftOW+KhNgkze9OfBZDf
	CfpW46cVjD6WRvan9D+i6l8aYbvXhNYd+RYPCI9YAGv/whiU/PcBuHd0abcnOVc/Q4m2
	bMfSGXnQ8zq2Ec9//DfWG0evnqQ6EeYTKf78X9+WmVdWiQPUFQCvBBb4c3Wm8tMm9p/y
	4RmvsecAyYadL9nwcvkHkxo/TTPkLECmIYmUOiG09hZFpaYiPTsY7iO+nbA7L19QwBDR
	OqfQ==
X-Gm-Message-State: ABuFfojlZKhp1ixpYfA86JYDsqKrWOLf5x2vjY+LoPho9EhSQ8m9X4ow
	Ywv+66RxbgPTIMAi53nFu4I2sQ==
X-Google-Smtp-Source: ACcGV62k2lwHEtfjsUXMBr58BwZl1sgXswk1w8lnhg62OW6A3b41UTFiQt3XT9syng0bJ5b08OE0tA==
X-Received: by 2002:adf:e50b:: with SMTP id
	j11-v6mr1080562wrm.111.1537883686446; 
	Tue, 25 Sep 2018 06:54:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h8-v6sm2851192wre.15.2018.09.25.06.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Sep 2018 06:54:45 -0700 (PDT)
Message-ID: <8ea9a7fb6034ecee04260ec19fc66af6c348f32e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Urs =?ISO-8859-1?Q?F=E4ssler?= <urs.fassler@bbv.ch>, Andreas Oberritter
	<obi@opendreambox.org>, openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 14:54:44 +0100
In-Reply-To: <aad5fbd908a38999b681052115038764caf45c5f.camel@bbv.ch>
References: <20180919064135.30249-1-urs.fassler@bbv.ch>
	<20180919171113.21fecc56@t460p>
	<ed51b3579be101e9d2f711ef9f94d16029981f92.camel@linuxfoundation.org>
	<1537795580.13947.1.camel@bbv.ch>
	<aad5fbd908a38999b681052115038764caf45c5f.camel@bbv.ch>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH] openssh: resolve install conflict with openssh-sftp-server-dev
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
X-List-Received-Date: Tue, 25 Sep 2018 13:54:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-09-25 at 15:05 +0200, Urs Fässler wrote:
> On Mon, 2018-09-24 at 15:26 +0200, Urs Fässler wrote:
> > On Wed, 2018-09-19 at 09:01 -0700, Richard Purdie wrote:
> > > On Wed, 2018-09-19 at 17:11 +0200, Andreas Oberritter wrote:
> > > > On Wed, 19 Sep 2018 08:41:35 +0200
> > > > Urs Fässler <urs.fassler@bbv.ch> wrote:
> > > > 
> > > > > Image generation fails with the configuration:
> > > > >   EXTRA_IMAGE_FEATURES = "ssh-server-dropbear eclipse-debug
> > > > > dev-
> > > > > pkgs"
> > > > > This is due the dependency eclipse-debug -> openssh-sftp-
> > > > > server 
> > > > > ->
> > > > > openssh-dev -> openssh. openssh can not be installed since it
> > > > > conflicts
> > > > > with dropbear.
> > > > 
> > > > That's odd. Why does openssh-sftp-server depend on openssh-dev?
> > > > Does
> > > > openssh-dev contain a file which it shouldn't, e.g. a
> > > > dynamically
> > > > loaded module/plug-in?
> > > 
> > > It doesn't, its the fact that "dev-pkgs" are requested in
> > > IMAGE_FEATURES. "openssh-dev" would be the default for openssh
> > > packages
> > > and dropbear-dev would be the default for dropbear packages. 
> > > 
> > > The patch here doesn't sound correct. I'm wondering if the
> 
> correct
> > > fix
> > > is for ${PN}-dev should not depend on ${PN} and whether that
> > > would fix
> > > the problem?
> > 
> > The dependency from ${PN}-dev to ${PN} seems to be the default
> > behavior
> > in Yocto. I don't know the consequences when we change this for
> > openssh. But it helps in my case.
> > (I added RDEPENDS_${PN}-dev = "", didn't found a better way)
> 
> If somebody know the implication of removing the dependency from
> ${PN}-dev to ${PN} for openssh and give the ok for it, I am fine with
> this solution.

I have an idea of the potential problems but I think we should consider
it. It would need wide testing and is a 2.7 change at this point.

Cheers,

Richard


