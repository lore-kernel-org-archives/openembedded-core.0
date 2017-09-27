Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6BE0771AEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 17:07:04 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id 85so7396700ith.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JNB4LwJ54qcHGDfVyK71NoYkrDVC5XjplRTtwRfzRq0=;
	b=McfQ8Jw3mFtRdcpaoKzpLkA9Vk0hixSD3bHNtRMnoBzhb3Je4Eg46Sqn2Gyp7GQIoy
	YUwmv/RVI/1UQkeKHIYShBs0e1SfffYuzh8TQAhPuIV+kgdSttm8IiZP17tkfCl9HOo2
	pZ9i6kGBdSjDZPB9eUh0RrtgVgNE3edENV3IiSo3SmF+iy6PX36sg2yqr5AeaWpSXmP4
	ov4QRGWoWxTQ/Pwo2Ti4/9RNB0lN8XHF+ZbqVrny/fO3MlYLrANxuTWn++tGfjID22JN
	08AIP5KM5feCK9ktZwyQJIZLFLusr4Hi/cwweZjRcQFtTTSZzrNhGGbJ96DIguLz5QzA
	eFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JNB4LwJ54qcHGDfVyK71NoYkrDVC5XjplRTtwRfzRq0=;
	b=ZcJaHXCobEwDBjYj5U6e5ifrebc5ogu7YkPd2roiK8g7F+/Qr7Q7koEIlbbXmdxQgM
	Ch9AQ09qQhRbqJsMidfzVnI0nlDVi1ffObrrLJ0XJXObudjrOuWj8aEjxaetc3FFN/QO
	EzQlS3PX8fPIn4B/XK2Gas47ClUKMLDwQlyRFkcv4y0dDU4ennq+FQrkwBZ4ejb7Io4R
	OfaJNgo0yjIEhzXzEK3FS3LkmNL/F6JBqVrl0UiD3QvH0GQbrsrX+vxSiodJx4qgL4eP
	GCGC/L3jai3KYabNKGPgrvvlbwiCKZq/Kg5jNkiLBxCN4lZNxvXYyUO1Th+/v3rCoUcT
	tIDw==
X-Gm-Message-State: AHPjjUhTJWUK3SFEzIVObdadFkqahyR8Lol53Ypg/gZApfkikDoEKz4r
	6XmhZGe00PJjKNy/FC7/4OHG6NNkN/LVTiCdVMdvyw==
X-Google-Smtp-Source: AOwi7QBYpaCaqDhO6HgwDumA0FtDJydf/kt4vVH0Eb7Wm1JnEaU9VQ9uulBULZJHBYfxZa5s+eRtViPOwMYXAFIGQOs=
X-Received: by 10.36.26.87 with SMTP id 84mr1721314iti.38.1506532026339; Wed,
	27 Sep 2017 10:07:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Wed, 27 Sep 2017 10:06:45 -0700 (PDT)
In-Reply-To: <CAMKF1soU7--gaCF1E70Ufp_tPy3NDs8w3FhHQpo592E4Yo=9eg@mail.gmail.com>
References: <1506513706-14213-1-git-send-email-matt@madison.systems>
	<CABcZAN=uMrwda=MGiKW9qPs_q7KLFR3V04KiSV-WCLwTPJ=XqQ@mail.gmail.com>
	<CAMKF1soU7--gaCF1E70Ufp_tPy3NDs8w3FhHQpo592E4Yo=9eg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Sep 2017 18:06:45 +0100
Message-ID: <CAJTo0La_2V=rNTBx2LZaDm3YpeMzybh645q9vDEigSOMVw_O7Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: rework mips architecture checks
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
X-List-Received-Date: Wed, 27 Sep 2017 17:07:05 -0000
Content-Type: multipart/alternative; boundary="001a1144159a45ebf9055a2ed21e"

--001a1144159a45ebf9055a2ed21e
Content-Type: text/plain; charset="UTF-8"

On 27 September 2017 at 17:33, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Wed, Sep 27, 2017 at 8:52 AM Christopher Larson <kergoth@gmail.com>
> wrote:
>
>> Another option is to use contains() for this. The signature generation
>> code knows how to handle contains specially, only depending on the presence
>> of the specified value in the list, rather than the entirety.
>>
>
> This approach seems better than anon python
>

Yes, agreed.

Ross

--001a1144159a45ebf9055a2ed21e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 27 September 2017 at 17:33, Khem Raj <span dir=3D"ltr">=
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><br><div class=3D"gmail_quote"><span=
 class=3D""><div dir=3D"auto">On Wed, Sep 27, 2017 at 8:52 AM Christopher L=
arson &lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Another=
 option is to use contains() for this. The signature generation code knows =
how to handle contains specially, only depending on the presence of the spe=
cified value in the list, rather than the entirety.</div></blockquote><div =
dir=3D"auto"><br></div></span><div dir=3D"auto">This approach seems better =
than anon python</div></div></blockquote><div><br></div><div>Yes, agreed.</=
div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1144159a45ebf9055a2ed21e--
