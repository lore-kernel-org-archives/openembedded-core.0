Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA6977A9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 15:33:52 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id d80so9915845qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vaf5KIBak/jlQjEfgaZH8SpVuPis4drIFhkh0vdkx+0=;
	b=C+SaIhwd0Zq9J2aql9O5Kzhb3cTZMVjwazpGCpaFKFZPhNSXgT/0RU8AdcwmuXV9ek
	AIiqPocwpnd8zA++KkMJUmBbFDwoliX2MpvR+bhy/U4FOL/PCI8ocHd23ml8A3CJVCkK
	arB3fXAZpchMryjBwmWrs4evcWY4zqz3NEUDb3OhxOhniJoIWtFmavrYxevmo3fLqDRZ
	DCpX7dgs5x8JT/z+qDhm4ivC0Kuf2HD5B4zTQ9rxFdoXJiw8uOazog4Su8JTC+b8r26G
	XcJBhPXimmhhsRwrqhdqbS9A3BRmVXtAEd5aqR7qU1cnVWvB9G5LGJylQXbljaD4xxs/
	DwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vaf5KIBak/jlQjEfgaZH8SpVuPis4drIFhkh0vdkx+0=;
	b=XOqOoOO+NJNZL1bO2ccWEfYC9+uK49ZLsy2O2vY10D2nE1Nyp42gEoX1mM1pULzrYy
	KeGWTOlEI40xTaBa600tfdR31WSh7em8Cs2FMa5KMGbUf9sHGU8NQmtbUOU8nH4vkHmp
	1RkJj95eE359hPIS2QdbsumpURLtrROlcy865la2tO1LzO7K+abWr/vevXe1ZGhGq75I
	tYVXOD3n58GamhjyfQ0z0eRjtCINctCYy3cYPWCs5KZB/QFl0xCE7glI9jKMddbQ7T0x
	jFAT0E8Bp2yAeWWTFHef0YXDcwWLEUDfn8H+y51k5sDp8xuQBVNnq6Wf7GW6bIxzV7ia
	oiaw==
X-Gm-Message-State: AN3rC/7xIBZyWUZK9UIDG+lo2gu2t1yBoXjUSD4HVemPzyOeYFaFf54l
	Qnr5y655hqVzpN/O1NxFfPy1R3LL3RAN
X-Received: by 10.55.115.65 with SMTP id o62mr13238650qkc.26.1492788833420;
	Fri, 21 Apr 2017 08:33:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 21 Apr 2017 08:33:33 -0700 (PDT)
In-Reply-To: <1492521609-26624-3-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
	<1492521609-26624-3-git-send-email-ferlandm@amotus.ca>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Apr 2017 16:33:33 +0100
Message-ID: <CAJTo0LY+Yw9K2W+ZJ3uLNDurBCLd9xV8huoBLwcNZQG=SEd5WQ@mail.gmail.com>
To: Marc Ferland <ferlandm@amotus.ca>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 2/8] bluez5: remove libasound-module references
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
X-List-Received-Date: Fri, 21 Apr 2017 15:33:53 -0000
Content-Type: multipart/alternative; boundary=001a114fdea2245a03054daefc67

--001a114fdea2245a03054daefc67
Content-Type: text/plain; charset=UTF-8

On 18 April 2017 at 14:20, Marc Ferland <ferlandm@amotus.ca> wrote:

> -PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex
> ${PN}-noinst-tools"
> +PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
>

packagegroup-base still refers to this package though:

  - nothing provides libasound-module-bluez needed by
packagegroup-base-bluetooth-1.0-r83.0.qemux86_64

Ross

--001a114fdea2245a03054daefc67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2017 at 14:20, Marc Ferland <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ferlandm@amotus.ca" target=3D"_blank">ferlandm@amotus.ca</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex"><div id=3D"gmail-:1xb" class=3D"gmail-a3s gmai=
l-aXjCH gmail-m15b8139e06b17090">-PACKAGES =3D+ &quot;libasound-module-<spa=
n class=3D"gmail-il">bluez</span> ${PN}-testtools ${PN}-obex ${PN}-noinst-t=
ools&quot;<br>
+PACKAGES =3D+ &quot;${PN}-testtools ${PN}-obex ${PN}-noinst-tools&quot;<br=
></div></blockquote></div><div class=3D"gmail_extra"><br></div>packagegroup=
-base still refers to this package though:</div><div class=3D"gmail_extra">=
<br>=C2=A0 - nothing provides libasound-module-bluez needed by packagegroup=
-base-bluetooth-1.0-r83.0.qemux86_64</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a114fdea2245a03054daefc67--
