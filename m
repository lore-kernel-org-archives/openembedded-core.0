Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35334C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 10:53:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147546.1783335204157179992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 03:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sj9flFs5;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso11791645e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 03:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783335202; x=1783940002; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/yuOXqN5n4whPSf4DsVbOchLOrWPGZR6yxA4pWSxCQ=;
        b=sj9flFs5HedIuEh/StzSRzx7GuiEEQSO/bcZJmj23T8BPYhGq1vfWy0LUNoJ/LRLNg
         tpTP8AvmTCrSR7e72GiZlpLtIJnyBrLVMLC96cXwy5MuLCvd4M91NQM/CkFRzlJc7li6
         M5SCYHdkovbWzrgm36bm1+2XjlhR4BhbxHcr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783335202; x=1783940002;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V/yuOXqN5n4whPSf4DsVbOchLOrWPGZR6yxA4pWSxCQ=;
        b=Cfe6d7w+CtqmST+sk0ezbvEtpqbdZeKRuLx/mSdRgbFfNqzUEKv/7d35UQqINVgpcF
         KldiogMAt3DnQoPXwNtZePbzosUBBAgGqh+JAmiQ5KOq8Yie3fsEhLnKNUkCwbFiJqli
         IDKGUv9g+O3IPSjLHYlOVVQs7Nj4LFCkqeeWwIt8rd9vopdGjGnBMDbEmDMp/b0z/+qZ
         Uzr2cYPk4Aj5ZlrYHcPYRnfOcDXFIMbpSkTdoEjcTPMCLxoXD/8jaKVRaLmYouWiCmDk
         boY09QEyPfu6oeJMlLV33YnZl32VMX4n8Yfr2RWlIpjlZoiYf/5eV7P0h9IY59R+4jO9
         D5mw==
X-Forwarded-Encrypted: i=1; AHgh+RqFK7CmubCKZMDBt2GPVs0KjArbzrS9YhtFQtNYJGAp98cXaLSqhOYRC2fIpKAihMaM6pfLDpOx60b816R5dgBIBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1k8t/x7EY4OhxsPH6/uQd5DkKfHRshEGyV3eawy5bt93jmwQ9
	w0N/n+8abceu0lp5jVGVZgNCs/VIyE8Re4kqQ8seGipr6EmwBy2kOfr/G7ZC6ia+57k=
X-Gm-Gg: AfdE7cmhEYRUJ4Tmc+XwpDfhKMmm72IX7SFYTZBZag/3hwJvGUn5FZ/JZvMbmntvOij
	2QJpRcjX79zaiMbL/UYDad8nKG6GgoNwhwsjnzRdX5fnPY7IcsYAEJ3vuoyKm2gFJEQ3URvHv1h
	bqX2F81q49qIc+51t+YPVE2Lu2KiI9y+f7LmPAhMXRtYK9fVjorPvYnB3fkAPeav5F/AJuQtEzd
	crLOEAeNc6LRf4A7o18UGWeSn4GGn8sEfsPTMaOjGqP+PYO2ZfyXaLN6ucUVK+hGywZkCfFBRAS
	WY59fSb7oFl/60MeAOzjsbldU0CqvBfJx7ceBdwfjLXWqSaXlt1eTtfNC6kHFsS/VsfGih78ggd
	wToU/FjfXgoxsE5ZSo/OwhoPDTXmcaQ9iCGNOMSDoyaLnRqwj/DBEICJKmDYCbrn/7hnwlTJUW+
	wuAVLX1hQfUt5BvhQ=
X-Received: by 2002:a05:600c:5306:b0:493:c8cf:27bd with SMTP id 5b1f17b1804b1-493d11f37e9mr118141205e9.19.1783335201995;
        Mon, 06 Jul 2026 03:53:21 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef183e7sm437606955e9.2.2026.07.06.03.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:53:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 12:53:21 +0200
Message-Id: <DJRFKHH9KRDJ.1L53XF1M4IYNL@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH 1/5] bind: Fix CVE-2026-1519
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <asparmar@cisco.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260610100404.2993940-1-asparmar@cisco.com>
 <DJJ53APG1CYV.2R73HPSIOJNPF@smile.fr>
In-Reply-To: <DJJ53APG1CYV.2R73HPSIOJNPF@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240246

On Fri Jun 26, 2026 at 6:59 PM CEST, Yoann Congal wrote:
> On Wed Jun 10, 2026 at 12:04 PM CEST, Ashishkumar Parmar X (asparmar - E =
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Ashishkumar Parmar <asparmar@cisco.com>
>>
>> Pick the upstream 9.18 backport [1] for CVE-2026-1519. The public ISC
>> advisory [2] describes the vulnerability and identifies the fixed BIND
>> release.
>
> Hello,
>
> I have not checked but bind is one of those rare project to have a stable
> branch that match our stable policy (I've already taken some upgrades).
>
> Instead of backporting CVE patches, why not trying to upgrade along the
> 9.18 branch?

Hello,

This whole series is now superseded by
https://patchwork.yoctoproject.org/project/oe-core/patch/20260630060410.120=
3985-1-asparmar@cisco.com/

Thanks!

>
>>
>> The upstream fix is split across the reproducer and validation commits.
>> Also include one prerequisite NSEC3 bounds-check commit that is required
>> before the validation changes can be applied cleanly and validated
>> safely on the downstream 9.18.44 source:
>>
>> - CVE-2026-1519_p1.patch [3] adds the upstream system-test reproducer
>>   for excessive NSEC3 iterations at delegation.
>> - CVE-2026-1519-dependent.patch [4] adds the prerequisite NSEC3
>>   next_length bounds check in isdelegation(). This patch is not part of
>>   the CVE merge commit, but it touches the same NSEC3 delegation path
>>   and must be applied before the functional validation changes.
>> - CVE-2026-1519_p2.patch [5] adds the iteration-limit handling in
>>   isdelegation().
>> - CVE-2026-1519_p3.patch [6] avoids re-validating already trusted
>>   rdatasets.
>> - CVE-2026-1519_p4.patch [7] checks RRset trust in
>>   validate_neg_rrset().
>>
>> Keep the patches split to preserve the upstream commit structure and to
>> make the SRC_URI ordering explicit.
>>
>> [1] https://gitlab.com/isc-projects/bind9/-/commit/5ef459eeaa92222ad28d2=
186f5eae9a586dece70
>> [2] https://kb.isc.org/docs/cve-2026-1519
>> [3] https://gitlab.com/isc-projects/bind9/-/commit/2c82f99a3c95f356861d5=
977f12ef9bbe2063cb6
>> [4] https://gitlab.com/isc-projects/bind9/-/commit/368c75a9f567f8b36cf24=
fefe45023e0a050e47b
>> [5] https://gitlab.com/isc-projects/bind9/-/commit/85c21feff9acb0982fe60=
f2c88201bf55533bd0e
>> [6] https://gitlab.com/isc-projects/bind9/-/commit/8890a91c1c16129333139=
b9d8a4381e0f741f0d6
>> [7] https://gitlab.com/isc-projects/bind9/-/commit/85fcd704e2f7cc2a25d21=
95bc4bb28398c889ed3
>>
>> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> ---
>>  .../bind/bind/CVE-2026-1519-dependent.patch   |  50 +++
>>  .../bind/bind/CVE-2026-1519_p1.patch          | 341 ++++++++++++++++++
>>  .../bind/bind/CVE-2026-1519_p2.patch          | 176 +++++++++
>>  .../bind/bind/CVE-2026-1519_p3.patch          |  52 +++
>>  .../bind/bind/CVE-2026-1519_p4.patch          |  59 +++
>>  .../recipes-connectivity/bind/bind_9.18.44.bb |   5 +
>>  6 files changed, 683 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519-de=
pendent.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519_p1=
.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519_p2=
.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519_p3=
.patch
>>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519_p4=
.patch
>>
>> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519-dependent=
.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-1519-dependent.patch
>> new file mode 100644
>> index 0000000000..eff7a06d82
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519-dependent.patch
>> @@ -0,0 +1,50 @@
>> +From af8929ebe72ca8564882632e59999795c781ebd4 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Ond=3DC5=3D99ej=3D20Sur=3DC3=3DBD?=3D <ondrej@isc.org=
>
>> +Date: Sat, 14 Feb 2026 14:43:41 +0100
>> +Subject: [PATCH] Invalid NSEC3 can cause OOB read of the isdelegation()=
 stack
>> +
>> +When .next_length is longer than NSEC3_MAX_HASH_LENGTH, it causes a
>> +harmless out-of-bound read of the isdelegation() stack. This patch
>> +fixes the issue by skipping NSEC3 records with an oversized hash length
>> +during validation.
>> +
>> +CVE: CVE-2026-1519
>> +Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/comm=
it/368c75a9f567f8b36cf24fefe45023e0a050e47b]
>> +
>> +(cherry picked from commit 67b4fb56e40bf856e1fccd41e752d5f486b5b569)
>> +(cherry picked from commit 368c75a9f567f8b36cf24fefe45023e0a050e47b)
>> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> +---
>> + lib/dns/rdata/generic/nsec3_50.c | 1 +
>> + lib/dns/validator.c              | 3 +++
>> + 2 files changed, 4 insertions(+)
>> +
>> +diff --git a/lib/dns/rdata/generic/nsec3_50.c b/lib/dns/rdata/generic/n=
sec3_50.c
>> +index f45fe4dc33..e04587bd1b 100644
>> +--- a/lib/dns/rdata/generic/nsec3_50.c
>> ++++ b/lib/dns/rdata/generic/nsec3_50.c
>> +@@ -324,6 +324,7 @@ tostruct_nsec3(ARGS_TOSTRUCT) {
>> + 	}
>> +=20
>> + 	nsec3->mctx =3D mctx;
>> ++
>> + 	return ISC_R_SUCCESS;
>> +=20
>> + cleanup:
>> +diff --git a/lib/dns/validator.c b/lib/dns/validator.c
>> +index 809b7be911..9ec13581ab 100644
>> +--- a/lib/dns/validator.c
>> ++++ b/lib/dns/validator.c
>> +@@ -339,6 +339,9 @@ trynsec3:
>> + 			if (nsec3.hash !=3D 1) {
>> + 				continue;
>> + 			}
>> ++			if (nsec3.next_length > NSEC3_MAX_HASH_LENGTH) {
>> ++				continue;
>> ++			}
>> + 			length =3D isc_iterated_hash(
>> + 				hash, nsec3.hash, nsec3.iterations, nsec3.salt,
>> + 				nsec3.salt_length, name->ndata, name->length);
>> +--=20
>> +2.35.6
>> +
>> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p1.patch =
b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p1.patch
>> new file mode 100644
>> index 0000000000..f78af9da11
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p1.patch
>> @@ -0,0 +1,341 @@
>> +From 81f8acc4bdf84eec6f53a65709b61ad3d963b4f7 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Nicki=3D20K=3DC5=3D99=3DC3=3DAD=3DC5=3DBEek?=3D <nick=
i@isc.org>
>> +Date: Tue, 3 Feb 2026 18:25:04 +0100
>> +Subject: [PATCH] Reproducer for CVE-2026-1519
>> +
>> +When a validating resolver processes a delegation from a DNSSEC-signed
>> +zone which uses too many NSEC3 iterations, it should cease the attempt
>> +to validate due to an NSEC3 iteration limit being exceeded and fall bac=
k
>> +to insecure.
>> +
>> +CVE: CVE-2026-1519
>> +Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/comm=
it/2c82f99a3c95f356861d5977f12ef9bbe2063cb6]
>> +
>> +(cherry picked from commit 9bc14a89f1313aa38330e84674ac3b7691db3383)
>> +(cherry picked from commit 2c82f99a3c95f356861d5977f12ef9bbe2063cb6)
>> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> +---
>> + .../system/nsec3-delegation/ns1/named.conf.j2 | 35 +++++++++++
>> + bin/tests/system/nsec3-delegation/ns1/root.db | 25 ++++++++
>> + .../ns2/iter-too-many.db.j2.manual            | 31 ++++++++++
>> + .../system/nsec3-delegation/ns2/named.conf.j2 | 40 ++++++++++++
>> + .../nsec3-delegation/ns2/sub.iter-too-many.db | 24 ++++++++
>> + .../system/nsec3-delegation/ns3/named.conf.j2 | 37 +++++++++++
>> + .../nsec3-delegation/ns3/trusted.conf.j2      |  1 +
>> + .../tests_excessive_nsec3_iterations.py       | 61 +++++++++++++++++++
>> + 8 files changed, 254 insertions(+)
>> + create mode 100644 bin/tests/system/nsec3-delegation/ns1/named.conf.j2
>> + create mode 100644 bin/tests/system/nsec3-delegation/ns1/root.db
>> + create mode 100644 bin/tests/system/nsec3-delegation/ns2/iter-too-many=
.db.j2.manual
>> + create mode 100644 bin/tests/system/nsec3-delegation/ns2/named.conf.j2
>> + create mode 100644 bin/tests/system/nsec3-delegation/ns2/sub.iter-too-=
many.db
>> + create mode 100644 bin/tests/system/nsec3-delegation/ns3/named.conf.j2
>> + create mode 120000 bin/tests/system/nsec3-delegation/ns3/trusted.conf.=
j2
>> + create mode 100644 bin/tests/system/nsec3-delegation/tests_excessive_n=
sec3_iterations.py
>> +
>> +diff --git a/bin/tests/system/nsec3-delegation/ns1/named.conf.j2 b/bin/=
tests/system/nsec3-delegation/ns1/named.conf.j2
>> +new file mode 100644
>> +index 0000000000..65016d1c67
>> +--- /dev/null
>> ++++ b/bin/tests/system/nsec3-delegation/ns1/named.conf.j2
>> +@@ -0,0 +1,35 @@
>> ++/*
>> ++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
>> ++ *
>> ++ * SPDX-License-Identifier: MPL-2.0
>> ++ *
>> ++ * This Source Code Form is subject to the terms of the Mozilla Public
>> ++ * License, v. 2.0.  If a copy of the MPL was not distributed with thi=
s
>> ++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
>> ++ *
>> ++ * See the COPYRIGHT file distributed with this work for additional
>> ++ * information regarding copyright ownership.
>> ++ */
>> ++
>> ++options {
>> ++	query-source address 10.53.0.1;
>> ++	notify-source 10.53.0.1;
>> ++	transfer-source 10.53.0.1;
>> ++	port @PORT@;
>> ++	pid-file "named.pid";
>> ++	listen-on { 10.53.0.1; };
>> ++	listen-on-v6 { none; };
>> ++	recursion no;
>> ++	dnssec-validation no;
>> ++};
>> ++
>> ++controls {
>> ++	inet 10.53.0.1 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
>> ++};
>> ++
>> ++include "../../_common/rndc.key";
>> ++
>> ++zone "." {
>> ++	type primary;
>> ++	file "root.db";
>> ++};
>> +diff --git a/bin/tests/system/nsec3-delegation/ns1/root.db b/bin/tests/=
system/nsec3-delegation/ns1/root.db
>> +new file mode 100644
>> +index 0000000000..c3f80d0d4b
>> +--- /dev/null
>> ++++ b/bin/tests/system/nsec3-delegation/ns1/root.db
>> +@@ -0,0 +1,25 @@
>> ++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
>> ++;
>> ++; SPDX-License-Identifier: MPL-2.0
>> ++;
>> ++; This Source Code Form is subject to the terms of the Mozilla Public
>> ++; License, v. 2.0.  If a copy of the MPL was not distributed with this
>> ++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
>> ++;
>> ++; See the COPYRIGHT file distributed with this work for additional
>> ++; information regarding copyright ownership.
>> ++
>> ++$TTL 300
>> ++.			IN SOA	. . (
>> ++				2025063000	; serial
>> ++				600		; refresh
>> ++				600		; retry
>> ++				1200		; expire
>> ++				600		; minimum
>> ++				)
>> ++.			NS	a.root-servers.nil.
>> ++
>> ++a.root-servers.nil	A	10.53.0.1
>> ++
>> ++iter-too-many.		NS	ns2.iter-too-many.
>> ++ns2.iter-too-many.	A	10.53.0.2
>> +diff --git a/bin/tests/system/nsec3-delegation/ns2/iter-too-many.db.j2.=
manual b/bin/tests/system/nsec3-delegation/ns2/iter-too-many.db.j2.manual
>> +new file mode 100644
>> +index 0000000000..fa5023d21b
>> +--- /dev/null
>> ++++ b/bin/tests/system/nsec3-delegation/ns2/iter-too-many.db.j2.manual
>> +@@ -0,0 +1,31 @@
>> ++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
>> ++;
>> ++; SPDX-License-Identifier: MPL-2.0
>> ++;
>> ++; This Source Code Form is subject to the terms of the Mozilla Public
>> ++; License, v. 2.0.  If a copy of the MPL was not distributed with this
>> ++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
>> ++;
>> ++; See the COPYRIGHT file distributed with this work for additional
>> ++; information regarding copyright ownership.
>> ++
>> ++{% raw %}
>> ++$TTL 300
>> ++@			IN SOA	ns2.iter-too-many. hostmaster.iter-too-many. (
>> ++				2026020300	; serial
>> ++				20		; refresh (20 seconds)
>> ++				20		; retry (20 seconds)
>> ++				1814400		; expire (3 weeks)
>> ++				3600		; minimum (1 hour)
>> ++)
>> ++
>> ++@	IN	NS	ns2.iter-too-many.
>> ++ns2	IN	A	10.53.0.2
>> ++
>> ++sub	IN	NS	ns2.sub.iter-too-many.
>> ++ns2.sub	IN	A	10.53.0.2
>> ++{% endraw %}
>> ++
>> ++{% for dnskey in dnskeys %}
>> ++@dnskey@
>> ++{% endfor %}
>> +diff --git a/bin/tests/system/nsec3-delegation/ns2/named.conf.j2 b/bin/=
tests/system/nsec3-delegation/ns2/named.conf.j2
>> +new file mode 100644
>> +index 0000000000..2f4823574f
>> +--- /dev/null
>> ++++ b/bin/tests/system/nsec3-delegation/ns2/named.conf.j2
>> +@@ -0,0 +1,40 @@
>> ++/*
>> ++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
>> ++ *
>> ++ * SPDX-License-Identifier: MPL-2.0
>> ++ *
>> ++ * This Source Code Form is subject to the terms of the Mozilla Public
>> ++ * License, v. 2.0.  If a copy of the MPL was not distributed with thi=
s
>> ++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
>> ++ *
>> ++ * See the COPYRIGHT file distributed with this work for additional
>> ++ * information regarding copyright ownership.
>> ++ */
>> ++
>> ++options {
>> ++	query-source address 10.53.0.2;
>> ++	notify-source 10.53.0.2;
>> ++	transfer-source 10.53.0.2;
>> ++	port @PORT@;
>> ++	pid-file "named.pid";
>> ++	listen-on { 10.53.0.2; };
>> ++	listen-on-v6 { none; };
>> ++	recursion no;
>> ++	dnssec-validation no;
>> ++};
>> ++
>> ++controls {
>> ++	inet 10.53.0.2 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
>> ++};
>> ++
>> ++include "../../_common/rndc.key";
>> ++
>> ++zone "iter-too-many" {
>> ++	type primary;
>> ++	file "iter-too-many.signed.db";
>> ++};
>> ++
>> ++zone "sub.iter-too-many" {
>> ++	type primary;
>> ++	file "sub.iter-too-many.db";
>> ++};
>> +diff --git a/bin/tests/system/nsec3-delegation/ns2/sub.iter-too-many.db=
 b/bin/tests/system/nsec3-delegation/ns2/sub.iter-too-many.db
>> +new file mode 100644
>> +index 0000000000..09b2bb6fb3
>> +--- /dev/null
>> ++++ b/bin/tests/system/nsec3-delegation/ns2/sub.iter-too-many.db
>> +@@ -0,0 +1,24 @@
>> ++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
>> ++;
>> ++; SPDX-License-Identifier: MPL-2.0
>> ++;
>> ++; This Source Code Form is subject to the terms of the Mozilla Public
>> ++; License, v. 2.0.  If a copy of the MPL was not distributed with this
>> ++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
>> ++;
>> ++; See the COPYRIGHT file distributed with this work for additional
>> ++; information regarding copyright ownership.
>> ++
>> ++$TTL 300
>> ++@			IN SOA	ns2.sub.iter-too-many. hostmaster.sub.iter-too-many. (
>> ++				2026020300	; serial
>> ++				20		; refresh (20 seconds)
>> ++				20		; retry (20 seconds)
>> ++				1814400		; expire (3 weeks)
>> ++				3600		; minimum (1 hour)
>> ++)
>> ++
>> ++@	IN	NS	ns2.sub.iter-too-many.
>> ++ns2	IN	A	10.53.0.2
>> ++
>> ++example	IN	A	127.0.0.1
>> +diff --git a/bin/tests/system/nsec3-delegation/ns3/named.conf.j2 b/bin/=
tests/system/nsec3-delegation/ns3/named.conf.j2
>> +new file mode 100644
>> +index 0000000000..e36b88c53e
>> +--- /dev/null
>> ++++ b/bin/tests/system/nsec3-delegation/ns3/named.conf.j2
>> +@@ -0,0 +1,37 @@
>> ++/*
>> ++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
>> ++ *
>> ++ * SPDX-License-Identifier: MPL-2.0
>> ++ *
>> ++ * This Source Code Form is subject to the terms of the Mozilla Public
>> ++ * License, v. 2.0.  If a copy of the MPL was not distributed with thi=
s
>> ++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
>> ++ *
>> ++ * See the COPYRIGHT file distributed with this work for additional
>> ++ * information regarding copyright ownership.
>> ++ */
>> ++
>> ++options {
>> ++	query-source address 10.53.0.3;
>> ++	notify-source 10.53.0.3;
>> ++	transfer-source 10.53.0.3;
>> ++	port @PORT@;
>> ++	pid-file "named.pid";
>> ++	listen-on { 10.53.0.3; };
>> ++	listen-on-v6 { none; };
>> ++	recursion yes;
>> ++	dnssec-validation yes;
>> ++};
>> ++
>> ++controls {
>> ++	inet 10.53.0.3 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
>> ++};
>> ++
>> ++include "../../_common/rndc.key";
>> ++
>> ++zone "." {
>> ++	type hint;
>> ++	file "../../_common/root.hint";
>> ++};
>> ++
>> ++include "trusted.conf";
>> +diff --git a/bin/tests/system/nsec3-delegation/ns3/trusted.conf.j2 b/bi=
n/tests/system/nsec3-delegation/ns3/trusted.conf.j2
>> +new file mode 120000
>> +index 0000000000..cb0be77b22
>> +--- /dev/null
>> ++++ b/bin/tests/system/nsec3-delegation/ns3/trusted.conf.j2
>> +@@ -0,0 +1 @@
>> ++../../_common/trusted.conf.j2
>> +\ No newline at end of file
>> +diff --git a/bin/tests/system/nsec3-delegation/tests_excessive_nsec3_it=
erations.py b/bin/tests/system/nsec3-delegation/tests_excessive_nsec3_itera=
tions.py
>> +new file mode 100644
>> +index 0000000000..f85384bb1e
>> +--- /dev/null
>> ++++ b/bin/tests/system/nsec3-delegation/tests_excessive_nsec3_iteration=
s.py
>> +@@ -0,0 +1,61 @@
>> ++# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
>> ++#
>> ++# SPDX-License-Identifier: MPL-2.0
>> ++#
>> ++# This Source Code Form is subject to the terms of the Mozilla Public
>> ++# License, v. 2.0.  If a copy of the MPL was not distributed with this
>> ++# file, you can obtain one at https://mozilla.org/MPL/2.0/.
>> ++#
>> ++# See the COPYRIGHT file distributed with this work for additional
>> ++# information regarding copyright ownership.
>> ++
>> ++from isctest.run import EnvCmd
>> ++
>> ++import isctest
>> ++
>> ++
>> ++def bootstrap():
>> ++    templates =3D isctest.template.TemplateEngine(".")
>> ++    keygen =3D EnvCmd("KEYGEN", "-a ECDSA256")
>> ++    signer =3D EnvCmd("SIGNER")
>> ++
>> ++    isctest.log.info("setup iter-too-many.")
>> ++    zonename =3D "iter-too-many."
>> ++    ksk_name =3D keygen(f"-f KSK {zonename}", cwd=3D"ns2").out.strip()
>> ++    zsk_name =3D keygen(f"{zonename}", cwd=3D"ns2").out.strip()
>> ++    ksk =3D isctest.kasp.Key(ksk_name, keydir=3D"ns2")
>> ++    zsk =3D isctest.kasp.Key(zsk_name, keydir=3D"ns2")
>> ++    dnskeys =3D [ksk.dnskey, zsk.dnskey]
>> ++
>> ++    tdata =3D {
>> ++        "dnskeys": dnskeys,
>> ++    }
>> ++    templates.render(f"ns2/{zonename}db", tdata, template=3Df"ns2/{zon=
ename}db.j2.manual")
>> ++    signer(
>> ++        f"-P -o {zonename} -f {zonename}signed.db -3 A1B2C3D4 -H too-m=
any -H 151 -S {zonename}db",
>> ++        cwd=3D"ns2",
>> ++    )
>> ++
>> ++    return {
>> ++        "trust_anchors": [
>> ++            ksk.into_ta("static-key"),
>> ++        ],
>> ++    }
>> ++
>> ++
>> ++def test_excessive_nsec3_iterations_delegation(ns3):
>> ++    # reproducer for CVE-2026-1519 [GL#5708]
>> ++    zone =3D "example.sub.iter-too-many"
>> ++    msg =3D isctest.query.create(zone, "A")
>> ++    res =3D isctest.query.tcp(msg, ns3.ip)
>> ++
>> ++    # an insecure response is expected regardless of the NSEC3 iterati=
on limit,
>> ++    # because the sub.iter-too-many. zone is unsigned. the real differ=
ence is
>> ++    # in the CPU usage required for generating such response, but that=
 can't be
>> ++    # easily and reliably tested in an automated fashion
>> ++    isctest.check.noerror(res)
>> ++
>> ++    with ns3.watch_log_from_start() as watcher:
>> ++        watcher.wait_for_line(
>> ++            f"validating {zone}/A: validator_callback_ds: too many ite=
rations"
>> ++        )
>> +--=20
>> +2.35.6
>> +
>> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p2.patch =
b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p2.patch
>> new file mode 100644
>> index 0000000000..ee033b4b91
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p2.patch
>> @@ -0,0 +1,176 @@
>> +From e77c45ddae1ca87058244978868b6489610ca136 Mon Sep 17 00:00:00 2001
>> +From: Matthijs Mekking <matthijs@isc.org>
>> +Date: Tue, 3 Mar 2026 10:40:36 +0100
>> +Subject: [PATCH] Check iterations in isdelegation()
>> +
>> +When looking up an NSEC3 as part of an insecurity proof, check the
>> +number of iterations. If this is too high, treat the answer as insecure
>> +by marking the answer with trust level "answer", indicating that they
>> +did not validate, but could be cached as insecure.
>> +
>> +CVE: CVE-2026-1519
>> +Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/comm=
it/85c21feff9acb0982fe60f2c88201bf55533bd0e]
>> +
>> +(cherry picked from commit 988040a5e02f86f4a8cdb0704e8d501f9082a89c)
>> +(cherry picked from commit 85c21feff9acb0982fe60f2c88201bf55533bd0e)
>> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> +---
>> + lib/dns/validator.c | 64 +++++++++++++++++++++++++++++++++------------
>> + 1 file changed, 48 insertions(+), 16 deletions(-)
>> +
>> +diff --git a/lib/dns/validator.c b/lib/dns/validator.c
>> +index 9ec13581ab..179b6590b5 100644
>> +--- a/lib/dns/validator.c
>> ++++ b/lib/dns/validator.c
>> +@@ -256,12 +256,25 @@ exit_check(dns_validator_t *val) {
>> + }
>> +=20
>> + /*%
>> +- * Look in the NSEC record returned from a DS query to see if there is
>> +- * a NS RRset at this name.  If it is found we are at a delegation poi=
nt.
>> ++ * The isdelegation() function is called as part of seeking the DS rec=
ord.
>> ++ * Look in the NSEC or NSEC3 record returned from a DS query to see if=
 the
>> ++ * record has the NS bitmap set. If so, we are at a delegation point.
>> ++ *
>> ++ * If the response contains NSEC3 records with too high iterations, we=
 cannot
>> ++ * (or rather we are not going to) validate the insecurity proof. Inst=
ead we
>> ++ * are going to treat the message as insecure and just assume the DS w=
as at
>> ++ * the delegation.
>> ++ *
>> ++ * Returns:
>> ++ *\li	#ISC_R_SUCCESS	the NS bitmap was set in the NSEC or NSEC3 record=
, or
>> ++ *			the NSEC3 covers the name (in case of opt-out), or
>> ++ *			we cannot validate the insecurity proof and are going
>> ++ *			to treat the message as isnecure.
>> ++ *\li	#ISC_R_NOTFOUND the NS bitmap was not set,
>> +  */
>> +-static bool
>> +-isdelegation(dns_name_t *name, dns_rdataset_t *rdataset,
>> +-	     isc_result_t dbresult) {
>> ++static isc_result_t
>> ++isdelegation(dns_validator_t *val, dns_name_t *name, dns_rdataset_t *r=
dataset,
>> ++	     isc_result_t dbresult, const char *caller) {
>> + 	dns_fixedname_t fixed;
>> + 	dns_label_t hashlabel;
>> + 	dns_name_t nsec3name;
>> +@@ -289,7 +302,7 @@ isdelegation(dns_name_t *name, dns_rdataset_t *rdat=
aset,
>> + 			goto trynsec3;
>> + 		}
>> + 		if (result !=3D ISC_R_SUCCESS) {
>> +-			return false;
>> ++			return ISC_R_NOTFOUND;
>> + 		}
>> + 	}
>> +=20
>> +@@ -303,7 +316,7 @@ isdelegation(dns_name_t *name, dns_rdataset_t *rdat=
aset,
>> + 		dns_rdata_reset(&rdata);
>> + 	}
>> + 	dns_rdataset_disassociate(&set);
>> +-	return found;
>> ++	return found ? ISC_R_SUCCESS : ISC_R_NOTFOUND;
>> +=20
>> + trynsec3:
>> + 	/*
>> +@@ -342,6 +355,18 @@ trynsec3:
>> + 			if (nsec3.next_length > NSEC3_MAX_HASH_LENGTH) {
>> + 				continue;
>> + 			}
>> ++			/*
>> ++			 * If there are too many iterations assume bad things
>> ++			 * are happening and bail out early. Treat as if the
>> ++			 * DS was at the delegation.
>> ++			 */
>> ++			if (nsec3.iterations > DNS_NSEC3_MAXITERATIONS) {
>> ++				validator_log(val, ISC_LOG_DEBUG(3),
>> ++					      "%s: too many iterations",
>> ++					      caller);
>> ++				dns_rdataset_disassociate(&set);
>> ++				return ISC_R_SUCCESS;
>> ++			}
>> + 			length =3D isc_iterated_hash(
>> + 				hash, nsec3.hash, nsec3.iterations, nsec3.salt,
>> + 				nsec3.salt_length, name->ndata, name->length);
>> +@@ -353,7 +378,7 @@ trynsec3:
>> + 				found =3D dns_nsec3_typepresent(&rdata,
>> + 							      dns_rdatatype_ns);
>> + 				dns_rdataset_disassociate(&set);
>> +-				return found;
>> ++				return found ? ISC_R_SUCCESS : ISC_R_NOTFOUND;
>> + 			}
>> + 			if ((nsec3.flags & DNS_NSEC3FLAG_OPTOUT) =3D=3D 0) {
>> + 				continue;
>> +@@ -369,12 +394,12 @@ trynsec3:
>> + 			      memcmp(hash, nsec3.next, length) < 0)))
>> + 			{
>> + 				dns_rdataset_disassociate(&set);
>> +-				return true;
>> ++				return ISC_R_SUCCESS;
>> + 			}
>> + 		}
>> + 		dns_rdataset_disassociate(&set);
>> + 	}
>> +-	return found;
>> ++	return found ? ISC_R_SUCCESS : ISC_R_NOTFOUND;
>> + }
>> +=20
>> + /*%
>> +@@ -590,8 +615,9 @@ fetch_callback_ds(isc_task_t *task, isc_event_t *ev=
ent) {
>> + 		} else if (eresult =3D=3D DNS_R_SERVFAIL) {
>> + 			goto unexpected;
>> + 		} else if (eresult !=3D DNS_R_CNAME &&
>> +-			   isdelegation(devent->foundname, &val->frdataset,
>> +-					eresult))
>> ++			   isdelegation(val, devent->foundname, &val->frdataset,
>> ++					eresult,
>> ++					"fetch_callback_ds") =3D=3D ISC_R_SUCCESS)
>> + 		{
>> + 			/*
>> + 			 * Failed to find a DS while trying to prove
>> +@@ -755,10 +781,13 @@ validator_callback_ds(isc_task_t *task, isc_event=
_t *event) {
>> + 			      dns_trust_totext(val->frdataset.trust));
>> + 		have_dsset =3D (val->frdataset.type =3D=3D dns_rdatatype_ds);
>> + 		name =3D dns_fixedname_name(&val->fname);
>> ++
>> + 		if ((val->attributes & VALATTR_INSECURITY) !=3D 0 &&
>> + 		    val->frdataset.covers =3D=3D dns_rdatatype_ds &&
>> + 		    NEGATIVE(&val->frdataset) &&
>> +-		    isdelegation(name, &val->frdataset, DNS_R_NCACHENXRRSET))
>> ++		    isdelegation(val, name, &val->frdataset,
>> ++				 DNS_R_NCACHENXRRSET,
>> ++				 "validator_callback_ds") =3D=3D ISC_R_SUCCESS)
>> + 		{
>> + 			result =3D markanswer(val, "validator_callback_ds",
>> + 					    "no DS and this is a delegation");
>> +@@ -2590,7 +2619,8 @@ validate_nx(dns_validator_t *val, bool resume) {
>> + 			result =3D findnsec3proofs(val);
>> + 			if (result =3D=3D DNS_R_NSEC3ITERRANGE) {
>> + 				validator_log(val, ISC_LOG_DEBUG(3),
>> +-					      "too many iterations");
>> ++					      "%s: too many iterations",
>> ++					      __func__);
>> + 				markanswer(val, "validate_nx (3)", NULL);
>> + 				return ISC_R_SUCCESS;
>> + 			}
>> +@@ -2626,7 +2656,7 @@ validate_nx(dns_validator_t *val, bool resume) {
>> + 		result =3D findnsec3proofs(val);
>> + 		if (result =3D=3D DNS_R_NSEC3ITERRANGE) {
>> + 			validator_log(val, ISC_LOG_DEBUG(3),
>> +-				      "too many iterations");
>> ++				      "%s: too many iterations", __func__);
>> + 			markanswer(val, "validate_nx (4)", NULL);
>> + 			return ISC_R_SUCCESS;
>> + 		}
>> +@@ -2833,7 +2863,9 @@ seek_ds(dns_validator_t *val, isc_result_t *resp)=
 {
>> + 			return ISC_R_COMPLETE;
>> + 		}
>> +=20
>> +-		if (isdelegation(tname, &val->frdataset, result)) {
>> ++		result =3D isdelegation(val, tname, &val->frdataset, result,
>> ++				      "seek_ds");
>> ++		if (result =3D=3D ISC_R_SUCCESS) {
>> + 			*resp =3D markanswer(val, "seek_ds (3)",
>> + 					   "this is a delegation");
>> + 			return ISC_R_COMPLETE;
>> +--=20
>> +2.35.6
>> +
>> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p3.patch =
b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p3.patch
>> new file mode 100644
>> index 0000000000..0473f40752
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p3.patch
>> @@ -0,0 +1,52 @@
>> +From 87c7c1aa7c648f15d57810afb198db709aa08ad3 Mon Sep 17 00:00:00 2001
>> +From: Matthijs Mekking <matthijs@isc.org>
>> +Date: Tue, 3 Mar 2026 11:17:25 +0100
>> +Subject: [PATCH] Don't verify already trusted rdatasets
>> +
>> +If we already marked an rdataset as secure (or it has even stronger
>> +trust), there is no need to cryptographically verify it again.
>> +
>> +CVE: CVE-2026-1519
>> +Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/comm=
it/8890a91c1c16129333139b9d8a4381e0f741f0d6]
>> +
>> +(cherry picked from commit 0ec08c212022d08c9717f2bc6bd3e8ebd6f034ce)
>> +(cherry picked from commit 8890a91c1c16129333139b9d8a4381e0f741f0d6)
>> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> +---
>> + lib/dns/include/dns/types.h | 1 +
>> + lib/dns/validator.c         | 7 +++++++
>> + 2 files changed, 8 insertions(+)
>> +
>> +diff --git a/lib/dns/include/dns/types.h b/lib/dns/include/dns/types.h
>> +index 8ddcbeb4e2..bd9623058a 100644
>> +--- a/lib/dns/include/dns/types.h
>> ++++ b/lib/dns/include/dns/types.h
>> +@@ -352,6 +352,7 @@ enum {
>> + 	((x) =3D=3D dns_trust_additional || (x) =3D=3D dns_trust_pending_addi=
tional)
>> + #define DNS_TRUST_GLUE(x)   ((x) =3D=3D dns_trust_glue)
>> + #define DNS_TRUST_ANSWER(x) ((x) =3D=3D dns_trust_answer)
>> ++#define DNS_TRUST_SECURE(x) ((x) >=3D dns_trust_secure)
>> +=20
>> + /*%
>> +  * Name checking severities.
>> +diff --git a/lib/dns/validator.c b/lib/dns/validator.c
>> +index 179b6590b5..47efd3940f 100644
>> +--- a/lib/dns/validator.c
>> ++++ b/lib/dns/validator.c
>> +@@ -1523,6 +1523,13 @@ verify(dns_validator_t *val, dst_key_t *key, dns=
_rdata_t *rdata,
>> + 	bool ignore =3D false;
>> + 	dns_name_t *wild;
>> +=20
>> ++	if (DNS_TRUST_SECURE(val->event->rdataset->trust)) {
>> ++		/*
>> ++		 * This RRset was already verified before.
>> ++		 */
>> ++		return ISC_R_SUCCESS;
>> ++	}
>> ++
>> + 	val->attributes |=3D VALATTR_TRIEDVERIFY;
>> + 	wild =3D dns_fixedname_initname(&fixed);
>> + again:
>> +--=20
>> +2.35.6
>> +
>> diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p4.patch =
b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p4.patch
>> new file mode 100644
>> index 0000000000..fd5d1afcd7
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p4.patch
>> @@ -0,0 +1,59 @@
>> +From 52b1997275768884d46c648b40f2ea625c386d17 Mon Sep 17 00:00:00 2001
>> +From: Matthijs Mekking <matthijs@isc.org>
>> +Date: Tue, 3 Mar 2026 11:43:23 +0100
>> +Subject: [PATCH] Check RRset trust in validate_neg_rrset()
>> +
>> +In many places we only create a validator if the RRset has too low
>> +trust (the RRset is pending validation, or could not be validated
>> +before). This check was missing prior to validating negative response
>> +data.
>> +
>> +CVE: CVE-2026-1519
>> +Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/comm=
it/85fcd704e2f7cc2a25d2195bc4bb28398c889ed3]
>> +
>> +(cherry picked from commit 6ca67f65cd685cf8699540a852c1e3775bd48d64)
>> +(cherry picked from commit 85fcd704e2f7cc2a25d2195bc4bb28398c889ed3)
>> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>> +---
>> + lib/dns/validator.c | 17 +++++++++++++----
>> + 1 file changed, 13 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/lib/dns/validator.c b/lib/dns/validator.c
>> +index 47efd3940f..7db102062b 100644
>> +--- a/lib/dns/validator.c
>> ++++ b/lib/dns/validator.c
>> +@@ -2463,6 +2463,17 @@ validate_neg_rrset(dns_validator_t *val, dns_nam=
e_t *name,
>> + 		}
>> + 	}
>> +=20
>> ++	if (rdataset->type !=3D dns_rdatatype_nsec &&
>> ++	    DNS_TRUST_SECURE(rdataset->trust))
>> ++	{
>> ++		/*
>> ++		 * The negative response data is already verified.
>> ++		 * We skip NSEC records, because they require special
>> ++		 * processing in validator_callback_nsec().
>> ++		 */
>> ++		return DNS_R_CONTINUE;
>> ++	}
>> ++
>> + 	val->currentset =3D rdataset;
>> + 	result =3D create_validator(val, name, rdataset->type, rdataset,
>> + 				  sigrdataset, validator_callback_nsec,
>> +@@ -2573,11 +2584,9 @@ validate_ncache(dns_validator_t *val, bool resum=
e) {
>> + 		}
>> +=20
>> + 		result =3D validate_neg_rrset(val, name, rdataset, sigrdataset);
>> +-		if (result =3D=3D DNS_R_CONTINUE) {
>> +-			continue;
>> ++		if (result !=3D DNS_R_CONTINUE) {
>> ++			return result;
>> + 		}
>> +-
>> +-		return result;
>> + 	}
>> + 	if (result =3D=3D ISC_R_NOMORE) {
>> + 		result =3D ISC_R_SUCCESS;
>> +--=20
>> +2.35.6
>> +
>> diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recip=
es-connectivity/bind/bind_9.18.44.bb
>> index d424edcb4e..9c8b73dccc 100644
>> --- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
>> +++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
>> @@ -18,6 +18,11 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BP=
N}-${PV}.tar.xz \
>>             file://bind-ensure-searching-for-json-headers-searches-sysr.=
patch \
>>             file://0001-named-lwresd-V-and-start-log-hide-build-options.=
patch \
>>             file://0001-avoid-start-failure-with-bind-user.patch \
>> +           file://CVE-2026-1519_p1.patch \
>> +           file://CVE-2026-1519-dependent.patch \
>> +           file://CVE-2026-1519_p2.patch \
>> +           file://CVE-2026-1519_p3.patch \
>> +           file://CVE-2026-1519_p4.patch \
>>             "
>> =20
>>  SRC_URI[sha256sum] =3D "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274a=
bf73f5b5389a6f82d"


--=20
Yoann Congal
Smile ECS


