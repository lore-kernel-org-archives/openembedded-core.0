Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 055C26FFF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 09:15:27 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 186so241394373iow.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=W4XkIFANH0RXN21Wg30WYmCs8FbOhIkLb4pjyHS5kTA=;
	b=BOvEk4koxaNkIocvZ7FE01X9DRJtmQqs89ZzuKT8mHyEJhOWdxt31qyyjLwp1zT+2p
	tJLm2C7p8TQI/sw7AtFZl4SwvXLLDv06rsx/QX99QGNeSw3livVzg6Em8grqXizBAUt0
	2dLpH5lgatjxYr6z1pnIaLCgDiOlnEoXO7VwKsKln2Whue31aB8mcmOKLcKnW9L9YQJ7
	dXWg5Sw51A2TrgiXPpQLtJqO/rqV5c9V8zD1jVLMx2MeoZXefWY0ddB0QFbKffFcc4m1
	WAd8MO5HU245myHgeXPTPU4JEE0iI9yIVTmxZoMNJSdt8XqIzQkUKz/fDyAvLq4F2wxM
	Sc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=W4XkIFANH0RXN21Wg30WYmCs8FbOhIkLb4pjyHS5kTA=;
	b=TnqavK7OeTq2gIgjBVT7W+SEuzVWgoGmcx/4xMLMQMoBkGocXTOK3U1IbmeazM4Wxw
	7FIe9cEdo6j6xvkO7TACW6jXXPq7JYfdL+T830jb+8O7RYuhB8vt3ByaCB1N6MZDUfGa
	35BKucHHSXcjlil1onLtVsSfFZ8w/RiXNmU3YfLLwsGONA9rRbeHHOpWofaoTIbu/sA6
	4tiPgENbtgJ+J1oQo1XUYdGSWXQmjGWkCYLgmcrdFbkF7lj+7vFG0+nqWl/FIwZcexga
	nPx+OEfWg1bgbC/xDjgKCI5dVgBFfrNmbvbbSSztF12qCAOXTbFLVNP7BGAWxLGUCtmr
	j8cA==
X-Gm-Message-State: ALoCoQlV2maouS+ypHuj3ZCzBCBDjTG3rMCI4j0kitY2x3zzM/vl/GFJyHVWAfYcK3qUkQMW+6y/XBWBGOykFAZWp6DOpP13ArtU7r7cCZXCajgiCmRGta4=
X-Received: by 10.107.135.104 with SMTP id j101mr1321629iod.133.1450948528140; 
	Thu, 24 Dec 2015 01:15:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 24 Dec 2015 01:15:08 -0800 (PST)
In-Reply-To: <1450925968-6421-1-git-send-email-Zhixiong.Chi@windriver.com>
References: <1450925968-6421-1-git-send-email-Zhixiong.Chi@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Dec 2015 09:15:08 +0000
Message-ID: <CAJTo0Lan+nUmJF3wX9VHghMTGhPr_UZfz-p4pnb6ab2FLGp7gg@mail.gmail.com>
To: Zhixiong Chi <Zhixiong.Chi@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] expat: Security Advisory-expat-CVE-2015-1283
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
X-List-Received-Date: Thu, 24 Dec 2015 09:15:30 -0000
Content-Type: multipart/alternative; boundary=001a113ebe929b882d0527a147bd

--001a113ebe929b882d0527a147bd
Content-Type: text/plain; charset=UTF-8

On 24 December 2015 at 02:59, Zhixiong Chi <Zhixiong.Chi@windriver.com>
wrote:

> +++ b/meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch
> @@ -0,0 +1,58 @@
> +Multiple integer overflows in the XML_GetBuffer function in Expat
> +through 2.1.0, allow remote attackers to cause a denial of service
> +(heap-based buffer overflow) or possibly have unspecified other
> +impact via crafted XML data.
> +
> +CVSSv2:  (AV:N/AC:M/Au:N/C:P/I:P/A:P)
> +
> +Upstream-Status: Backport
> +
> +Index: expat-2.1.0/lib/xmlparse.c
>

No signed-off-by in the patch.  Also can we experiment with a CVE tag in
the patch alongside the upstream-status and s-o-b?  "CVE: CVE-2015-1283".

Thanks,
Ross

--001a113ebe929b882d0527a147bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 December 2015 at 02:59, Zhixiong Chi <span dir=3D"ltr">&lt;<a href=3D=
"mailto:Zhixiong.Chi@windriver.com" target=3D"_blank">Zhixiong.Chi@windrive=
r.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":g=
8" class=3D"a3s" style=3D"overflow:hidden">+++ b/meta/recipes-core/expat/ex=
pat-2.1.0/expat-CVE-2015-1283.patch<br>
@@ -0,0 +1,58 @@<br>
+Multiple integer overflows in the XML_GetBuffer function in Expat<br>
+through 2.1.0, allow remote attackers to cause a denial of service<br>
+(heap-based buffer overflow) or possibly have unspecified other<br>
+impact via crafted XML data.<br>
+<br>
+CVSSv2:=C2=A0 (AV:N/AC:M/Au:N/C:P/I:P/A:P)<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Index: expat-2.1.0/lib/xmlparse.c</div></blockquote></div><br>No signed-of=
f-by in the patch.=C2=A0 Also can we experiment with a CVE tag in the patch=
 alongside the upstream-status and s-o-b? =C2=A0&quot;CVE: CVE-2015-1283&qu=
ot;.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">T=
hanks,</div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebe929b882d0527a147bd--
