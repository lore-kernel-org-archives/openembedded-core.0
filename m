Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0C873117
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 04:36:08 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id k3so1124269pfc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 21:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HTrXIty549zf56UmnSIk7d20F/VNBEL8nUCXw5T4C7g=;
	b=briEVwMiXb1vpuZ0RRXHqeGVS03QWYSZBL1HtAml4O2tCBYqsfelLPLT3BddngyKQy
	e9HNkKdGfeol6LAQgsWynRmIo/dPXe1zxJjj0MzqtQt+QHlK355vRiY061pod9z58+Tv
	5QhKUC8ptEAYXq6kAbsW3eIhpBdp4r6iH0jGPVIl18E1GP4/HmJeNu+h+MuzgsuVFPFF
	9JQ2HheQJeXh3CETINwzTAymS0PspGeW+wSSYoFt84u1M2EgLbMtEJufDf78Ps7YRoKc
	/Jbd13AsrAhUySZGxgZhb6ydrOd3Clw73GozQGXalvFcdM27/e/8ZCn4S/4l+GYM+3x1
	U1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HTrXIty549zf56UmnSIk7d20F/VNBEL8nUCXw5T4C7g=;
	b=aNaQtN2FNUpGJGLZkncjp0lHpATSGodC9iPFBy5xkFrpS+kCIMV8fddU+mvj0LUwzK
	ReFmPFtOI/fkhrhD0/VW/ROl0KrUnz4agbWo3/TFowNGsErC3V0ABTdsqLuk/cYpGDhz
	CCDlBsqR7pxZ9PjjXU9gsLWQe7THEWMQFhatEgO8WF29j078UGcy640g1jOI6EK7341o
	sORzz6pY9p6mK0TPGi2n0iJfjI1u2upBv5U9I8QSLRALaRjqytZt+nnCHSUbUIiYsT04
	Lk7hIXXnxehYa9MEJQftvUFhBOoqPLzB1CCSHzXoP3CxCe78d09zQf32wSjDLdSrjYFa
	BRjw==
X-Gm-Message-State: AHPjjUhWLlWgwQ/fc86/8J+jWBJjMsVF7bGE2mLlvzK9nFVz5IWJNo8L
	hwfIWpKYVTpEK+mtQmF9ZJGyqD5s/A==
X-Google-Smtp-Source: ADKCNb6XQU1ZlKNMebSbClTYWMwaK1IhQBsibhMOgOn2Rb/b1CeZ7Inqxmu0Ki/qYvxJ4KH9hl0mWbWuqNNOg0RZDug=
X-Received: by 10.98.157.74 with SMTP id i71mr2573126pfd.168.1504586170251;
	Mon, 04 Sep 2017 21:36:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 4 Sep 2017 21:35:39 -0700 (PDT)
In-Reply-To: <20170904210608.23764-1-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Sep 2017 21:35:39 -0700
Message-ID: <CAMKF1sruu96Y0ZUsHXDWG08=eayFWMe+p6QQJwk1oOw6qPViUw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] Revamp the Go support
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
X-List-Received-Date: Tue, 05 Sep 2017 04:36:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 2:06 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> This is not yet complete but does improve some parts of
> Go support on OE-Core.
>
> We are trying to port as much as possible work done by Matt on
> meta-golang back to OE-Core and also to avoid carrying old releases as
> there is no need to support more versions of Go toolchain.
>
> The first commits on this serie does fix errors in current
> implementation, the others are improvements and clean ups.
>

these changes look good to me in general.

>
> Otavio Salvador (7):
>   goarch.bbclass: Stop passing True as second argument of d.getVar
>   go.bbclass: Fix binary installation path detection
>   go: Remove Go 1.6 and 1.7 releases
>   goarch.bbclass: Add support for ARMv5

Does it work on v5?

>   go.bbclass: Use a global Go build flags
>   go.bbclass: Enable parallel build
>   go.bbclass: Use an auxiliary variable to add the build dependencies
>
>  meta/classes/go.bbclass                            | 34 ++++++++++--
>  meta/classes/goarch.bbclass                        | 20 +++----
>  meta/recipes-devtools/go/go-1.6.inc                | 19 -------
>  .../go/go-1.6/armhf-elf-header.patch               | 23 --------
>  .../go/go-1.6/fix-cc-handling.patch                | 50 -----------------
>  .../go/go-1.6/fix-target-cc-for-build.patch        | 17 ------
>  meta/recipes-devtools/go/go-1.6/gotooldir.patch    | 30 -----------
>  .../go/go-1.6/split-host-and-target-build.patch    | 63 ----------------------
>  meta/recipes-devtools/go/go-1.6/syslog.patch       | 62 ---------------------
>  meta/recipes-devtools/go/go-1.7.inc                | 19 -------
>  .../go/go-1.7/armhf-elf-header.patch               | 23 --------
>  .../go/go-1.7/fix-cc-handling.patch                | 50 -----------------
>  .../go/go-1.7/fix-target-cc-for-build.patch        | 17 ------
>  meta/recipes-devtools/go/go-1.7/gotooldir.patch    | 30 -----------
>  .../go/go-1.7/split-host-and-target-build.patch    | 62 ---------------------
>  meta/recipes-devtools/go/go-1.7/syslog.patch       | 62 ---------------------
>  meta/recipes-devtools/go/go-cross_1.7.bb           |  5 --
>  meta/recipes-devtools/go/go_1.6.bb                 |  4 --
>  meta/recipes-devtools/go/go_1.7.bb                 |  2 -
>  19 files changed, 40 insertions(+), 552 deletions(-)
>  delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
>  delete mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
>  delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
>  delete mode 100644 meta/recipes-devtools/go/go_1.7.bb
>
> --
> 2.14.1
>

