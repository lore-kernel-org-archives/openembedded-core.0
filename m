Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9EF3660034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 14:15:27 +0000 (UTC)
Received: by igbue6 with SMTP id ue6so53692712igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZwW2Ge7hQsQODtf6Lrg2bHMPST1eTtIhNLIaukHFf04=;
	b=CkVO6Q9isSLEoFY2AJF5eMYF6IBeUDXGV3wIRrh0QqTjarA5kx0V9FayNaAK5tCDFp
	b6aFlukUxxweOZIbbtbkgYKoFV83/rpqMd4u/0HAimBWDOoBExJM92iVzBuncP88rFaH
	sLykN28GnetGcxOjyJSBfcaqIPjbLDHXXThaM1U3jatGDljoD5XhDV5NWWaOT+wBxmw6
	80hSF5Cthe5NvgGkSQEeuH+utN1P3jft+QEfIooo1lB+qLEGTsvBLJnokHU7ncTpgUv5
	5xJ3JtiVVZbC8Au6ui20hxfrAKs8IBirjtwarB/w9gV8zM6oVJ9vKLT395Z7LEtgnERP
	IRXw==
MIME-Version: 1.0
X-Received: by 10.50.124.133 with SMTP id mi5mr21883887igb.13.1426601729050;
	Tue, 17 Mar 2015 07:15:29 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Tue, 17 Mar 2015 07:15:28 -0700 (PDT)
In-Reply-To: <CAJTo0LbyqjXJutC9nrj2zheJqrHGryVAydGeHffuCMB+5a-m0Q@mail.gmail.com>
References: <1425579036-31022-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LbyqjXJutC9nrj2zheJqrHGryVAydGeHffuCMB+5a-m0Q@mail.gmail.com>
Date: Tue, 17 Mar 2015 07:15:28 -0700
Message-ID: <CAMKF1sq3a-_XoAcN24Kddu0Rz6af_emVgR2Fabw3XaL2+FRN7g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/2] tcmode-default: Define one gdb version
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
X-List-Received-Date: Tue, 17 Mar 2015 14:15:31 -0000
Content-Type: multipart/alternative; boundary=001a1135f5784bcd1705117c9988

--001a1135f5784bcd1705117c9988
Content-Type: text/plain; charset=UTF-8

On Tuesday, March 17, 2015, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 5 March 2015 at 20:10, Khem Raj <raj.khem@gmail.com
> <javascript:_e(%7B%7D,'cvml','raj.khem@gmail.com');>> wrote:
>
>> +GDBVERSION ?= "7.8%"
>>
>
> What's the rationale behind wildcarding this instead of using the version
> of gdb in oe-core (7.8.1)?
>

It could be 7.8.1, rationale is if you update recipe to next minor version
then you don't have to change it.

>
> Ross
>

--001a1135f5784bcd1705117c9988
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, March 17, 2015, Burton, Ross &lt;<a href=3D"mailto:ross=
.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 5 March 2015 at 20:10, Khem Raj <span dir=3D"ltr">&lt;<=
a href=3D"javascript:_e(%7B%7D,&#39;cvml&#39;,&#39;raj.khem@gmail.com&#39;)=
;" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div style=3D"overflow:hidden">+GDBVERSION ?=3D &quot;=
7.8%&quot;<br></div></blockquote><div><br></div><div>What&#39;s the rationa=
le behind wildcarding this instead of using the version of gdb in oe-core (=
7.8.1)?</div></div></div></div></blockquote><div><br></div><div>It could be=
 7.8.1, rationale is if you update recipe to next minor version then you do=
n&#39;t have to change it.=C2=A0=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
><br></div><div>Ross=C2=A0</div></div></div></div>
</blockquote>

--001a1135f5784bcd1705117c9988--
