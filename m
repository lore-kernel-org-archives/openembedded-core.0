Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29211.1794839776512716125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 06:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=YmyXrDp+;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso40208915e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 06:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794839775; x=1795444575; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMP8yTkKk90m1u/oiIUzY+/f2QwI0wFdFOVp7rRcXfo=;
        b=YmyXrDp+2FnrL5UbvJ8rhaG9lAvpCaQinOxLyEcEjABRiyAUZdJm3lCYptoz/D01qT
         KaD6cwYPt1rQjFgKT2yBTvdo463GdpLmR0fDwGxmoEgUKJET8SMyfctawyK8sUdbUBRI
         TJunPxtLnMbDcg523qNFjWd46oSRfeEE6/JsMuRkx6uEKmBL2CDntCUmb0uHUzDZNMhR
         t6HWc3mCJ7Hwwl1ClvhexZke9yRkSZERdm229+XOiXzE34GJttcdQHiRsYKpocSyd2DF
         PkkpQrCsTkK/TUpg7WQLglp1yvND+jAOOVQIul9emYas8BTZ+Vo3ds3Xy+wWQbSKVkot
         83Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839775; x=1795444575;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMP8yTkKk90m1u/oiIUzY+/f2QwI0wFdFOVp7rRcXfo=;
        b=lVND/4r38wG4AFBG3OoEN1rSVce4FEs3Oy+XyY9+e0tJyCN43h9RtUiCNUPMZiKB9/
         rFLel36Es4yNjToC/m7rjOC1DMmqbgHdrsjo9AV+OJt9nchgVAJls5NnOQRiPiuttlQZ
         D+/Vmy9RDlJgwmW96HyDo9q+V6/tcNfcf6CxeyQ0MliMHbvNwHw0mQPs3aO01aUW+b6g
         U7nwpFc8h3cGskJgOuF7u6JMqYKmdgYJoDecuy4l2nSWfmiWzrSTIToZzF7BTbv2g0nS
         cre0WFEPOjrjgzhLVySkRvarhQWJnXfb7AqG92IhliGyV5yHCcXEo+7Aj2lEVJ5J5Oq3
         z9uA==
X-Forwarded-Encrypted: i=1; AL+hErEVBRkjKO5bgBCvocsAA9JL/JskNph/Kuvj3wZkhA1sVBl1DtMf/GTiY45AN09dZ8WU6AuCaVuPNSgKXCRb1IZchw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8dOuC27iMpXawbOx7ggfRrQBQ7RNrZNkjQSfVucVGfcPZ6qTOV
	OOBCvN3r2Um6zHeqlGuHGsL0hecDkE4eFy8ZJT/BQvyiE0oN7fGOgGP1Z1Q8LSBeszk=
X-Gm-Gg: AYBFou0hUSNg5Lz2swtQgDfA4AkHDxeNZPRS4J9Luzb9wZG7gRLDz0pYUVHKCV4t48Y
	6Fvtagl2ZVqHcMYWVAaUCS42NVHqRLSpb7JGh05lhV2DF2/I4i53KVkcucLBeyOKKjfhWxcLDnQ
	6KeNhl5NWrjLoA4xI1JIpD4Bc6osgnPOU4Xy7AZpOqMlC0xzFn7izLIxF/YJb0C6kmAElTYS7GA
	aNBG7oKqgScEtGYoktk7T4JfkBLBD0ytNsbEw/LDjUhHE80ghsZFBrpQeySX2wrwGLqe2nwKR/T
	2rqdvRPcBTFSsDIeYUWNVvZWev85QCODbnWrzVRF4IRPlKBd6epaG3DcAmjwmdO07NB86H48LG9
	OJHL089pVY7j5I9OwRG5UXvmUJCIuiCJ7pe7cv2ZW1Bf8vMilunttZQrxVF22JM6eF7/vPlCXDb
	FOeAQW6S7bgRhw8Gc4fDF8yHwiouebAkgmW7FuKCI/Z4S5tjiREIdI+b2gLZkJ3k7ykuqOK0iCh
	2sE8Qt3wDwvZOttFzVtKRzN527jjktDTZsK682N3G2N5yH5I1vvvrdtusUra2UEwoyEp38/JBcV
	Jfv+wl4yBKb5uiP/bjN5T+K0Cu6UmZ22hlH4luAC8NzuSSeUyinX3FEUWAOYfVnofKdSY+90X9d
	IaOlfek4KkQKYGw==
X-Received: by 2002:a05:600c:8b34:b0:4a2:1364:252a with SMTP id 5b1f17b1804b1-4bb559f7039mr225398095e9.3.1794839774533;
        Mon, 16 Nov 2026 06:36:14 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm24368515f8f.43.2026.11.16.06.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:36:14 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 15:36:13 +0100
Message-Id: <DMWPLL6BJVI3.1WWR7CLO0LHRF@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v2 1/5] curl: fix CVE-2026-8926
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
 <20261023093331.1886272-2-dkelaiya@cisco.com>
In-Reply-To: <20261023093331.1886272-2-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 14:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250344

Hello,

On Fri Oct 23, 2026 at 11:33 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Backport the upstream fix [1] for [2] to curl 8.19.0.
>
> Include entry-selection changes and extended test 685 from [4].
> Keep password-only entries valid for a user supplied in the URL,
> while rejecting passwords tied to a different login. Reset login
> matching state when changing entries.
>
> Include upstream follow-up [3] to cover URL users absent from the
> netrc file, with regression test 1646.
>
> Select the final login and password at the end of each machine entry.
> Extend tests/data/test1304 and tests/unit/unit1304.c for both
> credential orders, replaced logins, account values and macros.
> Document the retained parser API and test harness separately from
> upstream's lexer/scanner rewrite. Preserve generic password-only
> entries and the old blank-password API.
>
> [1] https://github.com/curl/curl/commit/4ae1d7cc2643e4773a136395f12bc02fc=
6867854
> [2] https://curl.se/docs/CVE-2026-8926.html
> [3] https://github.com/curl/curl/commit/7ca5f939c8403db7ede21e2ccb805a65d=
3329ef8
> [4] https://github.com/curl/curl/commit/a327a5bdedfad6b486bca4e0a1a4fdac9=
ab298ca
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
> Changes in v2:
> - Select the final login/password at entry boundaries to handle both
>   credential orderings and reject a mismatched final login.
> - Extend tests/data/test1304 and tests/unit/unit1304.c for both orders,
>   replaced logins, account values and macro bodies.
> - Document the retained parser API, test harness, password-only
>   entries and blank-password behavior.
> ---
>  .../curl/curl/CVE-2026-8926-dependent.patch   | 140 ++++++++++
>  .../curl/curl/CVE-2026-8926_p1.patch          | 258 ++++++++++++++++++
>  .../curl/curl/CVE-2026-8926_p2.patch          |  84 ++++++
>  meta/recipes-support/curl/curl_8.19.0.bb      |   3 +
>  4 files changed, 485 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926-dependen=
t.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8926_p2.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch b/meta=
/recipes-support/curl/curl/CVE-2026-8926_p1.patch
> new file mode 100644
> index 0000000000..71d44a2bd5
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-8926_p1.patch
> @@ -0,0 +1,258 @@
> +From 4ae1d7cc2643e4773a136395f12bc02fc6867854 Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Fri, 15 May 2026 11:45:49 +0200
> +Subject: [PATCH] netrc: scanner refactor
> +
> +Refactor the netrc scanner. Add test case for checking that the last
> +matched machine with unmatched login does not return the password as
> +success (unit1304).
> +
> +Closes #21624
> +
> +CVE: CVE-2026-8926
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/4ae1d7cc2=
643e4773a136395f12bc02fc6867854]
> +
> +Backport Changes:
> +- Kept curl 8.19.0's parsenetrc() state machine and tokenizer;
> +  applied the selection rules from upstream netrc_scan_end_entry()
> +  without importing the lexer/scanner replacement.
> +- Kept Curl_parsenetrc() and its char **loginp / char **passwordp
> +  interface. Omitted the netrc.h and url.c API/credential plumbing
> +  changes for Curl_netrc_scan() and Curl_creds.
> +- Kept the existing file-loading helpers; omitted upstream's grammar
> +  documentation, debug tracing and helper reordering.
> +- In the old parser, replaced the early login/password return with
> +  selection at machine, default, macdef and EOF boundaries. Reject
> +  an explicitly mismatched final login; keep password-only entries.
> +- Retained the old API's blank-password result for a matching login
> +  without a password, rather than importing Curl_creds handling.
> +- Consume account values and skip macro-body lines in the retained
> +  tokenizer instead of using upstream's literal-token/macro helpers.
> +- Adapted tests/unit/unit1304.c to the old API. Kept
> +  UNITTEST_BEGIN_SIMPLE and string cleanup instead of upstream's
> +  easy-handle setup. Retained the old assertion style and substring/
> +  superstring inputs. Updated the three unmatched-login results and
> +  ported the final host/unmatched-login regression.
> +- Extended the existing tests/data/test1304 fixture, which upstream
> +  does not modify, and added unit1304 assertions for both credential
> +  orders, replaced logins, account values and macro bodies.
> +
> +(cherry picked from commit 4ae1d7cc2643e4773a136395f12bc02fc6867854)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + lib/netrc.c           | 53 +++++++++++++++++++++++++-------------------=
-------
> + tests/data/test1304   |  8 ++++++++
> + tests/unit/unit1304.c | 52 ++++++++++++++++++++++++++++++++++++++++++++=
+++---
> + 3 files changed, 83 insertions(+), 30 deletions(-)

Thanks for the v2.

I think there is a problem with the tests: curl-ptest never runs
unit1304, so the added unit1304 code is not tested on the
autobuilder.=20

This patch was in this autobuilder build:
  https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/5130

The curl ptest logs of qemux86-64-ptest and qemuarm64-ptest both have:
   1304: IGNORED: The tool set in the test case for this: 'units' does not =
exist
  TESTDONE: 1008 tests out of 1008 reported OK: 100%
  https://valkyrie.yocto.io/pub/non-release/20261116-6/testresults/qemux86-=
64-ptest/curl.log
  https://valkyrie.yocto.io/pub/non-release/20261116-6/testresults/qemuarm6=
4-ptest/curl.log

Since this is mostly new code, I'd like to get the test right (meaning
running on the AB).

How did you run this unit1304 test?

Regards,
--=20
Yoann Congal
Smile ECS

