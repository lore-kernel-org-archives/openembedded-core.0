Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB02FE9D823
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 22:00:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43647.1775426394955130797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 14:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qLX86o8Y;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488879b2e6aso29256315e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 14:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775426393; x=1776031193; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mB6C94blcwg6RCowQ/YiVILKYTYP3d5/vHTJfrQwcxs=;
        b=qLX86o8YX1Q1iP3GaXX9Eg9SUeBKdCa0YHYMcQcLhaeZDxilexkKVwWv1CPbFSRg+a
         tCankOv/qB9iJNx3akjhISQMLvNDMaYhKj4/r0l/yMXILSIrLHEIdRxvqv9q3pgGl5Jq
         JmrMQ08yyxLtdU7tGySY4PxH3/nOwI9pAAClY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775426393; x=1776031193;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mB6C94blcwg6RCowQ/YiVILKYTYP3d5/vHTJfrQwcxs=;
        b=TVn8ctnrtFPYQ+xdJob3mmhJ3jRJPagpPP8jfZ+IirkSLbdHApc80JnqDslAXhN8pw
         hIIRY8YbIvsPuagHduYQAtYgTCmCfXDh2Z/2y41nFYjvQH6VMFVjebsXinJY0bYCDu/j
         aKxI9iwe+RcqS2Pxas8lIl0vumhKoalPDMuzP8PpEayzueIeZ2om/cJRl9lRFPv7b5Zj
         EhUWwoKWjpBFEz4GCV969CZVQu91DV8LJMZNExOXLAa6oXebm7lWR/V0WUNuvfRex4oH
         FTRQ7bJIMd1z6kw8h0j2UvaBYg64mEhB6eKHCKpkAIzb+BC0a/pDpglGa4l1dtYARAAE
         qWrw==
X-Gm-Message-State: AOJu0YwC4AB0UXDToGTMutg6iA37K+daoOf0bKhuRu3H5fKydDboYlec
	Ddh+UIuRzN+9A6QpBA2LM9v9e4xmFjWNL5By4LVodZPKnm9nXsn8/AMUK0ecjQ5HXlyprYcEa9X
	DSFjgbtU=
X-Gm-Gg: AeBDieujnw4LHDTpXNHQZBIRuXDaLZGh5k+JpQ6M9aUSPwwRMq3GdrNqRTZNHyE2utB
	MLg5JUlrZPWNMrkAisRZrnZgSGrSsv2MPItCALp5251XhSlh1uRjQottKROU31cBlUtUwHEA/7W
	/AWS1p3xPRf2oMCwj8Zi4bOKsDLGvnIbkoSeHE7TV4kw8+PDWGRBH+wGQXL5IaqS512Thknfe1J
	uUIHiKMNPZPoEDKzp7L1/PvvkBt7MvwAGeao3gD1AbGyD/lIFdSREiY6aktzymdVq234aE5tufw
	rHG4PX+BVxsRICEHNRUyEgMOP93vy2eVJGqGYkIFXXxUhouHzFDYd/0vsXidbYafasEYySRd/SM
	kKvuT+aM17flVils1oA/VlXvEua535NzD+Zn2aQG62jrWmSmFYRjvXkfMGq7xZrFUeBIoRNibju
	LB8t2kKEVS/F8+BiI38ETsyjWwHcjTzzi4U2bRkQpGwb0KrG8XeBWP6ZBYTPSrdM4a+1qZar0g7
	y6y6Dr9fTXP7hpf1dhiK57Zyg==
X-Received: by 2002:a05:600c:138f:b0:486:fbf6:abd4 with SMTP id 5b1f17b1804b1-488996f250dmr149398695e9.9.1775426393295;
        Sun, 05 Apr 2026 14:59:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488983db4fbsm76566405e9.13.2026.04.05.14.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 14:59:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Apr 2026 23:59:52 +0200
Message-Id: <DHLK4OYS7YW6.1U3G25661PEW1@smile.fr>
Subject: Re: [OE-core][kirkstone][PATCH] sqlite3: Fix CVE-2025-70873
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>
X-Mailer: aerc 0.20.0
References: <20260402071559.292708-1-vanusuri@mvista.com>
 <DHJW0NQHT38D.XY6Q9OTN12FY@smile.fr>
 <CANQUz183e_N3p7n1pSr4sXUP0QAHpytUZ=-akObn1HV3PXttqQ@mail.gmail.com>
 <DHK7STMY8355.1F4WMJQ94QI3C@smile.fr>
 <CANQUz1913UWT4A8TQnN0jknyrSagoN6gg8jyxi52dkbsqHSy2g@mail.gmail.com>
In-Reply-To: <CANQUz1913UWT4A8TQnN0jknyrSagoN6gg8jyxi52dkbsqHSy2g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 22:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234637

On Sat Apr 4, 2026 at 10:43 AM CEST, Vijay Anusuri wrote:
> Hi Yoann,
>
> Thanks for checking.
>
> From what I could verify, the issue affects SQLite versions with the
> zipfile extension up to 3.51.1. The upstream fix appears to originate fro=
m
> commit https://sqlite.org/src/info/3d459f1fb1bd1b5e (as referenced in the
> SQLite tracker and forum discussion).
>
> https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054
>
> https://sqlite.org/forum/forumpost/761eac3c82
>
> In the 3.51.3 tag, the fix seems to be included as part of a larger
> upstream commit
> (https://github.com/sqlite/sqlite/commit/15cd6704863f7c68818b2d607191ab69=
44d39f98),
> which bundles multiple changes together rather than isolating the CVE fix
> in a single minimal patch. That likely explains why it=E2=80=99s not imme=
diately
> obvious when looking for a one-to-one commit reference.
>
> So while there isn=E2=80=99t a standalone CVE-specific commit in 3.51.3, =
the fix is
> incorporated there as part of that broader change set.

Ok, thanks for the details, I agree: oe-core master is fixed.

Regards,

>
> Thanks & Regards,
>
> Vijay
>
>
>
>
> On Sat, Apr 4, 2026 at 1:37=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:
>
>> On Sat Apr 4, 2026 at 9:41 AM CEST, Vijay Anusuri wrote:
>> > Hi Yoann,
>> >
>> > The fixes for this CVE are already included in SQLite version 3.51.3 o=
n
>> the
>> > master branch.
>>
>> Can you tell me what commit does fix this CVE on the 3.51.3 tag? I don't
>> see it.
>>
>> Regards,
>>
>> > I=E2=80=99ve already submitted backport patches for the whinlatter and=
 scarthgap
>> > branches. Please let me know if anything further is needed.
>> >
>> > Thanks & Regards,
>> >
>> > Vijay
>> >
>> >
>> > On Sat, Apr 4, 2026 at 4:23=E2=80=AFAM Yoann Congal <yoann.congal@smil=
e.fr>
>> wrote:
>> >
>> >> On Thu Apr 2, 2026 at 9:15 AM CEST, Vijay Anusuri via
>> >> lists.openembedded.org wrote:
>> >> > From: Vijay Anusuri <vanusuri@mvista.com>
>> >> >
>> >> > Pick patch as per [1]
>> >> >
>> >> > [1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
>> >> > [2] https://sqlite.org/forum/forumpost/761eac3c82
>> >> > [3]
>> https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054
>> >> >
>> >> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> >> > ---
>> >>
>> >> Hello,
>> >>
>> >> As far as I can tell, this CVE applies to master. Since this is the e=
nd
>> >> of kirkstone soon, I'll take it into the reviews series but can only
>> >> merge it if there is a patch sent for this CVE in those branches.
>> >>
>> >> Regards,
>> >>
>> >> >  .../sqlite/files/CVE-2025-70873.patch         | 33
>> +++++++++++++++++++
>> >> >  meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
>> >> >  2 files changed, 34 insertions(+)
>> >> >  create mode 100644
>> >> meta/recipes-support/sqlite/files/CVE-2025-70873.patch
>> >> >
>> >> > diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
>> >> b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
>> >> > new file mode 100644
>> >> > index 0000000000..86004c0b74
>> >> > --- /dev/null
>> >> > +++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
>> >> > @@ -0,0 +1,33 @@
>> >> > +From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00
>> 2001
>> >> > +From: drh <>
>> >> > +Date: Sat, 6 Dec 2025 20:41:24 +0000
>> >> > +Subject: [PATCH] In the zipfile extension, only return as many byt=
es
>> as
>> >> > + Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum p=
ost
>> >> > + 761eac3c82]. Adjust ./configure so that it builds zipfile into
>> >> testfixture if
>> >> > + ZLIB is available, so that tests get run on unix platforms.
>> >> > +
>> >> > +FossilOrigin-Name:
>> >> 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
>> >> > +
>> >> > +Upstream-Status: Backport [
>> >>
>> https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f78=
9954bf8a
>> >> ]
>> >> > +CVE: CVE-2025-70873
>> >> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> >> > +---
>> >> > + shell.c | 2 +-
>> >> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> >> > +
>> >> > +diff --git a/shell.c b/shell.c
>> >> > +index fa45d40..3c4902c 100644
>> >> > +--- a/shell.c
>> >> > ++++ b/shell.c
>> >> > +@@ -7668,7 +7668,7 @@ static void zipfileInflate(
>> >> > +       if( err!=3DZ_STREAM_END ){
>> >> > +         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
>> >> > +       }else{
>> >> > +-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
>> >> > ++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out,
>> >> zipfileFree);
>> >> > +         aRes =3D 0;
>> >> > +       }
>> >> > +     }
>> >> > +--
>> >> > +2.25.1
>> >> > +
>> >> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
>> >> b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
>> >> > index acdd80022e..9e10caa399 100644
>> >> > --- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
>> >> > +++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
>> >> > @@ -10,6 +10,7 @@ SRC_URI =3D "
>> >> http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
>> >> >             file://CVE-2023-7104.patch \
>> >> >             file://CVE-2025-29088.patch \
>> >> >             file://CVE-2025-6965.patch \
>> >> > +           file://CVE-2025-70873.patch \
>> >> >             "
>> >> >  SRC_URI[sha256sum] =3D
>> >> "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
>> >> >
>> >>
>> >>
>> >> --
>> >> Yoann Congal
>> >> Smile ECS
>> >>
>> >>
>>
>>
>> --
>> Yoann Congal
>> Smile ECS
>>
>>


--=20
Yoann Congal
Smile ECS


