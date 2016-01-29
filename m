Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 73EA777208
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:14:05 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id d63so78664751ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 09:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QBtBFSyuu4oY5qbqM3xAEzwQL0H47tPrq4nk2K1OTzY=;
	b=NRWxHVewzMx/UovCVr25kK2kGll6tAPZfir9Ts0ZPk4bOO+2tauOFkb9RRWuK+bz5j
	amwLCTpF8CBEfWum1bviENX5Gq7gpHeA2uaEb5QYrFhZhFeXIvHNEO/nBXEm2u/peVHs
	AGGpQQjItsKpj6z3IgfdKOioAHIQ2DgOQZpKr5f81NfU9r5xRamSsZi3A24VmFkHSyoM
	dAnPsGoLFikdcsKt/auVHb8jQl5rd4sgTXKlsv5ICgfqkq9cDCJzuF/BtD+4wnXQpcdD
	bqrwnS0zFJeaQQJUDAgqtydCMmzDRIhw50c0HZx4gyCk5lPu8vTyj9QU2fzh2kI1vVAH
	Kzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QBtBFSyuu4oY5qbqM3xAEzwQL0H47tPrq4nk2K1OTzY=;
	b=JTpymqpxINySq00MGXj5NF4fd+6ucRXT/g/HUrd8oX6p3sDkqM+WdywGIePq51zuQ+
	+tcpdZfoTlBldGqP+IUjEs2PNPITlDvraoM6HR2lBzq8mbWS5RDDrRHF2Cbtkt9ys+Ve
	4P+1ETPfjg/vMHu815h5TS5vwjcoRly0Mq2ZZOB+arcfdoNwEO31erDdFoq0PFTflfwp
	aT+L9AX+T+IDMba99M3V3V7g76jN540DeFdc8bi8/qGbK6UyRQVBOL5f+x+GdHKoxhSp
	KXU8XSlwv0srYNv6aUuucHWzrGdFQwSSaIsNGORSJUaijStW9S3LCl8NsZ2FRv6IAdkh
	us9Q==
X-Gm-Message-State: AG10YOQbhVGJJEk9fHVk9Gujh8c8t3XbWGcwFU7qsiA4a6+FOmA/BLTDlRZzih/ptfex25xqmHAhXBtx/hyu0pdH
X-Received: by 10.107.3.154 with SMTP id e26mr10503205ioi.99.1454087646532;
	Fri, 29 Jan 2016 09:14:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 29 Jan 2016 09:13:46 -0800 (PST)
In-Reply-To: <1454080041-28576-1-git-send-email-adrian.ratiu@ni.com>
References: <1454080041-28576-1-git-send-email-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Jan 2016 17:13:46 +0000
Message-ID: <CAJTo0LbQBoWf8krboqY87V4HCQTaPwXeMECo1jHPDu259Y6wHQ@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Jacob Champion <jacob.champion@ni.com>,
	Adam Chappell <adam.chappell@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/1] apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG
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
X-List-Received-Date: Fri, 29 Jan 2016 17:14:06 -0000
Content-Type: multipart/alternative; boundary=001a113ec10aa4f0d8052a7c2988

--001a113ec10aa4f0d8052a7c2988
Content-Type: text/plain; charset=UTF-8

On 29 January 2016 at 15:07, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> +PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto"
>

configure: Crypto was requested but no crypto library was found;
autodetecting possible libraries
checking openssl/x509.h usability... yes
checking openssl/x509.h presence... yes
checking for openssl/x509.h... yes
checking for BN_init in -lcrypto... yes
checking for SSL_accept in -lssl... yes
  setting LDADD_crypto_openssl to " -lssl -lcrypto"

This should at least hard-code --with-nss or --with-openssl (and the
relevant build dependency), at the moment you're relying on the sysroot
containing NSS or openssl.  Luckily something pulls in openssl but that may
change.

Ross

--001a113ec10aa4f0d8052a7c2988
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 January 2016 at 15:07, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><span class=3D"">+PACKAGECONFIG[crypt=
o] =3D &quot;--with-crypto,--without-crypto&quot;<br></span></blockquote></=
div><br><div class=3D"gmail_extra">configure: Crypto was requested but no c=
rypto library was found; autodetecting possible libraries</div><div class=
=3D"gmail_extra">checking openssl/x509.h usability... yes</div><div class=
=3D"gmail_extra">checking openssl/x509.h presence... yes</div><div class=3D=
"gmail_extra">checking for openssl/x509.h... yes</div><div class=3D"gmail_e=
xtra">checking for BN_init in -lcrypto... yes</div><div class=3D"gmail_extr=
a">checking for SSL_accept in -lssl... yes</div><div class=3D"gmail_extra">=
=C2=A0 setting LDADD_crypto_openssl to &quot; -lssl -lcrypto&quot;</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">This should at=
 least hard-code --with-nss or --with-openssl (and the relevant build depen=
dency), at the moment you&#39;re relying on the sysroot containing NSS or o=
penssl.=C2=A0 Luckily something pulls in openssl but that may change.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div></div>

--001a113ec10aa4f0d8052a7c2988--
