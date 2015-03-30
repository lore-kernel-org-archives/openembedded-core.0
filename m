Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0A543736C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 16:43:27 +0000 (UTC)
Received: by qcfy6 with SMTP id y6so56775588qcf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 09:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rv9pNa9Qb15Jae3pMOns6f1nHIgRiHsEAeRlj5tSwJI=;
	b=UgTXnYDOWDYcQNqFFXCKB/wNwX5NERgptSfwnGenlx+RQARaxjlxG8RrpHU5C19Q7c
	uw5FvkyXO5sU8Lr/hYad6Iql1MS1moIM4zQIJSFvuIT2PNHESrpVYDxkHted2sw29b7b
	N8fzFHnDvNr/utGhAWm01GmMJ++hU9yQzLW+vJT2ZnSl8gmXvCYWz28w0U8SVk4ncntB
	nlwRv4PL8YdVBgdeWEYbb+zcGnsZLDLeUjc+2dkj3xxvh4X8G8AnGD8TVhbfBIXEOZlP
	+bPYXyN/VpCjSzb4Xf7fTguEGUxl3GvIxFeT3i7fnIVb5SprXG9Ur/MVkKRpyuENkoPF
	9BEw==
X-Gm-Message-State: ALoCoQmRSNCjhj588k/6JfurLzytssM42zihN2hlrwJKXhqCMS/reTI88UTwqDbNZTXk2JBWzBM/
X-Received: by 10.140.217.198 with SMTP id n189mr19650995qhb.29.1427733808667; 
	Mon, 30 Mar 2015 09:43:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 30 Mar 2015 09:43:08 -0700 (PDT)
In-Reply-To: <1A4BBFA3-A5F0-4145-A64D-326C186C51C4@gmail.com>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama> <20150329002843.GE2343@jama>
	<CAJTo0LZqbqThJ04OTmbrEhUQx1VaXT-9LGS-S6bosyKBmgGvFg@mail.gmail.com>
	<1A4BBFA3-A5F0-4145-A64D-326C186C51C4@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Mar 2015 17:43:08 +0100
Message-ID: <CAJTo0LY_v=R0Xv-QcYyEvm-fBun2JZG+xL80R_yMcBU-B2ASqg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Mon, 30 Mar 2015 16:43:29 -0000
Content-Type: multipart/alternative; boundary=001a11379880800d4a0512842e4b

--001a11379880800d4a0512842e4b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30 March 2015 at 17:41, Khem Raj <raj.khem@gmail.com> wrote:

> aren=E2=80=99t they variable data files ? where else should it go otherwi=
se
>

They're directory-wide caches, and caches tend to go into /var/cache.

Ross

--001a11379880800d4a0512842e4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 March 2015 at 17:41, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div>aren=E2=80=99t they variable da=
ta files ? where else should it go otherwise=C2=A0</div></blockquote><div><=
br></div><div>They&#39;re directory-wide caches, and caches tend to go into=
 /var/cache.</div><div><br>Ross=C2=A0</div></div></div></div>

--001a11379880800d4a0512842e4b--
