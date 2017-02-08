Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1C28C71C3D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:18:20 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id x49so165921606qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sM2Wdv71d2NUZbj+P87p6JrDPkui8GFJb9pEH0miPwo=;
	b=nrDAyBdB8/2RAUn7EPIfSvyeqa9L0t0i2/Wy40YOwSNMHlot1vK2KObnr3ADBRBHQ3
	jxdsmygrQNKYFfppxYPxtfbYPEqXC51U0Eo5GJPQxrxtHd55g1NIeW+njVZLZ0ee6mTv
	Ycv/lGTHJNSkl4Ckn5m6SWWWm49DA81/ypBRv6EG9TG1Wt3NACkQiLfGlzxqHK1VmSY3
	kqKQswww9DF8EJcsD0S3zRyVPK2EBeawCw7h3gNBymBplO5J47R6QABzdfvf8XaGKROV
	OFVuWHA8n9mJ+5DQYFPrZNuny2IenyUmk2bUcZy9aZ7lXY0boi/iZ7HNTlsxylruAf81
	lDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sM2Wdv71d2NUZbj+P87p6JrDPkui8GFJb9pEH0miPwo=;
	b=oktLQIV7m0oKwbXJMQa/kgprKdUYStL7Nb1OR9PuYaQ0qVn0dcOBamqr6dN+eqQKof
	2txSs/9ywyKNNhtwEPdrtRFuUQ/yoHAAhFdvStNY42ljzctXBXGbGnBQm0Aqab0SWeD9
	I4t7vn8q0BcKj81P4OvT/ezMxwKoaz1qQh4KelLwUAuWq40+MMVC+IiGDtBJSYFqR9/D
	O8kGh5cMPymtw0zZekqNTziSa6acOpVHWxEjJjRGO9rozyptCbNRhhquVTJ6ICkhErd3
	At9ZwHj34iY7zUkhynoVVzU5tnIMlQgMPhQTovLC1osfGETgPDFWBiCheo94ytjm/4Em
	3zOA==
X-Gm-Message-State: AMke39nhOm1yCLz6PrgZbPrVJPL9RmHMQAxlDTPHIo4KLXicMQyfOHUUzRoYuTNe2pB2l19Q5IB/YSgqnDwe1z+5
X-Received: by 10.200.53.247 with SMTP id l52mr19905690qtb.144.1486563501022; 
	Wed, 08 Feb 2017 06:18:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 8 Feb 2017 06:18:00 -0800 (PST)
In-Reply-To: <CAHiDW_EgMHAoBO+CnMEnTC6AMKud9GUZw_obX9i8GLGD=sWrVA@mail.gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
	<CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
	<1486561983.3754.4.camel@linux.intel.com>
	<a124d3f3-a46a-e84f-a30e-904e02ce8bc3@mlbassoc.com>
	<CAHiDW_EgMHAoBO+CnMEnTC6AMKud9GUZw_obX9i8GLGD=sWrVA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Feb 2017 14:18:00 +0000
Message-ID: <CAJTo0LZ8L+5Wv6SWswedikF3KStYkg_8U7q2Q2ddynuLqznUWg@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Wed, 08 Feb 2017 14:18:21 -0000
Content-Type: multipart/alternative; boundary=001a1142ba206a741d05480589ca

--001a1142ba206a741d05480589ca
Content-Type: text/plain; charset=UTF-8

On 8 February 2017 at 14:07, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 8 February 2017 at 15:57, Gary Thomas <gary@mlbassoc.com> wrote:
>>
>> I agree - if ruby is OE-core worthy, go most certainly is.
>>
>
> webkit-gtk needs ruby-native as a build dependency. If that wasn't the
> case ruby would almost certainly not be in oe-core.
>

This: ruby was added from meta-ruby because we really wanted webkit and
ruby is a build dependency.  If webkit wasn't in oe-core then the ruby
runtime would likely still be in meta-ruby, where it was a great example of
a language layer.

Ross

--001a1142ba206a741d05480589ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 February 2017 at 14:07, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On 8 February 2017 at 15:57, Gary Thomas <span dir=3D"ltr">&lt;<a href=
=3D"mailto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</=
span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
I agree - if ruby is OE-core worthy, go most certainly is.<span class=3D"m_=
2533577266409356119HOEnZb"><font color=3D"#888888"><br></font></span></bloc=
kquote><div><br></div></span><div>webkit-gtk needs ruby-native as a build d=
ependency. If that wasn&#39;t the case ruby would almost certainly not be i=
n oe-core.<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span>=
</div><span class=3D"HOEnZb"><font color=3D"#888888"><div></div></font></sp=
an></blockquote></div><br>This: ruby was added from meta-ruby because we re=
ally wanted webkit and ruby is a build dependency.=C2=A0 If webkit wasn&#39=
;t in oe-core then the ruby runtime would likely still be in meta-ruby, whe=
re it was a great example of a language layer.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142ba206a741d05480589ca--
