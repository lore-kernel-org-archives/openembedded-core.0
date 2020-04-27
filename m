Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web11.304.1587999687957485434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 08:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 1DC592E8925;
	Mon, 27 Apr 2020 10:01:26 -0500 (CDT)
Date: Mon, 27 Apr 2020 10:01:23 -0500
From: "Seebs" <seebs@seebs.net>
To: "kai" <kai.kang@windriver.com>
Cc: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pseudo: add macro guard for seccomp
Message-ID: <20200427100123.1f7354f4@seebsdell>
In-Reply-To: <20200427060416.40326-1-kai.kang@windriver.com>
References: <20200427060416.40326-1-kai.kang@windriver.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Apr 2020 14:04:16 +0800
"kai" <kai.kang@windriver.com> wrote:

> | ports/linux/pseudo_wrappers.c:129:14: error:
> =E2=80=98SECCOMP_SET_MODE_FILTER=E2=80=99 undeclared (first use in this f=
unction)
> |    if (cmd =3D=3D SECCOMP_SET_MODE_FILTER) {

Should the test be against this being #defined, rather than the
separate SYS__seccomp?

-s
