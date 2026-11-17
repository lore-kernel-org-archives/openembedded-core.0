Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17783.1794921574351563831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 05:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=c8Ov2lDB;
 spf=pass (domain: smile.fr, ip: 209.85.218.54, mailfrom: bastien.jauny@smile.fr)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50e26763a4so315510266b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 05:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794921572; x=1795526372; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=faFuhpb2rx9u262uiz1doU3NYgtvBKqVlkvBCiBKF8k=;
        b=c8Ov2lDBZE5cS8KqgWhfG4uTxJUQaJDcIqDPIjke2UUNn6HbP7iLVpxcubIQQslg56
         a9ILjUBGo8N00+3T0oHe9c3v9/AJNp0KxRVdinBq02lDm8oZaH2Qgm2Y3n3SbnA1MbYD
         4nK8DSKBG9LThjx02VKhdbYKVuZBAvufFF4T9cFSQkBq/q4XAzVXX2FURe46HfLubpe8
         IeT4P79b3HRtuLy5qPsSynGGN+H18Kx1u2H8ze//i05NPMhS/IXTGVxsqkytYLa5hD7R
         sUn6EK89QxKfBz/NTB2ieHLSW4mHNQ4z1ocT4aeH4jeXvnbDI9YBb2KAbnMxgVSoxPSK
         yiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921572; x=1795526372;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=faFuhpb2rx9u262uiz1doU3NYgtvBKqVlkvBCiBKF8k=;
        b=qBy+Di623MM0GFpj4OUBwr+PKsUEo4+KyigfHLp14oiy8i5twIwCkL1483eYJlY/q6
         l0WBQjtDnfvUPylFCNfwCHuoiuvFRJtMOQtyj6RPSJj+CtcNG+ICHXBcNTI6geJ7H3gk
         SUXzC9GTRfKEgrng9wxkluiSc1A9cbKR6l41CMCwySk0sVtBCVBdqupSpu3COXImyin8
         gfloDt0Ozt37CNKa7NZoaHUH2fG4roqQ3avZDf74Lhw01ho2x4+Qye+GJjNG48lYfG+m
         RKd7Uw7QLEebqpiOlJ9mezjgxMtzVH5cBhNpKXYInxGiHU+IDuWUMxi+i2HUgoPpolmv
         39sw==
X-Forwarded-Encrypted: i=1; AL+hErFHNnHEGKB2YQSkxmT+56p5YlanRRR46MEKigbvEC/UekcJh+zrwAmgCzuMmaLnI4C+Qo8cHbbmaehX6lBd3xdslg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z93rQo7GjrrFgn9A1poaKXgkKEpSk8wPacEK3ivbG8w81w2mUh9
	AaLKEL5aXp8OZD1GwDHG1BiY6oTLAIKP+zMwKrLdVXInymrruasJZB4IU0blX3/Ji6s=
X-Gm-Gg: AYBFou2qyrdyyz/71IFY6JSzXv5Dkep9OITU1KYosJaGOjmPzGaT2SfmdWBB7CBLzLB
	uXXN7Le6/HVPc5MYhkzTjv5CLRpz0/HyuhF/vHEv2UqdkEkOoBzXw+o3M45XeGZbjeMwG9LEUkG
	2PY7Oq9fLlpTSiQqVtTH8VrVWC69IfQtKE7MXJ6mgnGxRxbUoBxSh6DaZEZJZUhvca8LMw10ULy
	IAY1DoxtGRoeChGlJQxUd0tUxAM9rJzDLXK9aJnoYMW0+NJvHKims9LcZJp7LivMWNfWlK3hCZw
	gxLnHKptkt+TfhgGRi2zbvIt15FZqWHVAFm6eApvj7oQSkuhemhU1WeoqUzmOIetULzBt5kyrtJ
	oWH3LATtT16RWw/5KrqMwssI7YZTpGerMeaCzGi9aLQKbRHk7yOZ5f5GZJ5UX9ZFbcYfR2F3kPp
	ck6/zrcZUSo8xNZmWGj+SHDyADKdxZyAQEWgz/VMim+nBvWyXWyegE1AYnsnxSW4fSAMjxll53c
	w+OoBUApiG32Nv9rDptqO/IIsUzcvJF9SmTnPYm51qmLbTiqBe0CInLpA/fyrs4cs4Usfw6tnOH
	3Hai8RTf8C7EoO0mQdzxUkzr4LHcVoVz4Ya9QQV5pGUsnS0oLX6imcn3YuSIDjayAyMUyccGOHu
	ng+wIMu+Lx4zvSA==
X-Received: by 2002:a17:907:d308:b0:c40:f9ea:7387 with SMTP id a640c23a62f3a-c5096110ee7mr1135961966b.6.1794921572413;
        Tue, 17 Nov 2026 05:19:32 -0800 (PST)
Return-Path: <bastien.jauny@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b3asm539982166b.27.2026.11.17.05.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:19:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 14:19:30 +0100
Message-Id: <DMXILE8DULUH.1WHQ7HZRQTCTV@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
From: "Bastien Jauny" <bastien.jauny@smile.fr>
To: <Abinivesh.GA@windriver.com>, "Yoann Congal" <yoann.congal@smile.fr>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0-38-g09b49b623995
References: <BY1PR11MB8031E1AADA730E95EDEB30FF96772@BY1PR11MB8031.namprd11.prod.outlook.com>
In-Reply-To: <BY1PR11MB8031E1AADA730E95EDEB30FF96772@BY1PR11MB8031.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 13:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250449

On Thu Nov 5, 2026 at 6:52 AM CET, Abinivesh via openembedded-core G A wrot=
e:
> Hi Yoann,
>
> Thanks for the review.
>

Hi, I'm helping Yoann on scarthgap reviews.

> Commit message =E2=80=94 agreed, I'll drop the upstream-code description =
and reword as
> integration/provenance (revised version below, if you'd like a v2). The .=
patch file keeps
> the upstream author's message plus Upstream-Status: Backport [1c10bcc2e17=
2] / CVE: trailers,
> matching our recent ffmpeg CVE patches.
>
> Provenance/correctness: NVD/Red Hat/SentinelOne all identify librist_read=
() in
> libavformat/librist.c as the vulnerable function (ignores the caller size=
, copies full
> payload_len, reachable via async:rist://). Upstream 1c10bcc2e172 changes =
exactly that line;
> it applies cleanly to 6.1.4.
>
> Other maintained branches =E2=80=94 the vulnerable librist_read() is iden=
tical from 6.1.4 through
> 8.0.x, and I confirmed none of the oe-core branches carry the fix yet: sc=
arthgap 6.1.4,
> styhead 7.0.2, walnascar 7.1.2, whinlatter 8.0, wrynose 8.0.3 =E2=80=94 a=
ll affected by the same
> one-liner (master is already on 9.0.2, post-fix). So merging scarthgap do=
esn't leave a newer
> branch exposed on our side =E2=80=94 the newer streams are tracked separa=
tely and will get the same
> backport; happy to send those too if you'd prefer one series.
>

I can confirm this: both wrynose and scarthgap versions of ffmpeg are
affected by the CVE (8.03 and 6.1.4 respectively) but blacksail is OK
(9.0.2).

> Testing =E2=80=94 note the oe-core ffmpeg recipe has no librist PACKAGECO=
NFIG, so a default build
> compiles ffmpeg without the RIST protocol and the vulnerable path isn't i=
n the shipped
> binary (same situation Red Hat describes). Verification is therefore buil=
d + boot + runtime
> sanity rather than a RIST repro =E2=80=94 which is how the equivalent LTS=
 backport was validated on
> our side (clean build, target boots with no calltrace/coredump, runtime s=
anity pass).
>
> Regards,
> Abinivesh
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: Wednesday, November 4, 2026 8:48 PM
> To: G A, Abinivesh <Abinivesh.GA@windriver.com>; openembedded-core@lists.=
openembedded.org <openembedded-core@lists.openembedded.org>
> Subject: Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> Hello,
>
> On Wed Nov 4, 2026 at 10:53 AM CET, Abinivesh G A wrote:
>> FFmpeg before commit 1c10bcc contains a heap buffer overflow in the RIST
>> protocol reader (libavformat/librist.c). librist_read() ignored its size
>> argument and copied the full payload length into the caller-provided
>> buffer, overflowing it when the payload exceeds the destination size.
>>
>> Backport the upstream fix that clamps the copy to the caller buffer size=
.
>
> We usually omit info about upstream code in our commit message.
> We are more interested in integration information: patch provenance,
> proof that this is indeed the right patch to fix this CVE.
> Look at recent CVE patches to see what we expect.
>
>> Upstream fix:
>> https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3=
db142ce390602
>>
>> CVE: CVE-2026-75143
>>
>> Signed-off-by: Abinivesh G A <Abinivesh.GA@windriver.com>
>> ---
>>  .../ffmpeg/ffmpeg/CVE-2026-75143.patch        | 32 +++++++++++++++++++
>>  .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
>>  2 files changed, 33 insertions(+)
>>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143=
.patch
>
> Also, please check if this patch is needed for other maintained stable
> branches. I can't merge it on scarthgap if it is needed for wrynose (for
> exemple).
>
> Regards,
> --
> Yoann Congal
> Smile ECS

The usual process is to integrate the fixes from
top to bottom, meaning I can't accept this before it's available in
wrynose.

Please submit the backport for wrynose first.

Regards,
Bastien JAUNY

Regards,
--=20
Bastien JAUNY <bastien.jauny@smile.fr>

