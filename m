Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEB977121
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:56:29 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id u68so33625902uau.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 08:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/S7b4ljGJLANzuQCKpal1ylRywWohVlfQjAVgKmGKns=;
	b=W3NsND0SeciszLehczaWgnhlENa8tuq7RZdMGeP1JuRqfAoMeDmOIdktpBRNK2ZP7A
	AqSD/a/Dgzs2oBtaZBbqktkDaB/u2GQ3aRJlsEpEwTf60i0j7wwuDRb44bUURBnlSvye
	fSn/A25QTVemRzKljO0ev6PYed4xx5XILbToCRUhi82ZJ1ShroAANWqa6BjxxLA2x37b
	FDz0X2UGUqNjDrnhTkWUaqADPweNwRPgaoqO2brMCgzWFmy/b7HfmNpfYw4vbzWUi7jn
	R+0MjnvS1mk0t5eHnra6KZ4IFpkjOBg2iWigKDJiUnMnv8y6j4R0Wllt64tFqbVzVypg
	MFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/S7b4ljGJLANzuQCKpal1ylRywWohVlfQjAVgKmGKns=;
	b=ex+90YLILHC82yknfF1Ewhn8VRfX1xRZwR6eDi5KSz3qIi6EnXiGDbzqczcJv4Kbcm
	YCUtfnryFiG0GEcxA4IID6dDU7TorSgHkbVuS1KL9p3v1L0BnMOeNbl0DiWjFX8dSQky
	skfn/voibt0G6Ppaod4wUc115/v59VYMCtBshSdXBzC2KAMDZBX75Oaql8mjb9FxT2nA
	tSyJGUr8p9gkMPCkoEfZRNHz/LYDrnOt7hKzoWPLLClOh2W+SdWF8HUQ4y2E7UXL+yul
	++zq5JqqbIIWMJs5ESg/dSA5vi21sNCN+vQqqpCpbWLGFZpSkAlzHdYXtyypV6ZCYBpy
	ap3w==
X-Gm-Message-State: AE9vXwNvYyyH7BC0F3p3kCPm0AJmaJGRuXcwJjUZSIiXq+3T3buGqnCcmEt27rqBqP96IjJbACEs3/G9Fr5lJw==
X-Received: by 10.159.34.177 with SMTP id 46mr25785295uan.111.1473177389595;
	Tue, 06 Sep 2016 08:56:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Tue, 6 Sep 2016 08:56:29 -0700 (PDT)
In-Reply-To: <20160906132119.12111-1-ml@embed.me.uk>
References: <20160906132119.12111-1-ml@embed.me.uk>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 6 Sep 2016 17:56:29 +0200
Message-ID: <CALbNGRQdCtZcon4zKMfWimYevv+5ZZAiyHLOp1sVW=UPcVwcOg@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: Jack Mitchell <jack@embed.me.uk>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] cmake: set CMAKE_NO_SYSTEM_FROM_IMPORTED to ON
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
X-List-Received-Date: Tue, 06 Sep 2016 15:56:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 6, 2016 at 3:21 PM, Jack Mitchell <ml@embed.me.uk> wrote:
> From: Jack Mitchell <jack@embed.me.uk>
>
> set CMAKE_NO_SYSTEM_FROM_IMPORTED to ON in the bbclass
> and also the toolchain file. This is required as GCC6
> has become more tetchy about the use of -isystem in the
> compiler flags.
>
> Imported targets aren't used much in cmake at the moment which
> is why errors have been rare and probably worked around in
> different ways prior to this patch.
>
> Signed-off-by: Jack Mitchell <jack@embed.me.uk>
> ---
>  meta/classes/cmake.bbclass                                | 1 +
>  meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 5203d8a..8339a6b 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -57,6 +57,7 @@ set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "Additi
>  set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "Additional ASM FLAGS for release" )
>  set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>  set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
> +set( CMAKE_NO_SYSTEM_FROM_IMPORTED ON )
>
>  # only search in the paths provided so cmake doesnt pick
>  # up libraries and tools from the native build machine
> diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> index 60014bb..8279eb6 100644
> --- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> +++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> @@ -7,6 +7,7 @@ set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT
>  set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
>  set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
>  set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
> +set( CMAKE_NO_SYSTEM_FROM_IMPORTED ON )
>
>  string(REGEX MATCH "sysroots/([a-zA-Z0-9]+)" CMAKE_SYSTEM_PROCESSOR $ENV{SDKTARGETSYSROOT})
>  string(REGEX REPLACE "sysroots/" "" CMAKE_SYSTEM_PROCESSOR ${CMAKE_SYSTEM_PROCESSOR})
> --
> 2.9.3
>
Why not simply adding

-DCMAKE_NO_SYSTEM_FROM_IMPORTED=1

to cmake to avoid redundancy [1].

[1] https://github.com/schnitzeltony/oe-core/commit/930af34efb08c359541514e202173ec93a3a19c7

Andreas

