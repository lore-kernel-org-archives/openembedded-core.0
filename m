Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5AE71CA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 19:18:30 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id c15so49328058ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=QQPusBn5hjGaw0JH6DqUNba0AfCgT1yb87gcRJ3cPaY=;
	b=kLDoWmyDZUeJEjkZUdhsAXVca4ZxAEEScaU0tp7Kcx6mMW3tiLqxVUCyXWPxfgsuF5
	RM8tkG52uq2GLIDA3tbp+r6gd8RQ8QMuXqU1TTgAt5OCMN9rdxfm+KxBDEvHDP2fshQb
	QsI0rYSPQ9+elEV4Q5w5VyNyAGRxT5+XYX+dqtpzebE8o125pWPIa8L5+Vtghj3lctv2
	WxpihoD8WsTSP4aYMRJgWiwNnVn7VjFNcSxqQP8PzSfQ84SDOIUuIcaDVl1SzYJt/x1T
	4FH7o7Hv0dSWs6x8MFm1mByKuAtkK/4G2MmtxjVMJJGVzITNOltSbmzPyskM/QjRkD7n
	XF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=QQPusBn5hjGaw0JH6DqUNba0AfCgT1yb87gcRJ3cPaY=;
	b=tBcAVN0bUDsTey5dLB75WQsSs4UWyCzp24aI8deu8UhEaR0qF4gY8sbMc5NsU6bC4K
	wGzEa+uOjCS4ww+fbho6mDoevabNnqpusCLbG4MPIorRKtVrcfBeJ1hBPDraET9+OymP
	yx/j+bmwO2gvMm6OU7r+Xh9S4wE+bKOkszRhZi4/Bf5Pv99D0iZrEySqob4ueHL/P62l
	vbJ2SNXV1VFydXUB1IGjfAoPCABtSM92D+jN3oDvlsFjC2xc9mbWIN/i5azD1KZIx51U
	bcWRlD9vO03lB6eQLN3YVuV+NYqIiGVbkCM4cySbvvRCApwrNuTIG/Wf5MzU39CB334z
	4I9A==
X-Gm-Message-State: AODbwcAF9stj1u0P3vAGkO+QKCw1SwAzlCx4MND0HDgce3wZUVtAEdEo
	uQaumzVE+9kdGqce
X-Received: by 10.36.58.9 with SMTP id m9mr7023981itm.2.1494875911575;
	Mon, 15 May 2017 12:18:31 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F79A.dip0.t-ipconnect.de. [93.232.247.154])
	by smtp.gmail.com with ESMTPSA id
	m185sm5541218iom.7.2017.05.15.12.18.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 12:18:30 -0700 (PDT)
Message-ID: <1494875908.1179.254.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2017 21:18:28 +0200
In-Reply-To: <CAMKF1spKnOnZfMoijNz5kQjE2=5OO3k4CUVK5d04id1B42JB2A@mail.gmail.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
	<CAMKF1spKnOnZfMoijNz5kQjE2=5OO3k4CUVK5d04id1B42JB2A@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 6/6] local.conf.sample: make debug-tweaks depend on IMAGE_MODE
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
X-List-Received-Date: Mon, 15 May 2017 19:18:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-05-15 at 08:50 -0700, Khem Raj wrote:
> On Mon, May 15, 2017 at 6:27 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > Enabling "debug-tweaks" unconditionally, even if it is only in the
> > local.conf.sample file, runs the risk of that getting used in
> > production images.
> >
> > By checking the per-image IMAGE_MODE, the debug tweaks only get
> > enabled for images not meant for production.
> >
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > ---
> >  meta/conf/local.conf.sample | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> > index 85c5e21..edadbb7 100644
> > --- a/meta/conf/local.conf.sample
> > +++ b/meta/conf/local.conf.sample
> > @@ -114,8 +114,9 @@ PACKAGE_CLASSES ?= "package_ipk"
> >  #                     e.g. ssh root access has a blank password
> >  # There are other application targets that can be used here too, see
> >  # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
> > -# We default to enabling the debugging tweaks.
> > -EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
> > +# We default to enabling the debugging tweaks unless an image is explicitly
> > +# requested to be built for production.
> > +EXTRA_IMAGE_FEATURES ?= "${@ '' if 'production' == d.getVar('IMAGE_MODE') else 'debug-tweaks'}"
> 
> is IMAGE_MODE defined per image recipe ?

Conceptually it is, although I guess it might get set globally in
practice.

The class just defines the empty string (= no specific mode) as ??=
default. Then a distro's local.conf sample can define a weak ?= default,
probably "development" (similar to the current practice of enabling
debug-tweaks in local.conf.sample). Finally, specific image recipes
(like a core-image-minimal-development.bb which includes
core-image-minimal.bb) can force a fixed mode with
IMAGE_MODE_forcevariable = "development".

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




