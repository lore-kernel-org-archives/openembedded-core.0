Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D30207F7BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 13:05:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id o184so3089099wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 06:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=TniWgX59k6E+ffQ3OrFD/IyEVqrnsnZe1Qm7ZipfFF0=;
	b=bXdvf0K5a1lJRgBkI0yXYUlHZkV7XdBdYq527evIXDKsrF4+SMUqqLOAT3F6WgvbGU
	vxAGyxo/yM9IffN9bN185SLoXMIHnmEpO/HdnXhukZTT45eU3cRNn+vGwLLfjJpGUTiV
	GY/Covf1G6ovOM6SS1G2tp0k4+fTMstYtCdvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TniWgX59k6E+ffQ3OrFD/IyEVqrnsnZe1Qm7ZipfFF0=;
	b=ZHd1pwziJzDeG0VGxh1bkY5KSS74QFzkZrj8CglGuy8deucgpCZAOZHkcW0kp8Jzx4
	uQ6Gbfwn5/d9Sbd2+mi5LxsEyxse0raBNZyLBvdaryQlh2VaDgJIlMLXmSQopQtcGP5U
	yDC1yhpX4na5dtCUBF6kMT1WlSteehYJqP4udF54RzYGmjBQUFpWtJF8tUJJ3KJbGJYD
	b6VTYM1vCxAE/krWwqxAvuWBDPiYRX+VtShvq/EdUc8E8GtuCn4Eop7qt53Wj6wgbhQf
	aQ9TvKhA0D548MHdoG4i6gcPyzpREhwuvKdBe093q5annikc6WFJWsaNxyv+zd/zH2c5
	Y3ww==
X-Gm-Message-State: APjAAAUS97+fKq/Z8CeC4mSeC2Vl+FKai0fugkWaNYJLxKTWxonO1DnK
	ZnW/o0UqVScj7iud7fT3zspOIA==
X-Google-Smtp-Source: APXvYqym5Jd2SsyI8qYpN03yUhBB95v1/yHAqPtPkqieWYxJ+7LqXNZUysITlgZLBnGH24bxx3no4A==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr3460635wme.152.1568725536375; 
	Tue, 17 Sep 2019 06:05:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m16sm2835045wml.11.2019.09.17.06.05.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 06:05:35 -0700 (PDT)
Message-ID: <5e240acca6e16918443aa0d59d383388bc85f479.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 17 Sep 2019 14:05:33 +0100
In-Reply-To: <CALT56yNwveFV09w6x0Lit0sFOZ8v3cc9_2u09mkko0-kkpzEtg@mail.gmail.com>
References: <20190913154434.29908-1-dbaryshkov@gmail.com>
	<23aa15d10f0bfb0cc558caa5dd84991f465dba4a.camel@linuxfoundation.org>
	<CALT56yNwveFV09w6x0Lit0sFOZ8v3cc9_2u09mkko0-kkpzEtg@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/9] uefi.bbclass: add bbclass holding configuration for UEFI applications
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
X-List-Received-Date: Tue, 17 Sep 2019 13:05:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-09-17 at 12:33 +0300, Dmitry Eremin-Solenikov wrote:
> вт, 17 сент. 2019 г. в 01:17, Richard Purdie
> <richard.purdie@linuxfoundation.org>:
> > On Fri, 2019-09-13 at 18:44 +0300, dbaryshkov@gmail.com wrote:
> > > From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com
> > > >
> > > 
> > > Create new bbclass defining common variables for all UEFI-related
> > > packages (bootloaders, test applications, etc).
> > > 
> > > Signed-off-by: Dmitry Eremin-Solenikov <
> > > dmitry_eremin-solenikov@mentor.com>
> > > ---
> > >  meta/classes/uefi.bbclass | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >  create mode 100644 meta/classes/uefi.bbclass
> > 
> > I really want to get away from the proliferation of bbclass files
> > we
> > have. Wouldn't this make more sense as a .conf file?
> 
> Moving configuration to .conf file might make sense. I even can
> implement anonymous function as per-arch override. However there are
> still functions like efi_populate_common() and
> efi_iso_populate_common(), which can not be moved to .conf file.
> 
> Would you prefer separate uefi.conf file and uefi-bootloader.bbclass
> files

Would functions like this not be better suited to a lib/oe/efi.py ?

Its really easy to just put everything in a bbclass but I'm not
convinced its scaling well...

Cheers,

Richard


