Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 790EF77246
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 21:05:08 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l127so1868866iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 13:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ku5x5xb1ahs6+48RpPul7fgVF6sRKClizvlKwvcL/50=;
	b=dxNmqbxfeBirwzlk/1ng42enZplJBhvbkuk/M1GFSHqvaQt6vVqBZ5fiTj68/8P+3Q
	koE+hZEFfto+h0/OzwvL8frdiXafcCoj1i/dZQuO87+qf8X/kek4Q8TZyShrWwKb+MC0
	oB+daGg/2ZJ6Aj0FJ8QkXPZXSKATmJaKAv1GfhFPJG2WB/xiXdciIS75Xh2Pei2L7f8m
	TWN70qBX1dnvyeJlDBfR/yUvIjCd0hZLIf6jQY2UqucI4xSD9FlKx4hON5Z7HCt8J7wM
	RXJBNJS1OBWXJp45Cyay5hSCmyE87VNq8Su6mdOml/c5xDviM4btu7GqGqP6xJBIjEtM
	MTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ku5x5xb1ahs6+48RpPul7fgVF6sRKClizvlKwvcL/50=;
	b=EkNGYlvHVJGYX9qtPIyIS2Vy9PgTo14zd8t7sTvdoD60TazAjvoWeov/NtVTxU+RSD
	+IuLjHfLMQpMrKTa8YOd5IEyJKGM8gktosuMONYzKbWqdF0UeSkwO6n6I8lxp8VnsJoV
	pL022Cp883geN4jQvS6hZyNAI+Xp2dc80A26J/Vus+HyfDsueUqtZQ7WeGLRT7Vf3gXi
	vDMv400/z4fGvco1GvyYCi1NEgyAVQKwLQ4fplOa6FI9K5sMuFa2Sh3LFyOk6TOOFpxY
	A6Z2wUn2z748g/fp4SoUpsAvLnJ1HWT0Zjvn+U/2RrRfuhrSFZ3itREDcboECBReULCa
	rU5A==
X-Gm-Message-State: AG10YOTPfnqW6ljJJOdVBWPM+SJr8GTTtTXviTYTpxCXdD3M2G+GWPHpQBkl/7+4yOECexhzJUdaOGU5UuiJPysE
X-Received: by 10.107.3.220 with SMTP id e89mr33630005ioi.99.1456261509120;
	Tue, 23 Feb 2016 13:05:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 23 Feb 2016 13:04:49 -0800 (PST)
In-Reply-To: <1456228061-17206-1-git-send-email-guojian.zhou@windriver.com>
References: <1456228061-17206-1-git-send-email-guojian.zhou@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 21:04:49 +0000
Message-ID: <CAJTo0La=5Wo4hseZi-_PjZg0eanh-Qf=1aGpK71iqvTT_OyPmQ@mail.gmail.com>
To: guojian.zhou@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] oe-core: Update alternatives of man pages
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
X-List-Received-Date: Tue, 23 Feb 2016 21:05:08 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7cf3be3a052c764d11

--001a113f0e7cf3be3a052c764d11
Content-Type: text/plain; charset=UTF-8

On 23 February 2016 at 11:47, <guojian.zhou@windriver.com> wrote:

> +ALTERNATIVE_${PN}-doc += "eject.1 su.1"
>

WARNING: util-linux-2.27.1-r0 do_package: util-linux: alternative target
(/usr/share/man/man1/su.1 or /usr/share/man/man1/su.1.util-linux) does not
exist, skipping...
WARNING: util-linux-2.27.1-r0 do_package: util-linux: NOT adding
alternative provide /usr/share/man/man1/su.1:
/usr/share/man/man1/su.1.util-linux does not exist
WARNING: util-linux-2.27.1-r0 do_package: util-linux: alt_link ==
alt_target: /usr/share/man/man1/su.1 == /usr/share/man/man1/su.1

Looks like the generation of the documentation isn't deterministic, can you
fix that first?

Ross

--001a113f0e7cf3be3a052c764d11
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2016 at 11:47,  <span dir=3D"ltr">&lt;<a href=3D"mailto:guoj=
ian.zhou@windriver.com" target=3D"_blank">guojian.zhou@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":c0b" class=3D"" style=3D"ov=
erflow:hidden">+ALTERNATIVE_${PN}-doc +=3D &quot;eject.1 su.1&quot;<br></di=
v></blockquote></div><br><div class=3D"gmail_extra">WARNING: util-linux-2.2=
7.1-r0 do_package: util-linux: alternative target (/usr/share/man/man1/su.1=
 or /usr/share/man/man1/su.1.util-linux) does not exist, skipping...</div><=
div class=3D"gmail_extra">WARNING: util-linux-2.27.1-r0 do_package: util-li=
nux: NOT adding alternative provide /usr/share/man/man1/su.1: /usr/share/ma=
n/man1/su.1.util-linux does not exist<br></div><div class=3D"gmail_extra">W=
ARNING: util-linux-2.27.1-r0 do_package: util-linux: alt_link =3D=3D alt_ta=
rget: /usr/share/man/man1/su.1 =3D=3D /usr/share/man/man1/su.1</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Looks like the gen=
eration of the documentation isn&#39;t deterministic, can you fix that firs=
t?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div></div>

--001a113f0e7cf3be3a052c764d11--
