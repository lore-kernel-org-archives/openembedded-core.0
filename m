Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id DD8BB72492
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 13:44:44 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id b13so3846561qcw.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Dec 2014 05:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qPRBsyhPufCWSZy1kl2uJcyrkz+sudkeQMKx+VDp3OQ=;
	b=R5RryQMZb5tRJBUyRs5z0EgNk8NwpnPnZKH5fxRki0lCseKxFRZTEWdJuSkWqsUXN5
	6IzBXCmhe2q//1c/8qRIuDaVY9E+NqnwlBO9JRwySnzH2pzBlIAm60Gx/428FyqnisOd
	h1mP2YXNrinLCOg6g0kEKZCTEfTqwLo9eoYNeH8AqkeG9WRj7nWLsOkZ8SOMTGRc3eA0
	LAZBUCbDyJByNGjwLfKDJ7gsew1JazPV/NKo710XCo9Qd8ZGZlh9kH+tCINnpmOXgJV6
	msYhpFWc1I2z9kqj8AlFtAAVpD2Xnd3tvUAufgsaQesz0YG9ozgRf6T2SuTWVvyQx+G2
	Ob0A==
X-Gm-Message-State: ALoCoQnRijwesbbtRy0fVFC6uEswjJiTkl7fVxDrYyjFf4y0TKHp1mPI0eSbUjgFrecBam9xqt0d
X-Received: by 10.140.40.209 with SMTP id x75mr22076758qgx.80.1418046284628;
	Mon, 08 Dec 2014 05:44:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 8 Dec 2014 05:44:24 -0800 (PST)
In-Reply-To: <cover.1418017596.git.Chong.Lu@windriver.com>
References: <cover.1418017596.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Dec 2014 13:44:24 +0000
Message-ID: <CAJTo0LZHK+Wa3-EhpFK0Ajr8Cv9a6uQ3mDDmhqSjU8xSSg25CQ@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] use single variable to set baud rate
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
X-List-Received-Date: Mon, 08 Dec 2014 13:44:53 -0000
Content-Type: multipart/alternative; boundary=001a11c128361220070509b4a18b

--001a11c128361220070509b4a18b
Content-Type: text/plain; charset=UTF-8

On 8 December 2014 at 05:47, Chong Lu <Chong.Lu@windriver.com> wrote:

> Chong Lu (2):
>   syslinux.bbclass: use single variable to set baud rate
>   grub-efi.bbclass: use single variable to set baud rate
>

ERROR: ExpansionError during parsing
/home/ross/Yocto/poky/meta/recipes-core/images/
core-image-minimal-mtdutils.bb: Failure expanding variable GRUB_OPTS:
ExpansionError: Failure expanding variable GRUB_OPTS, expression was serial
--unit=${@filter(str.isdigit, d.getVar('SERIAL_CONSOLE', True).split()[1])}
--speed=${@d.getVar('SERIAL_CONSOLE', True).split()[0]} --word=8
--parity=no --stop=1 which triggered exception IndexError: list index out
of range

SERIAL_CONSOLE doesn't have to be set.

Ross

--001a11c128361220070509b4a18b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 8=
 December 2014 at 05:47, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mailto:C=
hong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":24m" class=3D"" style=3D"overflo=
w:hidden">Chong Lu (2):<br>
=C2=A0 syslinux.bbclass: use single variable to set baud rate<br>
=C2=A0 grub-efi.bbclass: use single variable to set baud rate</div></blockq=
uote></div><br>ERROR: ExpansionError during parsing /home/ross/Yocto/poky/m=
eta/recipes-core/images/<a href=3D"http://core-image-minimal-mtdutils.bb">c=
ore-image-minimal-mtdutils.bb</a>: Failure expanding variable GRUB_OPTS: Ex=
pansionError: Failure expanding variable GRUB_OPTS, expression was serial -=
-unit=3D${@filter(str.isdigit, d.getVar(&#39;SERIAL_CONSOLE&#39;, True).spl=
it()[1])} --speed=3D${@d.getVar(&#39;SERIAL_CONSOLE&#39;, True).split()[0]}=
 --word=3D8 --parity=3Dno --stop=3D1 which triggered exception IndexError: =
list index out of range<br></div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">SERIAL_CONSOLE doesn&#39;t have to be set.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c128361220070509b4a18b--
