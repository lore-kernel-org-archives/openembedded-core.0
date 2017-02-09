Return-Path: <dwesterg@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC8986069C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 21:02:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 194so1229095pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 13:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:in-reply-to:references:date
	:mime-version:content-transfer-encoding;
	bh=ryBvWPBGvYUjduT1v9V82L+G8aglMP65NXZ8ImQMHt8=;
	b=dhRK2zPJiVeIpyHSA7eNnEm1Fj6OV1IusVLM86SFITB2+yXfMJcoP7TV9hIP4L7+6/
	5MScnKmV+jli/YFB3OipOFd00bn7RgzNQQQ09VtEq3NWwBsHVnxeD6o3G9Tu/lav+pQE
	kgKNNUF4VTC7ira5i6haIb3Ib18IgVzuOCIw/n//IUEsLo1BjPmDXyXh49eGmJXWm2vA
	O9g4HoVo6iIgx7pLvEFhnvx47a8oig+71p4TYg2xG+PlFbRlzxwhXAgn6BiVp5uHrKoB
	A4fq4YzNY1AuVsQGZtMIx/o/QSSdEEt4PmbgFnG0T/SjydGhVriYTHo7zyv+9AAYNzlQ
	nC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:in-reply-to
	:references:date:mime-version:content-transfer-encoding;
	bh=ryBvWPBGvYUjduT1v9V82L+G8aglMP65NXZ8ImQMHt8=;
	b=mjxLFAE7yBP3VRNxgsIUtZfRmpICEgQSjG/j8V/LfPl/3HVF6Re8socLgarG1YicLQ
	k91Lt/w33D82K2CySZJFVWUuAdeXtwKwOVaMkf5+5JaduxTWZuChbXu8EFB3TTQZ1oTt
	9EiCG9gXPO6t51QuU9aOYNM++iqxTJo6q5Eok8/WaovTRhejM8wmWaP60G83ZgBbDL2H
	wF9f/gnHIo5NNIKiOXbu/kcfsbnDAAdBYqfES1/GmI+BW1AE1RCDomf2hdiYIUjz60nJ
	n2VYNgQXUSY0/Mww6AE8KZWSPp8EOBAJM6XI4GYXKB+OeQ19kqLNUi4qv22e4HuUia0k
	IlMw==
X-Gm-Message-State: AMke39nysB7a6dOeQEkhY2VPBVApTvV4X7bVbNynqR5IdlVpLtz2cbQxx29cvNoihhd1/A==
X-Received: by 10.99.131.65 with SMTP id h62mr6387956pge.41.1486674151037;
	Thu, 09 Feb 2017 13:02:31 -0800 (PST)
Received: from hfantroy-mobl.amr.corp.intel.com (jfdmzpr05-ext.jf.intel.com.
	[134.134.139.74]) by smtp.googlemail.com with ESMTPSA id
	e7sm31432468pgp.2.2017.02.09.13.02.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Feb 2017 13:02:30 -0800 (PST)
Message-ID: <1486674148.7361.125.camel@gmail.com>
From: Dalon Westergreen <dwesterg@gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
In-Reply-To: <CAAPZna0y4nMEUWrQQbBmXsu=4YSYekOATCe8e1c-NbDvGT9xvA@mail.gmail.com>
References: <1486656570-20299-1-git-send-email-dwesterg@gmail.com>
	<CAAPZna0y4nMEUWrQQbBmXsu=4YSYekOATCe8e1c-NbDvGT9xvA@mail.gmail.com>
Date: Thu, 09 Feb 2017 13:02:28 -0800
Mime-Version: 1.0
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-extlinux-config.bbclass: add support for timeout & default
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
X-List-Received-Date: Thu, 09 Feb 2017 21:02:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-02-09 at 18:25 -0200, Fabio Berton wrote:
> I get this error:
> 
> Exception: UnboundLocalError: local variable 'localdata' referenced before
> assignment
> 
> You are using localdata.getVar('UBOOT_EXTLINUX_TIMEOUT') before localdata =
> bb.data.createCopy(d).
> 
thanks.

> On Thu, Feb 9, 2017 at 2:09 PM, Dalon Westergreen <dwesterg@gmail.com> wrote:
> > When multible targets are defined it is useful to allow for
> > a default target along with a timeout.  After timeout, the
> > default target will be selected.
> > 
> > Signed-off-by: Dalon Westergreen <dwesterg@gmail.com>
> > ---
> >  meta/classes/uboot-extlinux-config.bbclass | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/meta/classes/uboot-extlinux-config.bbclass
> > b/meta/classes/uboot-extlinux-config.bbclass
> > index ec5fffb..96b5a2e 100644
> > --- a/meta/classes/uboot-extlinux-config.bbclass
> > +++ b/meta/classes/uboot-extlinux-config.bbclass
> > @@ -16,6 +16,10 @@
> >  #                                    concatenate and use as an initrd
> > (optional).
> >  # UBOOT_EXTLINUX_MENU_DESCRIPTION  - Name to use as description.
> >  # UBOOT_EXTLINUX_ROOT              - Root kernel cmdline.
> > +# UBOOT_EXTLINUX_TIMEOUT           - Timeout before DEFAULT selection is
> > made.
> > +#                                    Measured in 1/10 of a second.
> > +# UBOOT_EXTLINUX_DEFAULT_LABEL     - Target to be selected by default after
> > +#                                    the timeout period
> >  #
> >  # If there's only one label system will boot automatically and menu won't
> > be
> >  # created. If you want to use more than one labels, e.g linux and
> > alternate,
> > @@ -25,6 +29,9 @@
> >  #
> >  # UBOOT_EXTLINUX_LABELS ??= "default fallback"
> >  #
> > +# UBOOT_EXTLINUX_DEFAULT_LABEL ??= "Linux Default"
> > +# UBOOT_EXTLINUX_TIMEOUT ??= "30"
> > +#
> >  # UBOOT_EXTLINUX_KERNEL_IMAGE_default ??= "../zImage"
> >  # UBOOT_EXTLINUX_MENU_DESCRIPTION_default ??= "Linux Default"
> >  #
> > @@ -34,6 +41,8 @@
> >  # Results:
> >  #
> >  # menu title Select the boot mode
> > +# TIMEOUT 30
> > +# DEFAULT Linux Default
> >  # LABEL Linux Default
> >  #   KERNEL ../zImage
> >  #   FDTDIR ../
> > @@ -82,6 +91,15 @@ python create_extlinux_config() {
> >              if len(labels.split()) > 1:
> >                  cfgfile.write('menu title Select the boot mode\n')
> > 
> > +            timeout =  localdata.getVar('UBOOT_EXTLINUX_TIMEOUT')
> > +            if timeout:
> > +                cfgfile.write('TIMEOUT %s\n' % (timeout))
> > +
> > +            if len(labels.split()) > 1:
> > +                default = localdata.getVar('UBOOT_EXTLINUX_DEFAULT_LABEL')
> > +                if default:
> > +                    cfgfile.write('DEFAULT %s\n' % (default))
> > +
> >              for label in labels.split():
> >                  localdata = bb.data.createCopy(d)
> > 
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> 

