Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6127F323
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 11:48:23 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s15so2105286wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=TdCD/BrOzjg11EVeI8zVWN0yHVFNNuAtWAlPfINUKfI=;
	b=WoGAxDKhm6wdulgaRAldTu50ugfL7dypJxTXWdEm++ruhWMB/r/+ZJJBfHcIketM5Z
	Rdce+VhEdXi/Ey4quyXbKBIyt14ZMl2K8CL+Wj4CyzKk0eWw87Y/G3ch9qLLvHjqwJ0W
	F1hhUkvWaR46MJGZk0++BaSK53NTyIXCkS58b9N5bc9ggS94U8xyUEeyCvotIsWw/I++
	r3j5c7W60PPKwtFT4+xu//iGwNlScEEGhL93OcsLrGlSIeCX+ZwajHLhZcWSjZG3r3aZ
	2O17XtzhiKcZREAg8NR8iG7hc5ADyaklPfEt8yGQhcTA3xDC+yCGPs1/+RIb56nW3N/T
	LrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TdCD/BrOzjg11EVeI8zVWN0yHVFNNuAtWAlPfINUKfI=;
	b=mvCZ7wN2vsTrdjY770qN+x31d0hjehg5OVJOrcGqEQLGmRB2356oIaTkSIbwXkGw2b
	SiUotQpDqGjK7xa/KML8l2x52G3B7QDRTm2Zxt4rCs6SnGfa5d7ncwcgY/t+dqZ2CP8U
	qLrwEhmYmenPikoErGxgyhDhWezCePvUucfj525fnWzkkuMZCgzG7g4/paET8fAdnMHm
	jI3X84Q57ZfaG5OCMs4vvh8x4zyRHcEa0xsD5e/QeqjjIAsf2JDAPFSveux60hQCj+9v
	Ob/cOSTjOCaXiylB0buviOlx7UGnFMiKOERxCbMKpO+tZIKWN8PY32kVVoCPSDB6J1AH
	GSCw==
X-Gm-Message-State: APjAAAUVLR131lserFg7M8hDP7T0XmTRHp9MhUfHLPUvZ1dv1CCzRmVC
	MlRwWlRNGpHCpIq//2IIKwd2qZmE
X-Google-Smtp-Source: APXvYqwhqVho5z/zY7Lseo8TeU9GKsfT4/ODMyV+pvCpD/RPX9VjCbfUQIjjSrVBf2qWmGo4FOvNDw==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr3936753wmb.39.1565264903444;
	Thu, 08 Aug 2019 04:48:23 -0700 (PDT)
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
	by smtp.gmail.com with ESMTPSA id z7sm2253001wmg.22.2019.08.08.04.48.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 04:48:22 -0700 (PDT)
Message-ID: <09712a9113c606faf3b96e02cf3f009ef931507c.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 08 Aug 2019 12:48:22 +0100
In-Reply-To: <20190805105232.16148-1-luca.boccassi@gmail.com>
References: <20190805105232.16148-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH] python3-pygobject: move python3-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Thu, 08 Aug 2019 11:48:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> On 05/08/2019 11:52, luca.boccassi@gmail.com wrote:
> >   inherit gnomebase distutils3-base gobject-introspection upstream-
> version-is-even
> >   
> > -DEPENDS += "python3 glib-2.0"
> > +DEPENDS += "python3 python3-setuptools glib-2.0"
> 
> If setuptools is a build dependency then surely you mean 
> python3-setuptools-native.  And if you need python3-setuptools-
> native, 
> then just inherit setuptools3 instead of distutils3-base.
> 
> Ross

Hi,

inheriting setuptools3 does not seem to work, the build fails:

2019-08-07T20:29:11.4006600Z [INFO] [10443] | /source/build-
project/tmp/work/aarch64-project-linux/python3-pygobject/3.28.3-
r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open
file 'setup.py': [Errno 2] No such file or directory

Using the -native suffix works, so sent a v2 doing that.

Thanks!

-- 
Kind regards,
Luca Boccassi


