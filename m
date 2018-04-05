Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 10A1574B44
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 13:22:09 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id m47so15442724uae.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o0D+v5oEkCF+2k2aUghNKpLIIEyFS0oj/B/xY+dn8aw=;
	b=IlzKa27tI7+2xDCXLmXPjlVOBQDxFEBEN0Z9H7cZg1Kj/wmXKzHv2CFCUWhKjRYFjT
	fT4sfExteRMqn6/hpFNxSAVinn47mGZffVouSH1rTKFo84RwHbbRMq48zXpEltt/xP4N
	aKj8P12ZQcKpjNFQEOUVZgNwIVce020IaWJSOPIV+Ol4taSrsBluMc3P6udIYtam1bZ0
	GsEw1xzH6FikLonidY4x6ptG5Z6svYLKpUlhJMHWXXHOWyo2kdL+3SbDdeg43xDfW2n0
	yKEMw3IDb0oG9v/1Xfe2XEdFb61DkZAoP3a4A4SAzSSsEdq8a9c99bzlVkf7JLmRs/Ix
	w1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o0D+v5oEkCF+2k2aUghNKpLIIEyFS0oj/B/xY+dn8aw=;
	b=ByvW1B2/C2aj6giMHsDYxECkroXrI3oI3ZXCPL1YolM87C2cDAclQ4MZsXTOLGOoTa
	qEndzsNm5Wm6JVYPXzYE2H8DhBFcSp4hZQeFBlPYJTaHGbLA53oeP00C7u5H3OqXKOtO
	ksl/X3oANJFDlH6fISx3+gtoVn6SunUBfCf422YldBgygSr3t5klrcap9+dx92j0qqGT
	oPmIfiXWmY8++Ah8ijeGZVaYuNKGUI2ho2IDTZXu421VqkDJ3BMZeSs9wEbMN2acuzU5
	FmgGAtDlSBUqOioBPtz22RbPnYmGQZh2LqvTmrcVkS5b4epWRquBW0b5qzgqake5xPSs
	CT4w==
X-Gm-Message-State: ALQs6tCDTxQd5neYO21zX9O2W7B9nPm8+PEs9/XXrONdcqAtNMaDHiWJ
	EhUpEw0aL68CuOLUEWN9S78GK+djjOVQqnX8qqo=
X-Google-Smtp-Source: AIpwx4/pWFNdY1uqsWrb7iDPT3bdmGJEcuoLvutTqWx4BbTEy8TupdTcvBBrAnbwzbGo5KOe8PObOpVu2cG8n7qILu4=
X-Received: by 10.159.47.2 with SMTP id x2mr14079778uaj.23.1522934530718; Thu,
	05 Apr 2018 06:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzHSCh1VU91Leev0BaZNbzg05U--61WEO1UgcL700_WkBA@mail.gmail.com>
	<CAPGMVzGsUSor8=tX5EWWmnhUw1G4rpia9SVpSu=eYHw7DXDghw@mail.gmail.com>
	<236bdac4-6e55-777d-b808-dcd6375d5dbb@linux.intel.com>
	<CAPGMVzFPwMa5xV=0H2Wim=OgiYJ-Tv4KvFrm5T7-8ecDyWOy9w@mail.gmail.com>
In-Reply-To: <CAPGMVzFPwMa5xV=0H2Wim=OgiYJ-Tv4KvFrm5T7-8ecDyWOy9w@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 05 Apr 2018 13:22:00 +0000
Message-ID: <CAPGMVzGD5oUW2ZcnZepEBEghUh=UOQLqKr88_qYqgGwjP45E8Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] qemu boot problem
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
X-List-Received-Date: Thu, 05 Apr 2018 13:22:10 -0000
Content-Type: multipart/alternative; boundary="089e08253a74b84128056919d316"

--089e08253a74b84128056919d316
Content-Type: text/plain; charset="UTF-8"

Do have a look at main thread of this topic to know the Machine config and
error message

On Thu, 5 Apr 2018, 18:50 Rajath C S, <rajathcs.1996@gmail.com> wrote:

> The above text I have posted itself is the full output it's throwing and
> with with respect to command - runqemu qemux86
>
>
> On Thu, 5 Apr 2018, 18:38 Alexander Kanavin, <
> alexander.kanavin@linux.intel.com> wrote:
>
>> On 04/05/2018 01:43 PM, Rajath C S wrote:
>> > as the error specifies about a specific recipe missing the license, i'd
>> > like to know which recipe is that what is the pointer to defaultpkgname
>>
>> You need to provide both the command you issue on the command line, and
>> the full output that it prints.
>>
>> Alex
>>
>

--089e08253a74b84128056919d316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Do have a look at main thread of this topic to know the M=
achine config and error message</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Thu, 5 Apr 2018, 18:50 Rajath C S, &lt;<a href=3D"mailto:rajat=
hcs.1996@gmail.com">rajathcs.1996@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto">The above text I have posted itse=
lf is the full output it&#39;s throwing and with with respect to command - =
runqemu qemux86<div dir=3D"auto"><br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Thu, 5 Apr 2018, 18:38 Alexander Kanavin, &lt;<a h=
ref=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank" rel=3D"n=
oreferrer">alexander.kanavin@linux.intel.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On 04/05/2018 01:43 PM, Rajath C S wrote:<br>
&gt; as the error specifies about a specific recipe missing the license, i&=
#39;d<br>
&gt; like to know which recipe is that what is the pointer to defaultpkgnam=
e<br>
<br>
You need to provide both the command you issue on the command line, and<br>
the full output that it prints.<br>
<br>
Alex<br>
</blockquote></div></blockquote></div>

--089e08253a74b84128056919d316--
