Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 29C8C60767
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 15:25:53 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id su19so17951406igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 07:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=puqRt6sr+6Y85hnuLzObO1igPaJRA3vUkjlge05D/bw=;
	b=ia29Ok2uQnAn/WhRjQr1WAzKvr73E/7JO8eWGcTDgUW4p95xJiMB+ONr8PPvcr6by/
	40jqHqr7sXjroql68DXr8zNPWyK7yQoErNKByLVut8EAhSwxe34fNnPxJsMfEOsBO3nO
	6KPR7Dz6AG/7cRuc/cZfvqG2prsFFzDPzTI83lljr80t34PJF6GgTQ6sEKtmFfsCbv7s
	ufDA579U57HIFCV8HcMH9JRlAlubBQmeUwgAsTVu+BbJ2cggswhSfCXckiJTY+Ci07lK
	TGd7Xge7EQ8QwmjR3HgNpFz75sMqv2xeMDgz0alL8F9w7UMWCVIVBOBW8F1s8+sjDO5S
	3YMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=puqRt6sr+6Y85hnuLzObO1igPaJRA3vUkjlge05D/bw=;
	b=Z7fdiralzt32BBhLKArbO/KcqeUiVZvMV2q5eal1Gvl+9v5bhbSg2aYbNiPfD1HuSa
	EbxreEXggOKOetbPYVNJT1IFgll/mylH/zLj0T/Nd6396UMo1/ZtBg1kpemkPgB+40t9
	0yGqFaKzwodrhQfkrc9psUsJXkhi+ZvithaqONC7N2xyaVFs9pqWUu/FXYYjtM4Oj2oe
	4lqSDnGlfVFquAy4ekxB2xWtk8P2REhJBPs8CszsAeZWjPySWWAgK9ZbUTxzFtV/hHNS
	fNMqBKUO9sRJGfVSW4WZ/zBYGy7PDQ+FGj2J6U/DNw3+iznqznqHpBsetEpE14b8apPs
	gjbg==
X-Gm-Message-State: ALoCoQnGIUHQ5Rz2RX0R5x4HKNhc74LceZ07WGHqJ4G6/ubeojWxsUs383bDBkgOascu8O2MDQiYQT/2Dr1iCKdOIVNAUg+qw3ghyD2bLc2noRnMxIpBXcw=
X-Received: by 10.50.155.33 with SMTP id vt1mr15547897igb.64.1449761153685;
	Thu, 10 Dec 2015 07:25:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 10 Dec 2015 07:25:34 -0800 (PST)
In-Reply-To: <1449761060-21041-1-git-send-email-ross.burton@intel.com>
References: <1449761060-21041-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Dec 2015 15:25:34 +0000
Message-ID: <CAJTo0LZLPOLWJsDH5QBmqGgLyxOSqqqiEmjnL2Kk2mDFcw8hMQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cooker: use in instead of count
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
X-List-Received-Date: Thu, 10 Dec 2015 15:25:54 -0000
Content-Type: multipart/alternative; boundary=001a11343daa935bfb05268cd26d

--001a11343daa935bfb05268cd26d
Content-Type: text/plain; charset=UTF-8

Whoops, wrong list, and lame commit message.

Ross

On 10 December 2015 at 15:24, Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  bitbake/lib/bb/cooker.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py
> index 4df8881..d39c64b 100644
> --- a/bitbake/lib/bb/cooker.py
> +++ b/bitbake/lib/bb/cooker.py
> @@ -1072,7 +1072,7 @@ class BBCooker:
>
>          for pfn in self.recipecache.pkg_fn:
>              inherits = self.recipecache.inherits.get(pfn, None)
> -            if inherits and inherits.count(klass) > 0:
> +            if inherits and klass in inherits:
>                  pkg_list.append(self.recipecache.pkg_fn[pfn])
>
>          return pkg_list
> --
> 2.1.4
>
>

--001a11343daa935bfb05268cd26d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Whoops, wrong list, and lame commit message.<div><br></div=
><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 10 December 2015 at 15:24, Ross Burton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Ross=
 Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com<=
/a>&gt;<br>
---<br>
=C2=A0bitbake/lib/bb/cooker.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/bitbake/lib/bb/cooker.py b/bitbake/lib/bb/cooker.py<br>
index 4df8881..d39c64b 100644<br>
--- a/bitbake/lib/bb/cooker.py<br>
+++ b/bitbake/lib/bb/cooker.py<br>
@@ -1072,7 +1072,7 @@ class BBCooker:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pfn in self.recipecache.pkg_fn:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inherits =3D self.recipecac=
he.inherits.get(pfn, None)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if inherits and inherits.count(k=
lass) &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if inherits and klass in inherit=
s:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_list.appe=
nd(self.recipecache.pkg_fn[pfn])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return pkg_list<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a11343daa935bfb05268cd26d--
