Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 89CFA75E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 11:59:49 +0000 (UTC)
Received: by qgt47 with SMTP id 47so79595246qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 04:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=M/e9nL+VPNhGAic4uO0xTIuq7hhwxLnw/fX6wNAoiv8=;
	b=eNdG748LVNCJC+ZnbU/WHnH1l9taX1ZtSU53wffzZjlcAkAAIH3TsRx/uDlVqNb+KX
	RsvErECWBXyYkWEPl0ucuXskwFV5wqeA1txcx0IzfsbOKOpj6ClRXHh00K41BhikaPQ5
	xgrgkSJycECwqvMlcqjPj2yeJZECcZT+3Wtd0NlYK7HCF5wbC9JK6JwH8TH8L3rl4DTw
	TE23fswp8oahsitHWbC00yL9bRfEfhs/niXVR2Rq6PBmf5t8M5TY/W9rOsW597wVHFVW
	biQmn8uK7Y+mHoShjR+lA+TznUmBelMGJiV5mmssH7gKJGY+KkPX4iMTNtWVU+XnkOGQ
	rP5Q==
X-Gm-Message-State: ALoCoQnvFu2mHCu6HieXagHdN1f/L8n32ikdFeIuwe0RnbTfrnXVzHAKIx/fX6SRAjDvZ+cBFp85
X-Received: by 10.140.237.150 with SMTP id i144mr34592279qhc.22.1441713590123; 
	Tue, 08 Sep 2015 04:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 8 Sep 2015 04:59:30 -0700 (PDT)
In-Reply-To: <55EECD6D.3010602@mlbassoc.com>
References: <1441592391-108731-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LYt6Qd0OGqZgGKAtxpKuq9Cr2SUr42=vNa67+zPsUebYg@mail.gmail.com>
	<55EE38C7.30300@windriver.com> <55EECD6D.3010602@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Sep 2015 12:59:30 +0100
Message-ID: <CAJTo0LY7UUh8Lcz0FnqaCvkVtDx7VjWwyJJMwzvtgKS=GcFdYA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnu-efi: Make setjmp.S portable to ARM
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
X-List-Received-Date: Tue, 08 Sep 2015 11:59:51 -0000
Content-Type: multipart/alternative; boundary=001a113595aa685281051f3b1ac4

--001a113595aa685281051f3b1ac4
Content-Type: text/plain; charset=UTF-8

On 8 September 2015 at 12:58, Gary Thomas <gary@mlbassoc.com> wrote:

> Since this file is [obviously] only built on ARM targets,
> perhaps the patch should only be applied there?  e.g. use
>   SRC_URI_arm = "file://gnu-efi-Make-setjmp.S-portable-to-ARM.patch"
> instead of adding it to SRC_URI
>

IMHO, no need to complicate matters like that.

Ross

--001a113595aa685281051f3b1ac4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 September 2015 at 12:58, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"=
mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1um" class=3D"a3s" s=
tyle=3D"overflow:hidden">Since this file is [obviously] only built on ARM t=
argets,<br>
perhaps the patch should only be applied there?=C2=A0 e.g. use<br>
=C2=A0 SRC_URI_arm =3D &quot;file://gnu-efi-Make-setjmp.S-portable-to-ARM.p=
atch&quot;<br>
instead of adding it to SRC_URI</div></blockquote><div><br></div><div>IMHO,=
 no need to complicate matters like that.</div><div><br></div><div>Ross=C2=
=A0</div></div><br></div></div>

--001a113595aa685281051f3b1ac4--
