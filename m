Return-Path: <persaur@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E833C25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 00:06:48 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web10.10919.1716854805482277728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 17:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nrv/8B2m;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: persaur@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-df78b040314so265300276.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 17:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716854804; x=1717459604; darn=lists.openembedded.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdB99r1ZHiXz2HpaXdCLRBmb0v36vdLScIb9GAgunN4=;
        b=Nrv/8B2mMQrlarEP3ZFC7Nn6UVZa7rR9KN1iaS4LY9ZMEP5OtSlZn8maqEDIStTUHj
         AUPhNJCRfcLE2hmEQRVfjObPaZk+kV5F7AmhKHNB3TDzlvYQHjffJcbsyYyJpVaaknA1
         NPV0BUzH9psTMMrRImLz/9WEXpqc7er13trA6CkFq+TFNBJ2Qpa5Mn4tUu9po41PjbgD
         jIS1nzZwwGvSRAS0qKacaSCQ08WpV1+gpbje+q7r3HSqKwTLJEMIiDk7LdhMioyL0zN4
         BYRccY5HqknrobCFMRxkOrX0vd5GebJJi+J1K/S40CyVD7PXPfRWDXRyxRcXIA//z/pY
         QJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716854804; x=1717459604;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdB99r1ZHiXz2HpaXdCLRBmb0v36vdLScIb9GAgunN4=;
        b=gFp5epD8qFkaABZ6bZ19o9/eAbR1xXzWI/S5+PpX6G5sDvWGb0oJE86VJaOpBOC49w
         2P/wTMxpvWrQYD/KQvr2eoQn0zY8RTv3jNdO7JHXoS1lWY9aEHbKZsLLg6odN/Hn3gZ9
         rjpOHdztKqy690P0+IGvzWKp54qn4Jfj0pqFMn7IQMn53njeFa3OEqrPEIlHMHkKtMs1
         kQDAPMMcg2sPOh9wXLEmyoc0NbW2eA5B+xFqxhFYVQkiZxd6m27+24HjNhpQ6N2Rs50Y
         Y1mDBfkQqLOHS+zfv1a07UiHMd0+CqMeIggbioyAy9Y47zEqkuLkIDtekzyuXPdoES7I
         hJcw==
X-Forwarded-Encrypted: i=1; AJvYcCWfoHOSHnjgAozxH+HjvPJCXobHRK91rTxRr9wuMULFP2ZyX33CDQLhKA2yc6YF5GjWiIgxkeEGCBgjGivw1Y/blMKRhlQJeLypM69zuCxaNqybIar3etGs
X-Gm-Message-State: AOJu0YzZBfb44uY+87JkYscJGzwt1gsAXFCk4MTcOuyvkunTUgeIhyqG
	+0rPCR6L1257HO0zDfojaItWfbmVn1YydarXWOfswaUXpDPulDgC
X-Google-Smtp-Source: AGHT+IG37p34cMwOCQAKjqpDO9LjLhxO7SPcA5qIDFEpAYN4Rq424HW5uX/3HboyauGMTZIbvv/wUA==
X-Received: by 2002:a25:9348:0:b0:de6:d0a:ee3d with SMTP id 3f1490d57ef6-df7721c288dmr9644097276.30.1716854804327;
        Mon, 27 May 2024 17:06:44 -0700 (PDT)
Received: from smtpclient.apple (199-33-71-17.ord.as54203.net. [199.33.71.17])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df77472550esm753668276.52.2024.05.27.17.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 17:06:43 -0700 (PDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-F7B018AD-8F9B-4510-ADF4-C08F76470C02
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Mar 2024 01:00:01 AM HST
Date: Mon, 27 May 2024 20:06:32 -0400
Message-Id: <45F1D186-4A91-44DC-95FB-A2A2A29A4FCC@gmail.com>
References: <C58D6EAB-C160-41F3-BD60-B6CB3FD261FA@gmail.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>,
 Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex.kanavin@gmail.com>
In-Reply-To: <C58D6EAB-C160-41F3-BD60-B6CB3FD261FA@gmail.com>
To: yocto-security@lists.yoctoproject.org
X-Mailer: iPad Mail (21F90)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 00:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199948


--Apple-Mail-F7B018AD-8F9B-4510-ADF4-C08F76470C02
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mar 28, 2024, at 12:58, Rich Persaud <persaur@gmail.com> wrote:
> =EF=BB=BF
>> On Mar 28, 2024, at 12:37, Alexander Kanavin <alex.kanavin@gmail.com> wro=
te:
>>=20
>> =EF=BB=BFOn Thu, 28 Mar 2024 at 17:28, Marta Rybczynska <rybczynska@gmail=
.com> wrote:
>>> I think you weren't there at the weekly meeting when we discussed
>>> that: it started around Feb 14th and I see that in my data
>>> (I have a daily report).
>>>=20
>>> To make the story short: NVD is close to 0 activity since mid-February
>>> and there is no communication for now on why, what are the reasons
>>> etc.
>>> The security community is concerned and there are multiple ideas:
>>> amending/replacing the database, there is an open letter in the works
>>> etc.
>>> =46rom our practical view there's no automated solutions we can
>>> implement right now. I have some ideas and it would be good to discuss
>>> them,
>>> the next weekly meeting might be a good occasion.
>>=20
>> Probably alternatives to NVD will get increased attention too, which
>> is not a bad thing. This exposes NVD as the single point of failure,
>> and I can't see how they're going to restore trust.
>=20
> Funding has been an issue for years, e.g. many thousands of bug reports ne=
ver processed into CVEs, https://www.platformsecuritysummit.com/2019/speaker=
/sherman/

May 24th update:
https://therecord.media/nist-database-backlog-growing-vulncheck

> More than 90% of submissions to the government's National Vulnerabilities D=
atabase have not been analyzed or enriched since the agency announced cutbac=
ks in February, new research shows.
>=20
> Researchers from VulnCheck analyzed the NVD=E2=80=99s activity since it an=
nounced cutbacks on February 12 and found that of the 12,720 new vulnerabili=
ties added since then, 11,885 =E2=80=9Chave not been analyzed or enriched wi=
th critical data that help security professionals determine what software ha=
s been affected by a vulnerability.=E2=80=9D
>=20
> VulnCheck has a list of vulnerabilities it classifies as exploited and sai=
d nearly half of those bugs have not been analyzed by NVD since the slowdown=
. Another 82% of bugs that have a public proof-of-concept exploit have also n=
ot been examined, according to the company...
>=20
> =E2=80=9CWe recently enriched 1,300 CVEs and continue to diligently work t=
o ensure all submitted CVEs are enriched,=E2=80=9D CISA said. =E2=80=9CWe as=
k all CVE Numbering Authorities (CNAs) to provide complete CVEs when making i=
nitial submission to CVE.org.=E2=80=9D

--Apple-Mail-F7B018AD-8F9B-4510-ADF4-C08F76470C02
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"></div><div dir=3D"ltr">On M=
ar 28, 2024, at 12:58, Rich Persaud &lt;persaur@gmail.com&gt; wrote:</div><d=
iv dir=3D"ltr"><blockquote type=3D"cite">=EF=BB=BF</blockquote></div><blockq=
uote type=3D"cite"><div dir=3D"ltr"><meta http-equiv=3D"content-type" conten=
t=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"></div><div dir=3D"ltr">On M=
ar 28, 2024, at 12:37, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrot=
e:</div><div dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote></div><b=
lockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>On Thu, 28 Mar 2024 a=
t 17:28, Marta Rybczynska &lt;rybczynska@gmail.com&gt; wrote:</span><br><blo=
ckquote type=3D"cite"><span>I think you weren't there at the weekly meeting w=
hen we discussed</span><br></blockquote><blockquote type=3D"cite"><span>that=
: it started around Feb 14th and I see that in my data</span><br></blockquot=
e><blockquote type=3D"cite"><span>(I have a daily report).</span><br></block=
quote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote ty=
pe=3D"cite"><span>To make the story short: NVD is close to 0 activity since m=
id-February</span><br></blockquote><blockquote type=3D"cite"><span>and there=
 is no communication for now on why, what are the reasons</span><br></blockq=
uote><blockquote type=3D"cite"><span>etc.</span><br></blockquote><blockquote=
 type=3D"cite"><span>The security community is concerned and there are multi=
ple ideas:</span><br></blockquote><blockquote type=3D"cite"><span>amending/r=
eplacing the database, there is an open letter in the works</span><br></bloc=
kquote><blockquote type=3D"cite"><span>etc.</span><br></blockquote><blockquo=
te type=3D"cite"><span>=46rom our practical view there's no automated soluti=
ons we can</span><br></blockquote><blockquote type=3D"cite"><span>implement r=
ight now. I have some ideas and it would be good to discuss</span><br></bloc=
kquote><blockquote type=3D"cite"><span>them,</span><br></blockquote><blockqu=
ote type=3D"cite"><span>the next weekly meeting might be a good occasion.</s=
pan><br></blockquote><span></span><br><span>Probably alternatives to NVD wil=
l get increased attention too, which</span><br><span>is not a bad thing. Thi=
s exposes NVD as the single point of failure,</span><br><span>and I can't se=
e how they're going to restore trust.</span><br></div></blockquote><br><div>=
Funding has been an issue for years, e.g. many thousands of bug reports neve=
r processed into CVEs,&nbsp;<a href=3D"https://www.platformsecuritysummit.co=
m/2019/speaker/sherman/">https://www.platformsecuritysummit.com/2019/speaker=
/sherman/</a></div></div></blockquote><div><br></div>May 24th update:<br><di=
v><a href=3D"https://therecord.media/nist-database-backlog-growing-vulncheck=
">https://therecord.media/nist-database-backlog-growing-vulncheck</a></div><=
div><br></div><div></div><blockquote type=3D"cite"><div>More than 90% of sub=
missions to the government's National Vulnerabilities Database have not been=
 analyzed or enriched since the agency announced cutbacks in February, new r=
esearch shows.</div><div><br></div><div>Researchers from VulnCheck analyzed t=
he NVD=E2=80=99s activity since it announced cutbacks on February 12 and fou=
nd that of the 12,720 new vulnerabilities added since then, 11,885 =E2=80=9C=
have not been analyzed or enriched with critical data that help security pro=
fessionals determine what software has been affected by a vulnerability.=E2=80=
=9D</div><div><br></div><div></div></blockquote><div></div><blockquote type=3D=
"cite"><div>VulnCheck has a list of vulnerabilities it classifies as exploit=
ed and said nearly half of those bugs have not been analyzed by NVD since th=
e slowdown. Another 82% of bugs that have a public proof-of-concept exploit h=
ave also not been examined, according to the company...</div><br><div>=E2=80=
=9CWe recently enriched 1,300 CVEs and continue to diligently work to ensure=
 all submitted CVEs are enriched,=E2=80=9D CISA said. =E2=80=9CWe ask all CV=
E Numbering Authorities (CNAs) to provide complete CVEs when making initial s=
ubmission to CVE.org.=E2=80=9D</div></blockquote></body></html>=

--Apple-Mail-F7B018AD-8F9B-4510-ADF4-C08F76470C02--

