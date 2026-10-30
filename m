Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13175.1793371414195963511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 07:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=P7EXPrH1;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso447399f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793371412; x=1793976212; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wEL1oxudjdOntjqrB2w1NRVyfU8XVvsvaiZSfODP5A=;
        b=P7EXPrH1sYv2hIyCyMmaioEv4dabrxYH+t2fM8T3HYVtnOGmhbLC2K93jqK5MS7LVa
         AqYbHc0w16OCK9M5BeXQAHxF2+Cx3eBSJMDcmvUmB4bfnVgPxaC1tDjgzpc57zhXvQDY
         itFcsLu6NBQtxdJjJQ7v4HUwnODHcM/6XzZw+0FlLdNsWtBSvvbysEOTGeLVKdtHEutc
         +d3bL+rrtV7XMW0aYMjnoaU26+4t2+cYs0/1D0kstSmBR8rpqyPMJXak0AvmDV/8FQYv
         /VXDKE8u6oeYFHurJfNF49aD7VkoV7qbY9ikW6860DMGx9ecl56XzjeEy2xhjJ55T1qM
         nh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371412; x=1793976212;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8wEL1oxudjdOntjqrB2w1NRVyfU8XVvsvaiZSfODP5A=;
        b=zOk4Axg5AVKWpHJNTyUEkiGUC2l2yQnhE/bbbZ00ikszDhzRn/UOZiPbZTf2PqVw0B
         2B74QVKtRJTTb5xU5YBGXCGh/9/Y5kHj0kgRhDHTXw4hv+Cmgw5BEBhsQ71lU8iksTzn
         9pE3H5iVM5X9S/Nv3mlYh+vv6YGU466EmlA2Y5+ajFSJqXDyK+4dNHEVkHEpom9+c97L
         rsdhlDkJzGrzJH4klMujPCfSwDoEKRhVnvKrzFnIGNhbhx5cRBlEc03nSF+VBzxXIZCJ
         huKMmP05mYo38C4DUnrbqvZZeE2jJEo8ZajJzKzGqy1cweUeJ4P3V4HKkXO5cyuAFexU
         UFTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyzODJny7hHXCZrQ6uras4LeuMG8MMnojknvy9oJVCMtpFK15qnjmEHww50EO2+aFDpBzE6Gt4A47MTphIN7o1nQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJVOwh3hTdv6F+yFovmpJgtQZorUwpeec+KVm/LXhyrKUSHO5EX
	H4SP662JSdg6BgrwsUa2BQg8eWuIhxc98BypKP+KBSW4BFXnJCKNfP3i8Kfau+LatzcJ5hDbq0x
	ci+6yuCY=
X-Gm-Gg: AYBFou2BiKqzE4TsNAKaySN7/nKAHgTUd7sitGmg6RJYj5OobyXrDGGGYl1zniViMSv
	UAI/36uKgoGnUa9B0S3uUnzeaxadBIvNmaXg4xmTbcAg+utMAjMjqs0hk3/+UvTnA17jFTWvCgS
	s6Y99Mu4/1ihb0fNJ99BsnWuaA1s9TYwMP61d9YYosXmaLTDtQbjWs7I1ku4OVEUKSkn1x7cgah
	g5XM4NbvxSy4yCDU4yoIFTSmleONNFLZv4iVZppUxLG/f4RpDd6W4DtPP3T6XV0tRj1gPmAaFQt
	5dkFfB+QULNJvfrKQVIRFu2kXaHj2RM4RiyWStI34aH/a9AiSdGAIlyZATR94Y/Kpm7hwATNVZW
	Nrq5YI3Ah9FkISTAbwmGHnSlGAnsDOE3RlPz0MDerZH8ac/RTlwiEku7Ec3oW5V0Lix0J9PLSDh
	riLEyR4eFFLLfgfCRAMKSZ4lIWYUeMQ5GrKq1UJDn8Ez6zZrHjblQ21fVndURwWZSJNnG8pztkf
	pFZHXrNSsz+gpk3vbKrna8mcXaOVzMr1XYMcJA5vnjpwWMooNZAE93eYx5yVlJ8WgyEoeBv31MR
	RrwYs/KWejI+wi/ZUl5qCMbS96Od4VdmWyTxk4lDBzxjvR4GbQGql6t5d99+hnv3w7duVf4K71A
	nDE8PPJJqeAZ88o50wBe2B9GbKJxcUNAqO9vgfA==
X-Received: by 2002:a05:600c:3554:b0:4a1:f7f4:7cf2 with SMTP id 5b1f17b1804b1-4ac1737c474mr55383415e9.17.1793371412374;
        Fri, 30 Oct 2026 07:43:32 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm29532895e9.0.2026.10.30.07.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:43:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 15:43:31 +0100
Message-Id: <DMI93WSI0JHL.LBF1I5TUH1Q6@smile.fr>
To: <jason.stasiak@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH v2 4/5] libsoup-2.4: fix
 CVE-2026-5119
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260929205055.2403390-2-jason.stasiak@gmail.com>
 <20261014161209.2227316-1-jason.stasiak@garmin.com>
 <20261014161209.2227316-4-jason.stasiak@garmin.com>
In-Reply-To: <20261014161209.2227316-4-jason.stasiak@garmin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 14:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249048

On Wed Oct 14, 2026 at 6:12 PM CEST, Jason Stasiak via lists.openembedded.o=
rg wrote:
> Backport fix for CVE-2026-5119 from upstream libsoup 3 patch [1].
>
> [1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/b0626fff8538e3dd4a52f=
148d91c8348d51d64d1
>
> Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
> ---
> Changes since v1:
>    - Updated subject line to identify correct CVE
>
>  .../libsoup/libsoup-2.4/CVE-2026-5119.patch   | 129 ++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
>  2 files changed, 130 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-511=
9.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch=
 b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch
> new file mode 100644
> index 0000000000..0041010667
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch
> @@ -0,0 +1,129 @@
> +From b0626fff8538e3dd4a52f148d91c8348d51d64d1 Mon Sep 17 00:00:00 2001
> +From: Carlos Garcia Campos <cgarcia@igalia.com>
> +Date: Fri, 27 Feb 2026 12:03:25 +0100
> +Subject: [PATCH] Fix CVE-2026-5119

Keep the upstream patch subject please

> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/b0626fff8538e3dd4a52f148d91c8348d51d64d1]
> +CVE: CVE-2026-5119
> +
> +Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>

As an exemple, this backport changed:
soup_message_get_method (msg) -> msg->method
This look quite simple but this might hide more code that just a pointer
shorthand. I'd prefer it was listed in the backport notes with the check
that this is just a shorthand and not something more complex.

> +---
> + libsoup/soup-cookie-jar.c | 25 +++++++++++++++------
> + tests/proxy-test.c        | 46 +++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 64 insertions(+), 7 deletions(-)
> +
> +diff --git a/libsoup/soup-cookie-jar.c b/libsoup/soup-cookie-jar.c
> +index c8231f0e..b9abdc82 100644
> +--- a/libsoup/soup-cookie-jar.c
> ++++ b/libsoup/soup-cookie-jar.c
> +@@ -12,6 +12,7 @@
> + #include <string.h>
> +=20
> + #include "soup-cookie-jar.h"
> ++#include "soup-connection.h"
> + #include "soup-message-private.h"
> + #include "soup-misc-private.h"
> + #include "soup.h"
> +@@ -818,18 +819,28 @@ process_set_cookie_header (SoupMessage *msg, gpoin=
ter user_data)
> + 	g_slist_free (new_cookies);
> + }
> +=20
> ++static gboolean
> ++allow_cookies_for_request (SoupMessage *msg)
> ++{
> ++	/* Do not send cookies to a HTTP proxy for a HTTPS request */
> ++	return msg->method !=3D SOUP_METHOD_CONNECT || !soup_connection_is_tun=
nelled (soup_message_get_connection (msg));
    ^ this has been re-indented

> ++}
> ++
> + static void
> + msg_starting_cb (SoupMessage *msg, gpointer feature)
> + {
> + 	SoupCookieJar *jar =3D SOUP_COOKIE_JAR (feature);
> +-	GSList *cookies;
> ++	GSList *cookies =3D NULL;
> ++
> ++	if (allow_cookies_for_request (msg)) {
> ++		cookies =3D soup_cookie_jar_get_cookie_list_with_same_site_info (jar,=
 soup_message_get_uri (msg),
> ++		                                                               soup_m=
essage_get_first_party (msg),
> ++		                                                               soup_m=
essage_get_site_for_cookies (msg),
> ++		                                                               TRUE,
> ++		                                                               SOUP_M=
ETHOD_IS_SAFE (msg->method),
> ++		                                                               soup_m=
essage_get_is_top_level_navigation (msg));
> ++	}
    ^ Also reindented. I admit the upstream indentation is not ideal but
	changing it adds a lot of noise in my review process.

> +=20
> +-	cookies =3D soup_cookie_jar_get_cookie_list_with_same_site_info (jar, =
soup_message_get_uri (msg),
> +-	                                                               soup_me=
ssage_get_first_party (msg),
> +-							               soup_message_get_site_for_cookies (msg),
> +-								       TRUE,
> +-							               SOUP_METHOD_IS_SAFE (msg->method),
> +-							               soup_message_get_is_top_level_navigation (msg));
> + 	if (cookies !=3D NULL) {
> + 		char *cookie_header =3D soup_cookies_to_cookie_header (cookies);
> + 		soup_message_headers_replace (msg->request_headers, "Cookie", cookie_=
header);
> +diff --git a/tests/proxy-test.c b/tests/proxy-test.c
> +index 105a02a6..d8c7e8a1 100644
> +--- a/tests/proxy-test.c
> ++++ b/tests/proxy-test.c

Same remarks about the test code.

Thanks!
--=20
Yoann Congal
Smile ECS

