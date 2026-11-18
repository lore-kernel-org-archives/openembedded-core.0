Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10016.1794999260783420186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 02:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=afzAvMER;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: bastien.jauny@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so8527675e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 02:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794999259; x=1795604059; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qxw6WGNkJpo51l8W+ThRCd9P9kMvaGB/CPS+4vx1PRA=;
        b=afzAvMERZrdf5dc1ApcVgfo2IF7U5CkiM+BgPw/3xujPhuhoFXh7ld84o2UyQ+jKvr
         t5mHwW1inHDyVdEDfdl8uhdKOZAoEw8My85NT0ScNV3zGKn855Glrx4UdxmjtXtqvcyr
         8w/g7CSM1EIdU3SjnA73GjaBK5uhVMjfkhnOLyopiGQaMXvu51i5QQEC7YsLH7h+8wTK
         vRsbBKrSMEsoQsUYeqhs8ThAKW5M4IHPhQvB1qyObd9gxdzA+rq1NcIY9C7w1vMZ5YCT
         rzBlya2pour2LYXxtYS/0h0ORymf90CLc6va8usup2mweYk8NkkBAEDStMsDlOG9iEwe
         /wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999259; x=1795604059;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qxw6WGNkJpo51l8W+ThRCd9P9kMvaGB/CPS+4vx1PRA=;
        b=QX9M/kULHR2XURVyDDyzYUjVpnjw0dXe8HNmz1zW/POAw1GXOEDBQTRnTWLzXSZED/
         asdcPIrZzLhigi+xtB8uNSoW8rtilSf8zhu3O0gsHev2XWlyZnwFZFBdG0/T/82Vv0CN
         sAMUCS/TKwhbkycxb+P4xMjHgJPvhT+GBLOwS7X1PzEyZKEMcZDwBjPjQNstjLF4YguM
         FyI4eB+YyH4DNdfR/XlJkmA+Q29zNv1C8+N52dfd5ooUUorDw9RCCXrf4qS2PivzJqAg
         Aa8mt75wkqtykkSJJC00crTMh8Rhyyt9P6U+6xuwyscbCWcWJSxaFs4euBgA+HiQM5b9
         Dm9w==
X-Forwarded-Encrypted: i=1; AL+hErFuxcS6UcZKt0cqvD0ZaCR7yXkgRJEPtWzmg8ttT14QRaJp7IdJPZrI9MPeE/1YhLSSDxZhSUki37DNa7I0vkFrAw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9LsLyC7yyNclKdT+YHiGDBQJlTS4CmPhUXdd2Bqw11BAIansXR
	35bNsW/LO1fkRA2L7ES9YadUDypmko2GqbFfVYdMiQKEm+VWAn719CuMEcjUbdz7Qi0=
X-Gm-Gg: AYBFou2cTeLwhGBCqSmyL//XQNyk+7zEKuPbeGQGVs9D+9MJtML9WIFnzsV51Ml7Cyo
	MBpGZYR5burSEitabT8/jR1/bdOgCplBpwHxtq04P4YygIH5XBpvlgh67z9swEzDbbKzboQ/4PT
	Qfp0AILKSefpZKfpWUL+lfwRUCV5xtXJF10GcRgwJ+LJ5ed2RhgydkOetYv66PJvasTZPsSEvYK
	/0HIcoy5CXZrYGpiCzKHk9hecszIEMknqDihBdDbFX/ojzkHG75+4XUlRpguTGFVPcC4+Dedxh6
	sSHS3ECgXezjCqNvF7R0UH90CDtYQ/zQw9AEKzZRudhvsLX5HpO2p9UXP+ORbVqjNCc5uXFevzO
	EfAZXGLiqEFvZy3s58yLYjZWqzYy6FBeWSIHhCmh3YOVexVTELnc8ERCvc+jzDmTdNkSJCOKPCh
	J7gDWlbLBny+8Ao8kJ5oV9zJLtIoAEmJgOpABA8UfSG1j1zfqdv/mqgerzuOrXdAXzUNhxrZv5e
	cU5J7ZwcRtqWYtTKX6VpFPzJNBOWpkRDHeiE6Bvd1YM7FCSJAT6ttr1qJTpJYbPCvIhDsup2YLe
	wuybg1inQl+t8gbC077uG5VYNtA7I3/pVTKhisE1b/2iPdhtZKH0irfKtoQ5SQ8gJjSbmOZT5ab
	ajtskXnsrHjzMEMQKK5F7n+hRwCpX4rV7kg1M
X-Received: by 2002:a05:600c:310e:b0:4b8:d17e:da27 with SMTP id 5b1f17b1804b1-4bb7da4372dmr41813875e9.27.1794999258871;
        Wed, 18 Nov 2026 02:54:18 -0800 (PST)
Return-Path: <bastien.jauny@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d256f64sm51993595e9.1.2026.11.18.02.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:54:18 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 11:54:17 +0100
Message-Id: <DMYA4R46NAH8.35CZD2IV2F2X9@smile.fr>
From: "Bastien Jauny" <bastien.jauny@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 3/3] curl: set CVE_STATUS for
 CVE-2026-80231
X-Mailer: aerc 0.22.0-38-g09b49b623995
References: <20261104105645.2523473-1-dkelaiya@cisco.com>
 <20261104105645.2523473-4-dkelaiya@cisco.com>
In-Reply-To: <20261104105645.2523473-4-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 10:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250537

On Wed Nov 4, 2026 at 11:56 AM CET, Darsh Kelaiya -X (dkelaiya - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via openembedded-core wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> Analysis:
> - Select the native CA connection-reuse fix in [2], identified by
>   the advisory [1]. It compares the effective native CA setting.
> - The advisory limits the issue to Windows and macOS [1]. Scarthgap
>   builds curl, curl-native and nativesdk-curl for Linux.
> - In curl 8.7.1, native_ca_store is derived from CURLSSLOPT_NATIVE_CA.
>   The same flag is retained in ssl_primary_config.ssl_options,
>   which is cloned and compared for connection reuse.
> - The later implicit native CA selection in [3] is absent from the
>   Scarthgap source. Do not import the Wrynose TLS configuration patch.
> - Hence ignoring the CVE using not-applicable-platform for Linux.
>   Reassess if the SDK platform or native CA configuration changes.
>
> Reference:
> [1] https://curl.se/docs/CVE-2026-80231.html
> [2] https://github.com/curl/curl/commit/7be1e70cb6bcd83e130ecfe8cb91b6a7d=
cdeff42
> [3] https://github.com/curl/curl/commit/eefd03c572996e5de4dec4fe295ad6f10=
3e0eefc
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  meta/recipes-support/curl/curl_8.7.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.7.1.bb
> index 33265f0f25..28d834abb2 100644
> --- a/meta/recipes-support/curl/curl_8.7.1.bb
> +++ b/meta/recipes-support/curl/curl_8.7.1.bb
> @@ -66,6 +66,7 @@ CVE_STATUS[CVE-2026-9547] =3D "not-applicable-config: v=
ulnerable libssh backend is
>  CVE_STATUS[CVE-2026-82209] =3D "not-applicable-config: public suffix lis=
t support is disabled by the recipe with --without-libpsl"
>  CVE_STATUS[CVE-2026-12064] =3D "${@bb.utils.contains('PACKAGECONFIG', 'l=
ibssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabl=
ed in PACKAGECONFIG', d)}"
>  CVE_STATUS[CVE-2026-19931] =3D "${@bb.utils.contains('PACKAGECONFIG', 'k=
rb5 negotiate-auth', 'unpatched', 'not-applicable-config: GSS-API Negotiate=
 is disabled', d)}"
> +CVE_STATUS[CVE-2026-80231] =3D "not-applicable-platform: native CA reuse=
 issue affects Windows and macOS, not Linux"
> =20
>  inherit autotools pkgconfig binconfig multilib_header ptest
> =20

Hi Darsh,

This will need to be addressed upstream first. I see that this CVE is
already discussed in wrynose so we'll put this patch on hold for now.

Thanks,
--=20
Bastien Jauny
Smile

