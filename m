Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10276.1795000215577495047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OJ7bAeoN;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9210f2622ccso8721646d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 03:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795000214; cv=none;
        d=google.com; s=arc-20260327;
        b=kMz57j8P1E0gHQn5z36jEXiLjCEh1ZkUJoNIhHANSOa6OjCIf1LB7dEd9C83Kw3Wby
         ylWXyznyNFLgUmrxJb7F7UNmP0RL+z9KxnEL7KvUc1uuNsjiqm1eOwPRx96fl020/9/a
         NnmyrJ4Lvcm698kiolPL6iC0BcZJ5YSst/C1HwO0DDizHE8Nd76wSzz8EFU2fj+YGJCf
         +CF3NmcqrdpZU40inHt7Hj7mzQcZrNY/NlkOaLMFzKOxKIWGzEFjswaf941SZZMBBo7f
         JIMXGmcV2ragCi/U7FQQ8I3gsEhqnbJ1gcPyM+fUt+JwuKQaEBAvUmsZfFE9L1NvsyJU
         CSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0cSejceytLKWbAea+tiN57pHDwwVUYpXZemwzoF0vCo=;
        fh=GUUmjUNkH/WLFTiL0vCuwckdVXyzWNVqjMAG1DgDQoQ=;
        b=pZYh+i4xMCTVH/UyB5GzqdNipxAW15y07A7mVaUivxBVOQ+wVZze8Z/rSYuS2Lq9r8
         OpjfjA8qI3+XjY+P0RhjYu3lnUckOnI5sPFGKGmxwsZx07pVUexnocrVahnid5Urra06
         PNSyellg6R0F+KvCWgLmrV6iFsDIHkfmCxjtHBVXJhG4sKsMuGSV18go/n2jDU6PB31N
         v3WiNMDgasVUoOCZDy+xiVNumgeEnW+Cs8xqPt6hOIwX4hZQzcA5xeDdbTW7oooh7XG3
         a3Xl3svquBjheWpX6TlpjdCLBtCK9uUnMNd6hqVb6sXhKcjQXRGf4oB88yPfsjQ/L0e1
         DtaA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000214; x=1795605014; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cSejceytLKWbAea+tiN57pHDwwVUYpXZemwzoF0vCo=;
        b=OJ7bAeoNmcY18KWerus4YVpbD35ZmPmofkyXElxg/eIyBtSOhMYGITz/VhKfMrxz85
         8HpmPHFyMen3rWBWgtZR+kFb6gntzbGPNKl3Jukbq9H7HMtX3SDiNX8IT1Dn+aZ28+qA
         YWtB+6JlsZBynCfoCfaZLroJneiXplq2TDunQm+uh0foJsqlUgrxE34GB129ekdpIDFE
         tNRjgU2bgyqvtCXlIfdxhgGiqQZpGd3+E2ocohTEtuPVNU04IkUfep3A0Sofvg5+zn3E
         wQivX7lrYHDJ3WW0nkxCk4F6ey15buIaJXajaoKAgD++oe5d3mWX+IYZfIvj1yjTIoTv
         boNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000214; x=1795605014;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0cSejceytLKWbAea+tiN57pHDwwVUYpXZemwzoF0vCo=;
        b=M85PmNyCmgviufFGfOOiUHF7ugo3iYhDZjcDo3Hi+zsrbQQqx/BYlPEtcCaSlchh6l
         RDrlCRjwSVXosAode6Txks+TdcAPV7Thp6r31tqljCrh5w4GGI8sRsESP0Aq9f+jtE3k
         FiGAL0/p67vh2xWiDpyvMAvWUsAi4VgzKT64v7wfm3UzapshpTRFxqTnVHZewC3szhAe
         kGlHqf903ej/jhXyWM+VVwdcM2lBMwWckmA6+kF/J39zFXsKV2dDiqTYiNgKXtGymMIA
         LcnYRNBdWCwVSlp47geopp7d5jkQErmUsRv5r6TjRMGMFiZCMsna860IS47aBsjK/Lk0
         6DdA==
X-Forwarded-Encrypted: i=1; AL+hErHjYo3KbFEOqE5ZNvHl1Dl8nUn/38kofneyUMB6v5eigxdU2L+9m3ktNGzDTblUwqAOjCUxc1VI4mt2/JncCSjeWA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9Ec1ZUc2tf30LvZs2eQQ0Cch8/nBeiF0YZ95/KIh6e6p9AZqdF
	x43cdMiXrg+q7mPMCsBpMy05nJbt4C/Tm1nZlegIh5v6z8VPgapEGCORCoxhhJTT+eX4JyFYfJo
	dUl/4j80M7kVD0LC5ahzN+0ObryNoJiM=
X-Gm-Gg: AZFdTZdni6O8HAq5ACej4zKYKIwpLLKIFEPiq5E+aYKE/HZ/RKYBnJxJ6JKiA4Ey+3/
	ff+cpPAqeIkaeXhS+QG1pH1kP58O4vcJHYtdhHO8BakI0n+MZO5PrtArxYMiiGtF2NSUb4XOQUc
	3GC3gXdDEfhVBbufDYa8foG33IkH39K4K13zCa3b3qwsujCKFMN8L2z1/TaozB7uhRv41If2MFA
	DOgQMxwmn9HXfoFiyYEXvuNxlYi45MNlNVyuH6xlNLYl6jyeUkERTyTdLy1xkrd3TkXfSJsTEpB
	+ly3zk8W8qfwSRU5Mz4t/MFStpI5sSZYqqM300xF5MhLWV67+RRFoU2ShV4T2NZw+Q/rTs1uyqk
	lAOIyCR6CadtYEapumZ3Jbd9P5oo7gyvyRwDRd9Wj/IHAZLdiPIrN7zSJ
X-Received: by 2002:a05:6214:258a:b0:91e:8f70:8680 with SMTP id
 6a1803df08f44-92114ca88f7mr32620096d6.3.1795000214344; Wed, 18 Nov 2026
 03:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20261117164151.1362220-1-yoann.congal@smile.fr>
 <CANNYZj9Uj5v-Tb1TrA+TrxrdEyjO+qj25byZ0fWtUpiLHKH-DA@mail.gmail.com> <0fabfef3-dbe6-4fe4-8f7e-d5f8ad47f27f@kernel.crashing.org>
In-Reply-To: <0fabfef3-dbe6-4fe4-8f7e-d5f8ad47f27f@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Nov 2026 12:10:03 +0100
X-Gm-Features: Aa3M54qCVjnl8liTB9ViZMWTOZUCiWefM_vwwllafHFOQyBlIfn5PLlndPJj_rU
Message-ID: <CANNYZj-QWR+BDPzG5b1sn2oKBjk0CzYEB8_KgyC32-QfPdkUhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pseudo: inherit upstream-stable-release-point
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: yoann.congal@smile.fr, yocto-patches@lists.yoctoproject.org, 
	OE-core ML <openembedded-core@lists.openembedded.org>, mark.hatle@amd.com
Content-Type: multipart/alternative; boundary="00000000000025d7f306608b0e80"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 11:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250540

--00000000000025d7f306608b0e80
Content-Type: text/plain; charset="UTF-8"

The question is whether point releases of pseudo add only bugfixes? It's
not about 1.9 specifically, but any future release, e.g. 2.0.x as well.

The policy for what is acceptable is documented here:
https://docs.yoctoproject.org/ref-manual/release-process.html#criteria-for-qualifying-upstreams

Alex

On Wed, 18 Nov 2026 at 11:55, Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

> While pseudo is heavily driven by Yocto Project (and OpenEmbedded)
> requirements,
> I'm not treating this as a YP/OE specific project.
>
> When I say pseudo-1.9 has a stable API, I mean that.  The intention is
> that
> development happens in master.  Stable branches can have backports, as
> required/requested by contributors, but these backports need to "feel"
> stable,
> have a stable API (don't change command line arguments, don't change
> system
> requirements, etc.)
>
> Is there an official list of what is and isn't allowed no.  What pseudo
> does is
> so specialized, I don't think I could come up with a documented set will
> and
> won't.  I also don't expect any applications to write such a list as in
> the end
> it is up to the contributors and maintainers to weigh each patch to
> determine if
> it feels appropriate to go on a stable branch.  But in practice I expect
> if
> someone using pseudo-1.9 experiences breakage due to security fixes in an
> existing platform release we'll backport the fixes there.  But I do not
> intend
> to carry forward pseudo-1.9 forever and into newer host releases.
>
> So in short:
>
> 1. New Development goes to master (or equivalent)
> 2. Backports from master to a numbered branch can be requested
> 3. Priority for backports will be given to resolve breaking issues in
> known
> working hosts, generally centered around Yocto Project/OpenEmbedded as
> that is
> our primary test vehicle.
> 4. We do not intend API changes to be backported to older version.  (It's
> not a
> stronger statement, because with the security backports happening in
> distributions, it might be required at some point.)
>
> --Mark
>
> On 11/17/26 11:13 AM, Alexander Kanavin via openembedded-core wrote:
> > On Tue, 17 Nov 2026 at 17:42, Yoann Congal via openembedded-core
> > <yoann.congal=smile.fr@lists.openembedded.org
> > <mailto:smile.fr@lists.openembedded.org>> wrote:
> >
> >
> >     Pseudo now has a stable branch pseudo-1.9 with pseudo-1.9.x tags on
> it.
> >
> >
> > Is this branch collecting only bugfixes (or fixes needed for continuing
> > operation of yocto release branches)? Is this going to be a policy for
> any
> > future point releases, or is it a one-off just for 1.9.x? There should
> be
> > confirmation of these questions, in addition to the existence of the
> branch.
> >
> > Alex
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#250463):
> https://lists.openembedded.org/g/openembedded-core/message/250463
> > Mute This Topic: https://lists.openembedded.org/mt/122316790/3616948
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> mark.hatle@kernel.crashing.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000025d7f306608b0e80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The question is whether point releases of pseudo add =
only bugfixes? It&#39;s not about 1.9 specifically, but any future release,=
 e.g. 2.0.x as well.</div><div><br></div><div>The policy for what is accept=
able is documented here:</div><div><a href=3D"https://docs.yoctoproject.org=
/ref-manual/release-process.html#criteria-for-qualifying-upstreams">https:/=
/docs.yoctoproject.org/ref-manual/release-process.html#criteria-for-qualify=
ing-upstreams</a></div><div><br></div><div>Alex</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Wed, 18 Nov 2026 at 11:55, Mark Hatle &lt;<a href=3D"mailto:mark.hatle=
@kernel.crashing.org">mark.hatle@kernel.crashing.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">While pseudo is heavily=
 driven by Yocto Project (and OpenEmbedded) requirements, <br>
I&#39;m not treating this as a YP/OE specific project.<br>
<br>
When I say pseudo-1.9 has a stable API, I mean that.=C2=A0 The intention is=
 that <br>
development happens in master.=C2=A0 Stable branches can have backports, as=
 <br>
required/requested by contributors, but these backports need to &quot;feel&=
quot; stable, <br>
have a stable API (don&#39;t change command line arguments, don&#39;t chang=
e system <br>
requirements, etc.)<br>
<br>
Is there an official list of what is and isn&#39;t allowed no.=C2=A0 What p=
seudo does is <br>
so specialized, I don&#39;t think I could come up with a documented set wil=
l and <br>
won&#39;t.=C2=A0 I also don&#39;t expect any applications to write such a l=
ist as in the end <br>
it is up to the contributors and maintainers to weigh each patch to determi=
ne if <br>
it feels appropriate to go on a stable branch.=C2=A0 But in practice I expe=
ct if <br>
someone using pseudo-1.9 experiences breakage due to security fixes in an <=
br>
existing platform release we&#39;ll backport the fixes there.=C2=A0 But I d=
o not intend <br>
to carry forward pseudo-1.9 forever and into newer host releases.<br>
<br>
So in short:<br>
<br>
1. New Development goes to master (or equivalent)<br>
2. Backports from master to a numbered branch can be requested<br>
3. Priority for backports will be given to resolve breaking issues in known=
 <br>
working hosts, generally centered around Yocto Project/OpenEmbedded as that=
 is <br>
our primary test vehicle.<br>
4. We do not intend API changes to be backported to older version.=C2=A0 (I=
t&#39;s not a <br>
stronger statement, because with the security backports happening in <br>
distributions, it might be required at some point.)<br>
<br>
--Mark<br>
<br>
On 11/17/26 11:13 AM, Alexander Kanavin via openembedded-core wrote:<br>
&gt; On Tue, 17 Nov 2026 at 17:42, Yoann Congal via openembedded-core <br>
&gt; &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" =
target=3D"_blank">smile.fr@lists.openembedded.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:smile.fr@lists.openembedded.org" target=
=3D"_blank">smile.fr@lists.openembedded.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Pseudo now has a stable branch pseudo-1.9 with pseu=
do-1.9.x tags on it.<br>
&gt; <br>
&gt; <br>
&gt; Is this branch collecting only bugfixes (or fixes needed for continuin=
g <br>
&gt; operation of yocto release branches)? Is this going to be a policy for=
 any <br>
&gt; future point releases, or is it a one-off just for 1.9.x? There should=
 be <br>
&gt; confirmation of these questions, in addition to the existence of the b=
ranch.<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#250463): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/250463" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/250463</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/12231679=
0/3616948" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/122316790/3616948</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:mark.hatle@kernel.cra=
shing.org" target=3D"_blank">mark.hatle@kernel.crashing.org</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div>

--00000000000025d7f306608b0e80--
