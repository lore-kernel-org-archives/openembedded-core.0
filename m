Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 15F6065C90
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 10:36:17 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id y76so68784250qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 02:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mFvMPTyZog/JF1HD31dPvL8ODCYgMb5j0uBcU+/JQLQ=;
	b=ydxgvPZy3r4abKj9CPdLTZ/1yAadDZY6nK1hRcjB9oKL6rc0U2trkSWbPyrepxubwg
	5qlt6sTlm6ECpQ1D8IUyiVbtlAMrPqaFdd62AFhEBaOShoG75oETD0tqr3GdIOrivM2E
	ZpPj/tfj+pELUneyQV9+CiFDqf/9Kaz7bJiiRQCAHFBpit1UPm3Q5ViZj841w0zzgVRP
	RFsgrDartJU6+h0d2SLP5RoLb6PlxOcJRwjJkrluX8af8erRillLcwImssoN8e5PqfaZ
	pnnLYIBi4AfoEQbL9fwcIcH31Cmrbyeoxck4ZYDc41msh/iq5cxkZePskW6gt5uLP0DU
	j0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mFvMPTyZog/JF1HD31dPvL8ODCYgMb5j0uBcU+/JQLQ=;
	b=MTv08Y7wTzpKj4wnBmGGkqQq2AMViJAHadRtCYMGNHr3qxQVwOttokpG/uymW0tGyc
	ly4ayj+PRUsL4WO+Ai5ppF/cCSlaLo9iyOxxJuvh6LHzvtTQlDeihAS1/0qwq+8Seg/Z
	+kkXg3tWw/Mn4Crj5JsEKgxoenSWYEdUL28gMYa53TWTP2wVP4tkv+Zd1Yoi7DerI72t
	cYxStHOztFRcjLrEqPFtRDL6vG9/cO0akMfpRDyqbEcZUjpRDhfYNUS4sWzo0upGaXp5
	2YX24xspocppUTS8g5dTLHWq1eRPOlfr5Gqf+xvUeKpj9IrF6Ch4dlnytLwv8K6SzSXH
	3wrg==
X-Gm-Message-State: AMke39k70WEqU10jJWL3M55dwr5cdWrcrEZ6LN7Acff5pzvc/TThFNZ3G/mu7EiqL4gpHlcwAnj5lZ7g+zKk/xzb
X-Received: by 10.55.175.195 with SMTP id y186mr19372765qke.26.1488882978803; 
	Tue, 07 Mar 2017 02:36:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 7 Mar 2017 02:35:58 -0800 (PST)
In-Reply-To: <1488862727-25152-1-git-send-email-armccurdy@gmail.com>
References: <1488862727-25152-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Mar 2017 10:35:58 +0000
Message-ID: <CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: start to ignore the largefile distro feature
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
X-List-Received-Date: Tue, 07 Mar 2017 10:36:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c106843054a219542

--94eb2c06093c106843054a219542
Content-Type: text/plain; charset=UTF-8

CCing openembedded-architecture to open the field for comments.

On 7 March 2017 at 04:58, Andre McCurdy <armccurdy@gmail.com> wrote:

> The largefile distro feature has been enabled by default in oe-core
> for a long time and, more recently, also in poky-tiny. Building
> without the largefile distro feature receives little or no testing.
> Many packages now enable LFS without exposing a configure option, so
> there should be very little expectation that disabling the distro
> feature will result in a distro which globally disables LFS.
>

So I've had a bug for this for some time but have never got around to it.

If we're going to assert "LFS by default" do we want a sanity check to
verify it was used?

Do we want to put -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 in the default
CFLAGS?

I'm not aware of any good reason to not use LFS, but now is the time for
anyone else to speak up if you have a good reason to keep it as an option!

Ross

--94eb2c06093c106843054a219542
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">CCing openembedded-architecture=
 to open the field for comments.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra"><div class=3D"gmail_quote">On 7 March 2017 at 04=
:58, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.=
com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-=
left:1ex"><div id=3D"gmail-:2m3" class=3D"gmail-a3s gmail-aXjCH gmail-m15aa=
722cead5dc11">The largefile distro feature has been enabled by default in o=
e-core<br>
for a long time and, more recently, also in poky-tiny. Building<br>
without the largefile distro feature receives little or no testing.<br>
Many packages now enable LFS without exposing a configure option, so<br>
there should be very little expectation that disabling the distro<br>
feature will result in a distro which globally disables LFS.<br></div></blo=
ckquote></div><br>So I&#39;ve had a bug for this for some time but have nev=
er got around to it.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">If we&#39;re going to assert &quot;LFS by default&quot; do=
 we want a sanity check to verify it was used?</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Do we want to put=C2=A0<span style=
=3D"font-size:12.800000190734863px">-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=
=3D64 in the default CFLAGS?</span></div><div class=3D"gmail_extra"><span s=
tyle=3D"font-size:12.800000190734863px"><br></span></div><div class=3D"gmai=
l_extra"><span style=3D"font-size:12.800000190734863px">I&#39;m not aware o=
f any good reason to not use LFS, but now is the time for anyone else to sp=
eak up if you have a good reason to keep it as an option!</span></div><div =
class=3D"gmail_extra"><span style=3D"font-size:12.800000190734863px"><br></=
span></div><div class=3D"gmail_extra"><span style=3D"font-size:12.800000190=
734863px">Ross</span></div></div>

--94eb2c06093c106843054a219542--
