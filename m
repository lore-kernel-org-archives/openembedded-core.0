Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 57345760F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 12:59:12 +0000 (UTC)
Received: by qkbi190 with SMTP id i190so64806153qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 05:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DHstok1H5UeT9WI5AcH5Uu0Xchl7q404rBAzBtxATEE=;
	b=bHj8vYWRoBoxu/8LefpuIX2bRPp6JQobXgRrb03Cyt/LKgeD1ff+7lHgfz/ELpUQuS
	A0mM0nJVuEL1IjjhSmWKtLuf1FjjLJQcypkK5bwcisPGjfZO0H6C+E5esrjqvDDnK8TS
	3yDZ4hc+RH0I+QyAjWuWD/nXsS4J/UgyRVfloqkvDps9+yFXykYzCPH+pk4X3c6y/3UG
	eOqLXtVivqC0JYDtGoAZuMgLKy2sYfMIFs0bFLoiet0Pgw+Vm2IGSEksspbjfbZYX9M9
	ivaLxyA2p2hDtUHRyMK2OTi8P8nqJyLHD5Caxc6ZYY6WqLycWUz/Dl2/2Oq1dmmL+jwl
	nvCA==
X-Gm-Message-State: ALoCoQkNmJIwvpBlayvfV/3zNnF/ddUZ/SKffttt++Klg5V/3wIEkCPYA+jdmuzuTOxdXtxJyahM
X-Received: by 10.55.221.9 with SMTP id n9mr11750740qki.64.1444136352903; Tue,
	06 Oct 2015 05:59:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 6 Oct 2015 05:58:53 -0700 (PDT)
In-Reply-To: <fb59210fb91a5209c3d3ce6dbce38ff1@technux.se>
References: <cover.1413452836.git.kai.kang@windriver.com>
	<6958f500cac37c3534a9f58a8bc7b90cc4c94b7f.1413452836.git.kai.kang@windriver.com>
	<b64576e3c49076498b7cfb0cbf9f3963@technux.se>
	<CAJTo0LZjxvCgVLFGVhn0O2PCWTGYFOM46zZ7KG_tqOZgzd9xgQ@mail.gmail.com>
	<fb59210fb91a5209c3d3ce6dbce38ff1@technux.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Oct 2015 13:58:53 +0100
Message-ID: <CAJTo0LYiW1X+kZi0ra0JUMeywQVu4w492ULyRXcytpYFWiiwng@mail.gmail.com>
To: petter@technux.se
Cc: Openembedded core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] readline: Security Advisory - readline - CVE-2014-2524
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
X-List-Received-Date: Tue, 06 Oct 2015 12:59:13 -0000
Content-Type: multipart/alternative; boundary=001a1149d604529a0705216f3263

--001a1149d604529a0705216f3263
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6 October 2015 at 12:23, Petter Mab=C3=A4cker <petter@technux.se> wrote:

>  The patch must be applied by something/someone.. For example Debian
> solves it by doing their own .diff patch (
> http://http.debian.net/debian/pool/main/r/readline6/readline6_6.3-8.debia=
n.tar.xz).
> I can send a suggestion about how to solve this in a proper way.
>

Whoops, the file wasn't renamed to .patch and even after being renamed, it
isn't actually a properly formatted patch.  I'll fix this up now.

Thanks for noticing!

Ross

--001a1149d604529a0705216f3263
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 October 2015 at 12:23, Petter Mab=C3=A4cker <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:petter@technux.se" target=3D"_blank">petter@technux.se</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
">=C2=A0The patch must be applied by something/someone.. For example Debian=
 solves it by doing their own .diff patch (<a href=3D"http://http.debian.ne=
t/debian/pool/main/r/readline6/readline6_6.3-8.debian.tar.xz" target=3D"_bl=
ank">http://http.debian.net/debian/pool/main/r/readline6/readline6_6.3-8.de=
bian.tar.xz</a>). I can send a suggestion about how to solve this in a prop=
er way.</div>
<div class=3D"gmail_extra"></div></blockquote></div><br>Whoops, the file wa=
sn&#39;t renamed to .patch and even after being renamed, it isn&#39;t actua=
lly a properly formatted patch.=C2=A0 I&#39;ll fix this up now.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks for notici=
ng!</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a1149d604529a0705216f3263--
