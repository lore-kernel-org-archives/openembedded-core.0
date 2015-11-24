Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6FC607AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 20:05:17 +0000 (UTC)
Received: by ioc74 with SMTP id 74so32038751ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 12:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sz1PUg6TNPZAfOnODgjszbshGmQBc1OYBVSrTPP1gtE=;
	b=ExYgGP9ztdxoC2BSTGiNpDOjDP04Ot3d3avJdebHG9//wiVelPwOHpNVIb8z8tpV94
	B4w1L6rN05mx/fifP/DZKmsQ6maphn/BKyEMJ9PgfwC5dW7ZUKWpk49zSYGTPURrfTbV
	iSubYACMgsRkp0AaCUnzxh4G4CsgBa86ZF4F4gtZjp03xeVJIa9aIG6YDF3g2q08uOx2
	NStydWZJKhVTAD9QZVWjUo1cGKgTRJe0Q8fVw/fSnxJuAHQQmlw5YitB34a8RcHQH82q
	wgZpHeHOvrEtesZn2TVlk9tqIJgcDTXh/uNjgLZEiO4krxkNw4f27Fuiu82kJMfa35me
	69iQ==
MIME-Version: 1.0
X-Received: by 10.107.162.137 with SMTP id l131mr29902717ioe.49.1448395518541; 
	Tue, 24 Nov 2015 12:05:18 -0800 (PST)
Received: by 10.107.12.205 with HTTP; Tue, 24 Nov 2015 12:05:18 -0800 (PST)
Received: by 10.107.12.205 with HTTP; Tue, 24 Nov 2015 12:05:18 -0800 (PST)
In-Reply-To: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
References: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
Date: Tue, 24 Nov 2015 12:05:18 -0800
Message-ID: <CAMKF1spXxarTUskBgB6ABdL-yn4wSm1cOZSBKdCpyxQzDg_a8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: vmdk images with musl libc
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
X-List-Received-Date: Tue, 24 Nov 2015 20:05:18 -0000
Content-Type: multipart/alternative; boundary=001a1141bbc660a45705254edcf5

--001a1141bbc660a45705254edcf5
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 24, 2015 at 10:58 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> It's currently not possible to build a vmdk image when TCLIBC = "musl"
> due to the following dependencies:
>
> do_bootdirectdisk -> syslinux -> mtools -> glibc-gconv-ibm850
>
> Creating an mtools .bbappend containing:
>
> RDEPENDS_${PN}_libc-musl = ""
> RRECOMMENDS_${PN}_libc-musl = ""
>
> seems to be a workaround.
>
> Does anyone see a better solution?

That should be fine for musl.

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1141bbc660a45705254edcf5
Content-Type: text/html; charset=UTF-8

<p dir="ltr"></p>
<p dir="ltr">On Tue, Nov 24, 2015 at 10:58 AM, Andre McCurdy &lt;<a href="mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt; It&#39;s currently not possible to build a vmdk image when TCLIBC = &quot;musl&quot;<br>
&gt; due to the following dependencies:<br>
&gt;<br>
&gt; do_bootdirectdisk -&gt; syslinux -&gt; mtools -&gt; glibc-gconv-ibm850<br>
&gt;<br>
&gt; Creating an mtools .bbappend containing:<br>
&gt;<br>
&gt; RDEPENDS_${PN}_libc-musl = &quot;&quot;<br>
&gt; RRECOMMENDS_${PN}_libc-musl = &quot;&quot;<br>
&gt;<br>
&gt; seems to be a workaround.<br>
&gt;<br>
&gt; Does anyone see a better solution?</p>
<p dir="ltr">That should be fine for musl.</p>
<p dir="ltr">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a></p>

--001a1141bbc660a45705254edcf5--
