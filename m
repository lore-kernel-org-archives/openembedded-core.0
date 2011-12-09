Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ6x1-0000b4-KX
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 21:21:47 +0100
Received: by lahd3 with SMTP id d3so1260233lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 12:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=7Hbxyb73LIb4OtbQKiOG/gj9JJl8/WxHBQkf/7xo+F8=;
	b=gAQJnSM6rIcAZDU8RsS3xeOcQ4cCgILI+9ZBLe+4QReka1dJ3hkKVE2zWvTiWX10YK
	q5R/FBlLRTxW1D5CV6iqTqePfJN2RxnpfYG5jjrBDdhab+yz+DdeUoITZWXZnlJmAeJN
	tqJwv5ayHQbj9lfrQUikGYbFfc+Y1A9zfLJ04=
Received: by 10.152.128.103 with SMTP id nn7mr3502894lab.48.1323461696285;
	Fri, 09 Dec 2011 12:14:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 12:14:25 -0800 (PST)
In-Reply-To: <1323460893-30873-1-git-send-email-otavio@ossystems.com.br>
References: <1323460893-30873-1-git-send-email-otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 12:14:25 -0800
Message-ID: <CAMKF1spbr_wVbi7tLToDF3bPhg28cAGz_JVVWFg59iGHEM5quA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: avoid checking for linux/if_alg.h header
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
X-List-Received-Date: Fri, 09 Dec 2011 20:21:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2011 at 12:01 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> +# alg-test doesn't build, so disable that and test
> +# for if_alg.h as this header is only in 2.6.39
> +do_configure_prepend() {
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's:tools/alg-test ::g' Makefile.am
> + =C2=A0 =C2=A0 =C2=A0 sed -i 's:AC_CHECK_HEADERS(linux/if_alg.h, dummy=
=3Dyes,::g;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s:AC_MSG_ERROR(User-sp=
ace algorithm header files are required))::g' configure.ac
> +}
> +

may be you can cache that in site files instead of this.


