Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7C64C71AB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 10:21:13 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id m36so120976486qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 03:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sVMZCKZ6XyXzlp7TGMlStTUX98bi4SCOkHbgzLiQafk=;
	b=kJ460kq+kLRLwA9ykwdZM8THVdZUdge1oPxJeaPZ09OcgFMx5Rf4HUODmKaiUd662J
	Rr/cwIanVJBZapqZu4Rg+BHacp55F8Ne21ctrp5Y5TNxz0s6tBmC3FDY4kLMOEHQxc1d
	mKvG0StFfKJjrPD7tDmPTAnz0xk1pZRqbnpOpq+sq6JefvHKld3SI057P/5v/F9GIVtn
	6fwEElCMGXuCS/s1onEnAbC2BV05fhcfinWPY1zE7IMo9kw8YucFF4t+SSy/Hfv4/wY9
	7QVnD4ZIha3oVe95AuN7L4qg/hy/wGO6eAUWbgtEptabBPdDjZoDBPD8OkFySbM3efLP
	Afig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sVMZCKZ6XyXzlp7TGMlStTUX98bi4SCOkHbgzLiQafk=;
	b=CGaQUTjouqmmnjQwDJ58rMxuSPfa/XcJmDEg1CAtlssigpEt3MYgF58V7+68PkxBSH
	XyI+Ec7Y10C/sUiyZN3StFFwb/r6anrCkVWCpmDRj2ISyUVzrkNPdi+irhfiePJ73l1a
	lL3ry+xUClqdwbNx2czKWVoUd5jFnZ2q+LShdin4OdrhFyujZUAEtrTmVEaf5++RIAYc
	6prqGovdwOqlmhnUxZjP5Eg4zNiTLgiOzLXirIqVZSL+OSR9OBckYVyOYuJECzjyBn4B
	lybIRY95VSWBNrPSruYqZpZuLZif6mptMtCMtPX1IcExlFYrxxqIEbQHwE0SVbJzj/AE
	lAZw==
X-Gm-Message-State: AN3rC/7i9WTSEkKp8Qq8AFnTWCUH9r0I9aBJm7GKICAMk0rJLml9CiJh
	FxDqhnXIn4PaTjYebkOH6EdeZk9rU3f/
X-Received: by 10.200.41.108 with SMTP id z41mr11243710qtz.68.1492510874441;
	Tue, 18 Apr 2017 03:21:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 18 Apr 2017 03:20:54 -0700 (PDT)
In-Reply-To: <067fa2dd-24ee-60bc-4a27-ddf886d66408@linux.intel.com>
References: <1491876119-195521-1-git-send-email-dengke.du@windriver.com>
	<2f2ca19a-5af9-aa71-23bc-c2d30ea43445@windriver.com>
	<1492411399.19076.58.camel@linuxfoundation.org>
	<067fa2dd-24ee-60bc-4a27-ddf886d66408@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Apr 2017 11:20:54 +0100
Message-ID: <CAJTo0LYrNYscMvV5JBoSq2yicg0KEhyvH0Ao=UxEasQJUgyToA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: upgrade to 7.5p1
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
X-List-Received-Date: Tue, 18 Apr 2017 10:21:13 -0000
Content-Type: multipart/alternative; boundary=001a11405e8a7eacd8054d6e4425

--001a11405e8a7eacd8054d6e4425
Content-Type: text/plain; charset=UTF-8

On 18 April 2017 at 11:18, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Yes, but... people keep doing it despite you and me and everyone else
> telling them not to. How about someone would stash those updates to a kind
> of 'master-next-next' branch, and dump them to the list again when the
> merge window reopens? I can do that, if I would get a clear indication of
> when that work should start and finish.
>

FWIW I'm collecting patches in ross/mut for when master re-opens. They've
been posted to the list so don't need re-posting.

Ross

--001a11405e8a7eacd8054d6e4425
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2017 at 11:18, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":3nb" class=3D"a3s aXjCH m15b809332dec1247">Yes, but... peop=
le keep doing it despite you and me and everyone else telling them not to. =
How about someone would stash those updates to a kind of &#39;master-next-n=
ext&#39; branch, and dump them to the list again when the merge window reop=
ens? I can do that, if I would get a clear indication of when that work sho=
uld start and finish.<br></div></blockquote></div><br>FWIW I&#39;m collecti=
ng patches in ross/mut for when master re-opens. They&#39;ve been posted to=
 the list so don&#39;t need re-posting.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a11405e8a7eacd8054d6e4425--
