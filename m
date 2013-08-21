Return-Path: <cazfi74@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 110616B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 08:05:43 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id a1so44537qcx.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YtLWS/T6boJWTRjVOb5U2ZzTPZBTdMj0VMy0/j6om0I=;
	b=mhzXAoNYTcA4i/vNvIGZfh3VyFkIs98xBU75f8Md20PGbhw3JgZ4Vp6j6uJ9OxZBd5
	u/O8qVxGz9DdnrRFwvyCIqs/2kvkXpxeQ5xGTlZ/gXBgRs5iGWo6nOfY9b7X7AYM5yb5
	tCqWhOk9W9VWWB6OpIGE15L31EB0bj9tvqhKKs2ISJg375jAxus/UWpxhkc9Tur3NQPd
	4nKuPVog0h6IOYBY6nFt373KoJmIrjjUxggpG5ARnOrnmbHEi5lQ5/N/ywZm0D+OsqsB
	YRMTdrNnmu2uu11OLHvPdhPCx7sIuHI2eP35kG2SwOKRWaOJrks7UTZA/VA7hEdwqbhF
	XGtw==
MIME-Version: 1.0
X-Received: by 10.49.47.84 with SMTP id b20mr6986204qen.83.1377072344341; Wed,
	21 Aug 2013 01:05:44 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Wed, 21 Aug 2013 01:05:44 -0700 (PDT)
In-Reply-To: <1375713884-8528-4-git-send-email-cristian.iorga@intel.com>
References: <1375713884-8528-1-git-send-email-cristian.iorga@intel.com>
	<1375713884-8528-4-git-send-email-cristian.iorga@intel.com>
Date: Wed, 21 Aug 2013 11:05:44 +0300
Message-ID: <CAF6bG8c-1zkHYuLbnPPgCGENsaergeggvQvjMpJKcAr59k4rEg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] harfbuzz: upgrade to v0.9.19
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
X-List-Received-Date: Wed, 21 Aug 2013 08:05:44 -0000
Content-Type: text/plain; charset=UTF-8

On 5 August 2013 17:44, Cristian Iorga <cristian.iorga@intel.com> wrote:
> disable_graphite.patch updated.
>

> -
> --PKG_CHECK_MODULES(GRAPHITE2, graphite2, have_graphite=true, have_graphite=false)
> -+have_graphite=false

 As upstream had only check for existence of graphite2, we needed to
patch this disabling...

> + if test "x$with_graphite2" = "xyes" -a "x$have_graphite2" != "xtrue"; then
> +       AC_MSG_ERROR([graphite2 support requested but libgraphite2 not found])
> + fi
> ++have_graphite=false

 Here it seems (x$with_gpaphite2 = "xyes") that new upstream version
has configure switch --without-graphite2 that should be used instead
of patching any more.


 - ML

