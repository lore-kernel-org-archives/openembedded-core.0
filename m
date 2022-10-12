Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D97EC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:55:17 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.17667.1665561312382753396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WLmCIYvq;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id a25so13704090ljk.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 00:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hwz5rzZYQ0vPVFYR5oKNplzODXB2yDpEFgMZ+xU118s=;
        b=WLmCIYvqtG/so/z8Qjo6pI1UHJb6LT6OYxuoKuoYlA4rIh+b3JMAhbzLgmumyt+QDD
         dd8wmxi0I/o1KWLdvYY5K55GEJehFLo659/Nd7Iev3cCaMirRwyvVv122gb4LNunXmj1
         Ymv+78jnTaN+/Yxlq610gK+aCDi4vIzZMCGAcAMxXHkOikQnkRceZBrxFxz4GiKIarCb
         qQ8w7r7r3AFpI1m8i2fvS4DHA77gTd8iFoMsNq16zQNGB+C/KihEGwOliScVYYH9vv0s
         vbvB4ZJrGJnZyaBBkXspHnvlS8MTnzEezmPAwqHkxXQtnPAs2wsGLB/XkltNxojeWpLz
         F3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwz5rzZYQ0vPVFYR5oKNplzODXB2yDpEFgMZ+xU118s=;
        b=CypVgmzRa6Za7JJbctvdS4zSSHx4kLgATchsYVj89cN8604w7GNYi7jRTZ4hOXa/nM
         3fnZzTf/IJtJanE7IcDgQhNMxgYhzvhM8RqVXU3A6vUO7vjmyyyXanZkWH0ehnz0ytyr
         0W81YEk2hPITlBga43oYO40+NJ+d6psC4IrCKx7ebvX1nsWi1kZvPoQPXcT+6zfxSNKu
         frs+kiTrbQ+PMzZ1jIUrwzr8JcJou8A4RldCdn56B2YlLxoGxI5sO5uCD7g8usyRBEdH
         DYn1/wlC8+04JS5lQsRvpW+O1yIKWhGpZWxD3vdYhk1H4lpRMNZBICZgUZoy+NcJyffe
         DYEA==
X-Gm-Message-State: ACrzQf1YWuueawy4+xnwDbBs5XUfdU2hou5vDD9DGKzI1cmgpxCd8g12
	EKQG3McDwtVKXz442vYJNeJwIgPl3oak3f0G9mk=
X-Google-Smtp-Source: AMsMyM7F8rPOQr5hMyufeIdOgS9h1GzCg8p0mT48V7ELt4Hbb6Q6jxoRIy87Gflm43sM1Uu3OPA8QIfiVd8aUFXIjJg=
X-Received: by 2002:a05:651c:1607:b0:268:db3d:8f40 with SMTP id
 f7-20020a05651c160700b00268db3d8f40mr10482523ljq.87.1665561310492; Wed, 12
 Oct 2022 00:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <233c014c169e00e6a9ce464f3ab2bf79@pianon.eu> <CANNYZj_MhYekau2ufotcMe8atj79F+NkYPg0FhasMdu1TvVBqA@mail.gmail.com>
In-Reply-To: <CANNYZj_MhYekau2ufotcMe8atj79F+NkYPg0FhasMdu1TvVBqA@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 12 Oct 2022 16:54:57 +0900
Message-ID: <CAApg2=RcCWR2e0iRGzoW2ADhS3wA0ptTHy9otenv2rSndgZLKQ@mail.gmail.com>
Subject: Re: [OE-core] severe issue in CVE checker
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alberto Pianon <alberto@pianon.eu>, OE-core <openembedded-core@lists.openembedded.org>, 
	marta.rybczynska@linaro.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Carlo Piana <carlo@piana.eu>
Content-Type: multipart/alternative; boundary="000000000000437d4c05ead1b665"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171658

--000000000000437d4c05ead1b665
Content-Type: text/plain; charset="UTF-8"

I'll be looking into how to fix it. My current idea is to make the download
a transaction, so do not update the database until we're sure the download
is complete. Plus a warning that we have had an issue, I think.

In a next step we can retry a number of times.

Regards
Marta

On Wed, 12 Oct 2022, 16:50 Alexander Kanavin, <alex.kanavin@gmail.com>
wrote:

> Thanks for the information, can you send a patch?
>
> Alex
>
> On Wed, 12 Oct 2022 at 09:25, Alberto Pianon <alberto@pianon.eu> wrote:
> >
> > All, Marta, Richard,
> >
> > while implementing stats aggregation for CVE metadata in the Oniro
> > project, I encountered a severe issue in Yocto's CVE checker, apparently
> > due to this:
> >
> https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-db-native.bb#n81
> >
> > It appears that when cve-update-db-native fails to fetch some years of
> > NIST CVE db, it just issues a warning but goes on anyway.
> >
> > The result is that in some builds, randomly (depending on NIST webserver
> > timeouts or other connection problems), CVE db is not complete, so the
> > CVE check returns false negatives (i.e. no vulnerabilities found in some
> > components even if such vulnerabilities do exist)
> >
> > I ran into such problem because in Oniro we need aggregate data from
> > different builds for a large target matrix; I added a check to check
> > that CVE metadata for each component are the same in all builds, and it
> > failed, so I tried to figure out the cause and I found this:
> >
> > - in a build where cve-check found a vulnerability for acl:
> >      $ sqlite3 build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
> >      sqlite> SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS "acl";
> >      CVE-2009-4411
> >      sqlite>
> >
> > - in another build where cve-check did not found any vulnerability for
> > the very same version of acl:
> >      $ sqlite3 build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
> >      sqlite> SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS "acl";
> >      sqlite>
> >
> > so I listed both CVE db files in those two builds and this is what I
> > got:
> >
> >      $ ls -ll build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
> > build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
> >      -rw-r--r-- 1 ubuntu ubuntu 215093248 Oct 11 10:56
> > build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
> >      -rw-r--r-- 1 ubuntu ubuntu     28672 Oct 11 10:00
> > build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
> >
> > The two CVE db files were fetched just about 1h apart, but the second
> > file is apparently incomplete.
> >
> > I checked the log for the second build, and I found this:
> >
> >      WARNING: cve-update-db-native-1.0-r0 do_fetch: Failed to fetch CVE
> > data ([Errno 99] Cannot assign requested address)
> >      NOTE: recipe cve-update-db-native-1.0-r0: task do_fetch: Succeeded
> >
> > Fetch fails, but do_fetch task succeeds.
> >
> > So I looked into the recipe's code, and I found this:
> >
> https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-db-native.bb#n81
> >
> > It iterates over NIST CVE db years, but if some year fail to download,
> > it goes on anyway, and it still merges the successful downloads into
> > nvdcve_1.1.db, without returning error.
> >
> > IMHO this is a severe issue because it may silently lead to false
> > negatives in the CVE check. If some downloads fail due to timeouts or
> > other connection problems, cve-check should retry a number of times, and
> > if any download still fails, cve-update-db-native do_fecth should fail,
> > and it turn all do_cve_check tasks should fail, since doing a CVE check
> > against a corrupted/incomplete CVE database is clearly useless
> >
> > Regards,
> >
> > Alberto
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171657):
> https://lists.openembedded.org/g/openembedded-core/message/171657
> Mute This Topic: https://lists.openembedded.org/mt/94276393/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000437d4c05ead1b665
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div style=3D"font-size:12.8px" dir=3D"auto">I&#39;ll be =
looking into how to fix it. My current idea is to make the download a trans=
action, so do not update the database until we&#39;re sure the download is =
complete. Plus a warning that we have had an issue, I think.</div><div dir=
=3D"auto" style=3D"font-size:12.8px"><br></div><div dir=3D"auto" style=3D"f=
ont-size:12.8px">In a next step we can retry a number of times.</div><div d=
ir=3D"auto" style=3D"font-size:12.8px"><br></div><div dir=3D"auto" style=3D=
"font-size:12.8px">Regards</div><div dir=3D"auto" style=3D"font-size:12.8px=
"><div style=3D"color:rgb(136,136,136)">Marta</div></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 12 Oct 202=
2, 16:50 Alexander Kanavin, &lt;<a href=3D"mailto:alex.kanavin@gmail.com">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Thanks for the information, can you send a patch?<br>
<br>
Alex<br>
<br>
On Wed, 12 Oct 2022 at 09:25, Alberto Pianon &lt;<a href=3D"mailto:alberto@=
pianon.eu" target=3D"_blank" rel=3D"noreferrer">alberto@pianon.eu</a>&gt; w=
rote:<br>
&gt;<br>
&gt; All, Marta, Richard,<br>
&gt;<br>
&gt; while implementing stats aggregation for CVE metadata in the Oniro<br>
&gt; project, I encountered a severe issue in Yocto&#39;s CVE checker, appa=
rently<br>
&gt; due to this:<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-core/me=
ta/cve-update-db-native.bb#n81" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-upda=
te-db-native.bb#n81</a><br>
&gt;<br>
&gt; It appears that when cve-update-db-native fails to fetch some years of=
<br>
&gt; NIST CVE db, it just issues a warning but goes on anyway.<br>
&gt;<br>
&gt; The result is that in some builds, randomly (depending on NIST webserv=
er<br>
&gt; timeouts or other connection problems), CVE db is not complete, so the=
<br>
&gt; CVE check returns false negatives (i.e. no vulnerabilities found in so=
me<br>
&gt; components even if such vulnerabilities do exist)<br>
&gt;<br>
&gt; I ran into such problem because in Oniro we need aggregate data from<b=
r>
&gt; different builds for a large target matrix; I added a check to check<b=
r>
&gt; that CVE metadata for each component are the same in all builds, and i=
t<br>
&gt; failed, so I tried to figure out the cause and I found this:<br>
&gt;<br>
&gt; - in a build where cve-check found a vulnerability for acl:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 $ sqlite3 build-linux-clang-qemuarm-efi/tmp/CVE_CH=
ECK/nvdcve_1.1.db<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sqlite&gt; SELECT DISTINCT ID FROM PRODUCTS WHERE =
PRODUCT IS &quot;acl&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CVE-2009-4411<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sqlite&gt;<br>
&gt;<br>
&gt; - in another build where cve-check did not found any vulnerability for=
<br>
&gt; the very same version of acl:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 $ sqlite3 build-linux-clang-qemux86/tmp/CVE_CHECK/=
nvdcve_1.1.db<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sqlite&gt; SELECT DISTINCT ID FROM PRODUCTS WHERE =
PRODUCT IS &quot;acl&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sqlite&gt;<br>
&gt;<br>
&gt; so I listed both CVE db files in those two builds and this is what I<b=
r>
&gt; got:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 $ ls -ll build-linux-clang-qemuarm-efi/tmp/CVE_CHE=
CK/nvdcve_1.1.db<br>
&gt; build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -rw-r--r-- 1 ubuntu ubuntu 215093248 Oct 11 10:56<=
br>
&gt; build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -rw-r--r-- 1 ubuntu ubuntu=C2=A0 =C2=A0 =C2=A02867=
2 Oct 11 10:00<br>
&gt; build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db<br>
&gt;<br>
&gt; The two CVE db files were fetched just about 1h apart, but the second<=
br>
&gt; file is apparently incomplete.<br>
&gt;<br>
&gt; I checked the log for the second build, and I found this:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 WARNING: cve-update-db-native-1.0-r0 do_fetch: Fai=
led to fetch CVE<br>
&gt; data ([Errno 99] Cannot assign requested address)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 NOTE: recipe cve-update-db-native-1.0-r0: task do_=
fetch: Succeeded<br>
&gt;<br>
&gt; Fetch fails, but do_fetch task succeeds.<br>
&gt;<br>
&gt; So I looked into the recipe&#39;s code, and I found this:<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-core/me=
ta/cve-update-db-native.bb#n81" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-upda=
te-db-native.bb#n81</a><br>
&gt;<br>
&gt; It iterates over NIST CVE db years, but if some year fail to download,=
<br>
&gt; it goes on anyway, and it still merges the successful downloads into<b=
r>
&gt; nvdcve_1.1.db, without returning error.<br>
&gt;<br>
&gt; IMHO this is a severe issue because it may silently lead to false<br>
&gt; negatives in the CVE check. If some downloads fail due to timeouts or<=
br>
&gt; other connection problems, cve-check should retry a number of times, a=
nd<br>
&gt; if any download still fails, cve-update-db-native do_fecth should fail=
,<br>
&gt; and it turn all do_cve_check tasks should fail, since doing a CVE chec=
k<br>
&gt; against a corrupted/incomplete CVE database is clearly useless<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Alberto<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171657): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171657" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/171657</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94276393/5827=
677" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/94276393/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000437d4c05ead1b665--

