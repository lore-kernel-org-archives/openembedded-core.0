Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3349C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 13:58:47 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web09.9020.1643983126627962593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 05:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=beApCesF;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id w21so10939139uan.7;
        Fri, 04 Feb 2022 05:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I9khvmpK7OFeAR3nwiccLOM7kD/G215+b+bsOfzS2Vs=;
        b=beApCesFBEDcO4LP+dzAo1MavW+LfoJ83p18fIyvZmiYSOLpGPbr7uKnbwlxvHtI64
         tqYvx1jGOFFRG0sHwD/gj84pE/ZxHZEV0X5DosVWBi691FWBTUE28Y1lfNJGPb/5XAid
         CJaJRwwNf8cGxzypYCTEm0OntzPBypeqobsXHrA2JPyBWeIRutNd5boTdZ+tS+AKVstB
         hvPg869eCv2yVfPWVInae/p4Ppfwm97l2waWEJZI9WNOepIYJBbp2IrNqjB3UQ/VoTTA
         JX42abHHRBbcUHVLMXSDs/t5uTkYeTyWlv36yJDdC3oisCIrLDTGIWZSG68lXt057tZ5
         neaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I9khvmpK7OFeAR3nwiccLOM7kD/G215+b+bsOfzS2Vs=;
        b=SV2EyKgq6j1H38hPhPf+lbikBh37kHOpfJWkflb2O7jgqt3YKNvOXCnE4/73USehJU
         j9YpcQM5pbGGLHIr4kS3tmSpM49xql+F0oKWbdtSFcW9unEcvv2s1Cx9A/YoaORlgvVl
         3ILs1EgrQNcNs01Px2Z5J7M/Psa1wvNHE1j1k7i77KxPYruGxzjDErpTequ6psL66kmk
         BDTQ5bLbPqKSw1CyOQ/Hmy7O3Iphf41In4Bfu6vTc5vE/s/D38GBwlCGzFlM59tSQtx5
         XUHmdiPOaEPsNY7jw97rIuLSYRQ8q5Ujw7PwYqnNThVpTKldBbDrdLpY/fZdHqQvAP9r
         kDaQ==
X-Gm-Message-State: AOAM531ZdZi3+Zd6erpnZFg8iT/5LY/gVS/gtJv7P1Oy5aeyX2cVsNYl
	BdPfEs65cqlCLHhPT1wmKo5COuUc4RRX3bQFQQ4=
X-Google-Smtp-Source: 
 ABdhPJzNHBYwGKnsJj3gqxxzbo16iDKalKHmUbKCAbQTVXFoRSRKhetjV+LQ62p5nY7YTnVfIGoq8SCKeeubbviYRmI=
X-Received: by 2002:a67:ce95:: with SMTP id c21mr911573vse.81.1643983125686;
 Fri, 04 Feb 2022 05:58:45 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
 <lyiltukbsk.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyiltukbsk.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Feb 2022 14:58:34 +0100
Message-ID: 
 <CANNYZj9wOzJ-gp+HVP-915AQp9d-D_PN4GrgPqaC0ZLVvzbgqg@mail.gmail.com>
Subject: Re: [oe] [OE-core] Inclusive Language Proposal for YP/OE
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Jon Mason <jdmason@kudzu.us>,
 Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000392c5f05d731a68a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 13:58:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161346

--000000000000392c5f05d731a68a
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Feb 2022 at 14:21, Enrico Scholz via lists.openembedded.org
<enrico.scholz=sigma-chemnitz.de@lists.openembedded.org> wrote:

> "Jon Mason" <jdmason@kudzu.us> writes:
>
> > For BB_DISKMON_DIRS, the actions "ABORT, STOPTASKS and WARN" would
> > become "HALT, NO_NEW_TASKS and "WARN".
>
> I am not an native english speaker, but for "HALT" I will have to think
> twice whether it will pause the operation or abort it.  I would stay at
> "ABORT" because it makes much more clear what happens.
>

I'm not taking a stand here, but just providing the context for where the
push for avoidance of 'abort' comes from:
https://inclusivenaming.org/word-lists/tier-1/

Keep in mind that for non-native english speakers none of these words are
emotionally charged; they're just terms. Not so for native speakers.


> > BB_HASHCONFIG_WHITELIST -> BB_HASHCONFIG_IGNORE_VARS
> > BB_SETSCENE_ENFORCE_WHITELIST -> BB_SETSCENE_ENFORCE_IGNORE_TASKS
> > BB_HASHBASE_WHITELIST -> BB_BASEHASH_IGNORE_VARS
> > MULTI_PROVIDER_WHITELIST -> BB_MULTI_PROVIDER_ALLOWED
>
> The new variable names sound like boolean flags, not like lists.
>

I'd say the context should make it clear that they are lists (e.g. either
the initialization, or usage via iteration).

Alex

--000000000000392c5f05d731a68a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 4 Feb 2022 at 14:21, Enrico Scholz via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;enrico.scholz=3D<a href=
=3D"mailto:sigma-chemnitz.de@lists.openembedded.org">sigma-chemnitz.de@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">&quot;Jon Mason&quot; &lt;<a href=3D"mailto:jdmason@kudzu=
.us" target=3D"_blank">jdmason@kudzu.us</a>&gt; writes:<br>
<br>
&gt; For BB_DISKMON_DIRS, the actions &quot;ABORT, STOPTASKS and WARN&quot;=
 would<br>
&gt; become &quot;HALT, NO_NEW_TASKS and &quot;WARN&quot;.<br>
<br>
I am not an native english speaker, but for &quot;HALT&quot; I will have to=
 think<br>
twice whether it will pause the operation or abort it.=C2=A0 I would stay a=
t<br>
&quot;ABORT&quot; because it makes much more clear what happens.<br></block=
quote><div><br></div><div>I&#39;m not taking a stand here, but just providi=
ng the context for where the push for avoidance of &#39;abort&#39; comes fr=
om:</div><div><a href=3D"https://inclusivenaming.org/word-lists/tier-1/">ht=
tps://inclusivenaming.org/word-lists/tier-1/</a></div><div><br></div><div>K=
eep in mind that for non-native english speakers none of these words are em=
otionally charged; they&#39;re just terms. Not so for native speakers.<br><=
/div><div></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; BB_HASHCONFIG_WHITELIST -&gt; BB_HASHCONFIG_IGNORE_VARS<br>
&gt; BB_SETSCENE_ENFORCE_WHITELIST -&gt; BB_SETSCENE_ENFORCE_IGNORE_TASKS<b=
r>
&gt; BB_HASHBASE_WHITELIST -&gt; BB_BASEHASH_IGNORE_VARS<br>
&gt; MULTI_PROVIDER_WHITELIST -&gt; BB_MULTI_PROVIDER_ALLOWED<br>
<br>
The new variable names sound like boolean flags, not like lists.<br></block=
quote><div><br></div><div>I&#39;d say the context should make it clear that=
 they are lists (e.g. either the initialization, or usage via iteration).</=
div><div><br></div><div>Alex<br></div><br></div></div>

--000000000000392c5f05d731a68a--

