Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id C9D5E6A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 23:25:27 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so645897eek.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 16:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=oqn+eb+rnpBJIx7ROGi3d/qyx8DFdcFI6+6l7T75+Ys=;
	b=h+1U03/WNAk/OVNEorpfQzEg8zwbMDiBKfIbyvRZwlYzGO9DsiKJqGc/QWI6IIz2bl
	BjPVzSmQQ3AVvAT2DH30u1f3Qr9+fmiQ/uX3m7nY6veSyK7X7fA7RwXOWh0PL19gZBOO
	+YgYlMrezr4K0Xd0NRadASKDf0p3yDBraHNecJPqGtWNbF8gqDmIwZkRQIRmohbUCpSe
	M3ir8X1GV09z2AEWc9KFgjZryVAcz6K3UyS8zBJlmqv6lw1Q4estBSF7gk2hAOmzaM9T
	PZEOSRxiwDy5y91VUpj/EBAhdvoIS1GA1JYVYDx7otW5ZeCZzwz9WHUe3Rqji4s/+ST3
	Lokw==
MIME-Version: 1.0
X-Received: by 10.15.107.74 with SMTP id ca50mr7951778eeb.72.1375313127527;
	Wed, 31 Jul 2013 16:25:27 -0700 (PDT)
Received: by 10.14.117.65 with HTTP; Wed, 31 Jul 2013 16:25:27 -0700 (PDT)
In-Reply-To: <51F80A5D.5060000@opendreambox.org>
References: <1362529925-13211-1-git-send-email-obi@opendreambox.org>
	<1372758642-6302-1-git-send-email-obi@opendreambox.org>
	<1375197856.8017.7.camel@phil-desktop.brightsign>
	<825C7047-80C1-4FCF-B7F3-6F0895C41C36@gmail.com>
	<1375198498.8017.9.camel@phil-desktop.brightsign>
	<51F80A5D.5060000@opendreambox.org>
Date: Wed, 31 Jul 2013 19:25:27 -0400
Message-ID: <CALmOhg=W0Nu54tBy2Fk+wqCpDXQFAUR90-5UX8Xp10KkEz_zgg@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Andreas Oberritter <obi@opendreambox.org>
X-Gm-Message-State: ALoCoQnFLPS9O0+BWRQcSg1OYbficU0Fp67qo6txdFGeNyHYGb31pkaF4M/SPc354/2B3M+5N2Zv
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH v3] chrpath.bbclass: strip common parent directories from rpath
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
X-List-Received-Date: Wed, 31 Jul 2013 23:25:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 30 July 2013 14:47, Andreas Oberritter <obi@opendreambox.org> wrote:
> AFAIR, the reasoning against patchelf was the bad availability across
> distributions and it being a prerequisite for native builds. Today,
> there's still no patchelf package in current releases of Debian or Ubuntu.

pseudo isn't part of most distributions either; but that doesn't mean
it can't be an important part of OE/Yocto :-) Couldn't patchelf-native
be built as part of the "getting your system ready to build" phase?

Khem, don't forget to add it to buildtools-tarball, the SDKs, and the
build applicance(s).

