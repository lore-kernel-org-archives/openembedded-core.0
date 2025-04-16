Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B996C369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 04:51:11 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.11956.1744779068250549078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 21:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hbTcfEn1;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22c33e4fdb8so2934045ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 21:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744779068; x=1745383868; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pfxO4cO6eKxF/KCQOhby0Ivd61Q8oPAYoCTUlRHZqqs=;
        b=hbTcfEn1CkwF2owN3JlzlUPcFAGcylXm/TFbQV2beRvY+k3b0bPbPa1k08zAz73v1r
         RV5++nWoG3KhtIPeM2pRXeI+KMrzvLyfTNWxXrfFPjnA4HN/oL+j9agJs/I+0jGlE1jF
         PAIzSJOLOnaB4pE9+UMv+jXiTTctafK2t82Qlk4/2b4jeMQaq3dQtB/saHv9iSFRBsSw
         rhzKllGy+ovxqojr29f0xnUW4pIzhGfhL/8IH8125Rv7/k0nbpUmLcP6M648UMni4u0C
         HSr05bBIsoEPnafE9skU+qSsJdF9YVuhwHWCSP8fCRHJoJgi/iWa0mJeB2zXV/VzuVP8
         7naA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744779068; x=1745383868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfxO4cO6eKxF/KCQOhby0Ivd61Q8oPAYoCTUlRHZqqs=;
        b=qDL80fo07sz+Wh31TqPPbEvc7rPeMAfPf8DjLLTEbjQSeVPSmoDgQY+4TjX+VZCSFh
         rkRuy6772Xfj/wO6gZBnOUqsMSwv3TKHKy9sybpqtKIGjuFOdVudafK84IHZbgbax+wo
         ztCGBFI7u+KpWdqcze2oRZgMJtkbpxKX61+Nx9giyRcCmdBnEpi97+pmMj74ZXxdEQCp
         p3rpZ58pOJlQjd3mphe+PbV4KfetlFsMEQjpRT5jLgjX6a/3pZmdmeTYE/3bDKPCrF11
         uvzb5StJf9a1rnKWwAVzZ0LSct89Vv9S1aizMs/Pih8T/nvLmEj/81xW5aZPB89tYXW8
         fesA==
X-Gm-Message-State: AOJu0YwwmV8WLT2saWvBf28tr4foKdSepe84c7QAcL2MFBjsTfsLlRAP
	g7Lcz0YsBPRfgTV5RPXftv6sfysx8BahQ8nUeNm4bT+7/Unz97lY0aoHIO00IOkfDxNFJXx4haI
	hbQN+6gsvWht1ln90GULYWWxTSuM=
X-Gm-Gg: ASbGncuTmsTDSNNdT72SAs9wmNI7KE6oGTIdUJYZlNMojDHb+vnXx77Skpg8F43dvgt
	7b+1ouapjnPXnGyVJfivr3LIH4pL1UZoTc2EDCZCogXcZnmjTJa3X/WWgj/7kk69IkSj0swDFAz
	5Z3/vRU9pCWlafxpq74NdW0rGrfHpAbTei6zLipH0BuiXce+MLahLfJ7s=
X-Google-Smtp-Source: AGHT+IHVMdv22yqkHdT6lQOw0qSoqA4LfAl8fs4DHsVJFWNz/TclzVUw/CTvDc/qPg9foffbKcOSjiukE9INLKNrRMM=
X-Received: by 2002:a17:902:d48d:b0:224:10a2:cad9 with SMTP id
 d9443c01a7336-22c3596bf3emr6591335ad.41.1744779067503; Tue, 15 Apr 2025
 21:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <183683467BE332EC.10767@lists.openembedded.org>
In-Reply-To: <183683467BE332EC.10767@lists.openembedded.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 16 Apr 2025 06:50:54 +0200
X-Gm-Features: ATxdqUEHDgHT1tH9DCgD1iTgIFx5EVSXsO0OetHDUCW56LT3WU8veT4HNldNnNI
Message-ID: <CAApg2=RZpHZFTu372tKwzsLH6Y7URR5AjW=v2XnT3=YFBuwDiA@mail.gmail.com>
Subject: Re: [OE-core] VulnCon take-aways: NVD et al
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000087bf620632de08b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 04:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214973

--00000000000087bf620632de08b1
Content-Type: text/plain; charset="UTF-8"

Hello,
And as a follow up, MITRE's funding (so the CVE program) is uncertain after
April 16th :
https://www.securityweek.com/mitre-signals-potential-cve-program-deterioration-as-us-gov-funding-expires/

Interesting times ahead.

Regards
Marta

On Tue, 15 Apr 2025, 16:10 Marta Rybczynska via lists.openembedded.org,
<rybczynska=gmail.com@lists.openembedded.org> wrote:

> Hello,
> VulnCon is a conference on vulnerability management and related subjects
> and was held last week.
>
> My take-aways:
> - NVD situation is unlikely to change short-term
> - CVE programme is adding new features to the specification, but they are
> unlikely to make machine-readable identification mandatory (in general:
> anything that puts more work on CNAs)
> - there were discussion on standardizing end-of-life descriptions
> - discussed purl identification and confirmed (in a panel question) that
> it currently doesn't work for patched software or software with no package
> manager. Some options are possible like the github schema, but not in all
> cases.
> - next time it would be better to have more important representation from
> vulnerability data users, and present more real-world problems, especially
> in the embedded space.
>
> Videos from most talks will be available in around one month,
>
> Cheers
> Marta
>
> PS My blog post https://ygreky.com/2025/04/vulncon-2025-impressions/
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214946):
> https://lists.openembedded.org/g/openembedded-core/message/214946
> Mute This Topic: https://lists.openembedded.org/mt/112276783/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000087bf620632de08b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto">And as a follow up, MITRE&#39;s f=
unding (so the CVE program) is uncertain after April 16th :=C2=A0<a href=3D=
"https://www.securityweek.com/mitre-signals-potential-cve-program-deteriora=
tion-as-us-gov-funding-expires/">https://www.securityweek.com/mitre-signals=
-potential-cve-program-deterioration-as-us-gov-funding-expires/</a></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Interesting times ahead.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Regards=C2=A0</div><div dir=3D=
"auto">Marta</div></div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 15 Apr 2025, 16:10 Marta Ry=
bczynska via <a href=3D"http://lists.openembedded.org">lists.openembedded.o=
rg</a>, &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><div>Hello,</div><div>VulnCon is a conferen=
ce on vulnerability management and related subjects and was held last week.=
</div><div><br></div><div>My take-aways:</div><div>- NVD situation is unlik=
ely to change short-term<br></div><div>- CVE programme is adding new featur=
es to the specification, but they are unlikely to make machine-readable ide=
ntification mandatory (in general: anything that puts more work on CNAs)</d=
iv><div>- there were discussion on standardizing end-of-life descriptions</=
div><div>- discussed purl identification and confirmed (in a panel question=
) that it currently doesn&#39;t work for patched software or software with =
no package manager. Some options are possible like the github schema, but n=
ot in all cases.<br></div><div>- next time it would be better to have more =
important representation from vulnerability data users, and present more re=
al-world problems, especially in the embedded space.</div><div><br></div><d=
iv>Videos from most talks will be available in around one month,<br></div><=
div><br></div><div>Cheers</div><div>Marta</div><div><br></div><div>PS My bl=
og post <a href=3D"https://ygreky.com/2025/04/vulncon-2025-impressions/" ta=
rget=3D"_blank" rel=3D"noreferrer">https://ygreky.com/2025/04/vulncon-2025-=
impressions/</a></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214946): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214946" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/214946</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112276783/582=
7677" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/112276783/5827677</a><br>
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

--00000000000087bf620632de08b1--

