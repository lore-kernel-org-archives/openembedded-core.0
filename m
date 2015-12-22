Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9703D60721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 21:11:55 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id q126so198626894iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 13:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CX9JyPZSUr2i/OXxPo/B+ZQzU5nFcYSU+G22wDwYEmc=;
	b=gvY7eD7p94lo6guYY2/NAhxGYz/cxE/ZzTd2M4b5iE+UnMreXjeHbqh9gaw4M2tVNv
	LbMENey0hILSTA/s7E/nNk5GxrCOmQKq3IYGf+LKY6FLapclz0qayURyBoPbn1tdcXZN
	xclpNQXujk+1J0VXfkr37iF9yN2lL450CCELT4Tksz2KKxkYbFBphv9RO1+1EODcoyYX
	6ki41uEn5MFdJ8itHDO0J0ESBf+E0Wh+gHAgIwHN6gt+kXN+SSPKBZRaamitQAmnnjVA
	UBGbZOUOS7F8IVoT26xSjHqd45QyBxTkZ9ckAoHMo2qvHhhHwoJvngETBgbOpXrbRdwC
	QZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CX9JyPZSUr2i/OXxPo/B+ZQzU5nFcYSU+G22wDwYEmc=;
	b=mEryI1x8rfnqg0a+f0m7q9W/ofnbSwUHCtO8PRhlMd57yNlHjRrEJGod5MQQU48r5T
	8HlC+QrAjXilaI2CSWqHKVrKHc+xGK4JUFqreLkAwjhhfeGoKenftvM6V6DNFDz5icFk
	Y5vkb3c2fWwU+RVw5qljfw/f516+HABl+QU+TO5R/f9c/O7ZUVWKdw/KLAqFBJSnCUy1
	x4q1Ye4XP/vs3LaQ7XqCTaMGJF3Zb1nqEBxlaSeEF1Lv7H38MilNUBpAfecLEj7b9UzE
	vAKQJhvlxQ4G15q781d+DmcwQt1antVnUFhHIzPjZXtLZdtRfYtJN8A+t9Delh4NAxES
	xzkg==
X-Gm-Message-State: ALoCoQma+La2u+DDuThx/8r2CXPhFSn7bUW7C3doBYH4pHMjY7Tu2Aj+yQhq3rcSMZ5xVxfLDAcjykZgcCztRNiL6jH/8x9LAq54TIF1i5Iidj66ZhXHmVw=
X-Received: by 10.107.3.154 with SMTP id e26mr26057177ioi.99.1450818716101;
	Tue, 22 Dec 2015 13:11:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 22 Dec 2015 13:11:36 -0800 (PST)
In-Reply-To: <567999B4.8090201@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
	<55c3139023d3c2d418e5c34b2a7f4a000fdbc1dc.1450288828.git.mschiffer@universe-factory.net>
	<CAJTo0LZfmtfw-XsnVd7THwv1gKfmY=hjBF9EiNknA9jhLRS6Aw@mail.gmail.com>
	<567999B4.8090201@universe-factory.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Dec 2015 21:11:36 +0000
Message-ID: <CAJTo0LY=7WNEcQNeqraLzbEyy-LfQ_3YyA18oEF=aK-yfgXZMQ@mail.gmail.com>
To: Matthias Schiffer <mschiffer@universe-factory.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] base-files: create ${base_bindir} etc. instead of /bin, /sbin and /lib
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
X-List-Received-Date: Tue, 22 Dec 2015 21:11:56 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a3502030527830e2c

--001a113ec10a3502030527830e2c
Content-Type: text/plain; charset=UTF-8

On 22 December 2015 at 18:43, Matthias Schiffer <
mschiffer@universe-factory.net> wrote:

> Maybe adding both ${base_libdir} and ${nonarch_base_libdir} would make
> sense?
>

Sure.

Ross

--001a113ec10a3502030527830e2c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 December 2015 at 18:43, Matthias Schiffer <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:mschiffer@universe-factory.net" target=3D"_blank">mschiffer@un=
iverse-factory.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":h0" class=3D"a3s" style=3D"overflow:hidden">Maybe adding both $=
{base_libdir} and ${nonarch_base_libdir} would make<br>
sense?</div></blockquote><div><br></div><div>Sure.</div><div><br></div><div=
>Ross=C2=A0</div></div></div></div>

--001a113ec10a3502030527830e2c--
