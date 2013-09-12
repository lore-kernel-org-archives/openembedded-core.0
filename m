Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id AE2F96010E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 07:35:25 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id e12so6976667vbg.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 00:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lQ9IFsyMdn0Xh9AFPNMRRU8BSdmS98e5zLFoS1xWPCI=;
	b=f6qh7yXaQoiW19381IV6Ox8iySrk7G2aIEDFQFL+O6cWPk667S/bzJJQhyiLOt16Cx
	w4DTwLrQl80tNfnlTQpoe6Q1GPfx+4PpuNQabLn/kkkC3tX+UXL3pYQ23fiudFTt+Uvw
	j+Q109+dp/HRk3qAWbjCJwpC0/+OnUZgHKqEGpLQmi3xn1paZCZBXE9mI4AYKvBquKub
	sjpMxiNDiXyED7nWUOuJTX+AH4xyt3h9Envm8muuaxTUJ4V/qAPeql7WBsnEjNzW9nt7
	WiGYfOLSmWZOuCp9MBYFW/a9KKCq8tp5QmikpXaRWyrZFoQSgKEdl0+lwl7Xm/8mVkJE
	yaqQ==
X-Gm-Message-State: ALoCoQk/xezwbf4zusuKPTUDUx+9+C5Trm8JgK+eRVaUDBsXoOCiZ/Tf9dTDNY1JppZixoRkbbCP
X-Received: by 10.58.73.202 with SMTP id n10mr5352952vev.7.1378971327035; Thu,
	12 Sep 2013 00:35:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 12 Sep 2013 00:35:06 -0700 (PDT)
In-Reply-To: <1378948627.5240.66.camel@dvhart-mobl4.amr.corp.intel.com>
References: <1378931427-3479-1-git-send-email-ross.burton@intel.com>
	<1378948627.5240.66.camel@dvhart-mobl4.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Sep 2013 08:35:06 +0100
Message-ID: <CAJTo0LYhBv5RAf1QZV4ndQxWRrdZ=4jgRTRrsWnLe_7p7j1Dsg@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] ia32-base: only depend on GL if opengl DISTRO_FEATURE enabled
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
X-List-Received-Date: Thu, 12 Sep 2013 07:35:26 -0000
Content-Type: text/plain; charset=UTF-8

On 12 September 2013 02:17, Darren Hart <dvhart@linux.intel.com> wrote:
> I thought the idea was to try to build with --disable-gl or similar if
> the DISTRO_FEATURES didn't include opengl, rather than disable the
> driver entirely.
>
> Am I remembering incorrectly, or was there more discussion on that which
> showed that couldn't be made to work?

Orthogonal issues.  We're building the xf86-video-intel without DRI/GL
support in that case, but the machine recommends in ia32-base are
currently always pulling in the Mesa drivers (which we're not
building) and the server-side GLX support (which we're not building).

Ross

