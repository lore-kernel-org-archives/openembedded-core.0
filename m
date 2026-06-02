Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9586CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 08:27:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20283.1780388820593625919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 01:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JSOYQ5Ao;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso11656805e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 01:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780388819; x=1780993619; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vl8GOOby+abxER2zhEUPmTxy1rfUyETiqeBp82Nc4WA=;
        b=JSOYQ5AoW7ggv7JTCB3xBvWRtZgLx0v9knmT1rK2iuHjKqkr+VYeaSLR98BEcCpaEL
         aKE3E9Wjbjl0fQIG2f3YQsWS7zzCPANxEntBjXJwMLdCwVi8q5Z2s64WWdA13su+xLQ4
         +zuAQF2+5Vx4UaZIWuthZzZT3bF2L9T0chx2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388819; x=1780993619;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vl8GOOby+abxER2zhEUPmTxy1rfUyETiqeBp82Nc4WA=;
        b=owifWu0A5qSUAGMcIiPy4Q0uNX/ccMv/81VTdJ5ltnbXQweQCj2WBqIZ6r9/bO6dkq
         PN7i76f5KGhBqNlgVm8Cil4RnOe4DGZ4N7hSsBgtdScGzCwER6F/TEmwyD7M5WSeDBRN
         Hc4gVND+dLyioGT73wgoNVZuHhrK3Vf569R0wXQqcCRSNcoZipmKhb57/qv3k1GOO0Zg
         mYpWSfBxwGibZMdaTo8DdKq058+/VPbhtXGa4VprCj36E0DDFnHtb0p/dEiW5QygCYB8
         P3L9rTSv8TX5PrErQTc65xUl0ytdi/XsdFwRRlW75aw6x2SXYX4XcDTJc5RGdCF4N7Bu
         ff9w==
X-Forwarded-Encrypted: i=1; AFNElJ9d7oIMZIX8L0P0NfXlt3qKOdaWjvtvt6Q10IPOhhXA5OLCYtj/0Zw712O6MInSTDHRnytcDU/q2xYhDMDbnmBPGA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFmp9mpaaTpDmtF9KQjkEzNmD0v8dcRrkoqGOiWRiOXZBiLeKn
	4MhM/GVcpnPzX5LqeGOVcHK4zinKZleBZFrk0AXZKFiYgIsZhxaV5nqnaoF6JOimLg3aSIBj5tw
	z/qDJ
X-Gm-Gg: Acq92OGQi89vVrsWHG6y0yimkN6vKw2JihJfzQ14caEkeW1BvWc/dAWebQoCUPL64Lb
	7ysfE06eKGQdQ2Cb+DHeAftppd8m8fdWbTuTstrGw2wgxRo222Wv9fEIXEYUtDYrR8W9mlCWqaH
	6yZ88ktB16cyOPsvj6+f3xe++gQZeu0uwydvxRwMWCwzPctMLywA3C+KDVi2fQHqMXmA8jKOvBa
	hle3BZlpRJCpZeNw/ZesGN3Vx/YFzD9mca3tfe8uoi7Ehy2ycUW5jDe2GhA0NxwfKUbGdtSwWvu
	cApzdZNqmSatR+e5viJEC8GpFCutg6Mcvjusg69ke88Im9Eu35zMI7ca8GzuJShh7lszrx01osI
	SIXlUJLa17tnIwexyrK2A2LF7uipT+mZDIBF66Q/pIMVNoTMD4RVn1JKaZMkBhVaX9R9SxcRpBW
	LOed5J+Ogbopj5P2gxUulPZ7MuYpEu4ZX8BG9zPldtQFNEqr/qi0AxINDhNQmtsdAeRKSy7Vgvk
	IDUZbebV0WyBX6FnGNPKQ==
X-Received: by 2002:a05:600c:8582:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-490a293b7c1mr205506395e9.27.1780388818883;
        Tue, 02 Jun 2026 01:26:58 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34bd320sm30322581f8f.13.2026.06.02.01.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 01:26:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 10:26:58 +0200
Message-Id: <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <corentin.guillevic@smile.fr>, <martin@geanix.com>, <paul@pbarker.dev>,
 <mathieu.dubois-briand@bootlin.com>
To: "Sai Sneha" <saisneha196@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 3/4] insane.bbclass: add missing-srcrev QA check for
 SCM URIs
X-Mailer: aerc 0.20.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-4-saisneha196@gmail.com>
In-Reply-To: <20260602062940.3107241-4-saisneha196@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 08:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238018

On Tue Jun 2, 2026 at 8:29 AM CEST, Sai Sneha wrote:
> Add a proper QA check test_missing_srcrev() in do_recipe_qa that
> fires at build time via oe.qa.handle_error(), using the shared
> oe.qa.check_uri_srcrev() helper to avoid code duplication.
>
> Severity is controlled per layer:
> - WARN_QA:append =3D " missing-srcrev" for all layers (warning by default=
)
> - ERROR_QA:append:layer-core =3D " missing-srcrev" for oe-core (strict)
>
> This follows the same pattern as missing-metadata and missing-maintainer
> which are warnings globally but errors for oe-core.
>
> Note on CHECKLAYER_REQUIRED_TESTS: missing-srcrev is intentionally
> not added to CHECKLAYER_REQUIRED_TESTS because that would promote it
> to ERROR_QA for all layers globally during normal builds, contradicting
> the layer-specific enforcement requested in Bug 16051 Comment 3.
> Instead, yocto-check-layer.bbclass enforces it directly during
> checklayer validation runs.

Neither CHECKLAYER_REQUIRED_TESTS nor yocto-check-layer does not appear
in this patch. Maybe move this note to the next patch?

>
> Reported-by: Yoann Congal <yoann.congal@smile.fr>
> Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051
> AI-Generated: Developed with assistance from Anthropic Claude
> Signed-off-by: Sai Sneha <saisneha196@gmail.com>
> ---
>
> Changes in v5:
> - No changes to this patch
>
> Changes in v4:
> - Refactored to use shared oe.qa.check_uri_srcrev() helper
> - Eliminates duplicated URI parsing logic
> - Added note explaining why CHECKLAYER_REQUIRED_TESTS is not used
>
> Changes in v3:
> - Added AI-Generated disclosure and Reported-by tag
>
> Changes in v2:
> - Initial public submission
>  meta/classes-global/insane.bbclass | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index 04700be71c..1fe426646d 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -49,6 +49,9 @@ ERROR_QA ?=3D "\
>  ERROR_QA:append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'usrmerge', =
d)}"
>  WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
> =20
> +WARN_QA:append =3D " missing-srcrev"
> +ERROR_QA:append:layer-core =3D " missing-srcrev"
> +
>  FAKEROOT_QA =3D "host-user-contaminated"
>  FAKEROOT_QA[doc] =3D "QA tests which need to run under fakeroot. If any =
\
>  enabled tests are listed here, the do_package_qa task will run under fak=
eroot."
> @@ -1455,6 +1458,15 @@ python do_qa_unpack() {
>  python do_recipe_qa() {
>      import re
> =20
> +    def test_missing_srcrev(pn, d):
> +        import oe.qa
> +        src_uri =3D (d.getVar('SRC_URI', False) or '').split()
> +        for uri in src_uri:
> +            rev =3D oe.qa.check_uri_srcrev(pn, uri, d)
> +            if rev is None:
> +                oe.qa.handle_error("missing-srcrev",
> +                    "%s: SRCREV not set for SCM URI %s" % (pn, uri), d)
> +        =20
>      def test_naming(pn, d):
>          if pn.endswith("-native") and not bb.data.inherits_class("native=
", d):
>              oe.qa.handle_error("recipe-naming", "Recipe %s appears nativ=
e but is not, should inherit native" % pn, d)
> @@ -1497,6 +1509,7 @@ python do_recipe_qa() {
> =20
>      pn =3D d.getVar('PN')
>      test_naming(pn, d)
> +    test_missing_srcrev(pn, d)
>      test_missing_metadata(pn, d)
>      test_missing_maintainer(pn, d)
>      test_srcuri(pn, d)


--=20
Yoann Congal
Smile ECS


