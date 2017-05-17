Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC5877E0E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 16:16:53 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id b84so171064097wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 09:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ja9Nm/OGV+YeWZQlZuQVjcFXcSQbVh5LFr4Cf7WORDg=;
	b=FFumG44iJkLjLjaGVPbTYr2EiggMFIP0B/gSrKgOxFvkHXZcGSBoi/kiWxlXTyZlFi
	btUw5StH4c58++pfdkwQLtcPacCVIZZJu57rd0pi+ojb8PvnMqBDGClgP0qRGuOCj1MG
	9IUvY9Jqvk+Si//z1pHwODpNugOLdLMXtbL2DeQEzc8F90hnFm034y3jddv10rdy1tFq
	0Ds41SZe2TmBufX4SKXGrRnWpPInYQfjGPiNm6t+MjZP7GavSIZZWCwx5ZcGPk0zskbp
	8/F0CUj0Oyua7OTlwuBjEE/ZXH3kCzTAuJNtFmzFbcaQws92RmJ5su6QzLRRnXu9ovqt
	/Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ja9Nm/OGV+YeWZQlZuQVjcFXcSQbVh5LFr4Cf7WORDg=;
	b=GYIbY+eg7QpBb0tTYVA8aKS8B/rOBPD75wICjLP+8VohBX72ENw0YcxFs6Y0YggCcm
	W7c+taW8a6fCfUjWUqJqrT1O5HuplTJRF0Nq95JhG2qMNAi1e/dkYZmOuXapp7AKa+jb
	GHjazlT0mgF0mpCS/XjiGm1LnXDJ+4+AgF2fTHLRL4yOu4v5A+eCWkVUaiE10MX3b6oQ
	E/RWbkqbu7HjsGR9eqFHA455mI+A/A8BehE+RtiXcOTT434ri+HbR3myAZ3rm3K08Ssi
	3NuUW/mJ2cvzoqRdY9dfy7/uJ6jn9o0faKOQoFo8mdb4fOzJOyGV6q1jiMJ9KB1UePKa
	8c2g==
X-Gm-Message-State: AODbwcBC3sGcy03p/inVBnRHZw5HtN8OOQK75JgqoFtGKMk/jtIGAlEi
	yRKFbgOVa6TK8rIbUZtxdLamWFZbSw==
X-Received: by 10.80.163.213 with SMTP id t21mr3744675edb.158.1495037814567;
	Wed, 17 May 2017 09:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Wed, 17 May 2017 09:16:54 -0700 (PDT)
In-Reply-To: <CAJTo0LZ4WBk8dtPmjMO5cDcsuz7QXnLaJdDLxc336zPNEJy-vQ@mail.gmail.com>
References: <20170517073138.23672-1-Martin.Jansa@gmail.com>
	<CAJTo0LZ4WBk8dtPmjMO5cDcsuz7QXnLaJdDLxc336zPNEJy-vQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 May 2017 18:16:54 +0200
Message-ID: <CA+chaQcgbUhtfPEiCOFR=041cf_TP-DDCE91z-f0xtYeO0cHLg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-3.5: add runtime dependency from python3-compression on python3-misc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 May 2017 16:16:59 -0000
Content-Type: multipart/alternative; boundary="f403045c27bcdcfabd054fba9df4"

--f403045c27bcdcfabd054fba9df4
Content-Type: text/plain; charset="UTF-8"

that would break bz2 and lzma in python3-misc unless they are also moved to
-compression. And because I don't know what's using these (from inside of
python3-misc) I didn't want to move them - I'll leave it to someone else.

On Wed, May 17, 2017 at 5:21 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 17 May 2017 at 08:31, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> * the /usr/lib/python3.5/_compression.py file is possibly incorrectly
>> included
>>   in python3-misc, either it should be moved to python3-compression or
>> this
>>   runtime dependency is needed in order to use e.g. gzip.py in runtime:
>>
>
> Sounds like that file should be in -compression.
>
> Ross
>

--f403045c27bcdcfabd054fba9df4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">that would break bz2 and lzma in python3-misc unless they =
are also moved to -compression. And because I don&#39;t know what&#39;s usi=
ng these (from inside of python3-misc) I didn&#39;t want to move them - I&#=
39;ll leave it to someone else.</div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Wed, May 17, 2017 at 5:21 PM, Burton, Ross <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div class=
=3D"gmail_quote">On 17 May 2017 at 08:31, Martin Jansa <span dir=3D"ltr">&l=
t;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D"m_4849284428526549042:15p" class=3D"m_4849284428526549042a3s m_48492844=
28526549042aXjCH m_4849284428526549042m15c15526fde00f90">* the /usr/lib/pyt=
hon3.5/_compressio<wbr>n.py file is possibly incorrectly included<br>
=C2=A0 in python3-misc, either it should be moved to python3-compression or=
 this<br>
=C2=A0 runtime dependency is needed in order to use e.g. gzip.py in runtime=
:</div></blockquote></div><br></span>Sounds like that file should be in -co=
mpression.</div><span class=3D"HOEnZb"><font color=3D"#888888"><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></sp=
an></div>
</blockquote></div><br></div>

--f403045c27bcdcfabd054fba9df4--
