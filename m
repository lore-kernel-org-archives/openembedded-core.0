Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E9071731D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 16:03:41 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g203so150946359iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 08:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qfU2UKCB2nHKf2slctTBz1vT9I6LMPFGZOOLanMVNRc=;
	b=nEMKHQTT4uUey1i0Iy/qsHVvqMiDEd7T/O1CYZAf026gMiVksQ1e7+ipm9ukOMUlEe
	7u071GoItz24sFl2Pm4/uHnxNa02yWp8gmkMw/vVQlxVRB9JwFjZPhEyliYyf4ltL8cS
	ddvuS5nIYyHKAMoSq+6rLj4DxZv3mSHkPr6y/Psmz0Glqcj2y4Nm8aSIH8tcxX1o4R86
	jmIGe9DqXGjgNpyk+MbhGQIdofB1AvNRJHucsckqEDmGGULJlTbE8crgrxtvHUWV7v0z
	UGOrLAT/loTSLcm9p+JCefmjI0rVFk7RUnBbnwdQXFkySgwuj9fli9r2uTw6SZzU8A9n
	Cgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qfU2UKCB2nHKf2slctTBz1vT9I6LMPFGZOOLanMVNRc=;
	b=GmACAWP2i23JcvMfoe95RrnrrWQHNK6MMmmACwH8PUHu81L4tBI8gFDNyjhozWyi2j
	0LeWLAcxvNpVykguSAem8jiNBTyyaFhvKQznrSC4zai5/WzN7P6bevDZcIf0VMNoL2Q2
	4PXBz8/FGJ4BzbNKpA1zVEJhLP8Aop85x7GKOIg/RimLxYUObkArXnHgw4ESU3KYALXL
	PJ+LmeiQa/n6uG3O0/aBsI9hr0G7Mwvtun+Jd99xmGTTOIeXrsGPvGDExF7zu60URIEd
	fWyLGJmF9ux7TGPG0EKNvrV8rB62N1PF9YyGjFOMH/YjCDBVH0/meGrImZq3h3V148nZ
	gdAg==
X-Gm-Message-State: AD7BkJKod1wEAfapHiMwhyVayw9Py/X7uuFvjRjvj6Qc4chJ60ddis14+t+/yPPKJ1vl78AMqd2d1MPqtyINpN6c
X-Received: by 10.107.16.19 with SMTP id y19mr10510883ioi.148.1457712217365;
	Fri, 11 Mar 2016 08:03:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 08:03:17 -0800 (PST)
In-Reply-To: <CAJTo0LZVFTPSXpOi4bg72xFBqKcGDshaWZEQn84+3RjZD5gMtA@mail.gmail.com>
References: <1457706284-38023-1-git-send-email-helio.castro@bmw-carit.de>
	<CAJTo0Lb0qJKgAyqb4naHHdE6QfzfmzAw22DUU=srMWdXDm62LA@mail.gmail.com>
	<95245B46D926B348AEB132E99037C59B36A9FE3A@ULM-DC01.bmw-carit.intra>
	<CAJTo0LZVFTPSXpOi4bg72xFBqKcGDshaWZEQn84+3RjZD5gMtA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 16:03:17 +0000
Message-ID: <CAJTo0LbXUvRsnVeSMbgpT3qD9UzuoRzBou6ujPQD9cQNVGDQTQ@mail.gmail.com>
To: Helio Chissini De Castro <Helio.Castro@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Fix the license on GNU OpenMP
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
X-List-Received-Date: Fri, 11 Mar 2016 16:03:43 -0000
Content-Type: multipart/alternative; boundary=001a113fd1eae7ac5d052dc81214

--001a113fd1eae7ac5d052dc81214
Content-Type: text/plain; charset=UTF-8

On 11 March 2016 at 15:55, Burton, Ross <ross.burton@intel.com> wrote:

> On 11 March 2016 at 15:53, Helio Chissini De Castro <
> Helio.Castro@bmw-carit.de> wrote:
>
>> Since all the packages now share exactly the same license, there's no
>> reason anymore to specify each one of then, unless wanted to keep the names
>> to know which packages are related to this recipe.
>>
>
> That's a good point, thanks.
>

Follow up question - why not just set the recipe-scope LICENSE to
GPL3-with-gcc-exception and remove all package-specific license assignments.

Ross

--001a113fd1eae7ac5d052dc81214
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2016 at 15:55, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"=
><span class=3D""><div class=3D"gmail_quote">On 11 March 2016 at 15:53, Hel=
io Chissini De Castro <span dir=3D"ltr">&lt;<a href=3D"mailto:Helio.Castro@=
bmw-carit.de" target=3D"_blank">Helio.Castro@bmw-carit.de</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div style=3D"direction:ltr;font-fam=
ily:Tahoma;color:#000000;font-size:10pt">Since all the packages now share e=
xactly the same license, there&#39;s no reason anymore to specify each one =
of then, unless wanted to keep the names to know which packages are related=
 to this recipe.<br>
<div></div></div></blockquote></div><br></span>That&#39;s a good point, tha=
nks.</div><div class=3D"yj6qo ajU"><div id=3D":aqx" class=3D"ajR" tabindex=
=3D"0"></div></div></blockquote></div><br>Follow up question - why not just=
 set the recipe-scope LICENSE to GPL3-with-gcc-exception and remove all pac=
kage-specific license assignments.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113fd1eae7ac5d052dc81214--
