Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B58C7C6DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 14:31:47 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id p25so10765037qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jNXjY+M/mEiiHnPp1zurJD2FW3TQaxp5FL1UFr0urRo=;
	b=p8+6rD/cCpASzeCLvOrx/8gHGWDzeyrpehgM4tgJDmO+DHRTASOH/J+aSzGhczU5WW
	nAux2tun4O0qaEvCXAtBd/jUj1vq7Yf49mlm8vq/nLAruhC6e8W9EMk89A6kTbxphwnf
	yHS14qM9l3XYiCa733UV2BJYoj7Ua2oD1mUMx09QDIeqQrfJYI/cBFC4anxXnOWVP8YQ
	wsWiA8ANYjwzDaKaV3vUb6qWw4XxW0yEmpWJ2rKXbHjQPC+VZa0xWW5/5cNgs3fawvLy
	U/+cyuYl08whinC5KlmW8B26C5JYagXIRo4u7FIaX5Yl/aShnLlXJFfEeaKkISSpDbe1
	yRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jNXjY+M/mEiiHnPp1zurJD2FW3TQaxp5FL1UFr0urRo=;
	b=Nky3KgECVhq4nmGaxysb+6zVY/h5rpoixWz31qST8RiB42CREma97V/FFceZTlxsiD
	pjn/dtpSGlit0MArLv81v8cFfGpmrMXeF1Q1LUEOxTHSnzf/8j06cS/e0efmiEcGebB8
	V3iVQG4CUBT82Dw/fLOgDObY9pBl69BrO4qdFVaaLx7qnVkfqTmgtxiqwdDh01yeL6uE
	KDgfwZVQukKQ2p2suGmXtJAAep9eeOvuLCosk1i1AIWcN2QfOYX9JSneGkU2V+g8Ejol
	iEPqbm6imO2yd7fBWGsGJTVPHaxgNzgakpSOnOYuHwweQj4dyLZIRGGUIBMdD53h8bVJ
	8iqg==
X-Gm-Message-State: AHQUAuYp2tvKWFraF19QTZ8ta//KqWhRebh4O7yi0RRIwJcCjoO+tW5g
	SKN6EupRWpNM13egWXqCYPD3xNI+3x/v4OA2gTg=
X-Google-Smtp-Source: AHgI3IYSfu0E/Xcgo5rFwfnBIBYTH/JZ+MIrHH2CRw0TAi5UkQGCt75KESb6SqKlQke62vFkeK4E+DPCQjb9QxomcEw=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr7894252qtn.253.1550241107866; 
	Fri, 15 Feb 2019 06:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20190215073207.30036-1-anuj.mittal@intel.com>
In-Reply-To: <20190215073207.30036-1-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 06:31:21 -0800
Message-ID: <CAMKF1soOfyjys5MpoGDOqm99ZSHtd+wx3YkTC+pCJM35VNzptg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] meson.bbclass: point to llvm-config
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
X-List-Received-Date: Fri, 15 Feb 2019 14:31:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 14, 2019 at 11:32 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Allow packages using llvm-config to find it using meson's dependency
> interface.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/classes/meson.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index dff0485b47..aaf873cad2 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -89,6 +89,7 @@ ld = ${@meson_array('LD', d)}
>  strip = ${@meson_array('STRIP', d)}
>  readelf = ${@meson_array('READELF', d)}
>  pkgconfig = 'pkg-config'
> +llvm-config = 'llvm-config8.0'
>

i think llvm should install a symlink from llvm-config
otherwise we will need to change this everytime
we upgrade llvm tonew major version

>  [properties]
>  needs_exe_wrapper = true
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

