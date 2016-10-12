Return-Path: <zoltan.kuscsik@linaro.org>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9999571975
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 11:12:22 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id z65so52239173itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=MvfChj+qsdcl2F30jqSa7sStmurw55BCWMTBU4FNu9A=;
	b=bIlvuo4cTdXMW9Bx29D7EE5W6kCwqc5G3Hg5t0l7azEu3kAt2M2ugbFHv5U3YlEnSm
	yzG19gJfFQxNwUOxRGrw/ETsGWcQGSHcsE982R5N+B1pWRzk7hRs1yF8puUh2cGZW2uM
	xyBUz2JAsEXD6ECGDa5Z5nbgTyoSE/x7qJ1x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MvfChj+qsdcl2F30jqSa7sStmurw55BCWMTBU4FNu9A=;
	b=GDjsewz65UFeZF1ztwKq7t//++DpXcQf6SjSkHTNayl9pQDdeOU5JQAqqORqp/ewFl
	Jg3hVJmZr9mWgYtjuaCHlZLUvJ8sqwsjq3g8xq1mjH/ofrKNe4RY3sl0RPaRIVChHIhG
	z3GXNrxnc+/g0yk58/7pliDWJ6s4etqMHVvIggbmHUfmz18FuKru7PVWmZpFCgiTp0+d
	n9853PJp7+X9o0r4eawWURlmWMsOolNxLwt3ouD9ijJwe/69xVE4pN0+oJcjre/vZM14
	6ow+Ob314VWAS3PsVxaZSSpyUJ+FPatjSGluY7e1vewA2GNOfWTR67k4HYMOzgDPX4AQ
	v+Ng==
X-Gm-Message-State: AA6/9RmQoc9zcXhLiToQSOd+JDy8X1OLp/VFZ0SfT2UBRn3JdEfJ/RivMDDh5vZFIbudK++nmMa1sTmNiHIaloy8
X-Received: by 10.36.110.196 with SMTP id w187mr877232itc.28.1476270743839;
	Wed, 12 Oct 2016 04:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.53.67 with HTTP; Wed, 12 Oct 2016 04:12:03 -0700 (PDT)
From: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
Date: Wed, 12 Oct 2016 13:12:03 +0200
Message-ID: <CAAzKXnhZ86h2QNd8oVC-QrW726b9D8urV3JU7oQU3NGXR6EEWg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: libical build issue on krogoth
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
X-List-Received-Date: Wed, 12 Oct 2016 11:12:23 -0000
Content-Type: multipart/alternative; boundary=001a114abfb247a280053ea9113a

--001a114abfb247a280053ea9113a
Content-Type: text/plain; charset=UTF-8

Hi,

could you kindly merge the following fix from master to krogoth branch?

0445e68fdbbba5c4efb6422c89ee864e4273b114

The issue mentioned in the commit message can be reproduced on
krogoth builds  on armv8. The patch fixes the problem.

Issue described in commit message:

The libical build QA fails when libical is built for e.g. qemux86-64
already, and
is then built for generic86-64 in a way that install is re-run:

$ MACHINE=qemux86-64 bitbake libical
$ MACHINE=genericx86-64 bitbake -f -Cinstall libical

ERROR: libical-2.0.0-r0 do_populate_sysroot: QA Issue: libical.pc failed
sanity test (tmpdir) in path

Br,

Zoltan

-- 
Zoltan Kuscsik

Senior Software Developer, Linaro Digital Home Group
email: zoltan.kuscsik@linaro.org
IRC: zoli_ on irc.linaro.org

--001a114abfb247a280053ea9113a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><div><br></div><div>could you kindly merge the fol=
lowing fix from master to krogoth branch?</div><div><br></div><div><span st=
yle=3D"color:rgb(51,51,51);font-family:&quot;helvetica neue&quot;,helvetica=
,arial,sans-serif;font-size:14px">0445e68fdbbba5c4efb6422c89ee864e4273b114<=
/span><br></div><div><span style=3D"color:rgb(51,51,51);font-family:&quot;h=
elvetica neue&quot;,helvetica,arial,sans-serif;font-size:14px"><br></span><=
/div><div><font color=3D"#333333" face=3D"helvetica neue, helvetica, arial,=
 sans-serif"><span style=3D"font-size:14px">The issue mentioned in the comm=
it message can be reproduced on</span></font></div><div><font color=3D"#333=
333" face=3D"helvetica neue, helvetica, arial, sans-serif"><span style=3D"f=
ont-size:14px">krogoth builds =C2=A0on armv8. The patch fixes the problem.<=
/span></font></div><div><br></div><div>Issue described in commit message:</=
div><div><br></div><div>The libical build QA fails when libical is built fo=
r e.g. qemux86-64 already, and</div><div>is then built for generic86-64 in =
a way that install is re-run:</div><div><br></div><div>$ MACHINE=3Dqemux86-=
64 bitbake libical</div><div>$ MACHINE=3Dgenericx86-64 bitbake -f -Cinstall=
 libical</div><div><br></div><div>ERROR: libical-2.0.0-r0 do_populate_sysro=
ot: QA Issue: libical.pc failed</div><div>sanity test (tmpdir) in path</div=
><div><br></div></div><div>Br,</div><div><br></div><div>Zoltan<br clear=3D"=
all"><div><br></div>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">=
<div style=3D"color:rgb(136,136,136)">Zoltan Kuscsik</div><div style=3D"col=
or:rgb(136,136,136)"><br></div><div style=3D"color:rgb(136,136,136)">Senior=
 Software Developer, Linaro Digital Home Group</div><div style=3D"color:rgb=
(136,136,136)">email: <a href=3D"mailto:zoltan.kuscsik@linaro.org" target=
=3D"_blank">zoltan.kuscsik@linaro.org</a></div><div style=3D"color:rgb(136,=
136,136)"><span style=3D"font-size:12.8px">IRC: zoli_ on=C2=A0</span><a hre=
f=3D"http://irc.linaro.org/" style=3D"font-size:12.8px;color:rgb(17,85,204)=
" target=3D"_blank">irc.linaro.org</a><br></div></div></div>
</div></div>

--001a114abfb247a280053ea9113a--
