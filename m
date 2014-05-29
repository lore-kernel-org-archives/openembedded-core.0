Return-Path: <diego.sueiro@gmail.com>
X-Greylist: delayed 415 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 May 2014 13:24:16 UTC
Received: from mail-qg0-f52.google.com (unknown [209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3096FC7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 13:24:16 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id a108so898195qge.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=88/GN6jnJueL+TdynqlD6QewyPAChr6eTx96mKk46Lw=;
	b=qavm72uUTxvVGbfMeCSu8RmiZjSmZiui4uE6Z5o1fPIR/2puB3G5PkK2ryzxlVnpar
	xXbPerFX4xoHieMeFqW0OzPFR4wjXH265Ttozf/ogXhWYPypqpmkgkrq5lIdd/ojqMpz
	Firijl6cVOXEXf1STokOovsHZ3MkRGJMYny5SK8gnsF1aQQKkblT2i2S/NuneubplB22
	fvAKwe3eCbIZo8jLrsrDWGvgLwhYXzug0m3w48kYJT85NCVT+CY9tdT+oFnT+EPNqZsD
	OqKzVsEItwa2qH/yVzhpAC8rdEDqNLBtbrdPdYMv9aTyDWJLPh23ogyWuMH1p0QzRhin
	/N1Q==
X-Received: by 10.224.37.130 with SMTP id x2mr10215972qad.36.1401369442507;
	Thu, 29 May 2014 06:17:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Thu, 29 May 2014 06:17:02 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 29 May 2014 10:17:02 -0300
Message-ID: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: intltool version check errors
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
X-List-Received-Date: Thu, 29 May 2014 13:24:18 -0000
Content-Type: multipart/alternative; boundary=001a11c2b282d1e20604fa89bf9c

--001a11c2b282d1e20604fa89bf9c
Content-Type: text/plain; charset=ISO-8859-1

Folks,

I'm facing with a strange error on daisy branch.
Some native recipes are failing on do_configure step with this message:

checking for intltool >= 0.35.0...
/<snip>/tmp/sysroots/x86_64-linux/usr/bin/nativeperl found
configure: error: Your intltool is too old.  You need intltool 0.35.0 or
later.
Configure failed. The contents of all config.log files follows to aid
debugging


But intltool-native version is 0.50.2.
What am I missing?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c2b282d1e20604fa89bf9c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Folks,</div><div><br></div><div>I&#39;m facing with a=
 strange error on daisy branch.</div><div>Some native recipes are failing o=
n do_configure step with this message:</div><div><blockquote style=3D"margi=
n:0px 0px 0px 40px;border:none;padding:0px">

<div><div>checking for intltool &gt;=3D 0.35.0... /&lt;snip&gt;/tmp/sysroot=
s/x86_64-linux/usr/bin/nativeperl found</div><div>configure: error: Your in=
tltool is too old. =A0You need intltool 0.35.0 or later.</div><div>Configur=
e failed. The contents of all config.log files follows to aid debugging</di=
v>

</div></blockquote></div><div><br></div><div>But intltool-native version is=
 0.50.2.<br></div><div>What am I missing?</div><div><br></div><br clear=3D"=
all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>
Diego Sueiro<br>
<br>Administrador do Embarcados<br><a href=3D"http://www.embarcados.com.br/=
?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DA=
ssinatura%20Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br><=
br>/*long live rock &#39;n roll*/<br>

</div></div>
</div>

--001a11c2b282d1e20604fa89bf9c--
