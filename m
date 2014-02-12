Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 365276EEFD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 10:31:52 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id i8so14736940qcq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 02:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GCLpBc9OiV+uH87BmbvEUOXWVpLKRddtqhUsct3j49I=;
	b=W/6pOcVyDz+oSLuMqity7SfRHrbzmW3OS4wnnPtRDZqqU2IGzDTTwGj1oQOv1tQQAS
	MeawBDfXfRN+FYe4+Y9j6JSBzBfbxriT6u1pChwh+OGOi7AxsJ+ATWjAT3SIe2GV0hUT
	yYG2SN/Ej2sWbM1giILqJmCEqUV07GKB3cNDL0X0Y5N/ppOSQHV3mNhhUhzPBpDVWeRW
	wwTPgMx7gSzpPFpUwUvI/FuwNa2l7AWrHhxLUszItPx8zu+gJh7M6XtAvz+xlwionobH
	YDfHOMVt4392zk33QaZXBVuGjK8RXpG76BbyuoPBjWOVzaqibacUhPu8X/Cv5rrXIrtG
	0xKw==
X-Gm-Message-State: ALoCoQlxi041L3JdY59KijfJHCnsanRWkWaXxvFZ9fyMpfZkDSl/QZSkakrb3EK8SJw0v/y1uBvU
X-Received: by 10.224.97.67 with SMTP id k3mr66866413qan.17.1392201112084;
	Wed, 12 Feb 2014 02:31:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 12 Feb 2014 02:31:32 -0800 (PST)
In-Reply-To: <667eb5bde49b6a37e220a73df265b7c52c89ac02.1392189255.git.cristian.iorga@intel.com>
References: <cover.1392189255.git.cristian.iorga@intel.com>
	<667eb5bde49b6a37e220a73df265b7c52c89ac02.1392189255.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Feb 2014 10:31:32 +0000
Message-ID: <CAJTo0LY46wAFj+HmnsCx5jN8bp6G9dmJBJu4TDGYTvfWuCno+w@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] flac: upgrade to 1.3.0
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
X-List-Received-Date: Wed, 12 Feb 2014 10:31:52 -0000
Content-Type: text/plain; charset=UTF-8

On 12 February 2014 07:41, Cristian Iorga <cristian.iorga@intel.com> wrote:
> - Updated description, bugtracker and source;
> - Switched to ${BP} variable;
> - 0001-No-AltiVec-on-SPE.patch,
> flac-gcc43-fixes.patch, asm-pic.patch,
> obsolete_automake_macros.patch patches
> removed, included in upstream;
> - Licenses checksums changed due to added
> copyright owners and street adresses changed;
> - backported 1.3.0 specific fix;
> - removed obsolete PPC fix;
> - added support for SSE optimizations.

Got to love a patch that is 90% removals!

> +DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, a losless audio compression format."

"losless" is a typo.

>  S = "${WORKDIR}/flac-${PV}"

This is the default so you can remove this.

> +                --disable-xmms-plugin \
>                  --without-xmms-prefix \
>                  --without-xmms-exec-prefix \

Does the addition of --disable mean you can remove the two --without arguments?

Ross

