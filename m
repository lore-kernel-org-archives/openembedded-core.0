Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB65C001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:50:14 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.18287.1690908610318388495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BwQUSDdE;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6873a30d02eso1735909b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690908610; x=1691513410;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IhHiKmoA4w6a0XKD1gXPIryQWquZmM4/VM5LsU5/lKc=;
        b=BwQUSDdEIBBd+GgJ9pcobovG47AeKRk8imK9/wNM6UrLCRlfGxDoy5DTpndccBlkkM
         etqI+Yk2/uzfw/wUnjFiQI7nY/B+sy0buJbNekGn3NER5lX1rrJVG5Yss1hVdnRwV2H3
         5dOUt5h05UOgatlF0fHeT6m0nYslXUIzchS66yUwWDRnFKnUqh/FgvJJ0UAz7LFbt9TW
         Y4bYzpSFm+cziicx2H8LhO0JZw/+VWk99jKSkYih6h2YGWTg+XbZNR3hUZnSEMfo0cau
         XPkQAwm2fUoNXHv6MevQ6uHC73LBB2eJHrTUVwWbkF26JKl0tirARaWGwI/eYMDFXTjl
         RYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690908610; x=1691513410;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhHiKmoA4w6a0XKD1gXPIryQWquZmM4/VM5LsU5/lKc=;
        b=HryWUYMxTaZjEXAFEjPNaeHVL8sbZfxuLfOEydzBqo/YgmAsrBbieQuS7RYmLjlQJY
         p+HOB6KZViEFTOCR5RoNIFOiCJGIgiMckL/JF5Kiy95pLUVG05y5KKo5q/57TMsG+2EJ
         xq+ATLVaqhboZgnLlW1Ovs5bHMB40P6ToR+j9PIrnTFSW5EVeuysplbYJouSNdHY7497
         Zsv3VhnxsWMFCgiIHMIIbtz1xBaPYxElPxIAUTkXgg8dCRh/wPzUd+GA+tIskZgFff8Y
         6NWueznEi1KqQgQJSgc9WqcJfAUyiUeUGC0PzTrfm/nlVWgEKVTn/DSk00HVTxM9tJDG
         4z5g==
X-Gm-Message-State: ABy/qLY8qO6RycnItRqCMS17szTZEGiJmFQuN+iEMzpzg42g6L7hgbuZ
	hnfCsVPXJlfZ4XCxXn9Bc84=
X-Google-Smtp-Source: APBJJlGtBGpFz8vCpEHfCxlP4yz7o+Js23E5ojYAn8WjVpKlTuBAbQA0dmZeswtYOEqnqNeVUjilxA==
X-Received: by 2002:a05:6a00:22c7:b0:64c:c5f9:1533 with SMTP id f7-20020a056a0022c700b0064cc5f91533mr16121009pfj.33.1690908609503;
        Tue, 01 Aug 2023 09:50:09 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:a8ac:b08b:b4b5:993b? ([2601:646:9100:2cb0:a8ac:b08b:b4b5:993b])
        by smtp.gmail.com with ESMTPSA id b9-20020aa78109000000b0064378c52398sm9543611pfi.25.2023.08.01.09.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 09:50:08 -0700 (PDT)
Message-ID: <b4ccc207-16f9-9c70-95f8-9368effa8603@gmail.com>
Date: Tue, 1 Aug 2023 09:50:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][PATCH] alsa-lib: Add ptest
To: Poonam Jadhav <ppjadhav456@gmail.com>,
 openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
References: <20230801133833.96667-1-ppjadhav456@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
 Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
 miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
 /1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
 4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
 ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
 jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
 6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
 PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQoAIAIbAwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
 BQJTBC0aAAoJELsFM1WRnTMUul4An282FaN7oYXM2A8JzQt1ZWeUTlJZAJ0eOgup2Eqxx6gZ
 FOQE7EkRmOb6iM7DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
 DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
 2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
 I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
 RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
 6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
 584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
 HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
 KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
 seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
 3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
 9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
 EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
 X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
 3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
 jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
 UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
 mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
 suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
 XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
 VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
In-Reply-To: <20230801133833.96667-1-ppjadhav456@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y8T6Qfl08DlDdxu1ezatJ1oT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185359

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y8T6Qfl08DlDdxu1ezatJ1oT
Content-Type: multipart/mixed; boundary="------------fppNhuvey0g6yWBb7V3frswZ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Poonam Jadhav <ppjadhav456@gmail.com>,
 openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Message-ID: <b4ccc207-16f9-9c70-95f8-9368effa8603@gmail.com>
Subject: Re: [OE-core][master][PATCH] alsa-lib: Add ptest
References: <20230801133833.96667-1-ppjadhav456@gmail.com>
In-Reply-To: <20230801133833.96667-1-ppjadhav456@gmail.com>

--------------fppNhuvey0g6yWBb7V3frswZ
Content-Type: multipart/mixed; boundary="------------Q8Xe10p0W1QL703U7d3LnSW2"

--------------Q8Xe10p0W1QL703U7d3LnSW2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8xLzIzIDY6MzggQU0sIFBvb25hbSBKYWRoYXYgd3JvdGU6DQo+IEZyb206IFBvb25h
bSBKYWRoYXYgPHBvb25hbS5qYWRoYXZAa3BpdC5jb20+DQo+IA0KPiBBbHNhLWxpYiBpcyBh
IHVzZXIgc3BhY2UgbGlicmFyeSB0aGF0IHByb3ZpZGVzIGF1ZGlvDQo+IGFuZCBNSURJIGZ1
bmN0aW9uYWxpdHkgYXBpcyBmb3Igc2ltcGxpZnlpbmcgYXBwbGljYXRpb24NCj4gcHJvZ3Jh
bW1pbmcgYW5kIHByb3ZpZGUgaGlnaGVyIGxldmVsIGZ1bmN0aW9uYWxpdHkNCj4gDQo+IHB0
ZXN0IGV4ZWN1dGVzIGJlbG93IGJpbmFyaWVzIG9uIHRhcmdldDoNCj4gMS5jb25maWcNCj4g
Mi5jb250cm9sDQo+IDMuY2xpZW50X2V2ZW50X2ZpbHRlcg0KPiA0Lm1pZGlfZXZlbnQNCj4g
NS5uYW1laGludA0KPiANCj4gU2lnbmVkLW9mZi1ieTogUG9vbmFtIEphZGhhdiA8cG9vbmFt
LmphZGhhdkBrcGl0LmNvbT4NCj4gLS0tDQo+ICAgLi4uL2Rpc3Ryby9pbmNsdWRlL3B0ZXN0
LXBhY2thZ2VsaXN0cy5pbmMgICAgIHwgIDEgKw0KPiAgIC4uLi9hbHNhL2Fsc2EtbGliL3J1
bi1wdGVzdCAgICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKw0KPiAgIC4uLi9y
ZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNhLWxpYl8xLjIuOS5iYiB8IDIyICsrKysrKysr
KysrKysrKysrLS0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2Fsc2EvYWxzYS1saWIvcnVuLXB0ZXN0DQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0
YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3B0ZXN0LXBhY2thZ2VsaXN0cy5pbmMgYi9tZXRhL2Nv
bmYvZGlzdHJvL2luY2x1ZGUvcHRlc3QtcGFja2FnZWxpc3RzLmluYw0KPiBpbmRleCA2MjUw
Y2YwODFlLi45OWYwOTEzMmFlIDEwMDY0NA0KPiAtLS0gYS9tZXRhL2NvbmYvZGlzdHJvL2lu
Y2x1ZGUvcHRlc3QtcGFja2FnZWxpc3RzLmluYw0KPiArKysgYi9tZXRhL2NvbmYvZGlzdHJv
L2luY2x1ZGUvcHRlc3QtcGFja2FnZWxpc3RzLmluYw0KPiBAQCAtNSw2ICs1LDcgQEANCj4g
ICAjDQo+ICAgUFRFU1RTX0ZBU1QgPSAiXA0KPiAgICAgICBhY2wgXA0KPiArICAgIGFsc2Et
bGliIFwNCj4gICAgICAgYXByLXV0aWwgXA0KPiAgICAgICBhdHRyIFwNCj4gICAgICAgYmFi
ZWx0cmFjZSBcDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNh
L2Fsc2EtbGliL3J1bi1wdGVzdCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxz
YS1saWIvcnVuLXB0ZXN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAw
MDAwMDAuLjhmYmY5ZjE0MGENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliL3J1bi1wdGVzdA0KPiBAQCAtMCwwICsxLDE0
IEBADQo+ICsjIS9iaW4vc2gNCj4gK3NldCAtZXV4DQo+ICsNCj4gK2ZvciB0IGluIGNvbmZp
ZyBjb250cm9sIG1pZGlfZXZlbnQgY2xpZW50X2V2ZW50X2ZpbHRlciBjbGllbnRfZXZlbnRf
ZmlsdGVyDQoNCkl0IHdpbGwgYmUgZ29vZCB0byBkZXJpdmUgdGhpcyBsaXN0IGZyb20gdGhl
IHNvdXJjZXMgc28gaXQgcmVtYWlucyBpbiANCnN5bmMgd2l0aCBmdXR1cmUgYWRkaXRpb25z
L2RlbGV0aW9ucy4NCg0KPiArZG8NCj4gKyAgICBpZiAiLi8kdCIgPiAiYWxzYS1saWJfJHQu
bG9nIiAyPiYxDQo+ICsgICAgdGhlbg0KPiArICAgICAgICBlY2hvICJQQVNTOiAkdCINCj4g
KyAgICBlbHNlDQo+ICsgICAgICAgIGVjaG8gIkZBSUw6ICR0Ig0KPiArICAgICAgICBjYXQg
ImFsc2EtbGliXyR0LmxvZyINCj4gKyAgICBmaQ0KPiArICAgIHJtICJhbHNhLWxpYl8kdC5s
b2ciDQo+ICtkb25lDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9h
bHNhL2Fsc2EtbGliXzEuMi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9h
bHNhLWxpYl8xLjIuOS5iYg0KPiBpbmRleCBkNDgyZTI3NjgzLi44ZGNkN2M0NDQ4IDEwMDY0
NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtbGliXzEuMi45
LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS1saWJfMS4y
LjkuYmINCj4gQEAgLTksMTAgKzksMTIgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
Q09QWUlORzttZDU9YTkxNjQ2N2I5MTA3NmU2MzFkZDhlZGI3NDI0NzY5YzcgXA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9zb2NrZXQuYzttZDU9Mjg1Njc1YjQ1ZTgz
ZjU3MWM2YTk1N2ZlNGFiNzljOTM7YmVnaW5saW5lPTk7ZW5kbGluZT0yNCBcDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAiDQo+ICAgDQo+IC1TUkNfVVJJID0gImh0dHBzOi8vd3d3LmFs
c2EtcHJvamVjdC5vcmcvZmlsZXMvcHViL2xpYi8ke0JQfS50YXIuYnoyIg0KPiArU1JDX1VS
SSA9ICJodHRwczovL3d3dy5hbHNhLXByb2plY3Qub3JnL2ZpbGVzL3B1Yi9saWIvJHtCUH0u
dGFyLmJ6MiBcDQo+ICsgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXA0KPiArICAgICAg
ICAgICINCj4gICBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZGM5YzY0M2ZkYzRjY2ZkMDU3MmNj
Njg1ODU4ZGQ0MWUwOGFmYjU4M2YzMDQ2MGIzMTdlNDE4ODI3NWY2MTViMiINCj4gICANCj4g
LWluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZpZw0KPiAraW5oZXJpdCBhdXRvdG9vbHMgcGtn
Y29uZmlnIHB0ZXN0DQo+ICAgDQo+ICAgRVhUUkFfT0VDT05GICs9ICIgXA0KPiAgICAgICAk
e0BiYi51dGlscy5jb250YWlucygnVEFSR0VUX0ZQVScsICdzb2Z0JywgJy0td2l0aC1zb2Z0
ZmxvYXQnLCAnJywgZCl9IFwNCj4gQEAgLTQyLDMgKzQ0LDE5IEBAIFJSRVBMQUNFUzphbHNh
LWNvbmYgPSAiYWxzYS1jb25mLWJhc2UiDQo+ICAgUkNPTkZMSUNUUzphbHNhLWNvbmYgPSAi
YWxzYS1jb25mLWJhc2UiDQo+ICAgDQo+ICAgQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0
aXZlc2RrIg0KPiArDQo+ICtkb19jb21waWxlOmFwcGVuZCgpIHsNCj4gKyAgICAke0NDfSAk
e0NGTEFHU30gJHtMREZMQUdTfSAiJHtTfS90ZXN0L2xzYi9jb25maWcuYyIgLUkgIiR7U30v
aW5jbHVkZSIgLUwgIiR7Qn0vc3JjLy5saWJzLyIgLWxhc291bmQgLW8gY29uZmlnDQo+ICsg
ICAgJHtDQ30gJHtDRkxBR1N9ICR7TERGTEFHU30gIiR7U30vdGVzdC9jb250cm9sLmMiIC1J
ICIke1N9L2luY2x1ZGUiIC1MICIke0J9L3NyYy8ubGlicy8iIC1sYXNvdW5kIC1vIGNvbnRy
b2wNCj4gKyAgICAke0NDfSAke0NGTEFHU30gJHtMREZMQUdTfSAiJHtTfS90ZXN0L2NsaWVu
dF9ldmVudCJfZmlsdGVyLmMgLUkgIiR7U30vaW5jbHVkZSIgLUwgIiR7Qn0vc3JjLy5saWJz
LyIgLWxhc291bmQgLW8gY2xpZW50X2V2ZW50X2ZpbHRlcg0KPiArICAgICR7Q0N9ICR7Q0ZM
QUdTfSAke0xERkxBR1N9ICIke1N9L3Rlc3QvbmFtZWhpbnQuYyIgLUkgIiR7U30vaW5jbHVk
ZSIgLUwgIiR7Qn0vc3JjLy5saWJzLyIgLWxhc291bmQgLW8gbmFtZWhpbnQNCj4gKyAgICAk
e0NDfSAke0NGTEFHU30gJHtMREZMQUdTfSAiJHtTfS90ZXN0L2xzYi9taWRpX2V2ZW50LmMi
IC1JICIke1N9L2luY2x1ZGUiIC1MICIke0J9L3NyYy8ubGlicy8iIC1sYXNvdW5kIC1vIG1p
ZGlfZXZlbnQNCj4gK30NCj4gKw0KPiArZG9faW5zdGFsbF9wdGVzdDphcHBlbmQoKSB7DQo+
ICsgICAgaW5zdGFsbCAtbSAwNzU1ICIke0J9L2NvbmZpZyIgIiR7RH0ke1BURVNUX1BBVEh9
Ig0KPiArICAgIGluc3RhbGwgLW0gMDc1NSAiJHtCfS9jb250cm9sIiAiJHtEfSR7UFRFU1Rf
UEFUSH0iDQo+ICsgICAgaW5zdGFsbCAtbSAwNzU1ICIke0J9L2NsaWVudF9ldmVudF9maWx0
ZXIiICIke0R9JHtQVEVTVF9QQVRIfSINCj4gKyAgICBpbnN0YWxsIC1tIDA3NTUgIiR7Qn0v
bWlkaV9ldmVudCIgIiR7RH0ke1BURVNUX1BBVEh9Ig0KPiArICAgIGluc3RhbGwgLW0gMDc1
NSAiJHtCfS9uYW1laGludCIgIiR7RH0ke1BURVNUX1BBVEh9Ig0KPiArfQ0KPiANCj4gDQo+
IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMx
ODUyNDYpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzE4NTI0Ng0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9tdC8xMDA0ODM3NTMvMTk5NzkxNA0KPiBHcm91cCBPd25lcjog
b3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gDQo=
--------------Q8Xe10p0W1QL703U7d3LnSW2
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnm
DLpLSdfvZw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8
itwOoVR41DOBkftVmiO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXP
WndN1Ka4M/hzt7g+FmeyEssD/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e
1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/B
h0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuKER4Y8ycTq3gbIGJtVrIJjWPC
zWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6QjnIlzzcuMvRdZn2I
rnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN6g3vSlrR
JqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQII
AwQWAgMBAh4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0g
AJ9wRt36PqfjNe904evWolFf5cMmp8JgBBMRCgAgAhsDBgsJCAcDAgQVAggDBBYC
AwECHgECF4AFAlMELRoACgkQuwUzVZGdMxS6XgCfbzYVo3uhhczYDwnNC3VlZ5RO
UlkAnR46C6nYSrHHqBkU5ATsSRGY5vqIzsNNBEqXaJEQEACONtVDnlECi4B7SXSc
+wqRZ20y5QfAF0sGSkXesYz9/S4OU9pDNgYuMpPvEOjJGHzHa0XBa85+KqtkUCvF
fx7h+wAKYl0vSRqFNvEL/xKZJZUdeLXQlRfZ+Znm5/OVcCeXSK9eRaetR8tf0N03
AvoNHgN4Ur2oEWq0eYrlNBcy7zsb4wnCA0kjAIpBfiIj1gkgsy6oidXBrGDn8At0
p8TdA+a1p2cpv9y5SbiAgJ1ol7JB8jqp1gtxK7IFYJsAQwzXCaFECHDlGDMxFEiq
5mXE+3uVmRdeNqWzszqO6HztUZGggnBihCL3tDVkfM8GjcCUw97eFo2KGR3oPeXC
90HimaNgbgjpscKC0SESyzeEe+wFqpX2NXV0xRKz3lnFC1P2q2Q7HJ0eA6XBFfcI
b6vnzgn+zi9ab6I9C0u8NjW7hQXA4uMI4V7vT0Fwsl09HYZCI4+jJkXuVVjye792
1OsAS6JkWTgcPtp9SVyv8grA9YgPVX2REugOXN1s26hTL9d9USsrzByiIajB6sQx
53hqM2grELEHB4iSPGooy3wIqCnfSf1TGWOCURyB/79S6bBIfGplwI9VtZe12HL+
HAyTbuyE51S9qLKd6nw6xUaoDNKx4vipkgnlfMJzJXgokKbCZ1DO3n5nKVxWZ6rp
Hihv53wkgNTQQup3DHAgOJOPRwADBQ/+Kc3f+vwgUOaziDnFp8+sLDfWjaMhhqGQ
h83RZU9Yjkr+EUKjY9zM9K3MNxOxnHuY3arCkY57cvP3/SStl6SyvPVkgc2LktNq
y7NfIUls7Tlj56IeBXWtXtVUSKk6ulXXj3rDXXZj/RJn8WE58SYQDVN4N6PLaxmJ
M5RbiDLN7BscykTTt3bsXaozY18wyEpAJy/Ov43RUmYA54BMSK/E9Qef4Olf82eI
FY5xa/77AeXG/RevreCxEpK3rZ4UoaOAXnSEcPmUzfXOKrJxzjaxuByoBn6tgWVv
2TTclwrKrVd1VRKb7FwLYMxKy1MjqKoUwajoWcQ76DITlV1x5qNu5nUY6YlclQLJ
gh0a68LIigqNMT2VwhhIQQNlB6PnF2IaT15TPQw+ZkRTBJH+cuabCMcMmLSmtW+z
3Gp7lu9Ld108Cp6m9nlSuKyC1YP5MMjyS2S3lUuHdewb0W5dRUBpqE68UwaJm2yK
gNdOisvgB8x64D1/7IvCsJVA7fGYf9YDROB//mBgHe30qgc+MsE2u5U65BsCO5uL
Sm9EA5Rwx0F+Y+h+Swri5ZLXMa09ZLtS7Vyy6rsedvu+zOUVh1vN6qNjzUtLLEDS
RymAnF0u/2jtS4ISccNks9sd1Dzc+bLIEpIjfUAp7tFeVA2UHmCvAf2jq4209tXu
r+5GqYqrkSLCSQQYEQIACQUCSpdokQIbDAAKCRC7BTNVkZ0zFHVUAJ9IDpNFYVZL
U2T1aHmEmAcFBe5D5wCbBVUufOp45pebD9wGNMgoKf5XVr/CSQQYEQIACQUCSpdo
kQIbDAAKCRC7BTNVkZ0zFHVUAJwKR1o7etvz+BGmuV2YAfp5Hj16jgCeMPeHdpPC
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------Q8Xe10p0W1QL703U7d3LnSW2--

--------------fppNhuvey0g6yWBb7V3frswZ--

--------------y8T6Qfl08DlDdxu1ezatJ1oT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZMk3vwUDAAAAAAAKCRC7BTNVkZ0zFHTG
AJ9PLE1zx/iyTa5ET8wIBkUSLi/T2wCgilF8UEii+T7y04hXfUYjbk+nNoQ=
=cv2i
-----END PGP SIGNATURE-----

--------------y8T6Qfl08DlDdxu1ezatJ1oT--

