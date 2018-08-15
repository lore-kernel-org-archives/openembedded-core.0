Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id EC583790F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:38:38 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id b15-v6so960112oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 02:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5EjKCbKfyNBv8nILYufZ4UDVP9DX2kFgF5g4J9HvZI0=;
	b=rMB/hxPt7PE8Ta3LIJ1wLXcwXHyvCPyhTWjCq015kHMLjNjqGOn5hf4nY1YSJqObpo
	J81j2/gSLZ9a4eRqI99JfRBBiL4XtQVb+NhOXOc6x6rZehltAGFLPAtShq7I3dxw57pe
	eRJSndsSxX7/BdnceY/FwNYeG3NckO5klRRzTzGKifxsN4v+VCqt6CYnh1WDDFs4ntlH
	nJ/MdJQV1jBYqMwI3xbMkJ+riYEWymv74PYfhrhr2UPe62ZIJlaM+bZabGrMYGFhVaEg
	59LtPkYsYxD35EFgEpwT9SOG2yWh1BWYC+i6PLJkZGlOYPFxg5HQqJkpaZT/7oCOc+W6
	1GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5EjKCbKfyNBv8nILYufZ4UDVP9DX2kFgF5g4J9HvZI0=;
	b=P1QH8wOwFmA4SDbtKOnUZycqsgG+a5KdRGt1tDAvR/UTOV3SdHEo2mTLb1z2fjHEcP
	fdsxWIsSZFV+afVoxEMNwAKSfecxhcvFSkKm6yrE70ga6xaPYmcCr8F/RPaUsNWVtiqn
	srniM/DMEXZgkih9yUVRxZMsDofp6vrJU/JQmEzCPePjWNyOC9ZaCRYGUyZupf9Y3806
	SVk6Fi+MXOzp1l0kupmAl4TwsPj4DTStR4LIraaxgAPBGAFkBNFzok7ls57THSwutFC+
	e88XafhD2M2eqcew/41zVpg4AihyjWrovQJHDrIEQblgzsU+buZpVcvGy7Y4Pm943p8A
	qM5A==
X-Gm-Message-State: AOUpUlGdTFaQI5zVuT1GejjO/OLVdJkdJcnIHdSwuLYNKiC42GwaSWX9
	Jcnesl0YIxC9fcLUmTQSNFwcNH2QPbsUlGkQ51k=
X-Google-Smtp-Source: AA+uWPyoA35hvHIdbQuFwTXJluevGNo6cbQLRGIowO066UE/CakYOaiehc30feV0wloVKZZ07eb3jUC25Pz3PGxbhqE=
X-Received: by 2002:aca:5754:: with SMTP id
	l81-v6mr28094351oib.100.1534325919921; 
	Wed, 15 Aug 2018 02:38:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 02:38:39
	-0700 (PDT)
In-Reply-To: <1534325070-446684-1-git-send-email-changqing.li@windriver.com>
References: <1534325070-446684-1-git-send-email-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Aug 2018 11:38:39 +0200
Message-ID: <CANNYZj-wexL1sis+dLL1CSQUZHW_NH7HDh_mPSeE+x5HzWmO+Q@mail.gmail.com>
To: cli10 <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: remove depend on dbus for rpm native
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
X-List-Received-Date: Wed, 15 Aug 2018 09:38:39 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-15 11:24 GMT+02:00  <changqing.li@windriver.com>:
> for clean compile:
> during do_configure, since do_package not executed,  so .m4 files
> provide by autoconf-archive-native will not under recipe_sysroot_native,
>
> for second time configure:
> .m4 already copy under recipe_sysroot_native when run do_package last time
>
> so if there is code related .m4 of autoconf-archive-native in the configure.ac
> there will be differences and may cause problem.

I'm sorry, but this does not make sense. do_populate_sysroot is
executed only once, for all of the tasks. Can you provide steps to
reproduce the issue please?

Alex

