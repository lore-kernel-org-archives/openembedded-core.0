Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8082.1794648068011517284
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 01:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=nt4uO1oN;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so22160765e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 01:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794648066; x=1795252866; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0E32lgr5a/y4HuxKmDAIG+zDIwxqTd9Sr+ODZRpnuDw=;
        b=nt4uO1oNqeivfb3X1ioI7Di+CK0wJv2W069mlmp+Bf9W+2zsgXz4gbO2g+b5HUxFHu
         rmCYMv4Vt328q/T6m2grPa8RO7hl8bDUXuwnxXZFLjuXFJP5CU8zwb10AAhJOMxR7Eq+
         TpYm3Xst9s/ZHij1n2QYJnNB3atTd23H4nwc/J9oFwaBckoWikjJUP/0GyIAWgiNIhaK
         FXkdf0T5JOZP97FgaYRtcj440S2lzt2RUCjjqwSZznU38JBDp2JzLKfWNuEeUn56iyOq
         QYqCuuo71NEXvjWw7HvU8guLfucrHKPzuE5ibtXukNd9q0nCxMgMa9tG6q0Yca8Jl6cK
         ckbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794648066; x=1795252866;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0E32lgr5a/y4HuxKmDAIG+zDIwxqTd9Sr+ODZRpnuDw=;
        b=hc/OSORRe/9GFBEVDWnkLESVRoV92R7LP6YLw4biCFbbp/9fkuCAfmm3hf3clbLeJp
         p7cLVkXvCf0vnWYteNP5ReSdH97HHNP433KCciZ2QRfuNYHIWJ2BGJGDoGmp4PNkjh6C
         0KhvzvhID6jpivjuC/2sVf9TLVYOQVqOFp5hOyAytOrf4jqH7AsE0+Ek6MfhS7oZPlIy
         RvHQZWKFL9YPkp2ektigAftimTtGVB0vzw0wN9LnT5nc1FzuCY1FvOtbezGTL5EGOazo
         UDUcbN9WSNyR/pGvSj8Ytas1Nxt8dDmXcVwEtDmasjBpzp/qx10KhhRi3F79QV6r1ijq
         r5DQ==
X-Forwarded-Encrypted: i=1; AL+hErGF5KykclP4E8d/7fb5vqJXE9DAGSiYKV4QpklvkKFyimCwQDfhXIWz73lOO3smB0IbffvxQkphrMzl8aZXCrSPsA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8op3iPYGoooKvqnhcjnRlXX1k7+DOgJkYngCGXy8S1U7GkdNp/
	wDYjsVrgZu2XLSkfXqL3vjmLLKIs6qwoJBfwG8jDq/48X5whVmsK6uoA/y6dpjbgncU=
X-Gm-Gg: AYBFou35CFbU/xWXi0dYA1r4v8WYuAlZ4+cwRj5Q7hlfkS0OgBY4/FbaxXQGR0b4/zT
	CVrgWC6yXKI198AuL2+NDk6CCFX3N7NBz5dcXmBASx6fQdte2kmU26Wi8ohldt/5Rys/qaVx+fm
	cahzU//XnyQ7HdTBl5gXVwqmHmFG+LOhkHTuF0seI0c1GbL2vwruGoQnt+rqKJb/hKOyRcKODHu
	SGWQKny0n9emC5bmYPldup+dLk/2Z3A1YVBA5TihTIla+3w4JOoeHkH1o8hj5hYq7WyqBlK+gcu
	2wkJ3eio+G+XsXm6XflxMFDX11IYxDDMF+chgnFUJL0cnMVKbRr3UjcP9eM4ahEXWJ0oeoqVOeV
	kJQ75bNe0bQAT5eHu0j+xDAvYDnVSzBqFZ/ZPipUuV5j4RvJOuHN5JMDoTnK4icSA+nkEjBLXu8
	nSRmA9XbGvU2uzIziczcIyJMrFmsaa4O1rVTLwkNZnCy9l1jXC9cAzYPPxlbb+lXWmLx7h6jvps
	7/HwS+uzwPyAuiuyVg6P7kU2gdARCs9PdJvV3xGeXuai1plk3/cpy7KFdGT4ThpcPXHj3Vp8e9d
	DfE7/pYfyzseo+JWVEUmtIWh+QvcsjUb6q9EV29xij0p4s3wQaIN1Uu712q+bhzl+YTyI1kbd9H
	6qWZURSzbBsKFaE0O
X-Received: by 2002:a05:600c:8010:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb55a6a5f0mr104736025e9.19.1794648066021;
        Sat, 14 Nov 2026 01:21:06 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d7150529dsm5075717f8f.51.2026.11.14.01.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 01:21:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 10:21:05 +0100
Message-Id: <DMUTN7GH0G17.1CLRYSDWZVSUP@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] sudo: fix CVE-2026-82474
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <dkelaiya@cisco.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016065612.3926487-1-dkelaiya@cisco.com>
 <DM8WHNPDNECC.29BQ7CT8Z4HTX@smile.fr>
In-Reply-To: <DM8WHNPDNECC.29BQ7CT8Z4HTX@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250199

On Mon Oct 19, 2026 at 4:56 PM CEST, Yoann Congal wrote:
> On Fri Oct 16, 2026 at 8:56 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOC=
HIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Darsh Kelaiya <dkelaiya@cisco.com>
>>
>> This patch applies the upstream fix as referenced in [2],
>> using the commit shown in [1].
>>
>> The recipe enables Linux intercept support. Check execveat commands
>> and log subcommands instead of allowing this syscall unconditionally.
>> Resolve directory file descriptors and AT_EMPTY_PATH to paths for
>> sudoers policy checks.
>>
>> Apply prerequisites [3] and [4] for proc_read_link() and fexecve paths.
>> Include follow-ups [5] and [6] to reject failed pathname rewrites and
>> correct relative-path moves. Keep the upstream source changes intact.
>>
>> [1] https://github.com/sudo-project/sudo/commit/71fbe42dcd5a1c8f79954058=
3a2dfb2ae6221edf
>> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-82474
>> [3] https://github.com/sudo-project/sudo/commit/1a312af6348594df371e6088=
aeed99685977f575
>> [4] https://github.com/sudo-project/sudo/commit/e822b729da31baf915494632=
9a9d6ef569f0d182
>> [5] https://github.com/sudo-project/sudo/commit/d1121181a87b2b47b4dfbb2a=
f42399fcc5f1e3cd
>> [6] https://github.com/sudo-project/sudo/commit/02b14c043825b52be6cd537b=
7f11bd5e7e10512e
>>
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>>  .../files/CVE-2026-82474-dependent_p1.patch   |  94 +++
>>  .../files/CVE-2026-82474-dependent_p2.patch   |  34 +
>>  .../files/CVE-2026-82474-regression_p1.patch  |  39 ++
>>  .../files/CVE-2026-82474-regression_p2.patch  |  33 +
>>  .../sudo/files/CVE-2026-82474.patch           | 617 ++++++++++++++++++
>>  meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   5 +
>>  6 files changed, 822 insertions(+)
>>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-depe=
ndent_p1.patch
>>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-depe=
ndent_p2.patch
>>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-regr=
ession_p1.patch
>>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474-regr=
ession_p2.patch
>>  create mode 100644 meta/recipes-extended/sudo/files/CVE-2026-82474.patc=
h
>
> Hello,
>
> I think this fix is also needed for blacksail and master. Can you send
> the relevant upgrade/backports so I can merge this on wrynose?

Hello,

This CVE is now fixed on master but the cherry-pick does not apply
cleanly for blacksail. Can you send this fix for blacksail as well?

Thanks!
--=20
Yoann Congal
Smile ECS

