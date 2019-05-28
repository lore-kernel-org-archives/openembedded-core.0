Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5117DE8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 19:23:09 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id c24so1031620vsp.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 12:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JHqZMb/Tp+jrr9J2lrKWaAGOPvwG4NOPN8ZaNabWLf0=;
	b=pCpbiqsXTV0VdfNqAqKscODUVXBqBEIz83WvpFT4035KyFgDToE5HIie0A5+XwFct8
	fmwb4uwGkXg6V1cCVdFC1+dPMiS61U5rLIDKWCiFaDbBvUlz2SI+WxVFdKfDV9guPdIE
	PPlY6pqUTVfbGTrTZFubtoZDj5+DtQNqiExyFkuT5Qnq1sX9YDelj6DXAd62qg7LR7jI
	ZVo1b2V3+1pzZQgnzVmIjj5tNS0y5lwMvNq4BBPoD0bI8TpREe9Eq9EpMQSxVaAUCKfj
	WGV4vcs8onR3QohC0+dReEDDaYtmtIJkQZcmiDy7Y9+TMpXojJJ9H/h70yy4dtmL/ohQ
	fJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JHqZMb/Tp+jrr9J2lrKWaAGOPvwG4NOPN8ZaNabWLf0=;
	b=Fuvc+CXI2UN1s9q7Yb2I16BWd7vjqD/1fYjwc4jbgk3Xvv7uoaRpP774c6T1vbH3WT
	QP2iNDyJWsF73NVU0Amf9frFzaEXoaWjWmwWl86jZpk61mU3U1QamqDlOZYMmhSQNqRZ
	AdHEVF+SyCRxoVtUWxtfZ3gpAsNkAVsLLVTdGecxbhxLUA6dv0AIGInzipGYfoecVtGK
	uLz6KAat+adxWyGlRy1ZSpuoIBqCShyFuz330zsGHiTNvlG1srBEMlV8uum1RqYKYN1y
	IneDcK1jc3SxXqkOJjZPoeSrgl5Cyb7lOTT5qsViX1nzPh1lU8+Sug4Xh1H467sx+s1X
	F4kA==
X-Gm-Message-State: APjAAAXxw/SZMj8S1YqGwk6eozd1ziL8Y2J3/Zsn3egUr5bhXClgzgoP
	7rOLum5V/ESRbd9Rq4iYAo69e2nIQxZteQ02cuE=
X-Google-Smtp-Source: APXvYqwi4SR7TkIvUrBpzSVAHVoTF2NlJ4h9OLHpGCJatxtOVsF6rNMChqfwElbX3nTqogtHxx3r/CX4sSkfs4pgAk8=
X-Received: by 2002:a67:d71d:: with SMTP id p29mr80577174vsj.223.1559071389273;
	Tue, 28 May 2019 12:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <69e7b572a514abba106b28255461cf17720e68e1.camel@igalia.com>
In-Reply-To: <69e7b572a514abba106b28255461cf17720e68e1.camel@igalia.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 May 2019 12:22:57 -0700
Message-ID: <CAJ86T=VEKBv21mMo9cxh-VG8OstFF5bwte_g41k2=RUNAcbnRA@mail.gmail.com>
To: Philippe Normand <philn@igalia.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Use compiler launcher variable when ccache is enabled
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
X-List-Received-Date: Tue, 28 May 2019 19:23:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 28, 2019 at 12:13 PM Philippe Normand <philn@igalia.com> wrote:
>
> Setting the CMAKE_C{,XX}_COMPILER_LAUNCHER variables is the recomended way to
> deal with ccache in CMake. It allows build scripts to optionally opt-out of
> CMake, which is especially useful when the pre-processed GCC output is required.

Opt out of CMake? Or ccache ?

>
> Signed-off-by: Philippe Normand <philn@igalia.com>
> ---
>  meta/classes/cmake.bbclass | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index d3f0d70847..a5cffedbc6 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -26,14 +26,16 @@ python() {
>      if not d.getVar('OECMAKE_C_COMPILER'):
>          cc_list = d.getVar('CC').split()
>          if cc_list[0] == 'ccache':
> -            d.setVar('OECMAKE_C_COMPILER', '%s %s' % (cc_list[0], cc_list[1]))
> +            d.setVar('OECMAKE_C_COMPILER_LAUNCHER', cc_list[0])
> +            d.setVar('OECMAKE_C_COMPILER', cc_list[1])
>          else:
>              d.setVar('OECMAKE_C_COMPILER', cc_list[0])
>
>      if not d.getVar('OECMAKE_CXX_COMPILER'):
>          cxx_list = d.getVar('CXX').split()
>          if cxx_list[0] == 'ccache':
> -            d.setVar('OECMAKE_CXX_COMPILER', '%s %s' % (cxx_list[0], cxx_list[1]))
> +            d.setVar('OECMAKE_CXX_COMPILER_LAUNCHER', cxx_list[0])
> +            d.setVar('OECMAKE_CXX_COMPILER', cxx_list[1])
>          else:
>              d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
>  }
> @@ -49,6 +51,9 @@ OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LD
>  CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
>  CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
>
> +OECMAKE_C_COMPILER_LAUNCHER ?= ""
> +OECMAKE_CXX_COMPILER_LAUNCHER ?= ""
> +
>  OECMAKE_RPATH ?= ""
>  OECMAKE_PERLNATIVE_DIR ??= ""
>  OECMAKE_EXTRA_ROOT_PATH ?= ""
> @@ -86,6 +91,8 @@ set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).
>  set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
>  set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
>  set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
> +set( CMAKE_C_COMPILER_LAUNCHER ${OECMAKE_C_COMPILER_LAUNCHER} )
> +set( CMAKE_CXX_COMPILER_LAUNCHER ${OECMAKE_CXX_COMPILER_LAUNCHER} )
>  set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
>  set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
>  set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
> --
> 2.20.1
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

