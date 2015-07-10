Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8169A6017E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 09:20:40 +0000 (UTC)
Received: by qget71 with SMTP id t71so126566265qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 02:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2UB6w0fYLukY+tCRxiR3ztmfyvrUTbqDSQkRDNq9mgU=;
	b=a0nStH9maDwxvem6EJMhlVzHjzhS0lMBeJJuNLCSBrDaTP9II8ZeNwYnHThEbPr+Gu
	KcUE15szbKXxf3/VgCUd9kHfNZ4ds9EGKpNeQ7Cc8F44/ZF/NEtjRqLXAYf6F2KjPTh6
	Ou53nZceoHkV1fIYHMdMubzSiIxty38+OalSA7OvxgXLEbC3nGncmYbdEtgTDrQbjchD
	jTNQE4vyPSDNcsEeIo46JifQ7k+KeTfU0969ESwyRQ3/as4rAwjV0GhgwCjhtVFxTg/d
	+aSLHmlnUvXc8OKnl1ttgh/mCV+niFdSANWKFoQ5Y7+TfGa4x/Jb7udEBual6wRV4X9s
	PyBA==
X-Gm-Message-State: ALoCoQkjPxRXbwp12OdPS2Vcj6IKtzh3SstvuhzUDK4UZsHOlsOKaWSHe9CI3AjKkTrNKWkTSYwR
X-Received: by 10.55.53.193 with SMTP id c184mr30120680qka.62.1436520040653;
	Fri, 10 Jul 2015 02:20:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 02:20:21 -0700 (PDT)
In-Reply-To: <559F02AE.3010501@ni.com>
References: <559F02AE.3010501@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 10:20:21 +0100
Message-ID: <CAJTo0LZwXTDEKtR8+3EHfdEpMbB4P9nxyaC1odqW_dGHz5svAQ@mail.gmail.com>
To: Connor Smith <connor.smith@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Library Patches Causing Many Packages to Rebuild
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
X-List-Received-Date: Fri, 10 Jul 2015 09:20:41 -0000
Content-Type: multipart/alternative; boundary=001a11476f14bc7812051a81e2f5

--001a11476f14bc7812051a81e2f5
Content-Type: text/plain; charset=UTF-8

On 10 July 2015 at 00:24, Connor Smith <connor.smith@ni.com> wrote:

> rpm-native appears to be recompiling because the do_populate_sysroot
> hash is changing for the native versions of openssl and python. I'm not
> sure why either of these tasks are changing.
>

This is likely the source of a lot of the rebuilds.  openssl was changed,
openssl-native rebuilds, causing a rebuild of rpm-native, which likely
causes a re-package of everything.

If this doesn't explain the situation then attaching the cooker log
demonstrating the problem might help identify it.

Ross

--001a11476f14bc7812051a81e2f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 July 2015 at 00:24, Connor Smith <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:connor.smith@ni.com" target=3D"_blank">connor.smith@ni.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":n3" class=3D"a3s" s=
tyle=3D"overflow:hidden">rpm-native appears to be recompiling because the d=
o_populate_sysroot<br>
hash is changing for the native versions of openssl and python. I&#39;m not=
<br>
sure why either of these tasks are changing.</div></blockquote></div><br>Th=
is is likely the source of a lot of the rebuilds. =C2=A0openssl was changed=
, openssl-native rebuilds, causing a rebuild of rpm-native, which likely ca=
uses a re-package of everything.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">If this doesn&#39;t explain the situation then a=
ttaching the cooker log demonstrating the problem might help identify it.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a11476f14bc7812051a81e2f5--
