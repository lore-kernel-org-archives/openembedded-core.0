Received: from mail-gx0-f178.google.com ([209.85.161.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R3n5R-00050t-Ux
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 12:53:02 +0200
Received: by gxk21 with SMTP id 21so12826gxk.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 03:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=s2MA08s/+mJ6ymBC01TQNjaJHxOaz3R5kABX5xTdpio=;
	b=kRXssrOKOUKIpEhYVbnaTVxvErxwe0ZUkf9f7BbYoFLikSFsB40gws62TEtiZ4FqKS
	qYeZk9zQot0a59Un4ulAyPIHTFpbsagi0XkKEw6m+p66UFY2YabhAEP37RJI+oREmt6O
	WQ5/gbLbfgQbxxwBrjFaip1ErBIbpH4Cq543w=
MIME-Version: 1.0
Received: by 10.150.164.21 with SMTP id m21mr3333004ybe.72.1315997270961; Wed,
	14 Sep 2011 03:47:50 -0700 (PDT)
Received: by 10.150.192.6 with HTTP; Wed, 14 Sep 2011 03:47:50 -0700 (PDT)
In-Reply-To: <CAAQYJAuBa8_P_JNoT91RhYNtgEzsp85ovSRSE92MHGNE5bGb-Q@mail.gmail.com>
References: <CAAQYJAuBa8_P_JNoT91RhYNtgEzsp85ovSRSE92MHGNE5bGb-Q@mail.gmail.com>
Date: Wed, 14 Sep 2011 12:47:50 +0200
Message-ID: <CAAQYJAtZgaA3N7P934TAZdbpMgqiCJVu3zq-a_iSTSNcz-x83g@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Klibc
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
X-List-Received-Date: Wed, 14 Sep 2011 10:53:02 -0000
Content-Type: multipart/alternative; boundary=000e0cd5a104dc6f6b04ace47d15

--000e0cd5a104dc6f6b04ace47d15
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 9, 2011 at 11:27 AM, Andrea Adami <andrea.adami@gmail.com>wrote:

> Hello,
>
> we have the latest klibc release in the meta-openembedded layer.
>
> Awaiting an imminent klibc_2.0 release, I'd be grateful if someone could
> review and possibly test the recipes [1]
> which happen to build and package apaprently well for arm and mips targets
> (runtime tested le only).
>
> The recipes can be built separately (e.g. klibc-static-utils only) and are
> packaged
> in order to minimize the fooprint of the runtime dependencies.
>
> Thanks in advance for your comments
>
> Andrea Adami
>
> [1]
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-devtools/klibc
> **



bump

maybe time for a review during kernel.org outage?

For the lazy, klibc is mirrored around atm, ie
http://ftp.heanet.ie/mirrors/linux/libs/klibc/Current/


Thanks

Andrea Adami

--000e0cd5a104dc6f6b04ace47d15
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Sep 9, 2011 at 11:27 AM, Andrea Adami <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:andrea.adami@gmail.com">andrea.adami@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
Hello,<br><br>we have the latest klibc release in the meta-openembedded lay=
er.<br><br>Awaiting an imminent klibc_2.0 release, I&#39;d be grateful if s=
omeone could review and possibly test the recipes [1] <br>which happen to b=
uild and package apaprently well for arm and mips targets (runtime tested l=
e only).<br>

<br>The recipes can be built separately (e.g. klibc-static-utils only) and =
are packaged <br>in order to minimize the fooprint of the runtime dependenc=
ies.<br><br>Thanks in advance for your comments<br><br>Andrea Adami<br>

<br>[1] <a href=3D"http://cgit.openembedded.org/cgit.cgi/meta-openembedded/=
tree/meta-oe/recipes-devtools/klibc" target=3D"_blank">http://cgit.openembe=
dded.org/cgit.cgi/meta-openembedded/tree/meta-oe/recipes-devtools/klibc</a>=
<br>
<b></b>
</blockquote></div><br><br>bump<br><br>maybe time for a review during <a hr=
ef=3D"http://kernel.org">kernel.org</a> outage?<br><br>For the lazy, klibc =
is mirrored around atm, ie <br><a href=3D"http://ftp.heanet.ie/mirrors/linu=
x/libs/klibc/Current/">http://ftp.heanet.ie/mirrors/linux/libs/klibc/Curren=
t/</a><br>
<br><br>Thanks<br><br>Andrea Adami<br>

--000e0cd5a104dc6f6b04ace47d15--
