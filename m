Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id EBA1E7CDC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:30:21 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id h22so6434161edw.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JVjFHaXm8TTD3/F2wB2OmG2/81RmrQE/XAFLwS4Ao9o=;
	b=pabKQtcjRF23xaq+wdAJ9BDczQLgxCEFCF3FF84ZQIeA+fhvzj+ShcecGpVKY+o/9b
	IDbM0t6dNg+r8vas3EEke3gHsuUwW4+AYJI+dqPO9maePxPJ3GRBrCn1XTxV4oLkfDXz
	aPlWjk4o6bcPLq2FDu0AuvYw8cfOsMvVqLaKGzd3d84vfwpEREVPztxGf3YgB2yQytXk
	2RdzFtcVO58LbxkWdUSTIjypwwajbWcSQ5JADsvGkujL43hahlB74fFW8/Shk93enxI2
	/HThN8NSBwgGQ6X63PKerA+rtpzPSqzEgErFGB+z84J+UnLaOJ05lqm3TMNxl60bMTec
	HWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JVjFHaXm8TTD3/F2wB2OmG2/81RmrQE/XAFLwS4Ao9o=;
	b=NTBVu5flal2w7T7zaCjPtAxnorp6Jc41YRNQD2c9qgyIZ1Z2mq3/CV2jLWtXBKYVTn
	w1NAirYpqs5z0+ZfphfjpZEKrXroUEKa9dFgojmyWWWGQZ3JpcaYYtuf839++EGiuQFU
	bFPKCo3MiceAKLxPxlolmwFkycWU0uZJFSzfD3VP0753cnbdogMcYCHYFxGAZsXpJ455
	BHAM4lSHPOeUDdJU1lU5jMHJg51O3WyuSyeWJnpJNrIYohVzWCeatkxdgm9lBis7H4Mp
	xemqAULSbC5lH0WTe5BCe4H6URWUt/XCMtVKNc5ePW2xlMKTTsr/gf/DNOKCbxgGXodB
	gakw==
X-Gm-Message-State: APjAAAXX9juxVOkVQlL+gDQ5WG2yPALs8NS5Ha7V79KVMA0ix7YPItQc
	G63d4WDvM8FGDb20+f6754Z9knT2WoJvC9+u8uI=
X-Google-Smtp-Source: APXvYqwGshpOh6/O2pyK/XNJmnnKuBMuMWH65mUOOS+AOkqf8lQK8BD/2BpWmCv4FBbU1+tgN7nAffnkntI4AjlDgZ4=
X-Received: by 2002:a17:906:f87:: with SMTP id
	q7mr14611497ejj.237.1553013022637; 
	Tue, 19 Mar 2019 09:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <031101d4de63$7488adb0$5d9a0910$@gmail.com>
In-Reply-To: <031101d4de63$7488adb0$5d9a0910$@gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Tue, 19 Mar 2019 10:30:10 -0600
Message-ID: <CAFNP8OuSti2RCJgdh8zWokhBGd3pmy-CQOiTVOxyjL_99geFcA@mail.gmail.com>
To: sjolley.yp.pm@gmail.com
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW12'19
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
X-List-Received-Date: Tue, 19 Mar 2019 16:30:22 -0000
Content-Type: multipart/alternative; boundary="0000000000008bc588058475050a"

--0000000000008bc588058475050a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Here is a "start" at publicly documenting QA... I started on this a while
back and got content from Richard only.  It would be good to have eyes on
this so it could be completed.  There are holes and stuff may have
changed.  If you want, please look it over and send me feedback.

See https://yoctoproject.org/docs/scott_temp/test-manual/test-manual.html

Thanks,
Scott

On Tue, Mar 19, 2019 at 8:53 AM <sjolley.yp.pm@gmail.com> wrote:

> Current Dev Position: YP 2.7 M3 (New feature Freeze has begun.)
>
> Next Deadline: YP 2.7 M3 Cutoff was Feb. 25, 2019
>
>
>
> SWAT Team Rotation:
>
>    - SWAT lead is currently: Armin
>    - SWAT team rotation: Armin -> Paul on Mar. 23, 2019
>    - SWAT team rotation: Paul -> Ross on Mar. 30, 2019
>    - https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>
>
>
> Key Status/Updates:
>
>    - M3 has not built yet however most major pieces are in place,
>    including now, agreement on the new QA process. The delay is partly du=
e to
>    RP travel with others able to cover being unavailable for other reason=
s,
>    combined with infrastructure issues.
>    - The remaining questions for M3 are:
>       - Public documentation of the new QA process
>       - Upgrade for uninative for glibc 2.29
>       - Mesa upgrade? (unlikely given failures in testing)
>    - The Yocto Project has updated to its new governance model which
>    includes establishing a Technical Steering Committee (TSC) for Yocto
>    Project. This is designed to complement  and work alongside the
>    OpenEmbedded TSC. Three members of the YP TSC are selected by the Yoct=
o
>    Project governing board and those people are Ross Burton, Khem Raj and
>    Richard Purdie. The remaining two seats will be elected by OpenEmbedde=
d. It
>    is intended the TSC will take over the release process, SWAT team, bug
>    triage and feature planning/development for 2.8.
>    - YP 2.5.3 continues to be blocked on autobuilder-helper changes for
>    the stable branches and the resulttool changes in master to move to th=
e new
>    QA process.
>    - There is discussion on the openembedded-architecture list about
>    changes to the stable branch patch criteria to bring us more into line=
 with
>    current industry best practices and thinking.
>
>
>
> Planned Releases for YP 2.7:
>
>    - YP 2.7 M3 Cutoff was Feb. 25, 2019
>    - YP 2.7 M3 Release Target was Mar. 8, 2019
>    - YP 2.7 M4 Cutoff is Apr. 1, 2019
>    - YP 2.7 M4 Release Target is Apr. 26, 2019
>
>
>
> Planned upcoming dot releases:
>
>    - YP 2.5.3 (Sumo) will be targeted after YP 2.7 M2 is done.
>    - YP 2.5.4 (Sumo) will be targeted after YP 2.7 M4 is done.
>    - YP 2.6.2 (Thud) will be targeted after YP 2.5.4 is done.
>
>
>
> Tracking Metrics:
>
>    - WDD 2432 (last week 2439) (
>    https://wiki.yoctoproject.org/charts/combo.html)
>    - Poky Patch Metrics
>       - Total patches found: 1526 (last week 1523)
>       - Patches in the Pending State: 656 (43%) [last week 657 (43%)]
>
>
>
> Key Status Links for YP:
>
> https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule
>
> https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features
>
>
>
> The Status reports are now stored on the wiki at:
> https://wiki.yoctoproject.org/wiki/Weekly_Status
>
>
>
> [If anyone has suggestions for other information you=E2=80=99d like to se=
e on this
> weekly status update, let us know!]
>
>
>
> Thanks,
>
>
>
> *Stephen K. Jolley*
>
> *Yocto Project Project Manager*
>
> (    *Cell*:                (208) 244-4460
>
> * *Email*:              *sjolley.yp.pm@gmail.com
> <sjolley.yp.pm@gmail.com>*
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000008bc588058475050a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi, <br></div><div><br></div><div>He=
re is a &quot;start&quot; at publicly documenting QA... I started on this a=
 while back and got content from Richard only.=C2=A0 It would be good to ha=
ve eyes on this so it could be completed.=C2=A0 There are holes and stuff m=
ay have changed.=C2=A0 If you want, please look it over and send me feedbac=
k.</div><div><br></div><div>See <a href=3D"https://yoctoproject.org/docs/sc=
ott_temp/test-manual/test-manual.html">https://yoctoproject.org/docs/scott_=
temp/test-manual/test-manual.html</a></div><div><br></div><div>Thanks,</div=
><div>Scott<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 19, 2019 at 8:53 AM &lt;<a href=3D"mailto:sjoll=
ey.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div lang=3D"EN-US"><div class=
=3D"gmail-m_1454612999873202328WordSection1"><p style=3D"margin:0in 0in 0.0=
001pt"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color:black"=
>Current Dev Position: YP 2.7 M3 (New feature Freeze has begun.)</span><u><=
/u><u></u></p><p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-fami=
ly:&quot;Arial&quot;,sans-serif;color:black">Next Deadline: YP 2.7 M3 Cutof=
f was Feb. 25, 2019</span><u></u><u></u></p><p class=3D"MsoNormal"><u></u>=
=C2=A0<u></u></p><p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-f=
amily:&quot;Arial&quot;,sans-serif;color:black">SWAT Team Rotation:</span><=
u></u><u></u></p><ul style=3D"margin-top:0in" type=3D"disc"><li style=3D"co=
lor:black;margin-top:0in;margin-bottom:0.0001pt;vertical-align:baseline"><s=
pan style=3D"font-family:&quot;Arial&quot;,sans-serif">SWAT lead is current=
ly: Armin <u></u><u></u></span></li><li style=3D"color:black;margin-top:0in=
;margin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-family=
:&quot;Arial&quot;,sans-serif">SWAT team rotation: Armin -&gt; Paul on Mar.=
 23, 2019<u></u><u></u></span></li><li style=3D"color:black;margin-top:0in;=
margin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-family:=
&quot;Arial&quot;,sans-serif">SWAT team rotation: Paul -&gt; Ross on Mar. 3=
0, 2019<u></u><u></u></span></li><li style=3D"color:black;margin-top:0in;ma=
rgin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-family:Co=
nsolas"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_S=
wat_Team" target=3D"_blank"><span style=3D"color:rgb(17,85,204)">https://wi=
ki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a><u></u><u>=
</u></span></li></ul><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p styl=
e=3D"margin:0in 0in 0.0001pt"><span style=3D"font-family:&quot;Arial&quot;,=
sans-serif;color:black">Key Status/Updates:</span><u></u><u></u></p><ul sty=
le=3D"margin-top:0in" type=3D"disc"><li style=3D"color:black;margin-top:0in=
;margin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-family=
:&quot;Arial&quot;,sans-serif">M3 has not built yet however most major piec=
es are in place, including now, agreement on the new QA process. The delay =
is partly due to RP travel with others able to cover being unavailable for =
other reasons, combined with infrastructure issues.<u></u><u></u></span></l=
i><li style=3D"color:black;margin-top:0in;margin-bottom:0.0001pt;vertical-a=
lign:baseline"><span style=3D"font-family:&quot;Arial&quot;,sans-serif">The=
 remaining questions for M3 are:<u></u><u></u></span></li><ul style=3D"marg=
in-top:0in" type=3D"circle"><li style=3D"color:black;margin-top:0in;margin-=
bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-family:&quot;A=
rial&quot;,sans-serif">Public documentation of the new QA process<u></u><u>=
</u></span></li><li style=3D"color:black;margin-top:0in;margin-bottom:0.000=
1pt;vertical-align:baseline"><span style=3D"font-family:&quot;Arial&quot;,s=
ans-serif">Upgrade for uninative for glibc 2.29<u></u><u></u></span></li><l=
i style=3D"color:black;margin-top:0in;margin-bottom:0.0001pt;vertical-align=
:baseline"><span style=3D"font-family:&quot;Arial&quot;,sans-serif">Mesa up=
grade? (unlikely given failures in testing)<u></u><u></u></span></li></ul><=
li style=3D"color:black;margin-top:0in;margin-bottom:0.0001pt;vertical-alig=
n:baseline"><span style=3D"font-family:&quot;Arial&quot;,sans-serif">The Yo=
cto Project has updated to its new governance model which includes establis=
hing a Technical Steering Committee (TSC) for Yocto Project. This is design=
ed to complement =C2=A0and work alongside the OpenEmbedded TSC. Three membe=
rs of the YP TSC are selected by the Yocto Project governing board and thos=
e people are Ross Burton, Khem Raj and Richard Purdie. The remaining two se=
ats will be elected by OpenEmbedded. It is intended the TSC will take over =
the release process, SWAT team, bug triage and feature planning/development=
 for 2.8.<u></u><u></u></span></li><li style=3D"color:black;margin-top:0in;=
margin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-family:=
&quot;Arial&quot;,sans-serif">YP 2.5.3 continues to be blocked on autobuild=
er-helper changes for the stable branches and the resulttool changes in mas=
ter to move to the new QA process.<u></u><u></u></span></li><li style=3D"co=
lor:black;margin-top:0in;margin-bottom:0.0001pt;vertical-align:baseline"><s=
pan style=3D"font-family:&quot;Arial&quot;,sans-serif">There is discussion =
on the openembedded-architecture list about changes to the stable branch pa=
tch criteria to bring us more into line with current industry best practice=
s and thinking.<u></u><u></u></span></li></ul><p class=3D"MsoNormal"><u></u=
>=C2=A0<u></u></p><p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-=
family:&quot;Arial&quot;,sans-serif;color:black">Planned Releases for YP 2.=
7:</span><u></u><u></u></p><ul style=3D"margin-top:0in" type=3D"disc"><li s=
tyle=3D"color:black;margin-top:0in;margin-bottom:0.0001pt;vertical-align:ba=
seline"><span style=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.7 M3 =
Cutoff was Feb. 25, 2019<u></u><u></u></span></li><li style=3D"color:black;=
margin-top:0in;margin-bottom:0.0001pt;vertical-align:baseline"><span style=
=3D"font-family:&quot;Arial&quot;,sans-serif">YP 2.7 M3 Release Target was =
Mar. 8, 2019<u></u><u></u></span></li><li style=3D"color:black;margin-top:0=
in;margin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-fami=
ly:&quot;Arial&quot;,sans-serif">YP 2.7 M4 Cutoff is Apr. 1, 2019<u></u><u>=
</u></span></li><li style=3D"color:black;margin-top:0in;margin-bottom:0.000=
1pt;vertical-align:baseline"><span style=3D"font-family:&quot;Arial&quot;,s=
ans-serif">YP 2.7 M4 Release Target is Apr. 26, 2019<u></u><u></u></span></=
li></ul><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p style=3D"margin:0=
in 0in 0.0001pt"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;co=
lor:black">Planned upcoming dot releases:</span><u></u><u></u></p><ul style=
=3D"margin-top:0in" type=3D"disc"><li style=3D"color:black;margin-top:0in;m=
argin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-family:&=
quot;Arial&quot;,sans-serif">YP 2.5.3 (Sumo) will be targeted after YP 2.7 =
M2 is done.<u></u><u></u></span></li><li style=3D"color:black;margin-top:0i=
n;margin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-famil=
y:&quot;Arial&quot;,sans-serif">YP 2.5.4 (Sumo) will be targeted after YP 2=
.7 M4 is done.<u></u><u></u></span></li><li style=3D"color:black;margin-top=
:0in;margin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-fa=
mily:&quot;Arial&quot;,sans-serif">YP 2.6.2 (Thud) will be targeted after Y=
P 2.5.4 is done.<u></u><u></u></span></li></ul><p class=3D"MsoNormal"><u></=
u>=C2=A0<u></u></p><p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font=
-family:&quot;Arial&quot;,sans-serif;color:black">Tracking Metrics:</span><=
u></u><u></u></p><ul style=3D"margin-top:0in" type=3D"disc"><li style=3D"co=
lor:black;margin-top:0in;margin-bottom:0.0001pt;vertical-align:baseline"><s=
pan style=3D"font-family:&quot;Arial&quot;,sans-serif">WDD 2432 (last week =
2439)</span><span style=3D"font-family:Consolas"> (</span><span style=3D"fo=
nt-family:&quot;Arial&quot;,sans-serif"><a href=3D"https://wiki.yoctoprojec=
t.org/charts/combo.html" target=3D"_blank"><span style=3D"color:rgb(17,85,2=
04)">https://wiki.yoctoproject.org/charts/combo.html</span></a></span><span=
 style=3D"font-family:Consolas">)</span><span style=3D"font-family:&quot;Ar=
ial&quot;,sans-serif"><u></u><u></u></span></li><li style=3D"color:black;ma=
rgin-top:0in;margin-bottom:0.0001pt;vertical-align:baseline"><span style=3D=
"font-family:&quot;Arial&quot;,sans-serif">Poky Patch Metrics =C2=A0</span>=
<span style=3D"font-family:Consolas"><u></u><u></u></span></li><ul style=3D=
"margin-top:0in" type=3D"circle"><li style=3D"color:black;margin-top:0in;ma=
rgin-bottom:0.0001pt;vertical-align:baseline"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif">Total patches found: 1526 (last week 1523)<u></=
u><u></u></span></li><li style=3D"color:black;margin-top:0in;margin-bottom:=
0.0001pt;vertical-align:baseline"><span style=3D"font-family:&quot;Arial&qu=
ot;,sans-serif">Patches in the Pending State: 656 (43%) [last week 657 (43%=
)]</span><span style=3D"font-family:Consolas"><u></u><u></u></span></li></u=
l></ul><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p style=3D"margin:0i=
n 0in 0.0001pt"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;col=
or:black">Key Status Links for YP:</span><u></u><u></u></p><p style=3D"marg=
in:0in 0in 0.0001pt"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Pr=
oject_v2.7_Status" target=3D"_blank"><span style=3D"font-family:Consolas;co=
lor:rgb(17,85,204)">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_S=
tatus</span></a><u></u><u></u></p><p style=3D"margin:0in 0in 0.0001pt"><a h=
ref=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule" target=3D"_bl=
ank"><span style=3D"font-family:Consolas;color:rgb(17,85,204)">https://wiki=
.yoctoproject.org/wiki/Yocto_2.7_Schedule</span></a><u></u><u></u></p><p st=
yle=3D"margin:0in 0in 0.0001pt"><a href=3D"https://wiki.yoctoproject.org/wi=
ki/Yocto_2.7_Features" target=3D"_blank"><span style=3D"font-family:Consola=
s;color:rgb(17,85,204)">https://wiki.yoctoproject.org/wiki/Yocto_2.7_Featur=
es</span></a><u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u><=
/p><p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-family:&quot;Ar=
ial&quot;,sans-serif;color:black">The Status reports are now stored on the =
wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status=
" target=3D"_blank"><span style=3D"font-family:&quot;Arial&quot;,sans-serif=
;color:rgb(17,85,204)">https://wiki.yoctoproject.org/wiki/Weekly_Status</sp=
an></a><u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p =
style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-family:&quot;Arial&qu=
ot;,sans-serif;color:black">[If anyone has suggestions for other informatio=
n you=E2=80=99d like to see on this weekly status update, let us know!]</sp=
an><u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p clas=
s=3D"MsoNormal">Thanks,<u></u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=
=A0<u></u></p><p class=3D"MsoNormal" style=3D"break-after:avoid"><b><i><spa=
n style=3D"font-size:16pt;font-family:&quot;Times New Roman&quot;,serif;col=
or:purple">Stephen K. Jolley</span></i></b><b><i><span style=3D"font-size:1=
6pt;font-family:&quot;Tahoma&quot;,sans-serif;color:purple"><u></u><u></u><=
/span></i></b></p><p class=3D"MsoNormal"><b><span style=3D"font-size:8pt;fo=
nt-family:&quot;Courier New&quot;;color:blue">Yocto Project Project Manager=
<u></u><u></u></span></b></p><p class=3D"MsoNormal"><span style=3D"font-siz=
e:9pt;font-family:Wingdings;color:black">(</span><span style=3D"font-size:9=
pt;font-family:&quot;MS Sans Serif&quot;;color:teal">=C2=A0=C2=A0=C2=A0 </s=
pan><b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;c=
olor:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS=
 Sans Serif&quot;;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;">(208) 244-4460<span style=
=3D"color:black"><u></u><u></u></span></span></p><p class=3D"MsoNormal"><sp=
an style=3D"font-size:9pt;font-family:Wingdings">* </span><b><span style=3D=
"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color:teal" lang=3D"FR=
">Email</span></b><span style=3D"font-size:9pt;font-family:&quot;MS Sans Se=
rif&quot;;color:teal" lang=3D"FR">:</span><span style=3D"font-size:9pt;font=
-family:&quot;MS Sans Serif&quot;" lang=3D"FR">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<u><span style=3D"=
color:blue"><a href=3D"mailto:sjolley.yp.pm@gmail.com" target=3D"_blank">sj=
olley.yp.pm@gmail.com</a></span></u></span><span style=3D"font-size:12pt;fo=
nt-family:&quot;Arial&quot;,sans-serif" lang=3D"FR"><u></u><u></u></span></=
p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div></div>-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--0000000000008bc588058475050a--
