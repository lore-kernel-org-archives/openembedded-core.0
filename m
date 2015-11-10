Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5CE736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 17:41:18 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so3756573qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 09:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6mF3H4RpZD1QfQyWLdz1S4izWeJo6aQ49QuOxVyqi5o=;
	b=kLlxrpdqzhlZ4oB/lRX3a2kXkFAiLywDzAChqZgNSrSKocsFzFi75LKyvRDXvUbIjZ
	SLYafqxz8j2DpyuDHvn1gFLcgKsywThfQwhYQOYFvOEATSPJ5LTPg4MQ5WvRDNulmCzC
	+zRf4Hq8mXOXL2+AUO7cRqHhq3jmXfH0m1ywJrZWQoz0/xbD7JnlKA80VuQHUbANvLaL
	FzIqbBX8CTpBu8GPIjkwwKazS7ol7FUmg7cHB9TmfPFejTHYjrK6ak2Cy9jMAWCjIP4s
	S+3mDdoSW1Kd+2/EiD6KG2vqKF0DxL+SddisPvfBYcp0pihg/Jsz0NpWT2qgo7TXaOUv
	Pifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6mF3H4RpZD1QfQyWLdz1S4izWeJo6aQ49QuOxVyqi5o=;
	b=TfZgSXsbt+I3gtxW62uREYRgEGkBUwJK0fjxFBxJB32Ztbh04TGUCITMxhvy06EeNz
	HP/wNeJPYsLGxri4NTPJlt38fKyU7wVi+PTsWPNrHT5F2NE32lOotUC5wLGQOdB8lnpT
	nuUX5qCX98LpRMtWAS7JMgSTJyCMWCeYy70MTDnRlY8PAijK0JcKwYaXCY3dcAS+TJLT
	bLQoXWtmOZxx+fSYZekijsaXSJGeNJp6GpPcPbNBD6ZqyaSpV9IonirYbTWVqyBVe0i0
	TwJzkba6iz0qcAV4ETwmk2VfdUDHuG7Ib0wc7XmkTnP6qzLYJyf0BKZGhBmw/wcpJ1/G
	fQnw==
X-Gm-Message-State: ALoCoQks8mBcFOcxYuAR2KdgHpExE5jiIzz0vGfGvxpqEkUtkVzLWmYK8ceqMFxhILgmh3I/ba3x
X-Received: by 10.140.171.197 with SMTP id r188mr6352253qhr.93.1447177278019; 
	Tue, 10 Nov 2015 09:41:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Tue, 10 Nov 2015 09:40:58 -0800 (PST)
In-Reply-To: <56421DA6.5080700@windriver.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Nov 2015 17:40:58 +0000
Message-ID: <CAJTo0LYEYg+1oP8WwBbNYfM2mWGrFNyM3LgOXQUdL3JPC5BTsQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 17:41:22 -0000
Content-Type: multipart/alternative; boundary=001a113a7dfa95731f0524333757

--001a113a7dfa95731f0524333757
Content-Type: text/plain; charset=UTF-8

On 10 November 2015 at 16:39, Mark Hatle <mark.hatle@windriver.com> wrote:

> Let me rephrase.  Instead of calling out to qemu (or a real target) for a
> gobject and result.  Can the result be cached (like we do with the
> config-site
> info?)  This would allow me to run say a MIPS64 n64 gobject build, cache
> the
> results and use it on my octeon3 build (which can't run in QEMU.)
>

The metadata contains stuff like type sizes and alignment but wouldn't it
be possible to have some sort of map from machine to close-enough qemu
machine?  So for octeon3 is qemumips64 is close enough, run that.

(to be honest I thought the qemu runner support as used by the postinsts
already did this)

Ross

--001a113a7dfa95731f0524333757
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2015 at 16:39, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":62f" cl=
ass=3D"a3s" style=3D"overflow:hidden">Let me rephrase.=C2=A0 Instead of cal=
ling out to qemu (or a real target) for a<br>
gobject and result.=C2=A0 Can the result be cached (like we do with the con=
fig-site<br>
info?)=C2=A0 This would allow me to run say a MIPS64 n64 gobject build, cac=
he the<br>
results and use it on my octeon3 build (which can&#39;t run in QEMU.)</div>=
</blockquote></div><br>The metadata contains stuff like type sizes and alig=
nment but wouldn&#39;t it be possible to have some sort of map from machine=
 to close-enough qemu machine?=C2=A0 So for octeon3 is qemumips64 is close =
enough, run that.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">(to be honest I thought the qemu runner support as used by the =
postinsts already did this)</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a113a7dfa95731f0524333757--
