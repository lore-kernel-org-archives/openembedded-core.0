Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id E445B71988
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 20:21:00 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id x190so87763446qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 12:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GdLP8+4GUWnyd1DHnHRpwAFbTq4o36kY5hBlwWsuLXw=;
	b=N1hFjNWYO7SRxUD2G0NO93ekrCu1kJOV8D5GfKzl0Ot5ZYWsEsBq8E9VryTCvm2fMF
	hTMxgPYZHQHwZwoI94tFh0yP9cGjQfOkfplLLwAkwFgfHXsW9D4vTvjIwYQ1B6PxlOBp
	A7j/fYancv4HTPw0ypdk2BjQ4mtUvbKnKjqWTeABQs0ANZabPlRRFG4RFZrqXQwIY50z
	utJGGYCvKHXmTcuwyy8g+AEP0gTeouoyKTDHPjJI13ba4/2mgrfH2NPpBWLBgCillyqT
	nwdrxx2gZAu8s4Oj3FSwvjpG8RheJG8RoiTwf2caCjSH6TMywFwWXfbHcQwpPcADI/GJ
	CXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GdLP8+4GUWnyd1DHnHRpwAFbTq4o36kY5hBlwWsuLXw=;
	b=CMEQoE64aZ0bNUofnb3dBpjO87gOJgF/i1zpPVuGZvJuJ12moIaP0xNGDUZKvRnr5O
	ZCYAEm11UGY63lP55gQTxB0Y8tPU7pAafVa8mKMxM8ZidVFjDO8NnkzanKG81SXvk3vq
	2vLlTlQrXu29tk8IZ0SYhcEHGdk/PZbtOKQs9+1ysnZbmYjqhNFqY7tOtkOGJ0k3xpV1
	itCWW3bR1x90sBjlNMtOJxudDbvJTXvc+NjpTHhLD2INphkzBJ+oEeo9p/Obr+to2yUX
	qopbKmxiwKHaDi4iOdeu8nZlGh3E7bNlAsXwjwS8uBcI/qTeEzrsSTJVL3fadwhrvQ99
	uZuw==
X-Gm-Message-State: AKaTC00XKs5kyMxEPy4DTShTfOU2oxTQ2vEPdZto7Hk5c520FYt8vEiZu4NSKKfgHh/v+VqNEilS+0CmXtE9ckDK
X-Received: by 10.55.8.20 with SMTP id 20mr9736307qki.3.1480105261623; Fri, 25
	Nov 2016 12:21:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Fri, 25 Nov 2016 12:20:41 -0800 (PST)
In-Reply-To: <1480103880-1772-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1480103880-1772-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Nov 2016 20:20:41 +0000
Message-ID: <CAJTo0LYPcTEjZ50CYyZtSaBZMst6qO29pGgMS2FeAU89fKYTEw@mail.gmail.com>
To: huangqy <huangqy.fnst@cn.fujitsu.com>
Cc: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: 20160126 -> 20160920
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
X-List-Received-Date: Fri, 25 Nov 2016 20:21:03 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60597de6054225dcdb

--001a114c9d60597de6054225dcdb
Content-Type: text/plain; charset=UTF-8

On 25 November 2016 at 19:58, huangqy <huangqy.fnst@cn.fujitsu.com> wrote:

>  meta/recipes-extended/ltp/ltp_20160126.bb          | 118 ------
>

You forgot to add the new recipe to the git commit, so all this patch has
is you deleting the old version.

Ross

--001a114c9d60597de6054225dcdb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 November 2016 at 19:58, huangqy <span dir=3D"ltr">&lt;<a href=3D"mail=
to:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1xn"=
 class=3D"a3s aXjCH m1589b6ac543cc43e">=C2=A0meta/recipes-extended/<span cl=
ass=3D"il">ltp</span>/<a href=3D"http://ltp_20160126.bb" rel=3D"noreferrer"=
 target=3D"_blank">ltp_<wbr>20160126.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 118 ------<br></div></blockquote></div><br>You forgot to add the new =
recipe to the git commit, so all this patch has is you deleting the old ver=
sion.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a114c9d60597de6054225dcdb--
