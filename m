Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24F2760CB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 07:22:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f7so9116116wml.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 00:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=81U1Bhf05AC0u6fRK9S0JCeSxLhmljTh9NoOBtNbhuc=;
	b=Mt8TJZhaYvbOcLvBeNydbWFJf74EYWkcVFXf8GqeIRKcBOZ3dBtPQGn9rqZlFRYcEt
	y9ljBX9HxIvQA9SK5/RQ5w5ZASHVI1nZlQ2pB3zsDFgtpvchpu4E4ZNqzBVUp5chxQWW
	9pZyu24wju4j6+Az80tvIzIXI5N092acOKB80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=81U1Bhf05AC0u6fRK9S0JCeSxLhmljTh9NoOBtNbhuc=;
	b=SD65Z866JRH3MXnboCEm09rLRsQDV/lCWOnYrIbTMm5TUJqbmbiq31s2uMgxNOtoyd
	xzTYHOAr4IXUTqZmGVeTa7NfnSu9zUsE5+u7fudgxJH2jlWsyjv+bnBP4oamtPdAlpGQ
	FEHth809fjfWyme9mBeHS45GnxDW0rY9sSQF0d1OLFH8HuydrQVPtfQXFLxUvEngw1PX
	xcLlY/8zSYYkS2ebhUKsEXbfpRTubNs1rFADY7OfdjvrQxB8KBKmFNVvvnf9qZEaWx06
	CDq6b2gxTZ+QUuLnw2RLhyjQAmTS66x2o8x7a/Me4lndbGpnGRl6pZoxXkeTbSRpqN+7
	Y6tA==
X-Gm-Message-State: ANhLgQ3A8j+Bp0JhYANcHUm9k+WQidxQzIpZyYQUG4CusqSOXVPQ/izE
	5gk1MGvxwQFeRIrXrShq5Z6ghcz+EoQ=
X-Google-Smtp-Source: ADFU+vtE4zwKWJ9yoTIWyh3e/jDB+v+RLT4ZRhsj4IQxoSTMOWvawhJLIghs4FxNqH3Q4/LPF1QVTg==
X-Received: by 2002:a1c:b7d7:: with SMTP id h206mr4657312wmf.143.1584084124795;
	Fri, 13 Mar 2020 00:22:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x8sm68095498wro.55.2020.03.13.00.22.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 00:22:04 -0700 (PDT)
Message-ID: <da907d6a7f3e2a7391896c767a19bd36e2e87f1a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>, 
	"Jeremy A. Puhlman" <jpuhlman@mvista.com>
Date: Fri, 13 Mar 2020 07:22:03 +0000
In-Reply-To: <20200312142524.GB30953@joraj-alpa>
References: <20200311222249.29880-1-jpuhlman@mvista.com>
	<20200312142524.GB30953@joraj-alpa>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] babletrace2: make manpages multilib identical
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
X-List-Received-Date: Fri, 13 Mar 2020 07:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-12 at 10:25 -0400, Jonathan Rajotte-Julien wrote:
> Is this something upstream (lttng-dev mailing list) should be
> interested in?

Its a tough one as the man page is technically correct but the
references give us a challenge in packaging it. I can therefore
understand upstreams not accepting changes like this but if they were
open to some kind of tweak it does help us not have to have patches...

Cheers,

Richard

> Cheers
> 
> On Wed, Mar 11, 2020 at 03:22:48PM -0700, Jeremy A. Puhlman wrote:
> > From: Jeremy Puhlman <jpuhlman@mvista.com>
> > 
> > Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> > ---
> >  .../0001-Make-manpages-multilib-identical.patch    | 28
> > ++++++++++++++++++++++
> >  meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb     |  1 +
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-
> > Make-manpages-multilib-identical.patch
> > 
> > diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-
> > manpages-multilib-identical.patch b/meta/recipes-
> > kernel/lttng/babeltrace2/0001-Make-manpages-multilib-
> > identical.patch
> > new file mode 100644
> > index 0000000000..2401b176e6
> > --- /dev/null
> > +++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-manpages-
> > multilib-identical.patch
> > @@ -0,0 +1,28 @@
> > +From 56986190e4b0c10945ce6aaa7ca10d6bd8a26a39 Mon Sep 17 00:00:00
> > 2001
> > +From: Jeremy Puhlman <jpuhlman@mvista.com>
> > +Date: Mon, 9 Mar 2020 21:10:35 +0000
> > +Subject: [PATCH] Make manpages multilib identical
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> > +---
> > + doc/man/asciidoc-attrs.conf.in | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/doc/man/asciidoc-attrs.conf.in b/doc/man/asciidoc-
> > attrs.conf.in
> > +index ad1183f1..e11c7031 100644
> > +--- a/doc/man/asciidoc-attrs.conf.in
> > ++++ b/doc/man/asciidoc-attrs.conf.in
> > +@@ -1,7 +1,7 @@
> > + [attributes]
> > + # default values
> > +-system_plugin_path="@LIBDIR@/babeltrace2/plugins"
> > +-system_plugin_provider_path="@LIBDIR@/babeltrace2/plugin-
> > providers"
> > ++system_plugin_path="@prefix@/lib*/babeltrace2/plugins"
> > ++system_plugin_provider_path="@prefix@/lib*/babeltrace2/plugin-
> > providers"
> > + babeltrace_version="@PACKAGE_VERSION@"
> > + enable_debug_info="@ENABLE_DEBUG_INFO_VAL@"
> > + defrdport=5344
> > +-- 
> > 


