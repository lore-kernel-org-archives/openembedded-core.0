Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id D600965CB6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:30:27 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id d63so18848591ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 06:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0oTYNEAHvcVXOLu6e/FRY9/QebPLi7ux/kzqxXHXEBo=;
	b=RHzxAbUfoibzFNYqnUJ+QxCH86VZuSjTrcCSj1w1IuZmQNzjCJfMudHO4rwK+Skk+e
	1ibQKTsv7peqO4emTTv25jiAnTWUGjAKhN3hkT38PFfK1HlqDtHdtZvV3GeU7pVsK8TA
	FhICgfluUhNQXfY8mPOvFBOSTH5YBzWOGLckJRmKmOSDh/m+eyF/Py+SO5ygPrfWGFIX
	Gc6rDpYDSJ+F8097eDVBvzYAzHmsZxEOBRA6lUPJsrdg2WSj3xc5+e+Alcc8ncXMk/5/
	sbj39gMc4WvSldy6Uh8A44FxeeIOvdGNJbLeDZDK9c9IQV8+3ASildQfVSaRIBgrE7Pi
	Rdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0oTYNEAHvcVXOLu6e/FRY9/QebPLi7ux/kzqxXHXEBo=;
	b=kZQq6Hk2eoHHXtt/T9VUW/iDcWHV6frEdTQpO108affukqVDJ7bU6khcZZijzQ63Ua
	usA1mm9irtHI10L9D8x0yuKW1juLDq+b2smQyoS0lzyjKVi2vqwnXnXkdXcU8XNRpiDp
	M2RHlPusW4xjNth92lIQsJx31tUAK/sQbrZJFR/8WJ9V1yisB966bFGxshBrzKo+H3As
	gdFB8ANg5GVPKI9wLybgoQLOzmC85Y2s9GAXWLN06IE3KlUQvnelOWH1VXlJ5KNhZGjC
	kFAWQKN83y4yMfOLrwUlnbtndBL+eilnJGil56A8zQlaieZcQj/uchce6CzOseKNnfoY
	/Ydw==
X-Gm-Message-State: AG10YOSkSXBbQTh1JnB/gNvCbFEuHCYm7b7R/MIHskCkyAl8WRiDj40oxH5Lzg4F/Z3AuU0VFJE95P8YTyOOedFc
X-Received: by 10.107.164.15 with SMTP id n15mr30649220ioe.148.1455028228059; 
	Tue, 09 Feb 2016 06:30:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 9 Feb 2016 06:30:08 -0800 (PST)
In-Reply-To: <56B9C07D.1070807@linux.intel.com>
References: <1454981383-15843-1-git-send-email-akuster808@gmail.com>
	<1454981383-15843-3-git-send-email-akuster808@gmail.com>
	<56B9C07D.1070807@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Feb 2016 14:30:08 +0000
Message-ID: <CAJTo0LZAYt2vBGkD2mdwP4tVhV+D7GzZF7Eyk1hj1ZJ9tWJZGg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] nettle: Security fix CVE-2015-8804
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
X-List-Received-Date: Tue, 09 Feb 2016 14:30:28 -0000
Content-Type: multipart/alternative; boundary=001a11377682ac0c48052b5728bb

--001a11377682ac0c48052b5728bb
Content-Type: text/plain; charset=UTF-8

On 9 February 2016 at 10:33, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 02/09/2016 03:29 AM, Armin Kuster wrote:
>
>> From: Armin Kuster <akuster@mvista.com>
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>   .../nettle/nettle-3.1.1/CVE-2015-8804.patch        | 281
>> +++++++++++++++++++++
>>   meta/recipes-support/nettle/nettle_3.1.1.bb        |   1 +
>>
>
> Why not update to latest upstream (3.2) instead?


Yes, if both of these CVEs are fixed in 3.2 then master should upgrade
(with stable branches getting the patches if deemed severe enough).

Ross

--001a11377682ac0c48052b5728bb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 February 2016 at 10:33, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D"">On 02/09/2016 03:29 AM, Armin Kuster wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" target=3D"_bla=
nk">akuster@mvista.com</a>&gt;<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targe=
t=3D"_blank">akuster@mvista.com</a>&gt;<br>
---<br>
=C2=A0 .../nettle/nettle-3.1.1/CVE-2015-8804.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 281 +++++++++++++++++++++<br>
=C2=A0 meta/recipes-support/nettle/<a href=3D"http://nettle_3.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">nettle_3.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
</blockquote>
<br></span>
Why not update to latest upstream (3.2) instead?</blockquote></div><br>Yes,=
 if both of these CVEs are fixed in 3.2 then master should upgrade (with st=
able branches getting the patches if deemed severe enough).</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11377682ac0c48052b5728bb--
