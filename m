Return-Path: <net147@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D49E26FFD8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 11:35:40 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id cl4so10886501igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=r+t7lN3BnSRLMG55i37/izgq0rcX55S6Hyt8RKKTjGQ=;
	b=p6KLNHYBM2vU490BWG0iNZpr4Afh5wPEoiPkrN2xeFtYOqdbYWXpg1cnF81qt1vg1J
	Kkkm0x7fcZKXIM+Y62RFWjcZ+TT3TuYRElj70AZk7msp9nhyAuZh6NNuWnfaJNcjfwxX
	ItZxJZQRZtNq+KcqbneWSnsNnVfplBrN3Ect72IXS6yJCY8m6Ho/APQ7dZB91UOZGkcW
	IplEVro2IdVnsRlvuwlJeSoKi7lz9yMcEI9+AX8SKtwv1g/fPPiKwq2OLGD96XbdNwaw
	rCjz2vX0S8wNaoAx6Vv92WpQpVlqDKaW8ukBw3YHajkQIBzUguN5f9+j8d0t72RuJ5Ur
	g26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=r+t7lN3BnSRLMG55i37/izgq0rcX55S6Hyt8RKKTjGQ=;
	b=kbsHtx9nS5LqzzTZ3bb2PLisDoDDjEgPnF+3dWWe0geNDUHIYE3NefBgiOCttOdwj6
	upWjW39922a72qhU5XVo89LqoTrR4MGaWkP+89TshiPZ/AbISJMrMG6c8mfkPMUV20xK
	DIdc5Z6BTr+aamFrIoRrgy5NpDtRjJV6p+mIWknxwqobcl8+G0ucByy8De1/p2U9Gr+T
	x0sd/VzsMBQbBvpadIlZOaolOMG9CZBEi0VO3uaNyU9rkZPqVvCctMTN45jadlZitaWg
	pqlsD42UND2US8BGa0Xo4XUdcljQfPv0U4ugsloq+TucmkyRnIqYDOSbP5uMtNPK4Z/f
	VaUQ==
X-Gm-Message-State: AD7BkJIHvnO64zDMKv28vbBs6xHAjA3fuSs8JGmb4PuQcu+IAOYHyFZaReR59WbcKK6NEQAZ3r9Ymsfd1vLewQ==
MIME-Version: 1.0
X-Received: by 10.50.39.50 with SMTP id m18mr33124771igk.56.1458905741098;
	Fri, 25 Mar 2016 04:35:41 -0700 (PDT)
Received: by 10.36.69.12 with HTTP; Fri, 25 Mar 2016 04:35:41 -0700 (PDT)
In-Reply-To: <1458887112-27434-1-git-send-email-net147@gmail.com>
References: <1458887112-27434-1-git-send-email-net147@gmail.com>
Date: Fri, 25 Mar 2016 22:35:41 +1100
Message-ID: <CANwerB0ya2SdMUFYoTuXopXwhcx38pBNQEp7qR2jO+i3zs1_SQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: fix enabling of Python support
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
X-List-Received-Date: Fri, 25 Mar 2016 11:35:41 -0000
Content-Type: text/plain; charset=UTF-8

On 25 March 2016 at 17:25, Jonathan Liu <net147@gmail.com> wrote:
> Python support was not being enabled because of a conflicting
> --without-python configure argument in OE_EXTRACONF.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> index ae97759..6fd3e3e 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -13,6 +13,7 @@ RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-
>
>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>
> +EXTRA_OECONF_remove = "--without-python"
>  EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
>
>  SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
> --
> 2.7.3
>

Please ignore this patch.
It is is replaced by "gdb-cross-canadian: use PACKAGECONFIG for python
and readline".

Regards,
Jonathan

