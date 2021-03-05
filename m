Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web08.13808.1614959421784117413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 07:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=JFW8Cuir;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id EA54E2A40;
	Fri,  5 Mar 2021 10:50:20 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Fri, 05 Mar 2021 10:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=NJ3sn9rbAfCm3UpqzhE6LXOfqwAIwqU
	mGw2pGkE610E=; b=JFW8Cuirsytv/LZelt7amLEpZSk+iem/rYeRf8eusU8rg3Y
	bk0MfHoIrBBqyHs5qU8JcPTC0ceZ2hkdGJqteMdTz7xfLNzdPl5aYjYzGZmZWWER
	rADFSUSQ8VC4ASi1A7WFPjF2QMOKgEKSqPl4wgJ5T1GNnhKkzs0/GJNPEqnJBNeb
	Nr1YAFswH2vFC2M5vfvftGpiiN4ysews7bRLTk1qs8dA0v/xlTsd43c48DMIfVbi
	xJxCb71TAKthaoZ6c0QosdmhnPXkxzE5ZE8huNz4G0UVjhsKAAmhhVnnWAgni4aq
	wuGETqlCzZenq9DTv+Fxr9rfde06qOZbU7hnMFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NJ3sn9
	rbAfCm3UpqzhE6LXOfqwAIwqUmGw2pGkE610E=; b=FL2ydtFI03x/Kr741anD9N
	ZHVZxPXW4HrGy8BZSZLBc6sSgpCI1ep8FaIW/wDxMBavJMaf5LAxd5Q09VHcG+S5
	UhId2aEDFnOPq8Q9xIwh9w3bBmugn7CF3+7z1q+mwlL0HJb3Yt4RxhyuzIvuTTBm
	W0a3JkabJMnf5cAl2Qd2FlBDRc9zq/gPjs01oX6X5oPa9JtwaZ0xWz01NqbnStLE
	iSPt3G/eTZZhwabCBJFfTxqd47GYOr5Q99Ua75WOoYv8dK5auGVAP2T0qQXQ4Xxb
	cxX9oldQlNVXETrsdaKkLndscAThM15ZzXOCX2DbI7mWX5+EfL0Db3Nib6B3pGUA
	==
X-ME-Sender: <xms:O1NCYDdDjHQLYQuC9XmIzM_yR6OC7BAtkwHNmjc3SfXof1FCTKsg7w>
    <xme:O1NCYJMkxpRlq1Hds8DMzvJnemK7pBg1Ntz0Ayrt42Aq4lgYzq_jFlXa_SLePrlq2
    Sayoeup18Q7Qn1n8j4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesrgdtreerreertdenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeehuefgfeeuhfdtueegffettdejjefgheeugeefgfegffethfdv
    ffejgeefieetgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:O1NCYMj8HYYHI6ue4ibLxydTWLRNMqFvOcNzhxnbCLU7dqFTpHtMyg>
    <xmx:O1NCYE-9I8mS5C3rKThx-0YwzbcRIMewhHTbD3niCgrsnl2W7hViLA>
    <xmx:O1NCYPtYZAOYODCaWrCdaqee2Yzfp9iC6xob3-oS9soKaw0I-RB5AQ>
    <xmx:PFNCYN3qEtN6y5hdBB063biF4LKVz2Ty7j-NkvAwtF6TQZ2VVC_b8Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 93C77160060; Fri,  5 Mar 2021 10:50:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <3b2c904c-d7dd-4e36-97d1-dbacaf92eddd@www.fastmail.com>
In-Reply-To: 
 <CANNYZj-+T3kSDRQQ-qKiXf3XG-ifJod5UYjJnYwa2V_d5Tyxag@mail.gmail.com>
References: <20210304233526.3373832-1-andrei@gherzan.com>
 <CANNYZj-+T3kSDRQQ-qKiXf3XG-ifJod5UYjJnYwa2V_d5Tyxag@mail.gmail.com>
Date: Fri, 05 Mar 2021 15:50:00 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [OE-core] [PATCH 1/2] gcr: Add support for building without x11
Content-Type: multipart/alternative;
 boundary=e42fa4f04eea48d39930561f13bc9867

--e42fa4f04eea48d39930561f13bc9867
Content-Type: text/plain

On Fri, 5 Mar 2021, at 10:23, Alexander Kanavin wrote:
> On Fri, 5 Mar 2021 at 00:36, Andrei Gherzan <andrei@gherzan.com> wrote:
>>  GNOMEBASEBUILDCLASS = "meson"
>>  GTKDOC_MESON_OPTION = "gtk_doc"
>>  inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
>> -# depends on gtk+3, but also x11 through gtk+-x11
>> -REQUIRED_DISTRO_FEATURES = "x11"
>> 
>>  SRC_URI[archive.sha256sum] = "17fcaf9c4a93a65fb1c72b82643bb102c13344084687d5886ea66313868d9ec9"
>> 
>> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
>> +PACKAGECONFIG[gtk+] = ",--without-gtk,gtk+3"
> 
> This does not look like a meson option, and needs a on-setting as well. Please test the new options both ways.

Thanks. Sent v2.

---
Andrei

--e42fa4f04eea48d39930561f13bc9867
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Fri, 5 Mar 2=
021, at 10:23, Alexander Kanavin wrote:<br></div><blockquote type=3D"cit=
e" id=3D"qt" style=3D""><div dir=3D"ltr"><div class=3D"qt-gmail_quote"><=
div dir=3D"ltr" class=3D"qt-gmail_attr">On Fri, 5 Mar 2021 at 00:36, And=
rei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.com">andrei@gherzan.com=
</a>&gt; wrote:<br></div><blockquote class=3D"qt-gmail_quote" style=3D"m=
argin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8ex;borde=
r-left-color:rgb(204, 204, 204);border-left-style:solid;border-left-widt=
h:1px;padding-left:1ex;"><div>&nbsp;GNOMEBASEBUILDCLASS =3D "meson"<br><=
/div><div> &nbsp;GTKDOC_MESON_OPTION =3D "gtk_doc"<br></div><div> &nbsp;=
inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version=
-is-even vala gobject-introspection gettext mime mime-xdg<br></div><div>=
 -# depends on gtk+3, but also x11 through gtk+-x11<br></div><div> -REQU=
IRED_DISTRO_FEATURES =3D "x11"<br></div><div> <br></div><div> &nbsp;SRC_=
URI[archive.sha256sum] =3D "17fcaf9c4a93a65fb1c72b82643bb102c13344084687=
d5886ea66313868d9ec9"<br></div><div> <br></div><div> +PACKAGECONFIG ??=3D=
 "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"<br></d=
iv><div> +PACKAGECONFIG[gtk+] =3D ",--without-gtk,gtk+3"<br></div></bloc=
kquote><div><br></div><div>This does not look like a meson option, and n=
eeds a on-setting as well. Please test the new options both ways.<br></d=
iv></div></div></blockquote><div><br></div><div>Thanks. Sent v2.<br></di=
v><div><br></div><div>---<br></div><div>Andrei<br></div></body></html>

--e42fa4f04eea48d39930561f13bc9867--
