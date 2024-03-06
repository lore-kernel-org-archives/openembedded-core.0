Return-Path: <jonathan@joggee.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620DFC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 13:34:19 +0000 (UTC)
Received: from 8.mo582.mail-out.ovh.net (8.mo582.mail-out.ovh.net [178.33.42.204])
 by mx.groups.io with SMTP id smtpd.web11.11767.1709732058207694316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 05:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: joggee.fr, ip: 178.33.42.204, mailfrom: jonathan@joggee.fr)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.148.106])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TqYLc3cPtz1GMJ
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Mar 2024 13:34:16 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-dhjbs (unknown [10.110.178.25])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id DB2201FEAC
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Mar 2024 13:34:15 +0000 (UTC)
Received: from joggee.fr ([37.59.142.99])
	by ghost-submission-6684bf9d7b-dhjbs with ESMTPSA
	id QV5BCddw6GX+EAAAU+SFwA
	(envelope-from <jonathan@joggee.fr>)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 13:34:15 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-99G003ab8a534d-4a60-4ef6-a5a7-747d0f0e5cff,
                    622E3D65E487744B431855700C0379CF46E4D1D2) smtp.auth=jonathan@joggee.fr
X-OVh-ClientIp: 209.85.160.44
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-21f3a4ba205so2961686fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 05:34:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1T/Fr0Gs/04/C8D/CaetP3h0Jb8OAQ3BEtJmLUL77oYTJSqW1eYXBTFyF00oVpGuyLWrcWuoVVimO6vU/1tRi4VdoAMpufF8UYOoERT+i52ve3cJ63mW8
X-Gm-Message-State: AOJu0YyjS6UcHWmQ35QnX6wj4yN/JSywRNiN+ALc3e3XUKN5XsUZR/I+
	KhMtV1vqGHuTBCzdd5BKmISvAJF/5veiUu13cQG2YcEpNZc6ZC3GBTkBF9VWouYXKVCpAf9X3iQ
	xoWooPKE//Ra4AU1WoNqgeWUjY1c=
X-Google-Smtp-Source: AGHT+IGOvQfTZfL0Dp/cI9p4DrcH2cH+FlKX1xlV8ZG5gIcOBPvriLyaLGs1IwmVINH3xOc2L6xyWU8UM44FSILEIII=
X-Received: by 2002:a05:6871:b27:b0:21f:1547:35cc with SMTP id
 fq39-20020a0568710b2700b0021f154735ccmr5446360oab.47.1709732053671; Wed, 06
 Mar 2024 05:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20240227085722.2025994-1-xiangyu.chen@eng.windriver.com>
 <CANNYZj_uUATQFE54rkXaCiUqPRyaRvRWDJdhH0gGwBd9WHiLjA@mail.gmail.com>
 <4823ed44-2ba4-4d18-86c2-e6dc426e0a46@eng.windriver.com> <CANNYZj-FRp6uO9zVW-82JXBcArSQ6EMB7S444Wff5RNOtv6U1w@mail.gmail.com>
 <baece317-a250-4e8c-adb3-1e3227d0e9a6@eng.windriver.com> <CANNYZj-gAZjoAAMUVLhS5NPOz_Lh+NHdCB+pT+ifM2+sPnUGZA@mail.gmail.com>
 <476d00b2-8d19-40e2-b15a-995cb44edd39@eng.windriver.com>
In-Reply-To: <476d00b2-8d19-40e2-b15a-995cb44edd39@eng.windriver.com>
From: Jonathan GUILLOT <jonathan@joggee.fr>
Date: Wed, 6 Mar 2024 14:34:03 +0100
X-Gmail-Original-Message-ID: <CAA_hxbQNSoJt2PZG6hWpxAJGSWyXNaLkAKhxm=Y9NWi3qJHjMw@mail.gmail.com>
Message-ID: <CAA_hxbQNSoJt2PZG6hWpxAJGSWyXNaLkAKhxm=Y9NWi3qJHjMw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] bash: add locale alias for ja_JP shiftjis in run-ptest
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b8649d0612fe030b"
X-Ovh-Tracer-Id: 8131249128092667003
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfhgjhfffkffuvfevtgesrgdtreertddtjeenucfhrhhomheplfhonhgrthhhrghnucfifgfknffnqffvuceojhhonhgrthhhrghnsehjohhgghgvvgdrfhhrqeenucggtffrrghtthgvrhhnpeetfeejvddvtdetudejhefftdelgeejgfffueeuheeijeeuheffudduieehfeehtdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeduvdejrddtrddtrddupddvtdelrdekhedrudeitddrgeegpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhhonhgrthhhrghnsehjohhgghgvvgdrfhhrpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 13:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196677

--000000000000b8649d0612fe030b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Chen,

It does not seem to be the main issue, but here is an other strange thing I
noticed in the locale.alias file. Indeed, the file (provided by the
glibc-locale-alias package) in my environment already contains this line:
japanese.sjis   ja_JP.SJIS

I understand that ja_JP.SJIS is expected to be the "real" locale name.
However, your patch sets it as an alias for  ja_JP.shiftjis.

Regards,
Jonathan

Le jeu. 29 f=C3=A9vr. 2024 =C3=A0 11:27, Xiangyu Chen <xiangyu.chen@eng.win=
driver.com>
a =C3=A9crit :

>
> On 2/29/24 18:09, Alexander Kanavin wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > On Thu, 29 Feb 2024 at 11:00, Xiangyu Chen
> > <xiangyu.chen@eng.windriver.com> wrote:
> >
> >> And also i met a problem, most of cases are comparing test log with
> >> pre-test log from maintainer as the test result that line
> >> number/space/path/new line is produced causes diff failed,
> >>
> >> but in fact they are not a real test failure, the result still need to
> >> verify by manual, seems cannot do the automation test, any suggestion =
on
> >> that?
> > All of this seems to indicate that the bash test suite is not meant
> > for independent execution, and is only intended for bash maintainers.
> > Perhaps you should clarify this with them first, and then also point
> > out specific problems you are facing. Basically, engage with bash
> > upstream, and see if they're interested in helping you to improve
> > tests to the point where we can re-enable them. If there's no such
> > interest, we shouldn't have to continuously add fixes and workarounds.
> >
> > Whether the whole effort is worth your time is a question I leave for
> > you to answer :)
>
> Aha, thanks for your information :)
>
> Yes, from the result, it seems only intended for bash maintainers and
> not fit for other automation yet.
>
> I think firstly i need to check the history of bash maillist to see
> whether others sent this topic and the result of discussion on that.
>
>
> Thanks :D
>
>
> Br,
>
> Xiangyu
>
>
> >
> > Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196427):
> https://lists.openembedded.org/g/openembedded-core/message/196427
> Mute This Topic: https://lists.openembedded.org/mt/104599698/8060005
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jonathan@joggee.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b8649d0612fe030b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
<div>Hi Chen,</div><div><br></div><div>It does not seem to be the main issu=
e, but here is an other strange thing I noticed in the locale.alias file. I=
ndeed, the file (provided by the glibc-locale-alias package) in my environm=
ent already contains this line:</div><div>japanese.sjis =C2=A0 ja_JP.SJIS</=
div><div><br></div><div>I understand that
ja_JP.SJIS is expected to be the &quot;real&quot; locale name. However, you=
r patch sets it as an alias for=C2=A0 ja_JP.shiftjis. <br></div><div><br></=
div><div>Regards,</div><div>Jonathan<br></div>

</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Le=C2=A0jeu. 29 f=C3=A9vr. 2024 =C3=A0=C2=A011:27, Xiangyu Chen &lt;<a href=
=3D"mailto:xiangyu.chen@eng.windriver.com">xiangyu.chen@eng.windriver.com</=
a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
On 2/29/24 18:09, Alexander Kanavin wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt;<br>
&gt; On Thu, 29 Feb 2024 at 11:00, Xiangyu Chen<br>
&gt; &lt;<a href=3D"mailto:xiangyu.chen@eng.windriver.com" target=3D"_blank=
">xiangyu.chen@eng.windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; And also i met a problem, most of cases are comparing test log wit=
h<br>
&gt;&gt; pre-test log from maintainer as the test result that line<br>
&gt;&gt; number/space/path/new line is produced causes diff failed,<br>
&gt;&gt;<br>
&gt;&gt; but in fact they are not a real test failure, the result still nee=
d to<br>
&gt;&gt; verify by manual, seems cannot do the automation test, any suggest=
ion on<br>
&gt;&gt; that?<br>
&gt; All of this seems to indicate that the bash test suite is not meant<br=
>
&gt; for independent execution, and is only intended for bash maintainers.<=
br>
&gt; Perhaps you should clarify this with them first, and then also point<b=
r>
&gt; out specific problems you are facing. Basically, engage with bash<br>
&gt; upstream, and see if they&#39;re interested in helping you to improve<=
br>
&gt; tests to the point where we can re-enable them. If there&#39;s no such=
<br>
&gt; interest, we shouldn&#39;t have to continuously add fixes and workarou=
nds.<br>
&gt;<br>
&gt; Whether the whole effort is worth your time is a question I leave for<=
br>
&gt; you to answer :)<br>
<br>
Aha, thanks for your information :)<br>
<br>
Yes, from the result, it seems only intended for bash maintainers and <br>
not fit for other automation yet.<br>
<br>
I think firstly i need to check the history of bash maillist to see <br>
whether others sent this topic and the result of discussion on that.<br>
<br>
<br>
Thanks :D<br>
<br>
<br>
Br,<br>
<br>
Xiangyu<br>
<br>
<br>
&gt;<br>
&gt; Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196427): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196427" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196427</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104599698/806=
0005" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104599698/8060005</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jonathan@joggee.fr" target=
=3D"_blank">jonathan@joggee.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b8649d0612fe030b--

