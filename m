Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9E17FCD5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 19:52:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id z16so5380369pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 11:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to;
	bh=sspzxTN5r+X7rTj2nv1kjJV8y8+N576tSf10HQR4aTo=;
	b=cOQREkiPEj+kvNtajpRlr9X8SE+UzS7gqnOb3yZ12KdTk7uf/waePj7Am/Y5OaWdTt
	Su428PUbn8WWLNbEEXr1ONzBarCOS9bBywYHLrjTfQxzMvmvmc2RUENXpsS0OjIPjDSD
	eEZV6H9qAMemqEli7dYD/V6wMnLZI4310dSkGwgT8/uyegUVoHmJ4wblIpD53tnlbNlY
	BSKLwFnxcDNqVkxXp7yAGZEJSXHBn+PMs39jiETbaid6o1EqKZzUcFBzeIA2goFb7a2i
	PptM0bi8AqxIhP7VE+mJ9IwrdpEa76CErWBuOxSc7rToTCSEegiXHiHbh2HYTrygDrIF
	GBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=sspzxTN5r+X7rTj2nv1kjJV8y8+N576tSf10HQR4aTo=;
	b=oja/eJnXmO7MKvqhciXBFOYkCgh64+uRUwhGgPdKhkw1B4SBPqBUwOV8VMQtN1mWM/
	FpZ+uZPjTeaSRJ2BpD+AU/I+uy+h+3vgMPCNZcgMToL7H83F4qCGFK5xhogzLJZ4TJiO
	+jEZ4+zxFELevawh5+zZx35abaYp5VEEowagQT+QJIRl3HDxTNWSHe1CXtO87I1l+BJX
	VZ/b/1rIP158dqg+oOj5F4OYd/Kzg11gypMMrpV9+UTmKPt4pollIpSN20IsdffounGj
	GGmHqNfh9TAqApXfpa39azNc4FYd1U+eZV26Ci27C0ghScvnARBBGEBjcX1/SrU1Eexp
	SbyQ==
X-Gm-Message-State: APjAAAXC79jkh4VrQ7rw2WF4rUYGnd9araTFoRYEs8Quj2zeQE8VFDnf
	Rw50jC0JoceVstdRkVCqm0s=
X-Google-Smtp-Source: APXvYqzLtAZxIlRyfsJAkWeLa+n1QDw+Az0mzRZ1G0f0a6LXjGGQs1+OY0INRhpfcndQVC/5CxFMDg==
X-Received: by 2002:a62:1552:: with SMTP id 79mr21034281pfv.156.1578945145110; 
	Mon, 13 Jan 2020 11:52:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	z6sm15126016pfa.155.2020.01.13.11.52.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 11:52:24 -0800 (PST)
Date: Mon, 13 Jan 2020 11:52:23 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200113195223.vofhf7lamvwws4gj@apollo.localdomain>
References: <20200112135954.23868-1-crg7475@mailbox.org>
	<725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <725d92f91a56183e4166e633c0443fad44f6c5ba.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/12] gstreamer: Add common .inc files for meson based recipes
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
X-List-Received-Date: Mon, 13 Jan 2020 19:52:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 13, 2020 at 12:18:32PM +0000, Richard Purdie wrote:
> On Sun, 2020-01-12 at 14:59 +0100, Carlos Rafael Giani wrote:
> > * gstreamer1.0-plugins-common.inc
> >   The old gstreamer1.0-plugins.inc file, adapted for meson
> > * gstreamer1.0-plugins-packaging.inc
> >   The old gst-plugins-package.inc file, adapted for meson
> > * gstreamer1.0-ptest.inc
> >   Common code for meson based PTest support; autogenerates the run-ptest
> >   file and is designed to use the gnome-desktop-testing suite runner
> >   (which is why the .inc files inherits from ptest-gnome)
> > 
> > Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> > ---
> >  .../gstreamer/gstreamer1.0-plugins-common.inc | 47 +++++++++++++
> >  .../gstreamer1.0-plugins-packaging.inc        | 70 +++++++++++++++++++
> >  .../gstreamer/gstreamer1.0-ptest.inc          | 21 ++++++
> >  3 files changed, 138 insertions(+)
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-common.inc
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-packaging.inc
> >  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-ptest.inc
> 
> Thanks for this, I know its not an easy patch set to sort out!
> 
> I ran it on the autobuilder for testing since there was bandwidth
> available and there was one issue:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1455
> 
> which was in a plain OE-Core + bitbake build (no poky, so nodistro).
> 
> Any idea what is wrong there?

gcc: fatal error: cannot execute ‘cc1obj’: execvp: No such file or directory

seems it needs objC ?

> 
> Cheers,
> 
> Richard
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

