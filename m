Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2833.1794441924667135707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 16:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MBq+DGaK;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2570820eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 16:05:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794441924; cv=none;
        d=google.com; s=arc-20260327;
        b=M5XajWWlS3+fXUD232ShiT/g0GrQwbU1KCDDpSgoUHyE0EyItI/2epMxUt0eNhVwMY
         FJsjkX7s/spitfukMr/UnaRQ+YBi3kefD2DaonGQApfRV7HGbJNHtHb+gPZjS+qHpBjs
         PGRYyl2dskmI+CYD4nVjovbNSoRSx6nK455Mb2zdUYenVtZwV414801AcO9JEkqwDjzd
         GHKsuynGBFnEX7lqCbHFVI2Qkg9UH8rPIwIUaWFtLY1gjMsqzJx6r7IUeKoGwJQVhtiD
         amVZpTAwRHR0I2OF7ABsxDsngiWYS3KgRg2swDdVHven5va3vL4Nj5EEq4hr/L7GEsuz
         eUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0HcOGlRkREAG9OQIJG5K5xgj38KJZ/054m+H2C0i/HM=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=I4BZGNsgiMvMOAK/dZQhnj3hKh/SqsF/PudCgA2meaQ0r5Ti+uPE3eG7QBh/NZCoHb
         4SRgToYupykdpYsSpKzddph+jbAAWy/b5ORcPSrrmvdM7KUoNTPc33WTUi/gAL6nizRT
         LDyLTwZknLIkyJ07pyTAI2ASDkFqRs/8ewzBmiPI30lfUkXe+ewh2MieJndleWotQyBy
         HCJFy687HM9opWfHGZhE5IVc3a1y8ChXohXm1E40phvnEaa1q8lrdnP5MhJhE9UgFkrG
         IDlxjljSiKd6hioT6c5MQxdH6mgxFTSl68NkBXRf0jZZJ6QRRKDM2TCQW82Tu5RZIaRQ
         HYhA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794441924; x=1795046724; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0HcOGlRkREAG9OQIJG5K5xgj38KJZ/054m+H2C0i/HM=;
        b=MBq+DGaK07k1FGVT4Hx7255/YGzB85wQyvgeZcuuQkzknAKqCf+s0PRUNoml2rRYlP
         oT3NdhtslzinhzDAdUy9PeE/LLBteUg3v1EnAL4RmtcIYlZ6kCEz5DJMO0JgMe3ujI7u
         tgpAXV645DkozAWzyuLvtFQezp3/iG8teS2xfMavX/ED+P9jtMdSj4AMDNpmsSuvTtT1
         4sj+ntEl0j80uOuGYSeX0ryLqmnZdUhn2gURzOer2hj/raWD/wqjgzptL4DfdBfDHAn0
         J5FVHrQJRVaPtHvcaK6sZxPupJrQRSd79jlk6RnKYLAz8jZHe7ZiqVoOrCbZ07jjRJdE
         aRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441924; x=1795046724;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0HcOGlRkREAG9OQIJG5K5xgj38KJZ/054m+H2C0i/HM=;
        b=qQSKxIkQPyUfy/Zmc99DoJ09gwp7s1j+XAHBTeUxveS91Sq+jZblOIDFtUXl0l+Qwa
         4L9AFlkm93eZhcph1qenc13Oc2tC2AgpjqlDSIyKfyFCmgB2qiBR4iLjT+m7of/rE9SH
         7K+g1YgcUTUrMLDwt/mrHRNul+J6EBfd5KoI9pqy4FfQzgXqHQRu3YauS+sZSwizesvb
         mRsl8/HPeBry1HOfgDINuaUuJghDtfbn201+eZ69CK2BdlQqjx2TH75Kb8dO2s0Nft63
         Md9MfDHuOV+ba9R5gus4WrM++DjOht/TAT89EpUqfaJ7vJ8Ow48wbULlibg+DhkRe4R+
         Ty6w==
X-Gm-Message-State: APuU4Z8GyaAiqQ2xgbR7Kh5nLG9W2IeAmzNT9wInEvTMVRWQK2fPWZp7
	mfuwTbFdzwBO7GDRlFSeN6of+ZDcAUSv0sz+5r/aHdvA0UeyQJrDw/dgZEgQrnoV5sw9mehjF4x
	5xRinw3um50qXBhhqfVpZDCD9dIRbxnk=
X-Gm-Gg: AYBFou007uklkMY2Bc7AaQnsa7jcMHaVSFPWzIg7usTZ+EsFF23ciE5Z/fgxO54Celw
	VwNi5GrymE0PIVtVieu3LftuxX5Ndmx85I7WJ+/5E6cOP3BirC6kqEl/pGv2ckW/Jjb1plunXx3
	ylNv+h8ndV3a8eiVGmUcQMPrqmMSR9xEeXF+nXFN5q/pQsljet4ld21FOCSVBwrNduqxVQVV7x2
	5eWm89cwSO++maPnz10qguXQgKN2dkrvZ1mv+gkfh+exqCX9n2O1kCmBFxVKvVAt5uMa60jfuwZ
	Ey9JSzBielcn/MtkI8xjGM9s0VbMDp5mlSdXM2GA7nsfUX5dfIsbpMl4SLkUSMPdSy7ffrd/XRI
	JaieXCfzuL28ig561URGLmfpNEztrqhIe6Gb6qT+ugiPZKO0ocaqOmWIGqeXv
X-Received: by 2002:a05:693c:65d5:b0:36a:1f8:a5a4 with SMTP id
 5a478bee46e88-37687213f9dmr4583665eec.38.1794441923814; Wed, 11 Nov 2026
 16:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20261106025416.631340-1-ragaprasanth@gmail.com> <73F56A84-6C13-47D4-99A4-A08613A3263D@arm.com>
In-Reply-To: <73F56A84-6C13-47D4-99A4-A08613A3263D@arm.com>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 12 Nov 2026 09:04:47 +0900
X-Gm-Features: AclHuK8dXsedQg2PkBulzgbzoIBvMRifCX1gyzHWYR8ASkHtiBY2H-pRTQnxFSY
Message-ID: <CAG7eodFD6zD-WNXjTF==4U1gGzqPjhMSExjYKxJc9beL55FERw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: fix NameError when upgrading a TMPDIR
 from ABI 14
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007067880660091130"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 00:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250061

--0000000000007067880660091130
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

I saw your commit, fair point.
As ABI 14 trees are honister or older, would it be better to drop the 14 ->
15 conversion instead? Those trees would then get the normal layout-change
message rather than a traceback. I can send a v2.

Thanks,
Prasanth


On Thu, Nov 12, 2026 at 2:45=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 6 Nov 2026, at 02:54, prasanth via openembedded-core <ragaprasanth=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > drop_v14_cross_builds() calls sstate_clean_manifest(), which is defined
> > in sstate.bbclass. Since the sanity code moved to lib/oe in 4efa61f049
> > ("sanity: Move code to lib/oe"), that name is no longer in scope, so a
> > TMPDIR with ABI 14 fails with:
>
> Whilst I agree that upgrading from ABI 14 shouldn=E2=80=99t cause an erro=
r, 15 was
> introduced in kirkstone so you=E2=80=99re presumably trying to use a buil=
d tree
> that previously was used to build gatesgarth/hardknott/honister?
>
> > -                    sstate_clean_manifest(m, d)
> > +
> bb.utils.exec_flat_python_func("sstate_clean_manifest", m, d)
>
> Why exec_flat_python_func?  Literally nothing has used this function sinc=
e
> 2016, I=E2=80=99ll send a patch to remove it.
>
> Ross
>
>

--0000000000007067880660091130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<br><br>I saw your commit, fair point.=C2=A0<div>A=
s ABI 14 trees are honister or older, would it be better to
drop the 14 -&gt; 15 conversion instead? Those trees would then get the nor=
mal layout-change message rather than a traceback. I can send a v2.=C2=A0<d=
iv><br>Thanks,<br>Prasanth<br><br></div></div></div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Nov 12, 2026 at 2:45=E2=80=AFAM Ross Burton &lt;<a href=3D"mailto:Ross.Bur=
ton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 6 Nov 2026, at 02:54, prasanth via open=
embedded-core &lt;ragaprasanth=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<br>
&gt; <br>
&gt; drop_v14_cross_builds() calls sstate_clean_manifest(), which is define=
d<br>
&gt; in sstate.bbclass. Since the sanity code moved to lib/oe in 4efa61f049=
<br>
&gt; (&quot;sanity: Move code to lib/oe&quot;), that name is no longer in s=
cope, so a<br>
&gt; TMPDIR with ABI 14 fails with:<br>
<br>
Whilst I agree that upgrading from ABI 14 shouldn=E2=80=99t cause an error,=
 15 was introduced in kirkstone so you=E2=80=99re presumably trying to use =
a build tree that previously was used to build gatesgarth/hardknott/honiste=
r?<br>
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 sstate_clean_manifest(m, d)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bb.utils.exec_flat_python_func(&quot;sstate_clean_manifest&quot;, m, d)<br=
>
<br>
Why exec_flat_python_func?=C2=A0 Literally nothing has used this function s=
ince 2016, I=E2=80=99ll send a patch to remove it.<br>
<br>
Ross<br>
<br>
</blockquote></div>

--0000000000007067880660091130--
