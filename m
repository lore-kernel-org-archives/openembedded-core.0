Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D43157723F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:00:56 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id d63so19832290ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 07:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=2ktVmFoYXJhcCoJI+97zOnall8QodnW9pUs2y9b9vsE=;
	b=SCEjSCDn9yPxN30K1xgYDV10gk04ElHJ9f1NoE6fHlu/6cdFk5jIUblWTIt0PD7eJK
	xBq4YeOXu7gu+tGf3TmkDfE1z7L+Y0Ie62AANFo4SI4kw3Iy0j1aB2RODz+WpnQdmMNp
	GgLIu/seqAN6hF/kEp9Hc6OhNSdw7R+3jKHT6FgsaU+KrL4NNafqWZlpGxjXG+TutWqG
	edGgSIEzyPdWuZh2F7nRQ78nCPEGOuq1n++087U4gFNlS7BEYkgyZABzJ+CW+jeTJXyF
	Wxz/lp5w/KBmbphL9IK4qAFsjo7NeqsOTRyUkRCjDlJzaplK8CH4/kKRDueQrzvkkqvn
	kJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=2ktVmFoYXJhcCoJI+97zOnall8QodnW9pUs2y9b9vsE=;
	b=Uw9uftcew0grCIkr8afeS/I8+uTkeCfsfiL07A5aza16v2TYZAjgrm1VZNdUt1xNhi
	WlTZl2UuxXutB/2uKG5382T0IJ+WWC981z8f8U+HDP6HEdlrFCbbda6lkZdcGZ/5kJs0
	FLdULfazgc2Ku6zJhWASP8JLdbU6F0uZPfrNLqzA+534KkhKAlnCxv2Og3aZm+kAfw1y
	PEPf+pazthLPHzjFW3vb54RzGf6Me5hgN5INfR8DoFsnAvre+8eHMvn+ZE+gauO0t9OY
	2LGO3SX8WG2uKNO0VDk2zBAIWlnMBjO0BgE4wxT3hb8RB0ja2C5woQlhMbhEhzLnNeIA
	YJ9g==
X-Gm-Message-State: AG10YOTUjKStptsp15CEqw8gsDCxaJFu+yw8HFvmMGuJ2W95vc3u8rMjG6dMgBVJqp8NYx5G
X-Received: by 10.107.14.73 with SMTP id 70mr29295676ioo.31.1454425256533;
	Tue, 02 Feb 2016 07:00:56 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D4FD.dip0.t-ipconnect.de. [93.232.212.253])
	by smtp.gmail.com with ESMTPSA id
	vf11sm6347222igb.20.2016.02.02.07.00.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Feb 2016 07:00:55 -0800 (PST)
Message-ID: <1454425253.22914.5.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 02 Feb 2016 16:00:53 +0100
In-Reply-To: <CAMKF1srg=gT+SNznGFoLG2p_gHdwf4FW0UQk_5DqxKTB_A_k4Q@mail.gmail.com>
References: <1453495750-104494-1-git-send-email-raj.khem@gmail.com>
	<CAJ86T=U6jUg7+nLPVz_=cEodqRNcK=zHvu3yJBOvg+b9V0XXWA@mail.gmail.com>
	<1454314457.20696.16.camel@intel.com>
	<CAMKF1srg=gT+SNznGFoLG2p_gHdwf4FW0UQk_5DqxKTB_A_k4Q@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: Add support for busybox-init
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
X-List-Received-Date: Tue, 02 Feb 2016 15:00:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-01 at 08:57 -0800, Khem Raj wrote:
> On Mon, Feb 1, 2016 at 12:14 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > On Mon, 2016-01-25 at 11:39 -0800, Andre McCurdy wrote:
> >> > +        if grep "CONFIG_INIT=y" ${B}/.config; then
> >> > +                install -D -m 0777 ${WORKDIR}/rcS
> >> ${D}${sysconfdir}/init.d/rcS
> >> > +                install -D -m 0777 ${WORKDIR}/rcK
> >> ${D}${sysconfdir}/init.d/rcK
> >> > +                install -D -m 0755 ${WORKDIR}/runlevel
> >> ${D}${base_sbindir}/runlevel
> >> > +                if grep "CONFIG_FEATURE_USE_INITTAB=y"
> >> ${B}/.config; then
> >> > +                        install -D -m 0777 ${WORKDIR}/inittab
> >> ${D}${sysconfdir}/inittab
> >> > +                        tmp="${SERIAL_CONSOLES}"
> >> > +                        for i in $tmp
> >> > +                        do
> >> > +                                j=`echo ${i} | sed s/\;/\ /g`
> >> > +                                label=`echo ${i} | sed -e 's/tty//'
> >> -e 's/^.*;//' -e 's/;.*//'`
> >> > +                                echo "tty$label::respawn:
> >> ${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
> >> > +                        done
> >> > +                fi
> >> > +        fi
> >
> > SERIAL_CONSOLES is typically set differently for different machines. But
> > busybox is not machine-specific, therefore using SERIAL_CONSOLE like
> > this prevents sstate/package reuse or worse, causes package versioning
> > problems.
> 
> when busybox is used as init system then it becomes machine specific and we have
> a choice to do so which is disabled by default.

In my case, busybox is not the init system and the recipe is therefore
not machine specific. But the code above is active and thus introduces a
sstate dependency on the machine-specific SERIAL_CONSOLES anyway, even
though the code is dead (if check never reaches it).

The code would have to be added conditionally, and only when it is okay
to reference ${SERIAL_CONSOLES}.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




