Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6F4E8B383
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 23:12:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7305.1770160316792129495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 15:11:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=skUyVHDP;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f2599980so33903125e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 15:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770160315; x=1770765115; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJZmJNgyPpSOZ4jXI/UCKWybATAw35yfiOu8hl8ERDk=;
        b=skUyVHDPLVFcs6kQrbX+1rE/e0dnTnLLG3mzxUzYmpxnRVdKI5Yqr/3ULNLeWMCxkO
         8CD/oHB04jRMkwV7IjS4CN/+WzZz10GODpd87Eq7uCQ77OnxIBWVap0xtfoos9pmn5fb
         EwBjoP9KYAAGS/173kSuyN/z1c/zCQPXsTWmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160315; x=1770765115;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJZmJNgyPpSOZ4jXI/UCKWybATAw35yfiOu8hl8ERDk=;
        b=g+X70jIRvQCMxiLm/oa9gByH3uO2wbZn7rUnMeT1PobwL+6CdY9UeUqax96yS+zamu
         ungXCi0UkEhP3LCMcVdr3PvZoMBhYXQSsEvPoO8TiWqhgrYDMYmCDXDuAVlm/RN2lw8E
         woDkHIXrnITQFdcAOt2dSD/4SLipNLpvji+IDuBTHHsUid4m7YXauqU6s90RuXV/X3Zd
         1Em90wRwFH4atGxzv8zhXoRzibFnm96O9NrO3+9WPCXLGUrG2l3px3I9z5Ko79kDts10
         Ey/vzJN3WAvLT9qSbqwNmNWBEbKNk9luNMy4O84gAGc9hrnlL118gWDWM11u0rG5zT6S
         H3DA==
X-Forwarded-Encrypted: i=1; AJvYcCUkaoDN6FL2ZzYa20fs0X7EszUK2TNA0f/5G5uLIOhcTCJ5LACGfxpIQ8wtp2wLdOy3vJvrwOtjVF+5/6FFT81n8Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRpJ2l/sDEjj93jf+M7pN51CnLvusVmugJj42i3Gr8PryzU3xR
	ETp2P03jD4pwL3Upe3OObnqAL6QAWMyUfuZFG30+lgsddw+zTxomB8OKffc5T+j1xo8=
X-Gm-Gg: AZuq6aK5smAXYBfqHevoST+N1kGMS875BDUnwMa5k+5oczd58sbXycrkq4L0lqZOALW
	OB6R+RCS7U3N7yGMW0aoZM1nB9TF9n9fQndiYKzajAL13jZaHgBS0aQ4bp/oMkPeHlBdLeQm8dw
	MFr1C+Jc3o9jGX4Kwy7uj4POtsQ23urRgTmajyIdufl1914gE6zeyvtN4lnsWGmqHIxwkh8N49U
	1e7jrA143HceHngCr1343oiOGOGzYkofa7cDxpjcmd43BTFEiJYJmYHdP0izKaTiUC6D6suW3M1
	9KxwUFdM1KJKbiyPGRuyhU8YW+WK3Gw2kjlg41dnTw5NRP4DoM6+XsnDnsxJYApRYtYenp3DY6a
	aliA1qlH1277LAzbrwsmgivCDurkuMlSWQuQlK77ym2oA3xuGsJcXXOR0Plxexhmy6BTbjWm1VQ
	ytf8P1/4FmRoh9m/TmrhkIdR+1JhN3mltlkClkFaeqLht0+usvZ4GfAmpsjZiCR8el+/QV2SnqX
	84YImHwAhkIFAc=
X-Received: by 2002:a05:600c:4513:b0:480:3b26:82c3 with SMTP id 5b1f17b1804b1-4830e988d63mr14623075e9.20.1770160314935;
        Tue, 03 Feb 2026 15:11:54 -0800 (PST)
Received: from localhost (2a01cb001331aa00bbac16a227e685e0.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bbac:16a2:27e6:85e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec4fe2fsm6147645e9.3.2026.02.03.15.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 15:11:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 00:11:54 +0100
Message-Id: <DG5PGLYQCG6W.2Y675F7PAIJBL@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2] avahi: Backport fix
 CVE-2025-68276
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260127152944.95922-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260127152944.95922-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 23:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230491

On Tue Jan 27, 2026 at 4:29 PM CET, adarsh.jagadish.kamini via lists.openem=
bedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/avahi/avah=
i/pull/806/commits/0c013e2e819be3bda74cecf48b5f64956cf8a760
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Hello,

As I answered in you v1:
This fix was already sent a few days ealier that yours:
[scarthgap][PATCH 1/2] avahi: patch CVE-2025-68276
https://lists.openembedded.org/g/openembedded-core/message/229929
Unless I missed something important (and in this cas, please signal that
to me), I will proceed with Ankur's patch.

Thanks!

> ---
>  meta/recipes-connectivity/avahi/avahi_0.8.bb  |  1 +
>  .../avahi/files/CVE-2025-68276.patch          | 68 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.=
patch
>
> diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-=
connectivity/avahi/avahi_0.8.bb
> index 7930bd3037..bb20fd17cc 100644
> --- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
> +++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
> @@ -37,6 +37,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/avahi-$=
{PV}.tar.gz \
>             file://CVE-2023-38473.patch \
>             file://CVE-2024-52616.patch \
>             file://CVE-2024-52615.patch \
> +           file://CVE-2025-68276.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/avahi/avahi/releases/"
> diff --git a/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch b=
/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> new file mode 100644
> index 0000000000..b3e11f9597
> --- /dev/null
> +++ b/meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> @@ -0,0 +1,68 @@
> +From d5d18ced67e969d6a5052cacdbd7d4b2c97a1a3f Mon Sep 17 00:00:00 2001
> +From: Evgeny Vereshchagin <evvers@ya.ru>
> +Date: Wed, 17 Dec 2025 08:11:23 +0000
> +Subject: [PATCH] core: refuse to create wide-area record browsers when
> + wide-area is off
> +
> +It fixes a bug where it was possible for unprivileged local users to
> +crash avahi-daemon (with wide-area disabled) by creating record browsers
> +with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by callin=
g
> +the RecordBrowserNew method directly or by creating hostname/address/ser=
vice
> +resolvers/browsers that create those browsers internally themselves).
> +
> +```
> +$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --met=
hod org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
> +Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient=
 disconnected from message bus without replying
> +```
> +```
> +dbus-protocol.c: interface=3Dorg.freedesktop.Avahi.Server, path=3D/, mem=
ber=3DResolveHostName
> +avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e'=
 failed.
> +=3D=3D307948=3D=3D
> +=3D=3D307948=3D=3D Process terminating with default action of signal 6 (=
SIGABRT)
> +=3D=3D307948=3D=3D    at 0x4B3630C: __pthread_kill_implementation (pthre=
ad_kill.c:44)
> +=3D=3D307948=3D=3D    by 0x4ADF921: raise (raise.c:26)
> +=3D=3D307948=3D=3D    by 0x4AC74AB: abort (abort.c:77)
> +=3D=3D307948=3D=3D    by 0x4AC741F: __assert_fail_base.cold (assert.c:11=
8)
> +=3D=3D307948=3D=3D    by 0x48D8B85: avahi_wide_area_scan_cache (wide-are=
a.c:725)
> +=3D=3D307948=3D=3D    by 0x48C8953: lookup_scan_cache (browse.c:351)
> +=3D=3D307948=3D=3D    by 0x48C8B1B: lookup_go (browse.c:386)
> +=3D=3D307948=3D=3D    by 0x48C9148: defer_callback (browse.c:516)
> +=3D=3D307948=3D=3D    by 0x48AEA0E: expiration_event (timeeventq.c:94)
> +=3D=3D307948=3D=3D    by 0x489D3AE: timeout_callback (simple-watch.c:447=
)
> +=3D=3D307948=3D=3D    by 0x489D787: avahi_simple_poll_dispatch (simple-w=
atch.c:563)
> +=3D=3D307948=3D=3D    by 0x489D91E: avahi_simple_poll_iterate (simple-wa=
tch.c:605)
> +=3D=3D307948=3D=3D
> +```
> +
> +wide-area has been disabled by default since
> +9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
> +
> +https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
> +
> +CVE: CVE-2025-68276
> +Upstream-Status: Backport [https://github.com/avahi/avahi/pull/806/commi=
ts/0c013e2e819be3bda74cecf48b5f64956cf8a760]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + avahi-core/browse.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/avahi-core/browse.c b/avahi-core/browse.c
> +index e8a915e..59d53cb 100644
> +--- a/avahi-core/browse.c
> ++++ b/avahi-core/browse.c
> +@@ -541,6 +541,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare=
(
> +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, A=
VAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FL=
AGS);
> +     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE=
_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLA=
GS);
> +=20
> ++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_look=
up_engine) {
> ++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
> ++        return NULL;
> ++    }
> ++
> +     if (!(b =3D avahi_new(AvahiSRecordBrowser, 1))) {
> +         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
> +         return NULL;
> +--=20
> +2.34.1
> +


--=20
Yoann Congal
Smile ECS


