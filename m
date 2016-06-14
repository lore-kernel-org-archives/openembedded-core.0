Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 25D0162132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 09:27:15 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id z189so72120547itg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EpBowrSXOUXRIOxoOk9+P00Bf7Lwd6eGL2bkJrGelc0=;
	b=fvt6DeuXXT53B0FCxrKxYpb/hU4dj2dkoRSnBUnS0fFzLWK3CezmsyN+rYgxYpLgc4
	uBGY4mUMvhoTT+RQL7CZZoSdxaRxMgTRObTxomzXUllUSE34YUQKRPxQ9+Sjttg5jbbU
	2NCffpjOE8gXMxzg9yYSctjB3pMMhZCQBSnaWAnDkSXWqIqa+t1xj2PM4/EA3HZwmDJT
	hel0lvX45vClPQB1xTpfuZ0XIUaOw8v3j8+1kC9oinCeXwSS9MQ0jmQF+4qeVZqH0Q6y
	Z+1PSSrUBzpjFyYFUAYMFwE5Laaz4Aeb1kH8RrFpG9qjkPo0+RBle/L/L7NTlS0H4GNU
	verw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EpBowrSXOUXRIOxoOk9+P00Bf7Lwd6eGL2bkJrGelc0=;
	b=fHU7vVB5JUpAEAZpN9fmP0bEpD74P09kgGHWWdHl3GPSfi7EPREr02/HfIaGBdiDkX
	dUNgWTSP/XI6VRqhb2ziTjbiKCYsXWxhDyzzQ0Ljd2XPAA9OlP7e82Bzw8CCRYe7pZ4u
	qnDs8k80V+XrVdYbFKLnhZiJrRcc33ugEpE3/gN31wjmsw2hKYsYym7nVcb7BizJrooP
	xAM2AJTz3kmNi1S4QXoSTgLz7W/iloy0zbvyK4Eeh1SJLYH+qTBFpqgk4je/bfnIb3uf
	aQy0mkpJKYFd6JlNAVqTPleo+fKfLfeQjRM6ylfMAHofZqjcOg744MZ3WS9CLJ84L+Mn
	FamQ==
X-Gm-Message-State: ALyK8tKvcN9N9Pow0rxkHNGjKUDGA3XVMs5TsSCRDitzXrORW5583U1klh5h9nBeSNYheSAnBY0xrOS56gONxKsM
X-Received: by 10.36.2.71 with SMTP id 68mr6653940itu.38.1465896436488; Tue,
	14 Jun 2016 02:27:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 14 Jun 2016 02:26:57 -0700 (PDT)
In-Reply-To: <4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
References: <cover.1465824701.git.mariano.lopez@linux.intel.com>
	<4a96e992a3f5d117eb4b33513a2330e81ffd0b59.1465824701.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Jun 2016 10:26:57 +0100
Message-ID: <CAJTo0LbaK3civt08iMhoyxrFnWAF+d29Xv1njRCE_LKcAtMt_w@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] selftest/runtime-test.py: Add test for import test from other layers
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
X-List-Received-Date: Tue, 14 Jun 2016 09:27:16 -0000
Content-Type: multipart/alternative; boundary=001a1144b1d05fef810535399c2b

--001a1144b1d05fef810535399c2b
Content-Type: text/plain; charset=UTF-8

On 13 June 2016 at 14:32, <mariano.lopez@linux.intel.com> wrote:

> +        features = 'INHERIT += "testexport"\n'
> +        features = 'TEST_SUITES = "ping ssh selftest"\n'
> +
> +        # Build core-image-sato and testimage
> +        bitbake('core-image-sato socat')
> +        bitbake('-c testimage core-image-sato')
>

If we're just running ping/ssh/selftest, can the image be something a lot
smaller such as core-image-base?

Ross

--001a1144b1d05fef810535399c2b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 June 2016 at 14:32,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mariano.=
lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":48m" class=
=3D"a3s aXjCH m1554bb3cfec465aa">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D =
&#39;INHERIT +=3D &quot;testexport&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;TEST_SUITES =3D &quot;ping s=
sh selftest&quot;\n&#39;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Build core-image-sato and testimage<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core-image-sato socat&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;-c testimage core-image-sato&#39;=
)</div></blockquote></div><br>If we&#39;re just running ping/ssh/selftest, =
can the image be something a lot smaller such as core-image-base?</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--001a1144b1d05fef810535399c2b--
