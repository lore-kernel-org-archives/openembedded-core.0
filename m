Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 18BE77C3AB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 10:54:57 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id m62so3043260ith.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 02:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RNMu+PgCBO8MsEAmRQNMHkK2LFW3ts24X0DbQ084uso=;
	b=H/nfU78eakqLQOUYMHSjsAIl7g04Q3HGLNwBawsBdjraMF0pBfEA6vR6gZM5wJ+gvp
	as/UwgrQ1SkLZwkmcwRwpP5lUi909pWsBVd5JGJDBt6qOXndAKrFgoH+HO5xtqykeEYi
	GM4lUi5wVH4uwbyfBvvHiNCoecZut2mNOAuAPnZlWeS4JsCW+GzFwC9QZR13y23npbad
	1oWO6KAzfKe7ongywkhkxaScBIHXSXUyjND8ocRyF8BT4KBTxXDW5HpERF/rO/CHhA/g
	sRiowWKrAPMJGgAgrFMt+XYBTxoU+8qXajpzUPRpyOslbMiDqYgG3BD+IqA+lFbP9BVX
	RtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RNMu+PgCBO8MsEAmRQNMHkK2LFW3ts24X0DbQ084uso=;
	b=HlykNVAFjLbWt1Fbxbrb7FikJ19oY1+omMboC7+Tq62zyYNIuxKRgGVQQKnmhf65Ym
	H80eg/bRZPOU24QQBTjHgo1bZOoVyiEqN5Mv4r2GcbFR0vBcK5834hvorK8BrimkmnNx
	Y/KRl/PDUzM40bAMT9e7EMH8UN7uJr92tCUXOb4L//P+7+srilKcmLNNKbs254yWfwxV
	8NDnq6XUG2pBgVka32e0xqIIakWuIJhW5fS2KxCduURY62f42QnErEgULTu9ytYmm4tN
	gFpzgL4ljKE17e/ub8VT3KTAlNj5/D94hSIWMzZ2VP/jSuNfrr4zVylzTCpzeBdiaQof
	QW2g==
X-Gm-Message-State: AJcUukfhJ+5NzPl8XvBmyMPOLsiWEj9OlnmS58UvUPTw1M9yUjoYkDsM
	Vds6pTe+vJBekeuks78/aGB6SbJU4ELrDbpGav5kkg==
X-Google-Smtp-Source: ALg8bN5XNgORa6lG3vFPd09vz3qfAaPzM/xhpEcOOO2KqDZ7rw1g4b+MFivdzTAOOWVJ2ePGcasmA6FCuoaDUWfvh/o=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr10556427itj.62.1548932099058; 
	Thu, 31 Jan 2019 02:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20190130192917.19882-1-JPEWhacker@gmail.com>
In-Reply-To: <20190130192917.19882-1-JPEWhacker@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 31 Jan 2019 10:54:48 +0000
Message-ID: <CAJTo0LYQ_=y6=wkYJ2QuxJAaQ_uYV9PqJQgYmw1AZR1x=pAwhQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] ref-manual: Update the default value for PACKAGE_DEBUG_PACKAGE_SPLIT
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
X-List-Received-Date: Thu, 31 Jan 2019 10:54:58 -0000
Content-Type: text/plain; charset="UTF-8"

Doc patches to yocto@lists.yoctoproject.org please.

Ross

On Wed, 30 Jan 2019 at 19:30, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> The new default is "debug-with-srcpkg"
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  documentation/ref-manual/ref-variables.xml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/documentation/ref-manual/ref-variables.xml b/documentation/ref-manual/ref-variables.xml
> index 4b243a12dd6..8e30f47bafd 100644
> --- a/documentation/ref-manual/ref-variables.xml
> +++ b/documentation/ref-manual/ref-variables.xml
> @@ -9976,7 +9976,6 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
>                              <filename>/bin/.debug</filename>.
>                              Source files are placed in
>                              <filename>/usr/src/debug</filename>.
> -                            This is the default behavior.
>                              </para></listitem>
>                          <listitem><para>
>                              "debug-file-directory": Debug symbol files are
> @@ -10000,6 +9999,7 @@ recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
>                              ".debug" previously described with the exception
>                              that all source files are placed in a separate
>                              <filename>*-src</filename> pkg.
> +                            This is the default behavior.
>                              </para></listitem>
>                      </itemizedlist>
>                  </para>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

