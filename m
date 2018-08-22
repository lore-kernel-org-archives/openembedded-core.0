Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4F294792A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:05:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u12-v6so291061wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PdY23Ul+QjULg65JikZ3tQc2LfulzZnMQmaLWlDlmcU=;
	b=bZnDyaP4qAV9eR99Yt56Pe6mSS74oEXhbFG6LPRi6wJfEzhGO4BlG7Xwux8eQT+KWZ
	BjGOUsd6HXDMFKC4DzpIqKbCBbk6ZLRzGz0srzOZ+j4vFUT5gYqXycTCw8lGbIWxV2Wl
	+lgiO0F9fQyI7oGILByfNkGpr07uqloPq6nBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PdY23Ul+QjULg65JikZ3tQc2LfulzZnMQmaLWlDlmcU=;
	b=Zt1Jo/oV8GwtY+UVOJvKxYUcn4NslRriTyO/pRdINweg3g1X1i6IQckl5vWrTJ3byc
	XUjo0YyD8NIKbZSgAGJSZzQE3XpnZr6+TiFI2MG+K+5VWEQKLHgynkf4Fhpwg2g5ODrZ
	aFa9lhNP7x3sS9leLFAk3T99yEkND42jBKH5BSxpS+vLytfrzDVqkVzpNCiTeeWq7i6b
	JkpDrF76WS79RJDD+F3NUW6SBai5UW60YJtfj8EHpII3jfeQCILmP67H6OquJpZhVJnM
	+ZUz2MZQK14unkfWQuWssEq7Nacxm7o02BmurrWufLKG5GvEAYFXsSDYsS/4mNKKxPmA
	8akw==
X-Gm-Message-State: APzg51C0wFnE9ZQ4LYoAUewo8KX3nlP6eW0E4j79sxMMO2/fCfYBaYDA
	5ThkMI/x2ebtG6HohNATcoQDSw==
X-Google-Smtp-Source: ANB0VdbirPNoO204f43wTDqoUBs2Zf5974CckOBdPNcBxECHusn5HZEJSJl5b/mHdipJ49CxYHOgBg==
X-Received: by 2002:a5d:45cb:: with SMTP id
	b11-v6mr7115254wrs.122.1534943157024; 
	Wed, 22 Aug 2018 06:05:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l12-v6sm412176wrv.29.2018.08.22.06.05.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Aug 2018 06:05:56 -0700 (PDT)
Message-ID: <a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 14:05:54 +0100
In-Reply-To: <CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
	<CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Wed, 22 Aug 2018 13:05:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 15:02 +0200, Ricardo Ribalda Delgado wrote:
> On Wed, Aug 22, 2018 at 3:00 PM <richard.purdie@linuxfoundation.org>
> wrote:
> > 
> > On Wed, 2018-08-22 at 14:48 +0200, Ricardo Ribalda Delgado wrote:
> > > On Wed, Aug 22, 2018 at 2:45 PM <richard.purdie@linuxfoundation.o
> > > rg>
> > > wrote:
> > > > 
> > > > On Tue, 2018-08-21 at 16:58 +0200, Ricardo Ribalda Delgado
> > > > wrote:
> > > > > RTLDLIST table does not include /lib/ld-linux-x86-64.so.2,
> > > > > resulting
> > > > > on the following error:
> > > > > 
> > > > > root@qt5122:~# ldd ./qtec_webcam
> > > > > not a dynamic executable
> > > > > 
> > > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail
> > > > > .com
> > > > > > 
> > > > > 
> > > > > ---
> > > > >  .../glibc/glibc/0031-ldd-rewrite.patch        | 22
> > > > > +++++++++++++++++++
> > > > >  meta/recipes-core/glibc/glibc_2.28.bb         |  1 +
> > > > >  2 files changed, 23 insertions(+)
> > > > >  create mode 100644 meta/recipes-core/glibc/glibc/0031-ldd-
> > > > > rewrite.patch
> > > > 
> > > > I'm a bit confused as with MACHINE=qemux86-64, building core-
> > > > image-
> > > > sato
> > > > with ldd added to IMAGE_INSTALL, ldd works correctly even
> > > > though it
> > > > has
> > > > /lib/ld-linux-x86-64.so.2 (which is listed in RTLDLIST).
> > > > 
> > > > We have an automated QA test checking this too:
> > > > 
> > > > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oeqa/ru
> > > > ntim
> > > > e/cases/ldd.py
> > > > 
> > > > Which version of the project are you using? How would we
> > > > reproduce
> > > > the
> > > > issue?
> > > 
> > > I am using yocto-sumo
> > 
> > I'm not aware of any fixes since sumo in this area...
> > 
> > > Maybe your tests are run agains an image that has the package lsb
> > > installed. Which creates symbolic links to the standard locations
> > 
> > There is no /lib64 in the image and I'm not using or installing
> > lsb...
> > 
> > There is significant rewriting done as part of:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-core/gl
> > ibc/glibc-ld.inc
> > 
> > What value of RTLDLIST is your build showing?
> 
> RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> /libx32/ld-linux-x32.so.2"

Here I see:

$ MACHINE=qemux86-64 bitbake glibc -e | grep ^RTLDLIST=
RTLDLIST="/lib/ld-linux-x86-64.so.2"

Not sure why its different without looking at the code but its
something to look into...

Cheers,

Richard

