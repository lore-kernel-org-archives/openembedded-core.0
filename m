Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2C673D13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 14:28:37 +0000 (UTC)
Received: by vkgd64 with SMTP id d64so80908326vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 07:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=jHcqyDyGDp19FQOliEFMCSO24VhNoEbDDgbldIWzHlU=;
	b=wXW40yt02AiaLAbbkk2gwI52Lk3dHMCvSY8/wFfWuDObOwrw3QsliAViP6i2vSMJEP
	8jxO9fTSKCMlFizjtsmW9iGC74e/uRjx8FmXFQNk0onfo/8E2RhtlV/VIBEbN0RVZxvW
	iq4CZFMqFiAG3F37GgIYD2IBwGGNgr39Efu+ITkFh1h1CbySYXNr1HCb8w3t44RCT6sh
	YhoyuleIOr2vdevZ6ajIevma0mLQ9Yz/ZDitaYu99lkvWfPbbdcHdMHF+92Jnb4QFV4W
	dFcO76P2GOwrP4Vi4Y7hpgIOUDldWux7VHhy9106Xi5zihy9EeOKH5jmQpIdiNEyvoI6
	zX5Q==
X-Received: by 10.31.16.41 with SMTP id g41mr21110883vki.158.1442327317080;
	Tue, 15 Sep 2015 07:28:37 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.31.203.2 with HTTP; Tue, 15 Sep 2015 07:28:17 -0700 (PDT)
In-Reply-To: <1442302953-14230-1-git-send-email-erkka.kaaria@intel.com>
References: <1442302953-14230-1-git-send-email-erkka.kaaria@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 15 Sep 2015 07:28:17 -0700
X-Google-Sender-Auth: 0KmXM9fOJhYEdqr1jetf3ocmHfY
Message-ID: <CABcZANmbrQjgv0yAaSZqGSVV1QbYCO+p5e=8R=Cmi1m5P0V5XA@mail.gmail.com>
To: =?UTF-8?B?RXJra2EgS8Okw6RyacOk?= <erkka.kaaria@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Removes --with-wctype-functions configure option
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
X-List-Received-Date: Tue, 15 Sep 2015 14:28:37 -0000
Content-Type: multipart/alternative; boundary=001a11c003d6626fe2051fc9ff97

--001a11c003d6626fe2051fc9ff97
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 12:42 AM, Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria=
@intel.com>
wrote:

> This option is causing issues with python unicode support. Several unicod=
e
> related regression tests are currently failing (test_re and test_codecs f=
or
> example) and removing this option fixes these.
>
> This configure option mostly seems to be historical. Discussion related t=
o
> python issue 9210 (https://bugs.python.org/issue9210) indicates its
> original goal was to save memory and that the option should have been
> deprecated ages ago.
>
> Signed-off-by: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
>

The commit message subject line is missing the recipe or filename. See
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines for
details.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c003d6626fe2051fc9ff97
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Sep 15, 2015 at 12:42 AM, Erkka K=C3=A4=C3=A4ri=C3=A4 <span dir=3D"=
ltr">&lt;<a href=3D"mailto:erkka.kaaria@intel.com" target=3D"_blank">erkka.=
kaaria@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:=
rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":1tp"=
 class=3D"" style=3D"overflow:hidden">This option is causing issues with py=
thon unicode support. Several unicode related regression tests are currentl=
y failing (test_re and test_codecs for example) and removing this option fi=
xes these.<br>
<br>
This configure option mostly seems to be historical. Discussion related to =
python issue 9210 (<a href=3D"https://bugs.python.org/issue9210" rel=3D"nor=
eferrer" target=3D"_blank">https://bugs.python.org/issue9210</a>) indicates=
 its original goal was to save memory and that the option should have been =
deprecated ages ago.<br>
<br>
Signed-off-by: Erkka K=C3=A4=C3=A4ri=C3=A4 &lt;<a href=3D"mailto:erkka.kaar=
ia@intel.com">erkka.kaaria@intel.com</a>&gt;</div></blockquote></div><br>Th=
e commit message subject line is missing the recipe or filename. See=C2=A0<=
a href=3D"http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines"=
>http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a> for d=
etails.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>clar=
son at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Ma=
intainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c003d6626fe2051fc9ff97--
