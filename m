Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 465B26013D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 08:41:22 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id f6so101171508ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 01:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KV1Fae7XpFNn9iL5yz6ZfwT2jH8DHEdKETCGZw7u6Bo=;
	b=W/j7OwH6wa53iDspW8bBeAN6e93/tM+DoOTds5vSZN6kPkPSMmp+nBLwxvHgthR2FV
	BC8AVCQ24XufCxAd93U7yT4MDku3hkY9Piub5escjaZN0PRgkrkU7ehWWUq5y0J/fcvQ
	VAMFZJ7yPkY1kR3isKF/CCBGI+gpIX3HiilJiwfjaryJyDn10iBbUPu3LWZJ96gAzO3q
	k95Rrd3PI4jp33NM8u+aqZgNg+3LBxL6k9SZuSUwZsdEzJY76wEL8TTEaEJj0CG8ADMV
	mXqOpy+tb/KMOCYUjNZW1D1U46wvxmKjt4wj4lRqkrheQMzx/4BwEhXk1i9iqZjVGhK3
	XI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KV1Fae7XpFNn9iL5yz6ZfwT2jH8DHEdKETCGZw7u6Bo=;
	b=gnfkPbV9XN4FJ2FQPcDFCUhNocr0r3YVDVjWsTZDCsLhx7uojsk2eH3SApy8AGd2Zn
	/qdy9CvEQTFVnbkmaH2ZDxt9DxeR39KoYwk/t9B2vjLbpkmyuP5tz7TFhPvwUdske7oj
	SJ1TFWiZIlTdgictyEcxvK6TlnpO8nBVtPxR+UelY3G7u19aWIygRv41yc2MJSBE1OlX
	L80Cu2/2ZW7EBJ57D2dNhMDxHry+TcS/xoblM0YIgtE6IAVVze0IqEfpILLQy6z1HczV
	0dmCS3gIktOpvljtrlmtT5usRDrBrXDoVWEA/GEZuirMq50qLZvFjuFxcAWWNL3Um36s
	AUzg==
X-Gm-Message-State: ALyK8tJdnP1c4KjsZZFMQMZ8FWwWPtufM0V2KsUSxkc66gVFDgHE0LZ7oyz9l7o0ntuBM1zBHjLo2p01latnONOj
X-Received: by 10.36.20.212 with SMTP id 203mr17431733itg.83.1467794482707;
	Wed, 06 Jul 2016 01:41:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Wed, 6 Jul 2016 01:41:03 -0700 (PDT)
In-Reply-To: <6125589935ee01e7b5dec39659932f3ef3f47374.1467792379.git.yi.zhao@windriver.com>
References: <cover.1467792379.git.yi.zhao@windriver.com>
	<6125589935ee01e7b5dec39659932f3ef3f47374.1467792379.git.yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jul 2016 09:41:03 +0100
Message-ID: <CAJTo0LZ_gOmi8QffB+TChddE+ps0z348DJ0tRUwWM+1dMLDOmA@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: Yue Tao <yue.tao@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] randrproto: set ALLOW_EMPTY
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
X-List-Received-Date: Wed, 06 Jul 2016 08:41:27 -0000
Content-Type: multipart/alternative; boundary=001a1143e198bed2210536f388e8

--001a1143e198bed2210536f388e8
Content-Type: text/plain; charset=UTF-8

On 6 July 2016 at 09:09, Yi Zhao <yi.zhao@windriver.com> wrote:

> When adding package randrproto to an image with
> IMAGE_INSTALL_append = " randrproto", an error occurs:
>
> $ bitbake core-image-sato
> [snip]
> ERROR: randrproto not found in the base feeds (qemux86 i586 x86 noarch any
> all).
> [snip]
>

No.

$ oe-pkgdata-util list-pkgs -rp randrproto
randrproto-dbg
randrproto-dev
randrproto-doc

The answer here is to not add randrproto to an image, as the package
doesn't exist.  Especially when this is whack-a-mole:

$ oe-pkgdata-util list-pkgs -rp renderproto
renderproto-dev
renderproto-dbg
renderproto-doc

(repeat for every recipe in x11-proto)

Ross

--001a1143e198bed2210536f388e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 July 2016 at 09:09, Yi Zhao <span dir=3D"ltr">&lt;<a href=3D"mailto:yi=
.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":2w" class=3D"">When adding package =
randrproto to an image with<br>
IMAGE_INSTALL_append =3D &quot; randrproto&quot;, an error occurs:<br>
<br>
$ bitbake core-image-sato<br>
[snip]<br>
ERROR: randrproto not found in the base feeds (qemux86 i586 x86 noarch any =
all).<br>
[snip]</div></blockquote></div><div class=3D"gmail_extra"><br></div>No.</di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_extra">$ oe-pkgdata-ut=
il list-pkgs -rp randrproto</div><div class=3D"gmail_extra">randrproto-dbg<=
/div><div class=3D"gmail_extra">randrproto-dev</div><div class=3D"gmail_ext=
ra">randrproto-doc</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">The answer here is to not add randrproto to an image, as the p=
ackage doesn&#39;t exist.=C2=A0 Especially when this is whack-a-mole:</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=
=3D"gmail_extra">$ oe-pkgdata-util list-pkgs -rp renderproto</div><div clas=
s=3D"gmail_extra">renderproto-dev</div><div class=3D"gmail_extra">renderpro=
to-dbg</div><div class=3D"gmail_extra">renderproto-doc</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">(repeat for every recipe i=
n x11-proto)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div></div></div>

--001a1143e198bed2210536f388e8--
