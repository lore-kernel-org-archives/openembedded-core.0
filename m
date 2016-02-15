Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id C36726011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 10:30:31 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id 5so52824057igt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 02:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=O24ULeeiXgqAQ+AOtJ1ON6hMQcsXKYU16Ed9R53QcHI=;
	b=vru3tW77joQKP274VT2yvgqY1sd2d/c+Ygd6Ia36qjJ+iwmISHA2dDHpS7NleJi98N
	YyB1+77abnSfCNg0833loq751clEG6bs63zWbsb67lkI4Ox3a5wf1BbxwAZ80JUaSIQ6
	lUBj99jfjqf7GbEYtjt7jTqmHjPraJoN80SxVw2gtPLcmQw5sqULyFrJTQM2RCTaW22W
	wtTHC4cnkH5+po1ZlMiia3vNrCrwA7GridP+BIF1Cz6+IV+aHrlEwlYrphjY19dx9CkY
	Y1CiaF+Wgzi9q9adzIZf748lOYtccIhIwyA5VwKMtn02xuDkh5ob7MdY1WDGnBbv8mW7
	vg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=O24ULeeiXgqAQ+AOtJ1ON6hMQcsXKYU16Ed9R53QcHI=;
	b=U+y1xnkTfq4LnRQf+YH+pC9+HJrvbZaSsBAQZOD0SuGVvMBcyO2lDSzg+rTzk13rn+
	7uWp63/3XplU/qW0sTPurH7AVVPXYmWHeRfnb3fsoCctVDtuv+1opaNx1oI7OuesCLXP
	3MfEDBPGNLqBAvERHW92KzooneQLUmFWgrRgjodskGsQIYZn/i3seiDAX/5Fu9bOul50
	HBuPEeisA0wG7xdLq2BVeR5yUU0Za75vstcBK6FW6gMXR8nNrEbA+/g2t9Qz0JP1hiWt
	VQGVWHn+CbCMhnsqh22hIEIxMDBLeOX9dQFDJI21WHiS5h6fnp1lbcxvozuQcuws2eFU
	7FOQ==
X-Gm-Message-State: AG10YORs1VlwxKWmIUgK3oH0q9YahEsdfCyARjnhdu/dgRpq2ClDztp7hQcSizlOa3kj/YJVKts3lBrosXgTjPZs
X-Received: by 10.50.126.8 with SMTP id mu8mr11207252igb.52.1455532232588;
	Mon, 15 Feb 2016 02:30:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 15 Feb 2016 02:30:13 -0800 (PST)
In-Reply-To: <1455522477-32256-1-git-send-email-rongqing.li@windriver.com>
References: <1455522477-32256-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 10:30:13 +0000
Message-ID: <CAJTo0Lb5CtPQtRcOF0Bg6sd883Ah_SKFPL2Mimc82-OiyaKuLg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-serialgetty: fix a typo
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
X-List-Received-Date: Mon, 15 Feb 2016 10:30:32 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bfaecf8d052bcc811e

--047d7b1635bfaecf8d052bcc811e
Content-Type: text/plain; charset=UTF-8

On 15 February 2016 at 07:47, <rongqing.li@windriver.com> wrote:

> -SERIAL_CONSOLE ?= "115200 ttyS0"
> +SERIAL_CONSOLES ?= "115200 ttyS0"
>

bitbake.conf says:

SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', ';')}"

And the relevant commit introducing _CONSOLES says:

    Just define additional serial consoles like so:
    SERIAL_CONSOLES="115200;ttyS0 115200;ttyS1 ... 115200;ttySN"

So moving from CONSOLE to CONSOLES is more than just adding an S.

Anyway, surely the machine should be setting this if required?  Why does
systemd-serialgetty think that ttyS0 should be a serial console if the
machine doesn't say so?

Ross

--047d7b1635bfaecf8d052bcc811e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 February 2016 at 07:47,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rong=
qing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div id=3D":2uk" class=3D"" style=3D"over=
flow:hidden">-SERIAL_CONSOLE ?=3D &quot;115200 ttyS0&quot;<br>
+SERIAL_CONSOLES ?=3D &quot;115200 ttyS0&quot;<br></div></blockquote></div>=
<br>bitbake.conf says:</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">SERIAL_CONSOLES ??=3D &quot;${@d.getVar(&#39;SERIAL_CONSOL=
E&#39;, True).replace(&#39; &#39;, &#39;;&#39;)}&quot;<br></div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">And the relevant comm=
it introducing _CONSOLES says:</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra"><div class=3D"gmail_extra">=C2=A0 =C2=A0 Just defi=
ne additional serial consoles like so:</div><div class=3D"gmail_extra">=C2=
=A0 =C2=A0 SERIAL_CONSOLES=3D&quot;115200;ttyS0 115200;ttyS1 ... 115200;tty=
SN&quot;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">So moving from CONSOLE to CONSOLES is more than just adding an S.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Anyway, =
surely the machine should be setting this if required?=C2=A0 Why does syste=
md-serialgetty think that ttyS0 should be a serial console if the machine d=
oesn&#39;t say so?</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div></div>

--047d7b1635bfaecf8d052bcc811e--
