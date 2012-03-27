Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joaohf@gmail.com>) id 1SCdPY-0007r8-WA
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 22:54:37 +0200
Received: by bkcjg15 with SMTP id jg15so381334bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 13:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=In8bJjfTwN6pZDyA9+CRp/wPnCWu3zMYZkGg/VNmcW4=;
	b=m4n1+UDkoOapey9GzoqUM8dnWBnehx6mbhV6Zsi+7hWsZr42tVo6VpXosiUie+jM78
	62CFVB3k6G6hLsGaCzLbyary6M05TGBAXV8kr0ia9i7atdCzd5Ty8vs7EXFGKYYazUg8
	DNKu2LwlWMoi2lelcUEYsgkOKs56LtrXxJWUKmZIXhbN4I1t4ZfgjQb46qHBxheGkjzn
	ig1DxkC77AAcwCJOFI4mMrrBcSR0yYLlnUphhFzElcPW2fkTUSTUuhv+sIC/YvqOxq9S
	oVx5pKHI5l6mxVWf5F58uYkfsa6lfHfekbyyyFR5XK/1wZzTCgLMbh+H7O5vHCKrNtrA
	p7Mg==
MIME-Version: 1.0
Received: by 10.204.151.81 with SMTP id b17mr4720690bkw.17.1332881135690; Tue,
	27 Mar 2012 13:45:35 -0700 (PDT)
Received: by 10.205.40.4 with HTTP; Tue, 27 Mar 2012 13:45:35 -0700 (PDT)
In-Reply-To: <1658718.eaPkFfPBtZ@helios>
References: <cover.1332826876.git.sgw@linux.intel.com>
	<1443918.kuu0Jnlh65@helios> <4F7203EA.4030104@linux.intel.com>
	<1658718.eaPkFfPBtZ@helios>
Date: Tue, 27 Mar 2012 17:45:35 -0300
Message-ID: <CANFVK7_5o9TRPJQz0qVrsVjwLC_fgK_hYN-1oaa_kc6RG3Or2A@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Setup for VMDK to use Direct Disk
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
X-List-Received-Date: Tue, 27 Mar 2012 20:54:37 -0000
Content-Type: multipart/alternative; boundary=0015175cabae9ee4ec04bc3f925c

--0015175cabae9ee4ec04bc3f925c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I guess we can just put that in the docs for now. For future improvement
> though I wonder if we can trick the fetcher into just pulling across the
> current files into the rootfs. I'll put that on my todo list for later.
>


The following thread suggest a patch to fix it:

http://sourceforge.net/mailarchive/forum.php?thread_name=3D1307458172.10974=
.64.camel%40skunk&forum_name=3Dgenext2fs-devel

Thanks.

--=20
-----------------------------------------------------------
Jo=C3=A3o Henrique Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil
BSD051283
LPI 1
http://www.joaohfreitas.eti.br

--0015175cabae9ee4ec04bc3f925c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br>Hi,<br><br>
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I guess we can ju=
st put that in the docs for now. For future improvement<br>
though I wonder if we can trick the fetcher into just pulling across the<br=
>
current files into the rootfs. I&#39;ll put that on my todo list for later.=
<br clear=3D"all"></blockquote></div><br><br>The following thread suggest a=
 patch to fix it: <br><br><a href=3D"http://sourceforge.net/mailarchive/for=
um.php?thread_name=3D1307458172.10974.64.camel%40skunk&amp;forum_name=3Dgen=
ext2fs-devel">http://sourceforge.net/mailarchive/forum.php?thread_name=3D13=
07458172.10974.64.camel%40skunk&amp;forum_name=3Dgenext2fs-devel</a><br>
<br>Thanks.<br><br>-- <br>-------------------------------------------------=
----------<br>Jo=C3=A3o Henrique Freitas - <a href=3D"http://joaohf_at_gmai=
l.com">joaohf_at_gmail.com</a><br>Campinas-SP-Brasil<br>BSD051283<br>LPI 1<=
br>
<a href=3D"http://www.joaohfreitas.eti.br">http://www.joaohfreitas.eti.br</=
a><br>

--0015175cabae9ee4ec04bc3f925c--
