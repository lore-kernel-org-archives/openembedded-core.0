Return-Path: <persaur@gmail.com>
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com
	[209.85.161.43])
	by mail.openembedded.org (Postfix) with ESMTP id AE09E61085
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 10:01:22 +0000 (UTC)
Received: by mail-yw1-f43.google.com with SMTP id p69so9543308ywh.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 03:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=content-transfer-encoding:from:mime-version:subject:message-id:date
	:cc:to; bh=6v/GC77HvHW9YxskNyoT2/Y4aY+1Eip47D/bqM0htB8=;
	b=bkBgT5o0ducD0hgbHwffNzwp7h03Q4C1Fk0tlmPGwB4KNwtTaRZ797PMupbxJcUtdH
	Jr47dNFy35Nsjyj/Ia76HjrwwpKKApV1RYW2fbig2EZzusiNZB7/oeZLR2m1dlhQgVtr
	VNefiP2jOLdX51513xKuyr+2seaVt2V0L0yEfXQ6A7T7ItwldkSL0PmCGDStVY96b7PM
	SjSu7quvo4R20LefmwPHwhA/2z45GdXR8n6yS1Gon7S8CKy/ns4PTdXqXOjMOQGS30Di
	sYBw/4rqrliVt7tyD9wUcyfwIB2bDFEdZhLUcTwEPgGOqlsg/qrE5X7xqpzFWC6ZDBmC
	sFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:content-transfer-encoding:from:mime-version
	:subject:message-id:date:cc:to;
	bh=6v/GC77HvHW9YxskNyoT2/Y4aY+1Eip47D/bqM0htB8=;
	b=s/vAjwLl+WFZgmWDNMg5RGJAwC56zHQVh9jYPkOVAMltCrPq8LTNUhcerVg6gHrxxV
	J0Vdryc9IYVm2OpuTwBu17ERiGppNX+kyopOgrs+L1KZoqrhmWp6TbockRV8VRjzT/7k
	LZzLKQH3VKESSdFHjzIdtE+mtvkiFA+3dD+98OGe9AGF0RhsgghrT0JUtzybpeA+vOa5
	P5gUS4sMGTrdFCd6ezADD1sfX7e0ntSTmlDWSouF7vXfRkl1R9wVIPBLcMKtJ8KbJbou
	QKcX60rQGfmnHsZYz30HXo19KF5X5rfNql9+sWPGY3sokOPNyqQBKf+b3HM04UhjlIuT
	WA2g==
X-Gm-Message-State: ANhLgQ0CpC1hURsF2GW3LuWM9Pgb3UiLrciLhy8Eb+2kQWU3lsKfGT3q
	VNWMR9QtW2sCc+06W1BCs1rXb1fm
X-Google-Smtp-Source: ADFU+vt8dnYZUch+WTlCbAsLYAJTud+hFTXY/3ruj6RWNsavfpkSVrXaZDKiTSfQwfynvsKvAK2PLA==
X-Received: by 2002:a25:e4c6:: with SMTP id
	b189mr16427581ybh.182.1583748083423; 
	Mon, 09 Mar 2020 03:01:23 -0700 (PDT)
Received: from [100.64.72.98] ([173.245.215.240])
	by smtp.gmail.com with ESMTPSA id
	b195sm18034847ywh.80.2020.03.09.03.01.22
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 09 Mar 2020 03:01:22 -0700 (PDT)
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <C571C8E9-ED5B-4E86-8DC6-446615866698@gmail.com>
Date: Mon, 9 Mar 2020 06:01:21 -0400
To: Ayoub Zaki <ayoub.zaki@embexus.com>
X-Mailer: iPad Mail (17D50)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Mon, 09 Mar 2020 10:01:22 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-8DEF0632-0C19-41F6-AECA-8F11B0F586EB
Content-Transfer-Encoding: 7bit

--Apple-Mail-8DEF0632-0C19-41F6-AECA-8F11B0F586EB
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BF
On Mar 9, 2020, at 03:45, Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
>> Nothing to discuss in public.
>>=20
>>> This
>>> has been the situation from the start of the project, certainly this was=

>>> the case 5 years ago when I joined it, and the only person ever to make a=
n
>>> issue out of it is you. Everyone else seems to understand the deal they'=
re
>>> getting by using Yocto without a commercial support contract.
>>> ...
>> You are saying that 'track and fix CVEs' is on users.
>> Let's check what YP is telling users.
>>=20
>> Click on the "Is Yocto Project for you?" link on the YP frontpage:
>>=20
>> https://www.yoctoproject.org/is-yocto-project-for-you/
>> 13. Yocto Project follows a strict release schedule incorporating
>> security patches in all supported releases. This predictability is
>> crucial for projects that are based on Yocto Project and allows the
>> development teams to plan their activities. Developers can choose which
>> Yocto Project branch on which to base their activities as a function of
>> their needs. The development branch will ensure access to the latest
>> features while the stable branches will reduce the pace of changes. CVEs
>> (common vulnerabilities and exposures) issues are supported for the
>> latest 2 releases.
>=20
>=20
> Adrian is making a point here, The Yocto Project by claiming that it suppo=
rts security patches for Stable releases is misleading the Users!
>=20
> I work with different customers and some of them think that by using and p=
ulling the latest releases they will get the CVEs automatically fixed!
>=20
> YP should state that CLEARLY! Of course it will impact the choice of going=
 with Yocto or Not ( probably NOT in this case).

Would the Yocto mailing list [1] be a good venue to reach the maintainers of=
 the Yocto website? There are now a handful of OE-arch / OE-core threads on t=
his topic, which could be consolidated into a single thread on the Yocto lis=
t, where participants can act on recommendations.

Rich

[1] https://lists.yoctoproject.org/g/yocto


--Apple-Mail-8DEF0632-0C19-41F6-AECA-8F11B0F586EB
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D=
"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr">On Ma=
r 9, 2020, at 03:45, Ayoub Zaki &lt;ayoub.zaki@embexus.com&gt; wrote:</div><=
blockquote type=3D"cite"><div dir=3D"ltr"><blockquote type=3D"cite"><span>No=
thing to discuss in public.</span><br></blockquote><blockquote type=3D"cite"=
><span></span><br></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>This</span><br></blockquote></blockquote><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>has been the situation from the start of=
 the project, certainly this was</span><br></blockquote></blockquote><blockq=
uote type=3D"cite"><blockquote type=3D"cite"><span>the case 5 years ago when=
 I joined it, and the only person ever to make an</span><br></blockquote></b=
lockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>issue ou=
t of it is you. Everyone else seems to understand the deal they're</span><br=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>getting by using Yocto without a commercial support contract.</span=
><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>...</span><br></blockquote></blockquote><blockquote type=3D"cit=
e"><span>You are saying that 'track and fix CVEs' is on users.</span><br></b=
lockquote><blockquote type=3D"cite"><span>Let's check what YP is telling use=
rs.</span><br></blockquote><blockquote type=3D"cite"><span></span><br></bloc=
kquote><blockquote type=3D"cite"><span>Click on the "Is Yocto Project for yo=
u?" link on the YP frontpage:</span><br></blockquote><blockquote type=3D"cit=
e"><span></span><br></blockquote><blockquote type=3D"cite"><span>https://www=
.yoctoproject.org/is-yocto-project-for-you/</span><br></blockquote><blockquo=
te type=3D"cite"><span>13. Yocto Project follows a strict release schedule i=
ncorporating</span><br></blockquote><blockquote type=3D"cite"><span>security=
 patches in all supported releases. This predictability is</span><br></block=
quote><blockquote type=3D"cite"><span>crucial for projects that are based on=
 Yocto Project and allows the</span><br></blockquote><blockquote type=3D"cit=
e"><span>development teams to plan their activities. Developers can choose w=
hich</span><br></blockquote><blockquote type=3D"cite"><span>Yocto Project br=
anch on which to base their activities as a function of</span><br></blockquo=
te><blockquote type=3D"cite"><span>their needs. The development branch will e=
nsure access to the latest</span><br></blockquote><blockquote type=3D"cite">=
<span>features while the stable branches will reduce the pace of changes. CV=
Es</span><br></blockquote><blockquote type=3D"cite"><span>(common vulnerabil=
ities and exposures) issues are supported for the</span><br></blockquote><bl=
ockquote type=3D"cite"><span>latest 2 releases.</span><br></blockquote><span=
></span><br><span></span><br><span>Adrian is making a point here, The Yocto P=
roject by claiming that it supports security patches for Stable releases is m=
isleading the Users!</span><br><span></span><br><span>I work with different c=
ustomers and some of them think that by using and pulling the latest release=
s they will get the CVEs automatically fixed!</span><br><span></span><br><sp=
an>YP should state that CLEARLY! Of course it will impact the choice of goin=
g with Yocto or Not ( probably NOT in this case).</span><br></div></blockquo=
te><div><br></div>Would the Yocto mailing list [1] be a good venue to reach t=
he maintainers of the Yocto website? There are now a handful of OE-arch / OE=
-core threads on this topic, which could be consolidated into a single threa=
d on the Yocto list, where participants can act on recommendations.<div><br>=
</div><div><div>Rich</div></div><div><br></div><div>[1] <a href=3D"https://l=
ists.yoctoproject.org/g/yocto">https://lists.yoctoproject.org/g/yocto</a></d=
iv><br></div></body></html>=

--Apple-Mail-8DEF0632-0C19-41F6-AECA-8F11B0F586EB--
