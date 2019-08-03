Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3F73D7F397
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 12:33:57 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id a15so76684436qtn.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 05:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=idz5ThUMRzTyQ7aFhh7iyxB+kh/eOLUOFzvKjRQ5UfU=;
	b=Rky/hn9SEMZSegQINyjRWbm4HfUg5tqEh5e/VGn9n9DFT6EEhbFJbznmfG9kAioRX7
	/p8siJEvxBZ61xXtgAqa/k2yNRd6rzjhvAEn3NbCAwJ/2GjvgMK8BgMnvw/+RbJSPten
	SQxbWBDLbAr72ixlS/TBr35UBZU1dUOnPZjknM6b58et5GBLN0kNxdhs+bU8dSiB8lSC
	9smTgJTT5qIXPyYqeqRNqexfTIoUi82HPaguVT/VRl/9K7r5Gojzbil1w9RDBFLg1+Td
	8i6YuhSkSbCyGa4sy/GHZERvkPEK16LIbm3tcczHh0MWpNksxM+tzy3ESV2kNOC2z6OB
	IwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=idz5ThUMRzTyQ7aFhh7iyxB+kh/eOLUOFzvKjRQ5UfU=;
	b=cDAByyQJvFcdW6y2xZ14z93gRbtlKgOo+7pbJ4P118o7ZGbn+Y9DxcquWSvXFidSzx
	qH/NOPrj10OivGQWoeyXJNan0izV5/ZTkVB+8M+Z8SVYhaY9KG0hNbmX0E7nyQRtj9Pu
	1Ngh5oq0nwnLL+QQnJhyNko7dfDxva4KGZc7ha8W6Mow3EVoRWQ7X4w6E/rWjtP6MWJx
	FRjQWYjvuwM9sX9wkGr6nHQ2f0/MJyG635PIWSEFlKlbRh4+wwcLdvkQ7a1xm6jWIo3W
	s/SsDeBSNnmEXIoPVrItktXh+mXUA6uExSA+2SwaDyrBWrD7oDPkKlDFGa6VXb4NOa0I
	8ZEw==
X-Gm-Message-State: APjAAAU9DEqgUpZDL5ml2UEu94IhfdrJPrWnmEwaQ+LJMTIk1837t/dF
	gGndqTrsKSQbys71fbvhUmbCiVcau70/GsZpmc4gHJUm
X-Google-Smtp-Source: APXvYqzLuJNsQ6kprTeBDTMt5Z10EHoNb4YqWNTB6I1QRXgs05sU8Q1oqUfkZSZbxOcYqOVLFkgD4eIbLhdCq1stiXU=
X-Received: by 2002:aed:3644:: with SMTP id e62mr96645405qtb.80.1564835637948; 
	Sat, 03 Aug 2019 05:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
	<20190802120733.4a24ca3f@seebsdell>
	<20190802124246.27d4beca@seebsdell>
In-Reply-To: <20190802124246.27d4beca@seebsdell>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Aug 2019 05:33:46 -0700
Message-ID: <CAMKF1sr-gxJBXUn6OtU=0GtTw=CTLWfFLVWjATB-_k-1NYCP1g@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Sat, 03 Aug 2019 12:33:57 -0000
Content-Type: multipart/alternative; boundary="00000000000054f7ba058f35b090"

--00000000000054f7ba058f35b090
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 2, 2019 at 10:49 AM Seebs <seebs@seebs.net> wrote:

> On Fri, 2 Aug 2019 12:07:33 -0500
> Seebs <seebs@seebs.net> wrote:
>
> > Note that there's no lstat, and no AT_SYMLINK_NOFOLLOW. Which is to
> > say, these stats will be following the symlink even though O_NOFOLLOW
> > was set. I can probably patch this in a bit.
>
> Followup: Patch applied to master, but also in addition to fixing the
> stat calls, I had to use `flags&O_NOFOLLOW` rather than
> `flags|O_NOFOLLOW`.
>
> I am sort of amazed at how much DIDN'T break right away with that one.
>

Will this fix the file ownership issue that we see with Glibc-locale
packages from time to time?

>
> -s
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000054f7ba058f35b090
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Aug 2, 2019 at 10:49 AM Seebs &lt;<a href=3D"mailto=
:seebs@seebs.net">seebs@seebs.net</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Fri, 2 Aug 2019 12:07:33 -0500<br>
Seebs &lt;<a href=3D"mailto:seebs@seebs.net" target=3D"_blank">seebs@seebs.=
net</a>&gt; wrote:<br>
<br>
&gt; Note that there&#39;s no lstat, and no AT_SYMLINK_NOFOLLOW. Which is t=
o<br>
&gt; say, these stats will be following the symlink even though O_NOFOLLOW<=
br>
&gt; was set. I can probably patch this in a bit.<br>
<br>
Followup: Patch applied to master, but also in addition to fixing the<br>
stat calls, I had to use `flags&amp;O_NOFOLLOW` rather than<br>
`flags|O_NOFOLLOW`.<br>
<br>
I am sort of amazed at how much DIDN&#39;T break right away with that one.<=
br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Will this fix th=
e file ownership=C2=A0issue that we see with Glibc-locale packages from tim=
e to=C2=A0time?</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
-s<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000054f7ba058f35b090--
