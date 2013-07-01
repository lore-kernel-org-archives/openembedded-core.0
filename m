Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id 03D8B6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:46:35 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id 12so3663477vbf.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 07:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=uk+dkiLkRPeIYSPgxcBWXgpZQwylTC65NdikLEDKHeM=;
	b=ViGodjbuH+6HHg58g6ZsOIYO4e7XdQVChvW7Mg9X80kKmoGb93SKB8E2OANByPMQTc
	hA0j80tN6G/ZqvNwAF7AM9CI8t9regeosyrTuJ1qJaKMNAST91s2DgOiAyDKSBljUTSo
	n058JQGruHVjOzM4wfNsUO1Hc935H5igk8JuB2fJ6G0sWY7KGNJmOEKMUg+Xjs+VAnoV
	oNtvzCKVC9b+VqCpLSoU1mCu7CvRNuvFRUnrKqV69kOM+jQ/mNuQgALLWf50GCgPMwTq
	5SgZZZ+6uyh8WBiYE7kDy25Wuamm9CxE22ZiU/NwTYnkvZozLkIohxl8c6JcOi9rI7ZG
	Hlmg==
X-Received: by 10.220.1.9 with SMTP id 9mr9850326vcd.37.1372689996791; Mon, 01
	Jul 2013 07:46:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 1 Jul 2013 07:46:16 -0700 (PDT)
In-Reply-To: <C234ACE8-19BD-4AA8-A45C-C2F712BFA4ED@gmail.com>
References: <CAKpQ200meOQcEu+vwbWBQpVC+FtvJw1uXLVV2qufvLud5aEvLg@mail.gmail.com>
	<C234ACE8-19BD-4AA8-A45C-C2F712BFA4ED@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2013 15:46:16 +0100
Message-ID: <CAJTo0LZT=jktkc4+MURMzO1Vn9BcyzaaHcZTz_LmAHb5fpF27A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQlmnR3Lq96ojfVuUQCX7JzX98JUrn0uRLU8nj57zoSIYv1E07fMrdUpfpzaIUSLvhnESNkI
Cc: =?UTF-8?Q?V=C3=ADctor_MV?= <v.mayoralv@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: apr: Add EXTRA_OECONF += "apr_cv_mutex_recursive=yes"
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
X-List-Received-Date: Mon, 01 Jul 2013 14:46:36 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 15:30, Khem Raj <raj.khem@gmail.com> wrote:
> to prepate the patch for review and instead of putting it in EXTRA_OECONF
> add it to CACHED_CONFIGUREVARS

If it's going to do to CACHED_CONFIGUREVARS then the same series
should also remove the mention of this variable in
meta/site/powerpc32-linux too...

(one day I'll start a big prune of the site values, moving the
non-architecture-specific values to generic files)

Ross

