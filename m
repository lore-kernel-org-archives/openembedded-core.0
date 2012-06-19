Received: from moutng.kundenserver.de ([212.227.126.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve.english@navetas.com>) id 1Sh2Cd-0004vd-BR
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 19:26:55 +0200
Received: from mail-gh0-f175.google.com (mail-gh0-f175.google.com
	[209.85.160.175])
	by mrelayeu.kundenserver.de (node=mrbap0) with ESMTP (Nemesis)
	id 0MOkKM-1Sn4Ff1ZdW-0064SJ; Tue, 19 Jun 2012 19:03:33 +0200
Received: by ghbz2 with SMTP id z2so4459745ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 10:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=TTHasnWvC4UObcHe3ggP1JgXUa5z1nJKEv7BwzvMuIU=;
	b=Y4eLjWbuDA7j5HcndhQ2hMIRJwKFkn7/w7PmJx0xCBoGS2mW9i6p0tX7XgKs0sAQxp
	4+MyGidfKujPIcCVQlh7lgvGGmQssBMQu7pqNR0BR6ZsWIah7PU+urnVjTMnETNd7x0U
	tPeb8JQyg63MISGXNh1CszMuBWZaq7R7BFSH9oTjkLzwEv6r70WLAJqg6lSCp/cjvHwJ
	wTzfPi/kyZUKm29IUa7A2L1FKV5X5fG7eb20ntgJtEnt5z9hObFXQR7HJ3iq5KP1O355
	8724j0lZRJ/Xm4iqG+boXQcSTThy2JvFn5pqUbSGAWiOsxYeAYNS41JXtSgJU3R3UVve
	wwxg==
MIME-Version: 1.0
Received: by 10.50.185.163 with SMTP id fd3mr2049275igc.22.1340125411808; Tue,
	19 Jun 2012 10:03:31 -0700 (PDT)
Received: by 10.64.77.130 with HTTP; Tue, 19 Jun 2012 10:03:31 -0700 (PDT)
Date: Tue, 19 Jun 2012 18:03:31 +0100
Message-ID: <CANrdZLjpmXK5j+jr=fTD43je2Ni6exWGcrCkejKgE1ZZXe5TGQ@mail.gmail.com>
From: Steve English <steve.english@navetas.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQk743KcHVQ8bS+yDOjfvyiS/AJOuQ8cwFusZA992GHaljp+xAeVXPfkbDqpWWCo9Qnz1044
X-Provags-ID: V02:K0:+0pD4DV8dl462dYdVP9iHPa+hoHn3H0KlGBAD/hm3x1
	tXrmUGSG/EHUVTea2HmyKLuJS8/aeVTBgdzD1Xn+9XTwPoXQ5H
	bwVJSxU1+J+Q5rfcTiHNHtshmmEEXHbZhPPqA9L8FtTnicwHKm
	Oom/gZbhQqJPBLvYK23WNgmJBRyh0VNmnY0dVTsjuV3+No46Lj
	3p05z1Yr8cVNznXzs6ukn4g8a6nPkBaaP7OfQUckSnyeiZ57pf
	t2HnzHbgIFmYjZwuHfTigjIJIOAA9oWmiu32agiyCvfm1jCl4P
	ZOC/tRgUnVp4gh57cmu+JJ6Aj9VrohNlu+KYofE60u8VfoBNUy
	laanpWHO72V5961u2jh77afxdgnv1uA8D5Ux3WrW8yQ/KiwYpt
	j92vCc+K1qRHcUl4moCEdLTpIRx6b4/S1EAAUm5ZN6d8knVooE JhlV0
Subject: Generating a movable SDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2012 17:26:55 -0000
Content-Type: multipart/alternative; boundary=14dae9340d8b2015c804c2d6431b

--14dae9340d8b2015c804c2d6431b
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I've generated a cross compiling ARM SDK
(angstrom-eglibc-x86_64-armv7a-v2012.05-toolchain.tar.bz2) that works great
if installed in /usr/local/oecore-x86_64. I would like to move these
binaries and run them from under my home directory (on this and other host
machines).

I can tweak the PATH and use --sysroot where appropriate, but the ELF
binaries themselves specify a loader of
/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2
in their .interp header. Is it possible to generate an SDK that uses the
standard host loader, or at least uses a relative path for the built loader?

I have also asked this question (in a slightly more generic form) on Stack
Overflow http://stackoverflow.com/q/11104609/307745

Thanks,

Steve

--14dae9340d8b2015c804c2d6431b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br>I&#39;ve generated a cross compiling ARM SDK (angstrom-eglibc-x86_64=
-armv7a-v2012.05-toolchain.tar.bz2) that works great if installed in /usr/l=
ocal/oecore-x86_64. I would like to move these binaries and run them from u=
nder my home directory (on this and other host machines).<br>
<br>I can tweak the PATH and use --sysroot where appropriate, but the ELF b=
inaries themselves specify a loader of /usr/local/oecore-x86_64/sysroots/x8=
6_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 in their .interp header. Is=
 it possible to generate an SDK that uses the standard host loader, or at l=
east uses a relative path for the built loader?<br>
<br>I have also asked this question (in a slightly more generic form) on St=
ack Overflow <a href=3D"http://stackoverflow.com/q/11104609/307745">http://=
stackoverflow.com/q/11104609/307745</a><br><br>Thanks,<br><br>Steve<br>

--14dae9340d8b2015c804c2d6431b--
