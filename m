Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9D37371A5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 14:41:33 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id n21so381502102qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 06:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hI0ozH3z6X/RfQYyPgxBz3/Yh307GvgDcd98TKrDHek=;
	b=Iz2DHurrHYd9ia+1Ah4Mo02WI5+r2BlVl9wF59QYMUyWBG7/i5GTWmEYvTTXUKImgQ
	wexhiCztCHRrsNsuzVCuL0OuMSDAhQ7Q2QHa2HPMkOwi53hvaJt6TLzmpIPGMt+W2Ntc
	W0BzC+yXlIjT/WEhWg6vkXOP0QEoJgsIy0ZU5TPY2YYQHs9AKOADIhrvoPA0X5QVPHek
	/o9f0vOtjL5fTKDwFZLEwYjbE66EFK3Sn63YXh2uQ6DiF9gt1kM7KATZFRO300so2n/P
	/uDsmIEjuvkfBzGYkCL+pXBnY62gTTXpmikSkba8q5/fzw59yj8ouQDGGp+XQB5Kq5PB
	vhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hI0ozH3z6X/RfQYyPgxBz3/Yh307GvgDcd98TKrDHek=;
	b=K8PC2LcMecU7rWbomzvsquYXg4OZzUj84dS4stKrA2BLYC1rBarPr5HI+Hpt1QbI18
	WWTA1LIj8RlmYzdzBH7aryual9DcLMqsb3EJIgifXBLenq/UzRoq1t2R2mlJ0X3DPNZq
	5A1doCf49fBFD34iG+Oo5F18vEIXhmO+HEzrJjIiatPr51+iJcSoalwMO8BZJb4gKtHE
	KHfDrAo6ChF7RoeElx1dsEVGEeQGTZv+V0SriZ1slw29KIqX/+b011fDGwELUo7vqObt
	rHK4diRlNkyfK7sFCy1VOjGyVYeJ8hCzyr6siAPGgRdbdlCX2myhQdFstJbowiuqn2/5
	4ENQ==
X-Gm-Message-State: AKaTC00+qgHZT8tR81wDoH+8+v7VV9lfU16rLRZ9m1xXG3BCJQOrTriO6tJGth8opCmweDMRFE21RXq6sI27DZQj
X-Received: by 10.55.75.17 with SMTP id y17mr47110929qka.26.1481035294560;
	Tue, 06 Dec 2016 06:41:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 06:41:14 -0800 (PST)
In-Reply-To: <1481063903-49514-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1481063903-49514-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 14:41:14 +0000
Message-ID: <CAJTo0Lb3bMdhWvZeEhAx4pAH2WDWUmmB4sUK=hL=EDPmZ9Schg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: 4.3.4 -> 4.3.5
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
X-List-Received-Date: Tue, 06 Dec 2016 14:41:34 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8a1f77b0542fe66b7

--001a114a88c8a1f77b0542fe66b7
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 22:38, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> +++ b/meta/recipes-connectivity/dhcp/binutils-gdb
> @@ -0,0 +1 @@
> +Subproject commit 39eeab253474493bc9477dbb2bd9c8041f05764b
>

Can you resend without this bit?

Ross

--001a114a88c8a1f77b0542fe66b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 22:38, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2j=
2" class=3D"a3s aXjCH m158d492ea644de5c">+++ b/meta/recipes-connectivity/<w=
br>dhcp/binutils-gdb<br>
@@ -0,0 +1 @@<br>
+Subproject commit 39eeab253474493bc9477dbb2bd9c8<wbr>041f05764b<br></div><=
/blockquote></div><br>Can you resend without this bit?</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114a88c8a1f77b0542fe66b7--
