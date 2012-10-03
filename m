Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJMpV-0005lc-5s
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 13:09:29 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2012 03:56:18 -0700
Received: by oagh1 with SMTP id h1so6859209oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 03:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ARJz2TkY90O4aLFhjKTUNjbDXDqZeymN/Ap5GdesxpE=;
	b=crBRFioomIt3wF8nCcxXQS+S0xhMPIrDX8d+4JrXytwKeOPPkEuQ6586+QEdDSGWt6
	7J97vGqOJPWg0J2nnr5Ucj90n+PwyeJwSnUZD0K5BCMGmwvhGDQMBkqkrMeYQdVg8DAB
	yOQA6MdbbTBttrc9V7svQNaIi5wfE5n66rBh9zMUe7kLCeKAMEtr5+KKKBVGExlHrCZl
	nk95TmJw7P91iuLfY1OzX3RGc0ljzdGzH50nE2hjntvLZCr7vYmUYf6CYoNWf5cKr2Zs
	8DSvM8PxIbzTQHxx2aXkaNQkjRWrcFoUDr71aTXQy/6wK4QebFx4gZRXiiqp0+POdxiK
	VOuQ==
Received: by 10.182.212.70 with SMTP id ni6mr1191576obc.44.1349261778284; Wed,
	03 Oct 2012 03:56:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.70.6 with HTTP; Wed, 3 Oct 2012 03:55:57 -0700 (PDT)
In-Reply-To: <1349261304.18301.24.camel@ted>
References: <1349086731-2818-1-git-send-email-ross.burton@intel.com>
	<1349255253.18301.23.camel@ted>
	<CAJTo0LbGDt_dKSgL+Ms0M9QAB7d+nBVCuV0-WuNKuGDy-t19fQ@mail.gmail.com>
	<CAJTo0LYh7yqpN5gyfvfpNxoBVOP_jG0cjm8UHcYRT874=8B7yg@mail.gmail.com>
	<1349261304.18301.24.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Oct 2012 11:55:57 +0100
Message-ID: <CAJTo0LZRek50PZ1B4vd8vfVb0u8JALaX+2d+BGykjteBGD15TA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQlPLAbiTjPLBXuXEWohD+vtCcAgJGJQiWQUa412pbTuloai6DqQME4ap6ANjrLqUObFHMFd
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xf86-video-intel: drop libxvmc dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 11:09:29 -0000
Content-Type: text/plain; charset=UTF-8

On 3 October 2012 11:48, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> My other question was whether we need any m4 macros from xvmc to
> reautoconf it?

if test "$XVMC" = yes; then
	PKG_CHECK_MODULES(XVMCLIB,
			  [xvmc xext xfixes dri2proto x11-xcb xcb-dri2 xcb-aux],
			  [XVMC=yes], [XVMC=no])
fi

Nope, it uses pkgconfig.

Ross


