Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9288.1793359733796715607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=BHaOHEoq;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso6627685e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 04:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793359732; x=1793964532; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIT4EIUWM1dJ9SYimM0hDCMuoN2gKWKz/aIvstZIqwA=;
        b=BHaOHEoqcARLQabAsTPsdUrDNqnxrtssFnsVOb2uf2CemWKnycPcaYhEQN1MqyCvb3
         qA3chDdYBakudnPSQnrIM8dr0PRrPJyHFA+pawf2Od6y77T7M50udID+7/EfKghzMIDH
         uNrK2ycJGvJZRhjiUVF5B3twJ/6WIuZ4ExbUIbEvHhdmASKrgpZxdQnArLMX6ccVwG8o
         elYBbs6opfZQc53sqmN0m9GQgWTX3NBWhiheLnKYx88+9/P7PEyTTIX25gsEEeJ0eNlH
         3IafnGdXN/AHEyZkwp0plHcaVnnPoOrRcnD8BLPT3BPv01rvK90+SCxItKEmEjgL5bjA
         9pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359732; x=1793964532;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIT4EIUWM1dJ9SYimM0hDCMuoN2gKWKz/aIvstZIqwA=;
        b=OZ5gjQUPiC/ibjd4kaPDX0cztCY0DCbBB4pu8pYiyYAFGyMrjdZfOsJyLnMceNjOYt
         xDPc2xKO2nRsvQe3P7rkAj9UUTtTslL6Fb/qyPu5mZKem4CxP5TS0xb5Dh8emozxVXlG
         w5HbIUEzbR37JSa8jgljN9GsOERF+Sxv28FyzyVJwQZ7gMIPXSuSM9+4GE5F4Aa4L/t9
         YmLyxiJrmexsGGFd50usXCoBhRd1Z6IzRGa309v1hyVt1YDizivCRA4PbK/H1lQD1dME
         PwiTkIr27uzrLRFkIXFEMZX/DqoplzOcQGJdu+HrVTi829lp8JIpZOOEVFtlXzZwEC4e
         nPBA==
X-Forwarded-Encrypted: i=1; AKwUvByr/4AhuuFF/Fw9mryXIxo0v2ZBzV4P8ttgUblpXdSzjIHpp0WcYGKGYoy4LF+K03qx3H7Djy3Tio8QjjlkTFX7LQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJaNY91EyXatq8n55aNxHE0aBxK9N7REVCvLqQbqd6fU4jQLl15
	RigAa+cwkd7/eIIrdfbxGrSeDIlFaf14dn/ZzMUyy4GRTWu1GuYFaQByG9m6lM+9S64=
X-Gm-Gg: AYBFou2IsIXd1U/mFb0eG5k7MaqsSfcXO/82yWa+xbUb8BmM42EfaKmIlRU1yuovsEJ
	e+IlNEyvSnsQ3rkp70AiPblK/43S+r+eiHxWAeB8bj7Y6+W1n53yN5f4dPmYsQ8op/Yfbl6jQMd
	674C8Acjhw78QPQ/OYPgLZfqir6R22YKYAGf38eC+tJXiu1ryJ34oKQcguFaSHJkAxHS/zPXFJp
	rQmzukmKqTSjg11lAtunZiWSkwiOgxa9COdr4qnLNqtG3MQmKwluVu5UWqKEr5h3P057JVh4u1+
	itfzvYNyMcjFHAXwazKLJWpjCdcObQBKfLf/YEofyeHy/eBNEuoS9npKg8SWylN78ntE1jrzRAn
	nK3JeRuQrfE333lgbyY/dQsoq+e+NnNrvWDP5vHYAEKdWvQpu65BaKVjbgkriHdK4YpiUYNkuWI
	Q+M/CBAGNKog2XeK9hNllyOokbfiyZ+3VPlhe9H2U169QB7FM0S9UXO6QHnREJhh/w7olvLeOP6
	0DnqYDR7ePkr3xSk6pcym+OcCKdOS/WSMy7APrqPhMp0mQTGNrWcHhAL8TpXL6lIcs1JyygNCTS
	AFh2hEAmUim95wSyWOnn3Pkk37Ku6Cpq87FKuivYzlFoDfxiwl751AGg0dJYtY/v9c8zV6SLvJ8
	lBWCErQ9kxdjPoddkMWzCcTwJxxWrV8AEA0DaSA==
X-Received: by 2002:a05:600c:354c:b0:4a2:8c5:5e5 with SMTP id 5b1f17b1804b1-4ac17d16b1fmr41030925e9.7.1793359732037;
        Fri, 30 Oct 2026 04:28:52 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm45009995e9.4.2026.10.30.04.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 04:28:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 12:28:51 +0100
Message-Id: <DMI4YUY8VTX7.N1DBWV01TTNK@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2 5/8] curl: fix CVE-2026-8927
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <devanshp@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016130439.603118-1-devanshp@cisco.com>
 <DMI367I27X8Y.1QCWB126HTJ6L@smile.fr>
 <PH0PR11MB761654423DFF3F2219CCDCA2D36D2@PH0PR11MB7616.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB761654423DFF3F2219CCDCA2D36D2@PH0PR11MB7616.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 11:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249030

On Fri Oct 30, 2026 at 11:31 AM CET, Devansh Patel -X (devanshp - E INFOCHI=
PS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
> Thanks, that makes sense. I=E2=80=99ll fold the Digest feature-detection
> change into the main CVE patch, add the explanation, and remove the
> separate dependency patch and recipe entry in v3.
> Do the other patches in v2 look good, or are further changes needed?
> I=E2=80=99d like to address all feedback together before sending v3 to av=
oid
> multiple revisions of the series.

Sadly, I don't have more time to spend on this series in this review
cycle. I have to move forward to unblock the 50+ other patches.
This is a complex series with lots of changes from upstream, I'm not
surprised it takes time.
Try to apply the ideas of previous reviews to the other patches of your
series, maybe you will find issues?
You could also ask for a review from your coworkers before sending the
v3?

> Regards,
> Devansh
> ________________________________
> From: Yoann Congal via openembedded-core <yoann.congal=3Dsmile.fr@lists.o=
penembedded.org>
> Sent: Friday, October 30, 2026 15:34
> To: Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco) <d=
evanshp@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-=
core@lists.openembedded.org>
> Subject: Re: [OE-core][scarthgap][PATCH v2 5/8] curl: fix CVE-2026-8927
>
> On Fri Oct 16, 2026 at 3:04 PM CEST, Devansh Patel -X (devanshp - E INFOC=
HIPS PRIVATE LIMITED at Cisco) wrote:
>> From: Devansh Patel <devanshp@cisco.com>
>>
>> This patch applies the upstream fix as referenced in [3], using the
>> commits shown in [1] and [2].
>>
>> [1] https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c=
6b705385
>> [2] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc5=
7aacb567
>> [3] https://curl.se/docs/CVE-2026-8927.html
>>
>> The test adaptations account for these earlier upstream changes:
>> [4] https://github.com/curl/curl/commit/6cf3d7b1b161bc45501d17b401225bef=
e3c43943
>> [5] https://github.com/curl/curl/commit/a186ecf4bf0c8ebb3a9a826155b33921=
64ec257a
>>
>> Validation: ptests passed (866 tests, no failures). The release build
>> skips test1647 because debug support is disabled. A native debug build
>> with stunnel passed test1647 with the test compatibility changes below.
>>
>> Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> ---
>>
>> Changes in v2:
>> - Rebase onto stable/scarthgap-review
>> - Explain the test.h macro requirements in the backport changes.
>> - Adapt CONNECT normalization and the expected error for curl 8.7.1.
>> - Record target ptest and native debug validation.
>>
>>  .../curl/curl/CVE-2026-8927-dependent.patch   |  39 ++
>>  .../curl/curl/CVE-2026-8927.patch             | 390 ++++++++++++++++++
>>  meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
>>  3 files changed, 431 insertions(+)
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927-depende=
nt.patch
>>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
>>
>> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patc=
h b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
>> new file mode 100644
>> index 0000000..d05699d
>> --- /dev/null
>> +++ b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
>> @@ -0,0 +1,39 @@
>> +From a07fc9a9855848da48a4533b85153c681ae1b1a0 Mon Sep 17 00:00:00 2001
>> +From: Daniel Stenberg <daniel@haxx.se>
>> +Date: Fri, 25 Apr 2025 08:16:13 +0200
>> +Subject: [PATCH] tests/buildinfo: former "disabled" now provides more i=
nfo
>> +
>> +This tool now contains ON/OFF information about features in the build.
>> +This way, runtests gets both positive and negative feature presence wit=
h
>> +this. Allows for more flexibility and avoids having to duplicate the
>> +names.
>> +
>> +Closes #17180
>> +
>> +CVE: CVE-2026-8927
>> +Upstream-Status: Backport [https://github.com/curl/curl/commit/1968b32a=
fd8e41fbb87f8911d15c552c6b705385]
>> +
>> +Backport Changes:
>> +- Add only the Digest feature flag needed by the tests. Keep the old
>> +  disabled helper, which clears this flag when Digest is disabled.
>> +  Leave out the buildinfo rename and other feature-reporting changes.
>> +
>> +(cherry picked from commit 1968b32afd8e41fbb87f8911d15c552c6b705385)
>> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> +---
>> + tests/runtests.pl | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/tests/runtests.pl b/tests/runtests.pl
>> +index ddfab20e86..b40df554b2 100755
>> +--- a/tests/runtests.pl
>> ++++ b/tests/runtests.pl
>> +@@ -637,6 +637,8 @@ sub checksystemfeatures {
>> +             $feature{"Kerberos"} =3D $feat =3D~ /Kerberos/i;
>> +             # SPNEGO enabled
>> +             $feature{"SPNEGO"} =3D $feat =3D~ /SPNEGO/i;
>> ++            # Digest auth enabled unless disabled by build
>> ++            $feature{"digest-auth"} =3D 1;
>> +             # CharConv enabled
>> +             $feature{"CharConv"} =3D $feat =3D~ /CharConv/i;
>> +             # TLS-SRP enabled
>
> Reading the code more closely, I think it would make more sense to fold
> this CVE-2026-8927-dependent.patch into CVE-2026-8927.patch with the
> proper explanation (Like you did with the CONNECT line).
>
> I generally don't like squashing patches like this but in those 2 cases,
> I think this is the better option (the runtests.pl patch does not look
> like the upstream patch anymore, and the CONNECT line is buried in a
> very long cleanup patch).
>
> Thanks!
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS

