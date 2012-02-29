Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S2cEn-0004Fz-Lb
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 06:38:05 +0100
Received: by obqv19 with SMTP id v19so1927886obq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2012 21:29:37 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.60.4.105 as permitted sender) client-ip=10.60.4.105; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.60.4.105 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.60.4.105])
	by 10.60.4.105 with SMTP id j9mr8061124oej.29.1330493377107 (num_hops =
	1); Tue, 28 Feb 2012 21:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=7nNQINzxPic1DpveUmytHfvXfIxIIhTsP/XhXS7+i4g=;
	b=eeUJfvxAja1KP3UoFcIRMTIPxvp/H6v7D8l9dzVwj2V6+h1+4nOcoYE9x49hHbLJ/O
	9GdQ0rvDdUkRV1CN3OJ0e3w3JIjsXIbAsR3+ZKFBMa2B8BGA6pR4xjuxho6oo2f+tx15
	4cOIxIwPajxCdtxwRB5bhhJusnKCYZyC0WbuM=
MIME-Version: 1.0
Received: by 10.60.4.105 with SMTP id j9mr7129884oej.29.1330493377030; Tue, 28
	Feb 2012 21:29:37 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Tue, 28 Feb 2012 21:29:37 -0800 (PST)
In-Reply-To: <4F4DB40B.6000300@windriver.com>
References: <CAGDS+nmNeyC3P+x+mk0g-qOKhkJ5pMNhX-ckBXr4F273poq2yw@mail.gmail.com>
	<4F4DB40B.6000300@windriver.com>
Date: Tue, 28 Feb 2012 21:29:37 -0800
Message-ID: <CAGDS+nmKg-iCjTnNrnM9-qBK8JF0MbJB3HX4=PM-06KPNVs_Gg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Mark Hatle <mark.hatle@windriver.com>
Subject: Re: psuedo-native strangeness on 64 bit build machine
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
X-List-Received-Date: Wed, 29 Feb 2012 05:38:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 9:13 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:

> I'm building pseudo on 64-bit machines right now, no problem.
>
> The error you are seeing is pseudo attempting to build both a 64-bit and =
a
> 32-bit wrapper. =A0The 32-bit wrapper is built when the recipe detects su=
pport
> for both 32-bit and 64-bit userspace. =A0It does this by looking first th=
at
> your host is 64-bit, and then for /usr/include/gnu/stubs-32.h. =A0Assumin=
g it
> finds those, it assumes your system has 32-bit binaries on it.

Thanks for the quick reply.

My 64 bit build machine has the ia32-libs package installed and
/usr/include/gnu/stubs-32.h exists.  Any idea why the initial clean
build succeeds, but the rebuild triggered by the pull fails?

> To avoid a 32-bit build of pseudo, on a 64-bit machine. =A0You need to se=
t
> NO32LIBS =3D "1". =A0This instructs pseudo to avoid the 32-bit binary bui=
ld.
> =A0(If your machine has 32-bit binaries on it, you need to fix your compi=
ler
> to allow for 32-bit userspace builds, otherwise pseudo will be incapable =
of
> wrapping any 32-bit binaries, resulting in a potential mismatch of user,
> groups and modes set by any 32-bit applications.

Could you give me a pointer on how to "fix" my compiler to allow for
32-bit userspace builds?

Thanks!

Steve


