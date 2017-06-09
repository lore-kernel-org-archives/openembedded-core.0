Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE997833B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:56:51 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id u19so87876690qta.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 12:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cKuRE2YQwRi1UdtcI5FHcCtrMSfX2rcWOLVzqG3XHoc=;
	b=mIcn2TaPBSCujohN/ibvPfw8g9Tjghq82CubsletKwBU9MovjkM/CshPIsOlo6zlL3
	8H9hfXjIVbVnSN6Nj7r/yl+PtGTw4Y4vSK7YGiVXrot1Olb/qyDmkNBhmR00/vJnlLDw
	vfp/z2QzTalTFiFtDBQeQThdiLz2NuVHkns5TknsYD0PQMrIn7IIG3YLTzsklDOFYZWi
	qyaP7sqt3GQiRGFxYsdtp+zhTUxbMK0NyIF8NV0qifcqzSUZhYMI/6OsBa3KiFm8/1rC
	NaNuWEDzzNJbDbGnCfVfHEp++gEyxllmOLymtOXAqbozJWPBgZ75OezHeVHXwqwuq6Sz
	RkYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cKuRE2YQwRi1UdtcI5FHcCtrMSfX2rcWOLVzqG3XHoc=;
	b=eIToFJ1cPJtLrS0nRTNzAC27GrDl0KfH2HjxRBcDVxcPJEsGS3yKTrwB7Kju9ENwsW
	hiTF7RIMemiDngc2Iv8L+AiZh9eOQ2p0W8SKMX/7kceqrEbl8SeOEFe44RaciTic8jhx
	LDRTpn0PBqiekdJD8LNsCeONU51c3bf00r6aKz/WtmAZF1g887TFdFRihAdw6xm9NF8+
	H2dd2iIL8hI4GdmOrRdVEBFw/8kbL7KWlPEvYPncLTEInLgacAfTlrH0/KgaOj1vk0AC
	4hd0ATUAFDhyl6G9mzIjn0fiHOEDVEP9EF30753ww9lobWuGqKYy5P5nbN8xO4qXWVpq
	DWyw==
X-Gm-Message-State: AKS2vOym+N22zeh1yLYshicKewHNmmXhEBKTcc5GFvZAdUcvtnx1giYa
	U32kyXOWTOiF2JRqJFsIpfCyTzjRf0H0
X-Received: by 10.237.40.97 with SMTP id r88mr43940159qtd.27.1497038212561;
	Fri, 09 Jun 2017 12:56:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 9 Jun 2017 12:56:32 -0700 (PDT)
In-Reply-To: <20170609190157.GM28053@denix.org>
References: <1496972359-6459-1-git-send-email-fan.xin@jp.fujitsu.com>
	<20170609190157.GM28053@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 20:56:32 +0100
Message-ID: <CAJTo0LYOBWbkjC=s=5b9KSCTx+AaMEEfVU1bGLPxDSvzb-dZVg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] flex: Upgrade to 2.6.4
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
X-List-Received-Date: Fri, 09 Jun 2017 19:56:55 -0000
Content-Type: multipart/alternative; boundary="94eb2c068b34e012cc05518c5ec9"

--94eb2c068b34e012cc05518c5ec9
Content-Type: text/plain; charset="UTF-8"

On 9 June 2017 at 20:01, Denys Dmytriyenko <denis@denix.org> wrote:

> There were numerous issues with flex > 2.6.0 (e.g. doxygen), so all
> previous
> updates were reverted. Is 2.6.4 now safe? I doubt that, considering the new
> version was not published on sourceforge...
>

Yes, I doubt it too.

Ross

--94eb2c068b34e012cc05518c5ec9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2017 at 20:01, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D=
"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":3qy" class=3D"a3s aXjCH=
 m15c8e3ca6511432a">There were numerous issues with flex &gt; 2.6.0 (e.g. d=
oxygen), so all previous<br>
updates were reverted. Is 2.6.4 now safe? I doubt that, considering the new=
<br>
version was not published on sourceforge...<br></div></blockquote><div><br>=
</div><div>Yes, I doubt it too.=C2=A0</div><div><br></div><div>Ross=C2=A0</=
div></div><br></div></div>

--94eb2c068b34e012cc05518c5ec9--
