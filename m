Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 70A8776FC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:12:04 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id g73so20162812ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=klwjgGhbj5e8N+5CZ3ql6e7T6E52YVEE/LoWAFY3k78=;
	b=r2XO0RWz1ucvdPIUNM+L2UBULzl2KcgqkCNJl81bvTQsuPmEPmzPvlQO5ZpJ+Ogoag
	uxVYXosuhdb2qZtJI9gS0Tm9VQbU07+kwEHUYGyJe1yCfMLLV5RvoC7P1pzZ48DzCQmJ
	jyFB8GkV8YiGO1msfQwdaqVKvT+RvpNEkHE0oHqmk4vM4Jv9aFlSb4a+DGZrg+MKYim9
	DZY5W/b/AWw9J0UJvZjM5LltyUJBsdzvq88bT/Fy+xwXOoCko3MlEuPKKEc5dSEYnlJI
	VW7heUpwF6nnrYvJobKOMPlIiYLsWNp2fk9QBV/bAfkVdbE5s3mjPqGItFCXWmP43QfY
	bCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=klwjgGhbj5e8N+5CZ3ql6e7T6E52YVEE/LoWAFY3k78=;
	b=A81er13FDHdUBzJNHQ1dgSKzopxqWVs85F3AynHNMacOLrr4VAo1mn2DKZCQdFvcfu
	Am6SH7oWXlZR6BMWsktPsv+e7Ftw+ne9D9uoDa3iUUDDZuXu8jVoOZybdgqMVt+0znAe
	dr2cY9MpV56LLdTJYFV2nOdf1sNZjs87i8TnsI8aK8Uup9RaBLi+n4dbIM/lOaGLZNcq
	w4fOkbai50v2m7cluhVy1pBuSXDZNaRxEeHLCSFHk7QGIt87SxyEqEOyExf83P4PDX31
	enJWYpfCEFcQMr9fSVqFRhIs4cbMQumqsQqna2jpl1GVj8zKP1lZ0oQsU/8O9+oRYUaQ
	Hp7w==
X-Gm-Message-State: AG10YOS6n4EmKgGWbqAuEF6fhgr9dlbmVogXxYr0lCW9qbR09oR8Hp/UkM7Rbo1GCr2Vq/3NaAb0aMsNrcK3qiBv
X-Received: by 10.107.135.104 with SMTP id j101mr32161403iod.133.1453903925622;
	Wed, 27 Jan 2016 06:12:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 27 Jan 2016 06:11:45 -0800 (PST)
In-Reply-To: <1453903646-1919-1-git-send-email-adrian.ratiu@ni.com>
References: <1453903646-1919-1-git-send-email-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jan 2016 14:11:45 +0000
Message-ID: <CAJTo0LZFPbdaapbQ5n+O9W5nbYkLQWiEP=f4LnoFMcrt3=V62w@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg: Add 'opkg-collateral' to PROVIDES variable
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
X-List-Received-Date: Wed, 27 Jan 2016 14:12:09 -0000
Content-Type: multipart/alternative; boundary=001a113ebe92064d2f052a51633d

--001a113ebe92064d2f052a51633d
Content-Type: text/plain; charset=UTF-8

On 27 January 2016 at 14:07, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

>  RPROVIDES_${PN} = "opkg-collateral"
> +PROVIDES += "opkg-collateral"
>

Why does this also need a PROVIDES?  There's a RPROVIDES already for
on-target migration, and at least nothing in oe-core refers to
opkg-collateral directly.

Ross

--001a113ebe92064d2f052a51633d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 January 2016 at 14:07, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3eo" class=
=3D"a3s" style=3D"overflow:hidden">=C2=A0RPROVIDES_${PN} =3D &quot;opkg-col=
lateral&quot;<br>
+PROVIDES +=3D &quot;opkg-collateral&quot;<br></div></blockquote></div><br>=
Why does this also need a PROVIDES?=C2=A0 There&#39;s a RPROVIDES already f=
or on-target migration, and at least nothing in oe-core refers to opkg-coll=
ateral directly.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></div>

--001a113ebe92064d2f052a51633d--
