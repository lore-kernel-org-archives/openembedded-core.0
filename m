Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5C92877A2C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 12:58:29 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id r142so8188394qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E/je0ODioCFUmK7hCo+kVn02TUmJC+kPmq33YngjYWg=;
	b=xcnKdM/pg3bMv03yP8G1s+Pcbr2wvICzHwIukRkbDTJhByCHha9Gn4bf+TzsLyYzu9
	BqPLpUy3eyxhYqlrrEUudH7o4Azxs9aI+VZpVTZruI+5iPLs5FsDjN9bOkJPHyAuJkL1
	Dn2LXjqv63QsvO9O8bAc69gLUGXjO3mPSmPKapgdfSeuUzueW5LbasKTAfHao/KBaU33
	fxwzRrJhJwxQZCVTRjdhNJV8YQ+Uuu33cd42rkk1GpllQr80NTF/ifHeXvAyOkXViAeT
	bQD0jTZKM71RX5yEeM855/T4SllHnLn/4PPWMrAtal4+6U063+SvT8Chjy6GuVVoks0d
	mVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E/je0ODioCFUmK7hCo+kVn02TUmJC+kPmq33YngjYWg=;
	b=TYBO5kX6O94xrCCe7qnruE1RmNtPrU4FA0931L8kzOKQht1mI/nwMoN7sm+m0BL5aU
	I2rIVVvkI6xS0ZIxgO65uaA7njD6JmVR45wJuPXxcBbj+mOlbMHbf7AwjXNMp5GKKJ81
	2vr1r//crObMTCurNz0yceCXI/8VQbD2ELSCZdx3l10qD5OwOoVTb5PgvBVYS/h35Axe
	tea9sGztxNH0oipe4UYF/CgVyOTnWjOxKgRI2m0xA8fveIs4woIhLNPQEPorLXH4M3OC
	fFnNg44I4XXHIuAeWplP0JputyvtMorZxsdqTkKoc3r6b4ZRMpP7OyLL4cPqM0d5976i
	1i7w==
X-Gm-Message-State: AFeK/H3ZtWHYGn1BSGgwlnWeMnuRMFgPuWRKYF/NUNrh89KOKjTHSKvzMEBmdEalTzA7Tobqp/gZeLjJW/Yh3Sf4
X-Received: by 10.55.20.100 with SMTP id e97mr21766533qkh.3.1490619510860;
	Mon, 27 Mar 2017 05:58:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 27 Mar 2017 05:58:10 -0700 (PDT)
In-Reply-To: <20170327125359.16788-1-alexander.kanavin@linux.intel.com>
References: <20170327125359.16788-1-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Mar 2017 13:58:10 +0100
Message-ID: <CAJTo0LaHFRVRJuK6VLyP-O=wo+O1iGRdeZrTvzUwgQY68Dg73A@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 1/2] python3: do not hardcode "lib" into site-packages search path
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
X-List-Received-Date: Mon, 27 Mar 2017 12:58:31 -0000
Content-Type: multipart/alternative; boundary=001a1140110471372d054bb5e6a2

--001a1140110471372d054bb5e6a2
Content-Type: text/plain; charset=UTF-8

On 27 March 2017 at 13:53, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +            file://0001-Do-not-hardcode-lib-into-site-packages-path.patch
> \
>

This should probably be added
to meta/recipes-devtools/python/python3/python-3.3-multilib.patch instead
of being in a separate patch.

Ross

--001a1140110471372d054bb5e6a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 March 2017 at 13:53, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D=
"gmail-:3k3" class=3D"gmail-a3s gmail-aXjCH gmail-m15b0fd5f00f0f511">+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-hardcode-<wbr>lib=
-into-site-packages-path.<wbr>patch \<br></div></blockquote></div><br>This =
should probably be added to=C2=A0meta/recipes-devtools/python/python3/pytho=
n-3.3-multilib.patch instead of being in a separate patch.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140110471372d054bb5e6a2--
