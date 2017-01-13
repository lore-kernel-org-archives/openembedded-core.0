Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id D0D4560616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:16:39 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id s140so53648127qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 05:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=DgUrjpCUq0O1KoI5stzWqP2Z/4ftF2sTxefnInN9Tlc=;
	b=n/eAkTPKoObsfJGBMp3+gTLvQJkk+kLDKUCH2uvwhwJZy+ikWX/7hzylr6mFz/rh87
	qmJjbalDzi+fwIHZ7T75pcCD/KUkH3t4bJfIZBO3IjcMJRcQjxRr/CnCUnJVz/DvKUhp
	/YI4QsYJ+uvhNThKfSzx7RoGi6oAxWz2M6TdfNK3uTU+jvBK6UBEPym+MbM0q1RROp3T
	MGxqLsCpomUzqSP4TbvG7Hf97KWCYP0vk1ulXA/0ULUWE+cX9Z4kZA3p9JPaMP/ar9tQ
	QvuMW6/wRx4WNHjF5jvQ6GyqPYGIANEYdaZzaOhsjpZyNk2hX862q+xXSfmx9LmqCmO7
	4F6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=DgUrjpCUq0O1KoI5stzWqP2Z/4ftF2sTxefnInN9Tlc=;
	b=t3wFLEt4C03SzRMKf20euL0QanjU2vukzGfRaBjCu6p5wFUvN8UplIZwUIzYqB2cbX
	Se+iv+f/p8rFXcjPHtMN9flkZ+i9KosfyS3F6WG4ByUH0LwTG0zIBXFY+BBInis03k91
	2RZ3RuaElW4KpdW1pqPZ2P6LaUGjytmz3YshfBsrbsoT+H5OEeDDqRmOPWKaBI32ZVuX
	+iUtpYOpRV1prCq1i6iccWbWaZ66xatNJWxMsQD/HkWyMnbw8qUj4nE5LU7bN9bpn9sq
	5wh60yov4GeXPlpSlrPjfvoSOL4h9VqGJ+aoZhFdX8PVjz4ZR5yi8giU/uq22CNozNF3
	cz6g==
X-Gm-Message-State: AIkVDXIkM/nZHyY7UYoo65LlRANUSgRL02glF+VR3hxGBm/xQtI1sVAyUSOzRZ+sLnrSKsybr62+j1WrHs0QRJNo
X-Received: by 10.55.47.4 with SMTP id v4mr18171830qkh.77.1484313399281; Fri,
	13 Jan 2017 05:16:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 13 Jan 2017 05:16:18 -0800 (PST)
In-Reply-To: <cover.1484312322.git.ross.burton@intel.com>
References: <cover.1484312322.git.ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jan 2017 13:16:18 +0000
Message-ID: <CAJTo0LY2yy+XT73gB8xg=2AK8zQQKsb+Z2_ho6eCJkU1oNCKRA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/80] Consolidated pull
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
X-List-Received-Date: Fri, 13 Jan 2017 13:16:40 -0000
Content-Type: multipart/alternative; boundary=001a114f4108e67f590545f9a4af

--001a114f4108e67f590545f9a4af
Content-Type: text/plain; charset=UTF-8

On 13 January 2017 at 13:00, Ross Burton <ross.burton@intel.com> wrote:

> Markus Lehtonen (10):
>       oeqa.utils.metadata: re-organise host distro information
>       oeqa.utils.metadata: re-organise distro information
>       oeqa.utils.metadata: drop 'unknown' git data elements
>       oeqa.utils.metadata: fix retrieval of git branch and revision
>       oeqa.utils.metadata: rename 'revision' to 'commit'
>       oeqa.utils.metadata: add commit count information
>       oeqa.utils.metadata: have layer name as an attribute in xml
>       oeqa.utils.metadata: add bitbake revision information
>       oeqa.utils.metadata: allow storing any bitbake config variables
>       oeqa.utils.metadata: include BB_NUMBER_THREADS and PARALLEL_MAKE
>

Markus just sent a V2, so please drop these.  I'll remove them from my
branch shortly.

Ross

--001a114f4108e67f590545f9a4af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2017 at 13:00, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1og" class=3D=
"a3s aXjCH m15997eaab7b53979">Markus Lehtonen (10):<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: re-organise host distro informati=
on<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: re-organise distro information<br=
>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: drop &#39;unknown&#39; git data e=
lements<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: fix retrieval of git branch and r=
evision<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: rename &#39;revision&#39; to &#39=
;commit&#39;<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: add commit count information<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: have layer name as an attribute i=
n xml<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: add bitbake revision information<=
br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: allow storing any bitbake config =
variables<br>
=C2=A0 =C2=A0 =C2=A0 oeqa.utils.metadata: include BB_NUMBER_THREADS and PAR=
ALLEL_MAKE</div></blockquote></div><br>Markus just sent a V2, so please dro=
p these.=C2=A0 I&#39;ll remove them from my branch shortly.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114f4108e67f590545f9a4af--
