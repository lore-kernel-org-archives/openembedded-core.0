Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id E878B621CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 09:37:10 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hf12so267868vcb.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 02:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=V9NmcYhPwIEFWPHlBq2EVPvLtHzzc+o+xteCSfzlBDI=;
	b=bxhWwi4HxYnUg6hBTacZsQN9FqBJAPPyv5lTTpdyQ4dSmpQi3UzhbTheBQk3Kssb9P
	/rG3B6gu20/rwCxxICUuKexcqseEAC2h76HZ4lkoqGlVWMv9C2kJLXrVLgaPW/o7cO//
	cVs8LnMh0iWwuqqYDw79u9iqsYz5qn+3MrAJ479sL8CEbQmvOzl1liTkqfdqApRyvTAo
	0cpNKZJflDgbErJFyCidT2Rd3XE1KoN9xSfMrXTuQcf2TRzV5CxPY9DTr4Plxekeg2jg
	KT5VdkqgBYtm/ZofQbOXwNPliGUctL3NRgJsn8ZF0Ql9UeHpfEgg2kawlxKOIlawSGAh
	w/Bg==
X-Received: by 10.59.1.196 with SMTP id bi4mr619286ved.45.1371202631425; Fri,
	14 Jun 2013 02:37:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Fri, 14 Jun 2013 02:36:51 -0700 (PDT)
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Jun 2013 10:36:51 +0100
Message-ID: <CAJTo0LbHzzORe1mh=io7CYfuh7VE1yvj-P-KO36YJLBjB3encw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkOHOri61tUih9NI86Po4r4MTcUOOCk5Fgdmi4gyDQPhhr77n6niHyqrpX8xpzfanOHxZnq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Mesa cleanup and more PACKAGECONFIG options
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
X-List-Received-Date: Fri, 14 Jun 2013 09:37:11 -0000
Content-Type: text/plain; charset=UTF-8

On 13 June 2013 00:19, Martin Jansa <martin.jansa@gmail.com> wrote:
> Martin Jansa (10):
>   mesa: merge mesa-common.inc to mesa.inc
>   mesa: use PACKAGECONFIG instead of DISTRO_FEATURES to define
>     EGL_PLATFORMS
>   mesa: move LIC_FILES_CHKSUM to .inc
>   mesa: merge mesa-git.inc to mesa_git.bb
>   mesa: introduce PACKAGECONFIG for dri
>   mesa: remove more .la files
>   mesa: introduce gallium PACKAGECONFIG
>   mesa: introduce openvg PACKAGECONFIG
>   mesa: use PACKAGESPLITFUNCS
>   mesa: introduce gallium-llvmpipe PACKAGECONFIG

Signed-off-by: Ross Burton <ross.burton@intel.com>

Great stuff :)

Ross

