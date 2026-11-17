Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14408.1794909027480500119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 01:50:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=heM0hdun;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Hv4wofWH;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 749651400113
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 04:50:26 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 17 Nov 2026 04:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794909026;
	 x=1794995426; bh=MOBYj2n/Oj+8qMI9RFU6Zqi9N+v/m1gbkT4JCZHxuxU=; b=
	heM0hdunEU/RwLy+eUtAh6SpJRJIwUp9uibefFhcZrrbcESxqxEMO9qLkE2yfOtr
	ZUvt7qf9w1UyYqq/RxmOa1hGThr66cf9YlT9qlrg6/Rbjo5iGQCv0G3DKTGlBZlS
	tMYYV1VOjFIX6gV5MdcSXII/VtkTN1VO3Xw5MKu/wEPz5UXCz/uJbv9HdpD5D4fA
	GemlH6Qh3zGPK56TnxV0Z/U/dnCFNppPUkUMs8VJedn5U+dP7Wqwrd6Ik+bz1GbQ
	pbQamAGRqLZxcMap5Is5guV8LO29B4qRmZuAAFul1q7oTdrsVjuC0dXZSKNJoway
	SOmHIX8KLVj9rkgnSC2nEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794909026; x=1794995426; bh=M
	OBYj2n/Oj+8qMI9RFU6Zqi9N+v/m1gbkT4JCZHxuxU=; b=Hv4wofWHiPnEuugBU
	yf+rrDEemnaJl6n8wvCv4uITaJ+mXIEhqbB/fpRS304NIk5cV4CkTUcf2OsyFE8n
	mChCwD9u49Hn3Mnq1UVtiwQdBxDsViVE4agbcandDLkX1D3Uy6MWVnuxbxztD4p5
	Hl+sGXgFRJfs4GQ9Pal1WzFJ8WAyT/314coO38eukSO4iyAojl8YZ791OK4HaLVT
	xpmQx7zdTt7k4YwA99Y6TdqdZqK2SZmBvWb2lStDQdsjGXhn18kn73670gE34cTg
	9K4+uKuAIjxddcK4PIYUaJcxnZiDvoc7Po7hKzWuLWQX4F4s83GfBqB1INBGejlW
	N0ylQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794909026; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:F9Pgd/uu9674qLGYpPFkHcjriOwZAeZ3FUPyShDxBRWKOBN
	l9h2AoXembq/ezmOFUv96MG6zOrhqjPT+6V5Skf7EKM+5qh2IgQaFatA2CdOxGGC
	BvNB/hqdYqt7OJ6JwgDpcdJDSdgleIvuzFjLz8GHl/raAq0rSRPhqI8w60ApOfuw
	rTAjYxD4RR/v1VsxJp49xCExbQVprQ/7WTuVrGQqpT7UK/voLHRvtHjXv9eb8F3y
	XMv5Stm3DV7ZDlOExHYMUWYtwMkNi7RHOcNzXgY3zWsVqWlrhCthtFSsJL4sTIvX
	Vh4Lb7Y904Puw/R5yCdtC0/cEDww0Ali2eKlsOQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:CGKETrpnUkHBcwvU2yIC3XpSV8wJBnZ0HsFGoBcSRjI=:EqbnDzhkgTEj68fN72GC/ZKWdODp7PXSnWqwISiFCtI=;
X-ME-Sender: <xms:YiP8akjNSdAmmJZCFwXEA8Sp-mehGw2kN02lMG9su_QDeApegdMtTA>
    <xme:YiP8akcPDV7ruoVedJS_WiILogVUKOugV0zjyXk35CpB6_7LRoE5dq64w_Fol9GZp
    4pIzvyQBjDcEgSrHcQ5URWlxGw4ycxCnBNqdhYdWqgiFzghRrfXfNg>
X-ME-Received: <xmr:YiP8apdTO6O_ISwyIJq_K6IujsBVS9L1cPU7SAaq96j_EXiFnqkO2wVgJdS5MyKR6brDBlO-B0UEgrzj7nY7Hn3_clxf>
X-ME-Proxy-Cause: dmFkZTE4ZbGzuDbdPlcWs5aXgXD80cnroNJN1McX+2tcEx2P/LWwU6i3qRBrrzSMm+X+mj
    svMN8LzJLLn8k+sWgzijwUlnnFThznmmNnYEGpl6djYoqh717oyfmmAPhD+0jMu0gQowdZ
    VvNA/t8B8MDCDpcaOwnkTdHYsAJIFXr4Zt7SjMfkrCAyP3PT7QDl7mI/JYph71zuDlpPsa
    I9neuQcoHsCS6KlS5mA0a1eky36BYgNnuY0It+FLz744d8twMLNqenj6gH/PAeADBW4dPN
    oqkEyWt1i0O9gO9aqjnMj34l+L+6N1YejBcZruzKotPytpyoAVS8IbqFFdC7IuoWwsKuGN
    n57gxwRRgV+AVqOCkdPHEvhLJALFDyvPuV1u5KIOGR1UcVZYjQBGRO57wxbcJcOpwwXMwG
    lmU6uW6C/Nc2cjdt/4zHTwhe5mj62jZgMNMBidU5baoA8CjSlG26sASNtWylwwOXBKRL44
    qW8nxgJhTkDlDy+w/lLAqYM7NU7KWJZExUbXuFHfiJNZ9OlZJdVK8TErB46t41OaotkFbu
    lN2DTM84m+ka09PLoITK12A5BcxbsDVVqZ15JS/XYUANzFpn4g5sBoHovNvygclDihri20
    raUbfURm7HWNWKAqdGQwWsLRLGMtsgv/5ffIhK3nYCt+rFbV4Sa+gYtMZYng
X-ME-Proxy: <xmx:YiP8au_EWrez-VKImtNoQ_mmDo7WzHlqC42nm5clbjPTwKM4Tn2nsg>
    <xmx:YiP8alkPStc4Gf_HN3v7qL_bvywPMpZPSYR9Kw3gus7-nfF7-8oi_w>
    <xmx:YiP8ag8A8JKuJ4Y9eVu-6Y7U3Z28jTCkF9EMy8F0HZLc5r-eABCyRQ>
    <xmx:YiP8ajmK5K3uPMnCiJIBGJfGDY-0ebhXwgQ_tDQhYkuAoxcacxYY_A>
    <xmx:YiP8aqT5mknN3SiEKUUGcYlL9DpKqHGLxh5bj-ny6L7l7f4KAuTsKy2N>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 04:50:25 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 09:50:24 +0000
Message-Id: <DMXE5AL1MFRL.SJ70FR1E8XH2@pbarker.dev>
Subject: Re: [OE-core][wrynose][PATCH v2 2/5] curl: fix CVE-2026-11564
From: "Paul Barker" <paul@pbarker.dev>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Darsh Kelaiya -X (dkelaiya - E
 INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261023093331.1886272-1-dkelaiya@cisco.com>
 <20261023093331.1886272-3-dkelaiya@cisco.com>
 <DMWR7AJXCNJ1.105TD3KM0QL29@smile.fr>
In-Reply-To: <DMWR7AJXCNJ1.105TD3KM0QL29@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 09:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250416

Hi Darsh,

I'm following up on what Yoann has already said and adding some comments
of my own here.

On Mon Nov 16, 2026 at 3:51 PM GMT, Yoann Congal wrote:
> On Fri Oct 23, 2026 at 11:33 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFO=
CHIPS PRIVATE LIMITED at Cisco) wrote:
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>
>> This patch applies the upstream fix as referenced in [2],
>> using the commit shown in [1].
>>
>> Retain the curl 8.19.0 option-completion API and existing opt-in
>> automatic client certificate behavior. Reset native CA options per
>> transfer without adding the newer initial-origin restriction.
>>
>> [1] https://github.com/curl/curl/commit/d69bfad3fa3daf5e72331f6870667607=
828d5891
>> [2] https://curl.se/docs/CVE-2026-11564.html
>>
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> Changes in v2:
>> - Clarify that Schannel selection remains opt-in and disabled by
>>   default, preserving the existing CURLSSLOPT_AUTO_CLIENT_CERT flag.
>> - Document the per-transfer native-CA reset and omitted newer
>>   initial-origin restriction. Schannel redirect behavior has not been
>>   runtime tested.
>> ---
>>  .../curl/curl/CVE-2026-11564.patch            | 139 ++++++++++++++++++
>>  meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
>>  2 files changed, 140 insertions(+)
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11564.patch
>>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-11564.patch b/meta/=
recipes-support/curl/curl/CVE-2026-11564.patch
>> new file mode 100644
>> index 0000000000..86f0181630
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-11564.patch
>> @@ -0,0 +1,139 @@
>> +From d69bfad3fa3daf5e72331f6870667607828d5891 Mon Sep 17 00:00:00 2001
>> +From: Stefan Eissing <stefan@eissing.org>
>> +Date: Mon, 8 Jun 2026 10:11:30 +0200
>> +Subject: [PATCH] ssl native_ca_store: always reinit
>> +
>> +Add bit `native_ca_store_opt` to keep the setting of
>> +CURLOPT_(PROXY_)SSL_OPTIONS and use that to calculate every easy
>> +transfer if a native CA store shall be used or not.
>> +
>> +This avoids `native_ca_store` getting stuck on TRUE after being set
>> +once.
>> +
>> +Closes #21902
>> +
>> +CVE: CVE-2026-11564
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/d69bfad3=
fa3daf5e72331f6870667607828d5891]
>> +
>> +Backport Changes:
>> +- Applied the option-completion helper to lib/vtls/vtls.c because curl
>> +  8.19.0 does not have lib/vtls/vtls_config.c.

The vtls_config.c file was added by the commit you link to below. It's
commit message is:

    When a transfer goes against another origin than the initial one, do no=
t
    add the following to the ssl configuration: client cert, client key, sr=
p
    user/pass, pinned key.

That seems like a fix worth having. The diff is large, but hopefully
most of it is moving code around rather than fully re-writing it.

If that commit is backported as well, does the upstream patch for this
CVE apply cleanly?

>> +- Kept auto_client_cert derived from CURLSSLOPT_AUTO_CLIENT_CERT, as
>> +  in the old set_ssl_options(). This preserves the existing Schannel
>> +  opt-in behavior; automatic selection remains disabled by default.
>> +- Omitted the initial-origin restriction from the newer origin-aware
>> +  configuration, introduced by [1].
>> +  Curl 8.19.0 has no equivalent origin state. This backport resets
>> +  native CA options per transfer without adding that restriction.

How has this been tested? Have you confirmed that this still resolves
the vulnerability?

Some judgement needs to be exercised when making changes to upstream
security patches as part of the backporting process. You need to explain
and justify the decisions, not just rely on the stable maintainer to
figure it out.

A simple change doesn't need much explanation, but one that may affect
the security properties does. "Simple" in this case doesn't mean small.

>> +
>> +[1] https://github.com/curl/curl/commit/d3391229b0a0eb04f1ffe85f1483a89=
0c5e00009
>> +
>> +(cherry picked from commit d69bfad3fa3daf5e72331f6870667607828d5891)
>> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> +---
>> + lib/doh.c       |  3 ++-
>> + lib/setopt.c    | 20 ++------------------
>> + lib/vtls/vtls.c | 21 +++++++++++++++++++++
>> + 3 files changed, 25 insertions(+), 19 deletions(-)
>> +
>> +diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
>> +index 6dcc67d..35cb4f0 100644
>> +--- a/lib/vtls/vtls.c
>> ++++ b/lib/vtls/vtls.c
>> +@@ -306,6 +306,22 @@ static void free_primary_ssl_config(struct ssl_pri=
mary_config *sslc)
>> + #endif
>> + }
>> +=20
>> ++static void ssl_easy_config_compl_options(struct ssl_config_data *sslc=
)
>> ++{
>> ++  uint8_t options =3D sslc->primary.ssl_options;
>> ++  /* If set via CURLOPT_(PROXY_)SSL_OPTIONS, we definitely use it.
>> ++   * If not, we switch it on for supported backends if no custom
>> ++   * ca settings exist. */
>> ++  sslc->native_ca_store =3D !!(options & CURLSSLOPT_NATIVE_CA);
>> ++  sslc->enable_beast =3D !!(options & CURLSSLOPT_ALLOW_BEAST);
>> ++  sslc->no_partialchain =3D !!(options & CURLSSLOPT_NO_PARTIALCHAIN);
>> ++  sslc->no_revoke =3D !!(options & CURLSSLOPT_NO_REVOKE);
>> ++  sslc->revoke_best_effort =3D !!(options & CURLSSLOPT_REVOKE_BEST_EFF=
ORT);
>> ++  sslc->earlydata =3D !!(options & CURLSSLOPT_EARLYDATA);
>> ++
>> ++  sslc->auto_client_cert =3D !!(options & CURLSSLOPT_AUTO_CLIENT_CERT)=
;
>
> I'm sorry, I'm still not conviced that this change from upstream patch
> is safe:
> -+  sslc->auto_client_cert =3D Curl_peer_equal(origin, initial_origin) &&
> -+                           !!(options & CURLSSLOPT_AUTO_CLIENT_CERT);
> ++  sslc->auto_client_cert =3D !!(options & CURLSSLOPT_AUTO_CLIENT_CERT);
>
> The fact that the function is not available is not reason enough to just
> omit the call. If the function is simple, maybe inline it?
>
>> ++}
>> ++
>> + CURLcode Curl_ssl_easy_config_complete(struct Curl_easy *data)
>> + {
>> +   struct ssl_config_data *sslc =3D &data->set.ssl;

Best regards,

--=20
Paul Barker

