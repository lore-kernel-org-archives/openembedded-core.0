Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TiXT1-0000DJ-PR
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 22:34:21 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Dec 2012 13:19:45 -0800
Received: by mail-ia0-f197.google.com with SMTP id x26so10647805iak.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 13:19:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=GlltHuGQ/hfOkD73aX5HnTmlVlI0Pz3hN2XhQCA7R3M=;
	b=Re2ovqswwJDu0z/58yyaxhrGlITEU84+VYhq0C6CZaQ+nGBY+feYtLMH0LpdSXMvhQ
	TYINJ75Ry4hJ30lKiyu1BRgLbZTOzdE1tpV62aChN4boEMi8YqQL9phu7Jgy1HdLnhRV
	UHWklBilS6rxTMtulCcFrs6DAKuuOxvW94KO+S9u/mccQbDun23lWb71Uc3bzlipGSTl
	wg8inbscqQb1gGlWzb5VUNTGzj4o2PapcZsxMpitlT4rcOOOrl3NH4QFmVBQkNIBwm9D
	0Yh8Nz+VaW+LSU/3Q56xr4rskR4U1tkDS8dv/6QsuF+JxuM1cW53L+At9+MlmwkxUQ91
	QWqg==
Received: by 10.60.4.165 with SMTP id l5mr10323702oel.84.1355260784838;
	Tue, 11 Dec 2012 13:19:44 -0800 (PST)
Received: by 10.60.4.165 with SMTP id l5mr10323699oel.84.1355260784746; Tue,
	11 Dec 2012 13:19:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 11 Dec 2012 13:19:24 -0800 (PST)
In-Reply-To: <690eb2a2b704d5129634f956349f9d8fdc4864d8.1355214185.git.alexandru.damian@intel.com>
References: <cover.1355214185.git.alexandru.damian@intel.com>
	<690eb2a2b704d5129634f956349f9d8fdc4864d8.1355214185.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Dec 2012 21:19:24 +0000
Message-ID: <CAJTo0LbeOJvSexKNDCSdJyT5yGOU=atZ9=joBz8iT3RHg4Y17Q@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQmHEL9u1mPc5sK9UH7DQz7/g7BrW1L9Zbw9AgmPhugQA/RnzR+RdJ5gA4CQcIGfqfPDILgQhebsvG/DuvNbPBqqfVHjeKglv2+M4DfkbfRvgN7DjAxAsnEAkycf2ehWXJTQbY8vb7RsRF/O37fgpDDPNVBDIQr7KNO9HK3Er8Cs+PjeH4TmCiXZAElal3A4cL947uw+
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] Adds wayland/weston recipe
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
X-List-Received-Date: Tue, 11 Dec 2012 21:34:21 -0000
Content-Type: text/plain; charset=UTF-8

On 11 December 2012 08:29, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> +EXTRA_OECONF += "--enable-clients --enable-drm-compositor --enable-xwayland"

--enable-drm-compositor is repeated in the (commented out) "kms" packageconfig.

XWayland should be a packageconfig option.

> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \

What's the point of this?

> +                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
> +                  "
> +#PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm virtual/libgbm udev"

Presumably this is the "DRM compositor" that the commit message refers to?

Ross


