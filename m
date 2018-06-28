Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id E1BA960017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 11:13:33 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id h10-v6so5088762wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D3xhuXHrrAqg0FjlBJLamc2xG3GEqgkTs2mSPp3Ha3s=;
	b=piEz2Z7tj0D7kyTVsZvxMsCt9CTNmpBpDA+uGLHTIkqIi/fqnqMXCDzU6PEgqTxPZ/
	iwiJju5+v9XFUF5hOnMNI2NC5wtAmRyo48hs3kDtSNBk6WkYG0Z4ENrqr5UKfCGMd4o2
	n7PrGPWwlzJiENqbe15qWK4tRzRaXgFWXtB+bODnfEFpLt6Q+UcvhNdOswPYqg4xS8kk
	YKsPlYmbKjo/8veiR7gLqhY/76ZMkm6fWDpHtjLtjddizgBE/unL4IDj5gjE/QmXm+SM
	L4/UQkXAK1Q5UbrhDNbhF8Z8nIc/zEI+ezPyFQBnZE4nEn+LP7+QPqzYlFWwgGtvq+dq
	Xr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D3xhuXHrrAqg0FjlBJLamc2xG3GEqgkTs2mSPp3Ha3s=;
	b=VLoow47/B3MZRmUyjUqllrbA6ZQbz0Vs/fnnpBeVeVTM5HAP/aa4ea+6EmWTG7oHKQ
	mV1WhiOp3CiutuJfcXCqdUORKcsmTAZP/ABr+QSKff0H3u7KKtHJIHdnGMFd+qTELVnX
	ODskKOWg0Asz3Ij/DGAJpCQits5z8u35yscq31JNmBtS6L3w9Y5wNb9FpICPn3C7gn/7
	hkPrkfAeUjQ5IoOrALVDNHIfFKX6lLkbQHZx8h+0j3hMW3QRh5IbimckguZSfXzOLbo4
	G/v1vbrMDnzTZdJYGllpcllvpsT9oeKrBf7mJgK1ArweXwOLCm3UzFwkr7VjxsoKlGf8
	x8uw==
X-Gm-Message-State: APt69E3GneYV+/K+aaYCNaBvva/TAlzo1TEksN7Sl/Tg1Ij7g/Pmpwgf
	rBEMx46k8s6+BLgIJMYsaPOd1lpmmPl82KOeggE=
X-Google-Smtp-Source: AAOMgpdOFenf8oEDungZ37UIv1XlGFFWhjq1UUdkKOmDkSh8o4nV3TfmXpXHFvCflX4w2G6kuJAYLuhYBWU/i5QNVUU=
X-Received: by 2002:a5d:4091:: with SMTP id
	o17-v6mr4160765wrp.133.1530184414475; 
	Thu, 28 Jun 2018 04:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <969ccd61-7a03-a81f-c36f-04c5d806d3e2@windriver.com>
In-Reply-To: <969ccd61-7a03-a81f-c36f-04c5d806d3e2@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Jun 2018 13:13:22 +0200
Message-ID: <CA+chaQd7LE8y7-xzsPTa0CYS9bq-94MwGE=hFbtgz3odkq-d0g@mail.gmail.com>
To: Kai Kang <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] How to deal allarch packages in dependency chain for multilib rootfs?
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
X-List-Received-Date: Thu, 28 Jun 2018 11:13:34 -0000
Content-Type: multipart/alternative; boundary="000000000000773f2c056fb1d25a"

--000000000000773f2c056fb1d25a
Content-Type: text/plain; charset="UTF-8"

In our build I've removed the openssl runtime dependency
(RDEPENDS_${PN}_remove = "openssl"), because we pull the right version of
openssl (lib32-openssl in our case) to the image elsewhere.

On Thu, Jun 28, 2018 at 10:48 AM Kang Kai <Kai.Kang@windriver.com> wrote:

> Hi all,
>
> When build 32 bits rootfs with 64 bits bsp, if an allarch/noarch package
> is installed to lib32 rootfs, it causes
> unexpected 64 bits packages which is required by the allarch package
> installed to lib32 rootfs.
>
> Take ca-certificates as example. ca-certificates rdepends on openssl, so
> if ca-certificates is installed to image,
> 64 bits package openssl will be installed too no matter what the rootfs
> is. But only 32 bits openssl package should
> be installed to 32 bits rootfs.
>
> There are 2 ways to fixed the issue.
>
> 1 expand allarch/noarch packages with multilib. So if add ca-certificates
> to image, lib32-ca-certificates will be
>    installed to 32bits rootfs. And then also the dependency lib32-openssl
> is installed. That is what we expected.
>
> 2 expand DEPENDS/RDEPENDS of allarch/noarch packages with a prefix
> 'noarch-' when multilib is enabled. So then
>    ca-certificates requires 'noarch-openssl'. And make both lib32-openssl
> and openssl provides 'noarch-openssl'.
>    When do_rootfs, there is only one rpm repo 'oe-rootfs-repo' now. We
> will create repos with different priorities
>    according to different archs/subdirectories. For 32 bits image, make 32
> bits rpm repo has  higher priority, so lib32-openssl
>    will be installed to 32 bits rootfs rather than 64bits.
>
> I know these 2 ways are not perfect, but only possible ways I have in mind
> to solve the problem.
>
> Any comment or suggestion is greatly appreciated. Thanks a lot.
>
> --
> Regards,
> Neil | Kai Kang
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000773f2c056fb1d25a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In our build I&#39;ve removed the openssl runtime dependen=
cy (RDEPENDS_${PN}_remove =3D &quot;openssl&quot;), because we pull the rig=
ht version of openssl (lib32-openssl in our case) to the image elsewhere.</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jun 28, 2018 at=
 10:48 AM Kang Kai &lt;<a href=3D"mailto:Kai.Kang@windriver.com">Kai.Kang@w=
indriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20

   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p><font size=3D"+1">Hi all,</font></p>
    <p><font size=3D"+1">When build </font><font size=3D"+1"><font size=3D"=
+1">32 bits rootfs with </font>64 bits bsp, if an
        allarch/noarch package is installed to lib32 rootfs, it causes<br>
        unexpected 64 bits packages which is required by the allarch
        package installed to lib32 rootfs.</font></p>
    <p><font size=3D"+1">Take ca-certificates as example. </font><font size=
=3D"+1"><font size=3D"+1">ca-certificates rdepends on openssl,
          so if </font></font><font size=3D"+1"><font size=3D"+1"><font siz=
e=3D"+1"><font size=3D"+1">ca-certificates is installed to
              image,<br>
              64 bits package openssl will be installed too no matter
              what the rootfs is. But only 32 bits openssl package
              should<br>
              be installed to 32 bits rootfs.</font></font></font></font></=
p>
    <p><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"=
+1">There
              are 2 ways to fixed the issue.</font></font></font></font></p=
>
    <p><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"=
+1">1
              expand allarch/noarch packages with multilib. So if add </fon=
t></font></font></font><font size=3D"+1"><font size=3D"+1"><font size=3D"+1=
"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1">ca-certificates to =
image, </font></font>lib32-</font></font></font></font><font size=3D"+1"><f=
ont size=3D"+1">ca-certificates will be<br>
          =C2=A0=C2=A0 installed to 32bits rootfs. And then also the depend=
ency
          lib32-openssl is installed. That is what we expected.<br>
        </font></font></p>
    <p><font size=3D"+1"><font size=3D"+1">2 expand DEPENDS/RDEPENDS of </f=
ont></font><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=
=3D"+1">allarch/noarch
              packages with a prefix &#39;noarch-&#39; when multilib is ena=
bled.
              So</font> then<br>
            =C2=A0=C2=A0 </font></font></font><font size=3D"+1"><font size=
=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D=
"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1=
">ca-certificates requires
                          &#39;noarch-openssl&#39;. And make both lib32-ope=
nssl
                          and openssl provides </font></font></font></font>=
</font></font></font></font></font></font><font size=3D"+1"><font size=3D"+=
1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1">=
<font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1">&#3=
9;noarch-openssl&#39;.<br>
                          =C2=A0=C2=A0 When do_rootfs, there is only one rp=
m repo
                          &#39;oe-rootfs-repo&#39; now. We will create repo=
s
                          with different priorities<br>
                          =C2=A0=C2=A0 according to different
                          archs/subdirectories. For 32 bits image, make
                          32 bits rpm repo has=C2=A0 higher priority, so </=
font></font></font></font></font></font></font></font></font></font><font s=
ize=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=
=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D=
"+1"><font size=3D"+1">lib32-openssl<br>
                          =C2=A0=C2=A0 will be installed to 32 bits rootfs =
rather
                          than 64bits.</font></font></font></font></font></=
font></font></font></font></font></p>
    <p><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"=
+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"><font size=3D"+1"=
><font size=3D"+1"><font size=3D"+1">I know
                          these 2 ways are not perfect, but only
                          possible ways I have in mind to solve the
                          problem.</font></font></font></font></font></font=
></font></font></font></font><font size=3D"+1"><br>
      </font></p>
    <p><font size=3D"+1">Any comment or suggestion is greatly appreciated.
        Thanks a lot.</font></p>
    <pre class=3D"m_1934409344669207458moz-signature" cols=3D"72">--=20
Regards,
Neil | Kai Kang</pre>
  </div>

-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000773f2c056fb1d25a--
