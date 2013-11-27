Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6086C73C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 19:03:02 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id c11so5554357lbj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 11:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=YW89RH0FedIlmG8xHnM4Mnpug1Fv/1LjK1vrYS+e8JA=;
	b=ljrvZX1UwLtyNUvFRk8Ny896r06RHsQa9QXRaGu5wzObXsYzaFdb6G1maemt0JrNTm
	sAWd8jxdVg77wDWcKgln5tEHLBgcrF/YY3Q4ZUaxs1M6DOP359kAapUCy+dbusu4VL5K
	sjtxIDECMXuJN2tjwoc1vyXqLbJqHddW+8pMz6m466WKVH1Bqy+62I0QiimqL8GBH/GJ
	xf93APs/kwkLf5MhOIv4dH1LFHsXM64ezzy+hXVdLSyF+II2XNcia53YbgR9NzsPO255
	XM7jhXW0dV3lPhRgdtT1jEqSoNzGxS3PaBMiss/mLMdIv76/FHU6p0O93ee/2FNsM8Yl
	cIyg==
X-Received: by 10.152.216.167 with SMTP id or7mr30663175lac.10.1385578981330; 
	Wed, 27 Nov 2013 11:03:01 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Wed, 27 Nov 2013 11:02:41 -0800 (PST)
In-Reply-To: <cover.1385467738.git.paul.eggleton@linux.intel.com>
References: <cover.1385467738.git.paul.eggleton@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Nov 2013 12:02:41 -0700
X-Google-Sender-Auth: nP_Z7msDc0KPuQx0LqAxJWae4CE
Message-ID: <CABcZANkJoSBLjV6Td1eCZFJqOuYY_9+Nepti1zRsJey4q75HWg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Image manifest support
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
X-List-Received-Date: Wed, 27 Nov 2013 19:03:06 -0000
Content-Type: multipart/alternative; boundary=001a1135e318fd944404ec2d3e88

--001a1135e318fd944404ec2d3e88
Content-Type: text/plain; charset=UTF-8

Would you mind summarizing the differences between this and the already
emitted image license manifest in deploy/license?


On Tue, Nov 26, 2013 at 5:09 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> The following change since commit 25a75e83550fab0f9d2486b13ec9ab6339b6a8b0:
>
>   linux-firmware: add missing linux-firmware-iwlwifi-7260-7 package
> (2013-11-25 16:14:15 +0000)
>
> is available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib paule/manifest
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/manifest
>
> Paul Eggleton (1):
>   classes/image: write image manifest
>
>  meta/classes/image.bbclass            | 15 +++++++++------
>  meta/classes/populate_sdk_deb.bbclass |  2 ++
>  meta/classes/populate_sdk_ipk.bbclass |  2 ++
>  meta/classes/populate_sdk_rpm.bbclass |  2 ++
>  meta/classes/rootfs_ipk.bbclass       | 14 --------------
>  scripts/opkg-query-helper.py          |  9 +++++++++
>  6 files changed, 24 insertions(+), 20 deletions(-)
>
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135e318fd944404ec2d3e88
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would you mind summarizing the differences between this an=
d the already emitted image license manifest in deploy/license?</div><div c=
lass=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, Nov 26, 201=
3 at 5:09 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eg=
gleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>=
&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The following change since commit 25a75e8355=
0fab0f9d2486b13ec9ab6339b6a8b0:<br>
<br>
=C2=A0 linux-firmware: add missing linux-firmware-iwlwifi-7260-7 package (2=
013-11-25 16:14:15 +0000)<br>
<br>
is available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" target=3D"_blank">git.openembedded.org/openembedded-core-contrib</a> pa=
ule/manifest<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Dpaule/manifest" target=3D"_blank">http://cgit.openembedded.=
org/cgit.cgi/openembedded-core-contrib/log/?h=3Dpaule/manifest</a><br>
<br>
Paul Eggleton (1):<br>
=C2=A0 classes/image: write image manifest<br>
<br>
=C2=A0meta/classes/image.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 15 +++++++++------<br>
=C2=A0meta/classes/populate_sdk_deb.bbclass | =C2=A02 ++<br>
=C2=A0meta/classes/populate_sdk_ipk.bbclass | =C2=A02 ++<br>
=C2=A0meta/classes/populate_sdk_rpm.bbclass | =C2=A02 ++<br>
=C2=A0meta/classes/rootfs_ipk.bbclass =C2=A0 =C2=A0 =C2=A0 | 14 -----------=
---<br>
=C2=A0scripts/opkg-query-helper.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A09 +++++++++<br>
=C2=A06 files changed, 24 insertions(+), 20 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.1.2<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Op=
enEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, M=
entor Graphics
</div>

--001a1135e318fd944404ec2d3e88--
