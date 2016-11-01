Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6286660722
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 00:53:19 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 128so6709712oih.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 17:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=uZP5NKR74s6D01Kvb2GBfGrci/PIdET/Am7QHBaNshU=;
	b=dRqX+UjcxGkpQD4H8/x92AyewlSuxp8gBB79nFIBJC+C7KtkYFIaGnXz132qruajpe
	f8T9TZAc4c5CqfzGFA6o2OIARyZ1kzVKnqMUK1fCOmcl5xgeabFuM3IBP7eYoHch3XxT
	ExPv0XfRjniyyVvzP9IQnyN63vdl8s6sMNQp4BKiR+TSpZCEy3PH5gmbZPxRe3b+lc0o
	zVKiHp3uM6HNnoFUOtm8qbtKhIBj756Dr4FcSHpxhdR0JhPpJxIlCPPtpWmITICNkbC7
	eDOUp6xofb2o0JfPnBInMUP/fknkCLLj5/+S3FfLabpWuA2CFHCO7fFSmVOqRfRlx8pH
	49BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=uZP5NKR74s6D01Kvb2GBfGrci/PIdET/Am7QHBaNshU=;
	b=ZpYR8eYYPRE148PQnmZKYZ7TYkELv+fN22dJxflnFr3QenMJjbGRc8GIS4H0fq4wur
	DDZutCuK752p6XtVVtj/XOI/w7H72fOZKx1nFDGOKAJOF7EHb16K0M1sY2x7M8LbeQCI
	sV7J+IjRgmK9X78Z34+yjlOzkHvKSe+KkXwJoEl+QIodwXlTTyhKaf41DFbfyuxA2Y2y
	Vz32Dx8ncd91SetOe8unD78x8JxNhB+E/HWzo+dybMuh+fEAM1enzrw31Wa1IncLBr1Y
	Gj0DHig3xNNt15vWJXAGP1yLbRrEs0DtrCnVuzdVcQB2QD7ZCyc1E1bj+cdqJucDhbdz
	hbAg==
X-Gm-Message-State: ABUngvcOuvurZGDwTT8lnN+07lg16V8eFSqM07L5h5Htyp1VySpwF0vr277FQeigEijAIDGf+gOqLchdn7jlxQ==
X-Received: by 10.157.58.35 with SMTP id j32mr21597440otc.166.1477961601439;
	Mon, 31 Oct 2016 17:53:21 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Mon, 31 Oct 2016 17:53:01 -0700 (PDT)
In-Reply-To: <1A7D1C00-1B1C-40CF-8240-9BC100D0EA8A@gmail.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
	<e1af68e680f3fbf20d7b0a8c55802a9cdd3f404b.1477886344.git.paul.eggleton@linux.intel.com>
	<CAMKF1soshS9nzHZ_OEQ9cJvZNRREnAKQKz6fXUzcJQGBD6nvHA@mail.gmail.com>
	<2111229.GbldrazETl@peggleto-mobl.ger.corp.intel.com>
	<1A7D1C00-1B1C-40CF-8240-9BC100D0EA8A@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 31 Oct 2016 17:53:01 -0700
X-Google-Sender-Auth: BLwyxKVCaLtv8ydH0T3XTB6nCEE
Message-ID: <CABcZANkuOrrB7npS448CUokhGL5YkO+fdHpmK7QcKbFR+-NPCg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] classes/license: fix handling of symlinks pointed to in LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 01 Nov 2016 00:53:20 -0000
Content-Type: multipart/alternative; boundary=001a114713ac3edd47054032c045

--001a114713ac3edd47054032c045
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 3:34 PM, Khem Raj <raj.khem@gmail.com> wrote:

> > On Oct 31, 2016, at 12:41 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> >
> > Hi Khem,
> >
> > Why wouldn't it be?
>
> Was thinking out loud if the path is expanded to absolute paths then
> does it get recorded into task checksums  ?


It=E2=80=99s resolved in the copy_license_files function, not at parse time=
. Of
course, any functions calling copy_license_files will change checksums due
to the function itself changing, presumably.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114713ac3edd47054032c045
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Oct 31, 2016 at 3:34 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; On Oct 3=
1, 2016, at 12:41 PM, Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@lin=
ux.intel.com">paul.eggleton@linux.intel.com</a><wbr>&gt; wrote:<br>
&gt;<br>
&gt; Hi Khem,<br>
&gt;<br>
&gt; Why wouldn&#39;t it be?<br>
<br>
</span>Was thinking out loud if the path is expanded to absolute paths then=
<br>
does it get recorded into task checksums=C2=A0 ?</blockquote></div><br>It=
=E2=80=99s resolved in the copy_license_files function, not at parse time. =
Of course, any functions calling copy_license_files will change checksums d=
ue to the function itself changing, presumably.<br>-- <br><div class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clar=
son at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Ma=
intainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a114713ac3edd47054032c045--
