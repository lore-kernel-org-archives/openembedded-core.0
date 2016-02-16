Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6767760112
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 09:21:00 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id 5so73761283igt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 01:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/mPMxpcvYzR6pa1IGb9KCPQfY072zX3/nTIpNbYnqoY=;
	b=cFEd0qs9dp9UznctO9MtkW0Uoj3ygt+T8wRMvRCktdUqRpK1Mx7x7l1sTuHC+UJsf7
	mgr23GKjjZvu8jgpSzrziI6WWfOWXgsEhZxCwpvYZtO1JdLQHpsbwb3eD3hCHRTNH/ji
	73+6sTY1bfl1bFunTgHqxpvLxoCnbu8VIuT6sz7DFsRL5bIAiFQIF9RJ9HNhuZvhlA9s
	gvt0O+Pt0JTg+fLe9ljH8lr8uojv/IilwnoPXXrqdlNhaqw+GVtM4rhNC1ME218l2KRz
	2rc9uGMYDXn4k4AgDNYcJnokZml15UHC/VbK+RmQLQd8TTACLA+YNPBL7tA+adwF+uuL
	IMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/mPMxpcvYzR6pa1IGb9KCPQfY072zX3/nTIpNbYnqoY=;
	b=ap8Q3SKHEfK/URQQoJfwkj2pyzGgTfGZyE3J5y4s9awuPj7xzbNZ0xTrD0eWVQehLj
	6ZMiLsG4zS2Jzk4qS69sOwFwRNAA/APQfwZpmo1/Hs/A66VExkl9O0YZTdVJKlhlfHIt
	I9XZ7HPMpHoEi0LtXA9hafmZ4Au5GiqRlEnFUmrfkRIA4OUG1a446tI49Tx3UI+B74Sf
	a6v2Iz6XUXzfWWS/CLKE6RPhFPLrdj+eJBpr1kODTcllBTojkJPhlP2DS+NcMAik15D2
	oNM5BQOYRkOjrRBazyWK0U2Cofzkgdz7yQ/fLyDdi/H2f4HO9+X+0RaQr0+MNdLQz3Xn
	/AkA==
X-Gm-Message-State: AG10YORJWpNAh4bRzjc6jIXgtM3tEbl9McCRFghk//bRkjZQkVSdlQuD/UbhqW4NP5i0v0DgBvJJNnmWuPPRJ2dt
X-Received: by 10.50.111.111 with SMTP id ih15mr17628324igb.78.1455614461729; 
	Tue, 16 Feb 2016 01:21:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 16 Feb 2016 01:20:42 -0800 (PST)
In-Reply-To: <CA+chaQeKD6yo1bih1pimJ7P2F1OPsT0B70Ew3ETQuwH8H6nRfg@mail.gmail.com>
References: <1454943548-21889-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LZm-Q-f8im1Ssfcp6z8T2nj51ToV=s9NMYF2EP0z-Yt4Q@mail.gmail.com>
	<20160214115245.GC3028@jama>
	<CAJTo0LZ6Kuqiqi-AmihXKy7DWxc9e2+V4QS3VmVN=rfOFVCFng@mail.gmail.com>
	<CA+chaQeKD6yo1bih1pimJ7P2F1OPsT0B70Ew3ETQuwH8H6nRfg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Feb 2016 09:20:42 +0000
Message-ID: <CAJTo0LZt-CRO6Ub5nDhYnadjMvzHCgG3+Abm54s_9L6UupDnPA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Tue, 16 Feb 2016 09:21:01 -0000
Content-Type: multipart/alternative; boundary=089e0149be34ec0de3052bdfa655

--089e0149be34ec0de3052bdfa655
Content-Type: text/plain; charset=UTF-8

On 15 February 2016 at 23:15, Martin Jansa <martin.jansa@gmail.com> wrote:

> I'm sorry it looks like it was caused by bbappend in one of our layers.
>
> We were using this bbappend with older mesa version and it set
> PACKAGECONFIG[dri3] to empty, because of unrecognized mesa options in that
> version.
>

Great, thanks for the update.

Ross

--089e0149be34ec0de3052bdfa655
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 February 2016 at 23:15, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I&#3=
9;m sorry it looks like it was caused by bbappend in one of our layers.<div=
><br></div><div>We were using this bbappend with older mesa version and it =
set PACKAGECONFIG[dri3] to empty, because of unrecognized mesa options in t=
hat version.</div></div></blockquote></div><br>Great, thanks for the update=
.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--089e0149be34ec0de3052bdfa655--
