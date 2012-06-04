Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SbStO-0003qj-7R
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 10:44:02 +0200
Received: by obhx4 with SMTP id x4so8206281obh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 01:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=453YIy16If1EKrs6PycUDhXT8FexxS63+bCgzcj+nFk=;
	b=CTn6jTMe5uby+RDs7Jqkwxrxwgb4kI+MthOtw4wp+KKIp1Mws3AFkQrhUYMZeNLByb
	dH9PoSFjX9e0bhEcbyY6pI/zEqCLeamzPJb8MHHlSvaOFosnqyjIa6dV0fdb2zlHgCQV
	YxWyzUsxJbp1qmwm8Nycwn3Doq4G4vsl/dxA8M1InssgQfNcnP/c98GcPbsue6VT6q4z
	mL7bFVR1sQtlBxEmY3AtqeVdZbP4JkkPEr7uFT5Qx4ygylh8o0NgBuKwh2e71tQtdy8+
	TlZSixqdTv5yNvb9RCEtoG75tNFouHfbOk5wU2+ORljLpt/tKFgb+auOfcKRH9xSx9/l
	plZg==
MIME-Version: 1.0
Received: by 10.60.9.193 with SMTP id c1mr10899030oeb.47.1338798817268; Mon,
	04 Jun 2012 01:33:37 -0700 (PDT)
Received: by 10.182.8.3 with HTTP; Mon, 4 Jun 2012 01:33:37 -0700 (PDT)
In-Reply-To: <CAOHjBZukor5Cy+2N-s0rFiiwR8Epp2vDaPuw7o5B4u-BMno3LQ@mail.gmail.com>
References: <CAOHjBZukor5Cy+2N-s0rFiiwR8Epp2vDaPuw7o5B4u-BMno3LQ@mail.gmail.com>
Date: Mon, 4 Jun 2012 10:33:37 +0200
Message-ID: <CAOHjBZvFwiq97xv2kf6OjvCbPUCmX5tQ0P5NjvWXb--97oVvgg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libiconv/gettetxt circular dependency on eglibc
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
X-List-Received-Date: Mon, 04 Jun 2012 08:44:02 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c916edd3de04c1a163c3

--e89a8ff1c916edd3de04c1a163c3
Content-Type: text/plain; charset=ISO-8859-1

Solved,
I missed to set TARGET_OS = "eglibc" leaving it to "uclibc", my previous
build...

Cheers,
Giuseppe

2012/6/4 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> Hi All,
>
> I'm falling in a circular dependency error between libiconv and gettext
> during eglibc build.
> libiconv (as set in tclibc-eglibc.inc) is set to "eglibc", so the recipe
> for libiconv shouldn't be included
> in the build list (it inherits gettext and gettext depends on libiconv).
> Please can you clarify this?
>
> Many thanks,
> Giuseppe
>

--e89a8ff1c916edd3de04c1a163c3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Solved,</div><div>I missed to set TARGET_OS =3D &quot;eglibc&quot; lea=
ving it to &quot;uclibc&quot;, my previous build...</div><div>=A0</div><div=
>Cheers,</div><div>Giuseppe<br><br></div><div class=3D"gmail_quote">2012/6/=
4 Giuseppe Condorelli <span dir=3D"ltr">&lt;<a href=3D"mailto:giuseppe.cond=
orelli@gmail.com" target=3D"_blank">giuseppe.condorelli@gmail.com</a>&gt;</=
span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div>Hi All,</div><div>=A0</div><div>I&#39;m falling in a =
circular dependency error between libiconv and gettext during eglibc build.=
</div>
<div>libiconv (as set in tclibc-eglibc.inc) is set to &quot;eglibc&quot;, s=
o the recipe for libiconv shouldn&#39;t be included</div>

<div>in the build list (it inherits gettext and gettext depends on libiconv=
).</div><div>Please can you clarify this?</div><div>=A0</div><div>Many than=
ks,</div><div>Giuseppe</div>
</blockquote></div><br>

--e89a8ff1c916edd3de04c1a163c3--
