Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (unknown [209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8A79060167
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 14:42:56 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i17so4559456qcy.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 07:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CiMkiNFSale7yboLFD00JRDNQlrm9nORnPXFFfxYVFU=;
	b=C2WOP4vL2zKEdQBCZIabAyElpDuKmTRY+HXtSnneYwcwxOcdU986HDNcrKRRXyyn8V
	fsrcfCTGjGiXj1lGznoX8soTCADAueGWUBe4AFQsuQSDR7o+JMBXC48jCDtqIMDy/E7D
	I2sQlrpmr2+6s5gpH31mEd7JwHxM67wCfqhLtFat87V5VCs0Jyh1MipAn74P5rCJxX4T
	aL9MFnSWKjMB7mjtvmIO8j5B5ZeI5LWEpFX4lSkAgxwMZXcHCFIOE3JH1YPBUMogx+ku
	1VRuwP2jYQDlt7NyPeFTfZRaOGqu7pJAp9MaKlENgwgRAL7a4PbVpxCwkXPKcWCDw03R
	i1Cg==
X-Gm-Message-State: ALoCoQnTMX8MvWGkYurytKdZNf/euEh87P3BrDknuCYPbk+GdLYvLtCLuJ3TNrTo7v5LZIUwPjFw
X-Received: by 10.229.134.198 with SMTP id k6mr15118260qct.13.1399646577486;
	Fri, 09 May 2014 07:42:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 9 May 2014 07:42:37 -0700 (PDT)
In-Reply-To: <1399645908-14499-1-git-send-email-ticotimo@gmail.com>
References: <1399645908-14499-1-git-send-email-ticotimo@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 May 2014 15:42:37 +0100
Message-ID: <CAJTo0LYCdUJMPN8+pZWXrvsRc9fyiq7gm2dOh0N3gRcqWFP1CA@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: add lcms, libpoppler-glib dependenies
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
X-List-Received-Date: Fri, 09 May 2014 14:42:57 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2014 15:31, Tim Orling <ticotimo@gmail.com> wrote:
> +DEPENDS += "wayland virtual/egl pango lcms libpoppler-glib"

For a start libpoppler isn't in oe-core, so this causes a build
failure for everyone not using meta-oe.

These are for the basic test applications: I'd prefer to see a patch
that either forcibly disabled the checks or added configure options so
the dependencies can be controlled.

Ross

