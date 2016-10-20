Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 38B9571AAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:23:52 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id z190so81754134qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 02:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tT5sNoAJi3HCE2JfXGGAthFgfoj8ilDnGGE3Hux3pvQ=;
	b=C7xWCAn+AR8ppPLa8MK/5bbkiHN0NZHLnkRYF2bDw5fT+9oaF5fn65k/C6MIqg6A6a
	vTF/ooa/Mrnv7XrBze0z6HYZHz7FttLpdkG4tOEUf6UILxEZD94D/N1g9fqG+cLw2fqj
	JPxb3nCEPwYrln21Xj2de0F+5s3Oy/vyExUgf9wE+Y2X56uH7gr3xO/eQnc4+dyy+7hs
	po1YH8E1WQhFW96Kgwu1gzBRJbKqLmhGpAjFzFSaiFpnVzr2ll33JihPqU56J35/m6YW
	ukTUUKlzz5kO9wvl7yjbASdiC3afhSTfBFBLgZn1gYUpehNL/+Y0ufVta6nwvFQHfDtW
	D3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tT5sNoAJi3HCE2JfXGGAthFgfoj8ilDnGGE3Hux3pvQ=;
	b=b4lytU90c9uRgo61rhgLRBju4GT33dlV9UQocJT8eJuozRCzXwob/sGy06H5PwYXJ0
	JBZKO37khfLhHKD8aCOcufgO8LVPKkI02Akq88jsJRDnuVIOFI84NSm/8/xLsXd3D9ha
	t7qVASnZFgTqtoXshWDnsdmhEiUP6wDa21uOG/C2U9zV4i8x7keMpqUBLVll5oZz1bPm
	FMu9UwGzrXO30SRrZ7RWMREa5pZabb1Op0J0Gc9NF78QnBQY78DukUj4nJroxsB50DoW
	G2iuK0Ba9CdU0Jn8e6odAzcxLQTLWAyA9lEvPvN2QudJsZt3uIlfbz2l+Id5AnGzzUpL
	IKmA==
X-Gm-Message-State: ABUngvdtOyivqTqY9RP8hkWxex3YrWpQbSKgSnvWAzm+WXelsm45iIyRc+PaEujXFRi90TS5B/OQRFvTI1psi4rj
X-Received: by 10.55.198.132 with SMTP id s4mr7672919qkl.221.1476955434173;
	Thu, 20 Oct 2016 02:23:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 20 Oct 2016 02:23:33 -0700 (PDT)
In-Reply-To: <c5f8205c2501e2c8264bd3c315b42569d66ac6c7.1476888929.git.alexander.kanavin@linux.intel.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<c5f8205c2501e2c8264bd3c315b42569d66ac6c7.1476888929.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Oct 2016 10:23:33 +0100
Message-ID: <CAJTo0Lb3B9FSEXHjd4ZhkF4GwosbCkUVkq5nHuM7sEEV7EgVaA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/19] webkitgtk: update to 2.14.1
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
X-List-Received-Date: Thu, 20 Oct 2016 09:23:53 -0000
Content-Type: multipart/alternative; boundary=001a11438fd000dac9053f487c45

--001a11438fd000dac9053f487c45
Content-Type: text/plain; charset=UTF-8

On 19 October 2016 at 16:06, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Rebase 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>

buildhistory-diff reports that the binaries are being removed:

packages/corei7-64-poky-linux/webkitgtk/webkitgtk-bin: PKGSIZE changed from
213688 to 0 (-100%)
  * FILELIST: removed all items "/usr/bin/MiniBrowser /usr/bin/jsc"

Have these all been removed upstream (in which case we can remove
lib_package), or are they optional now and we should enable this?

Ross

--001a11438fd000dac9053f487c45
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 October 2016 at 16:06, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D"gmail-:6cg" class=3D"gmail-a3s gmail-aXjCH gmail-m157dd87428c68711">Reb=
ase 0001-WebKitMacros-Append-to-I-<wbr>and-not-to-isystem.patch<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;</div></blockq=
uote></div><br>buildhistory-diff reports that the binaries are being remove=
d:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><di=
v class=3D"gmail_extra">packages/corei7-64-poky-linux/webkitgtk/webkitgtk-b=
in: PKGSIZE changed from 213688 to 0 (-100%)</div><div class=3D"gmail_extra=
">=C2=A0 * FILELIST: removed all items &quot;/usr/bin/MiniBrowser /usr/bin/=
jsc&quot;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Have these all been removed upstream (in which case we can remove lib_p=
ackage), or are they optional now and we should enable this?</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></di=
v>

--001a11438fd000dac9053f487c45--
