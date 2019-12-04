Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 19A6F7F7D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 20:18:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t14so1155267wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 12:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=9A7Vz8s9ObMLP4L3AfHyTJ31d6ExMGTmkl9sL+YPd38=;
	b=T2Dh4ur7t+kMvp6j/XBOLiaUKgPqEWmnqkMVw2MiicjQJlUtkDHLitIKV5L2H9c590
	k8v5JRvU/KwTOQn2aGztrOJZp0Q9Lvsyk+dpjCkHwFDwqua+MwSOQk2HSxzLBHy421c2
	F4EBvwkWOwx/iUuLqjyMBc7b21dRAv9XvZRi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=9A7Vz8s9ObMLP4L3AfHyTJ31d6ExMGTmkl9sL+YPd38=;
	b=EphGGc44x3QISHJGAaHkwFoIsBawP+iXCmjl8KVQ0sKInA/p2kj7bGnKRvk0VxtY3P
	LzchugmEAruH5huS42PgBCrVOkpHQLVUz15bRbsOt+LaU2wYEzDNTww+SgEMMeVoV7QC
	KScH/mpU0A+F7GDaUwTAD71knQdzvhnegM5cmVOWfQyCo+srWgKVsH1LzXkHO/HptltM
	GWd3wApyjH47fwUoAijyRF9vA/xyzKnHCJUE8pQVefJeRdyqDJIkyR8eNRcxHCOnJofk
	u2QVVVS2ysauMzEelSS80qG3IBj9FemqWAGtRLD8Y3/YOY+c1P2vyUhY8YxfH/lwkPKr
	JwSg==
X-Gm-Message-State: APjAAAXuPFIaDPDSAO4cjJ4UIwGAmT1IxNoB0IVUu+wWHW99c+P1B662
	Y5qCRNWMxplYMA8YAw5fT/Bl7A==
X-Google-Smtp-Source: APXvYqzFWqJKjpmqm6741TulJrOA52QZapiDY0mVtwKo+4teZ75QSyTF4m9/KvBsZXs3cP3yQnIa/Q==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr1498046wmj.54.1575490697833; 
	Wed, 04 Dec 2019 12:18:17 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a14sm9993276wrx.81.2019.12.04.12.18.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 12:18:17 -0800 (PST)
Message-ID: <6cada1f180fe4bad594d71033573ff9fba3a30e9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 04 Dec 2019 20:18:15 +0000
In-Reply-To: <CAMKF1sp29T-e0=5BBoX_=ZtUEs7fh3qAU9P__dXQH6NxCL+6hw@mail.gmail.com>
References: <20191204193254.2418208-1-raj.khem@gmail.com>
	<ea686615755dd811edab17648e6b5ac2377bf1af.camel@linuxfoundation.org>
	<CAMKF1sp29T-e0=5BBoX_=ZtUEs7fh3qAU9P__dXQH6NxCL+6hw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: Use PCRE for hardlink
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
X-List-Received-Date: Wed, 04 Dec 2019 20:18:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-12-04 at 12:12 -0800, Khem Raj wrote:
> On Wed, Dec 4, 2019 at 12:00 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2019-12-04 at 11:32 -0800, Khem Raj wrote:
> > > Use PCRE, this enables using posix extended Regexps on cmdline
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/util-linux/util-linux.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > > b/meta/recipes-core/util-linux/util-linux.inc
> > > index 1fa82363b1..8f867aa9b4 100644
> > > --- a/meta/recipes-core/util-linux/util-linux.inc
> > > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > > @@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "
> > > file://README.licensing;md5=972a134f1e14b2b060e365df2fab0099
> > > 
> > >  #gtk-doc is not enabled as it requires xmlto which requires
> > > util-
> > > linux
> > >  inherit autotools gettext manpages pkgconfig systemd update-
> > > alternatives python3-dir bash-completion ptest
> > > -DEPENDS = "libcap-ng ncurses virtual/crypt zlib"
> > > +DEPENDS = "libcap-ng ncurses virtual/crypt zlib libpcre2"
> > > 
> > >  MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
> > >  SRC_URI =
> > > "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.t
> > > ar.x
> > > z \
> > 
> > Given it works today without that, shouldn't it be a PACKAGECONFIG?
> 
> its default with other main linux distros. I thought since what we
> were doing was not
> default, I did not see a need for packageconfig. I can certain do a
> v2 with packageconfig and enabling it by default, is that better ?

We're embedded so we're supposed to expose this kind of config and tend
to the more minimal ;-)

Cheers,

Richard


