Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 515EC71BA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 22:28:33 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id t10so1768601vke.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SIC3Pbg2aX4RUxnfZ41Q2fo3LYBbuiIgjGCJAVkSg88=;
	b=l7rBj8L2C2899MvrRnasZ85JMG42TDJEjOsZChBUCvcTVui0QqEPVJ+83aSNuwkpoa
	XwtTqJNoYh7Qfm7i/FGmeQ2kZnKm9GVtLW5Hk8jOU8WVZ82nQWBs2HoQkLEImd/wxrDC
	JXe8B1/s5F1lSvceXNZY9aWm5FfzKjTSP80OdDLmBxmhb6PkFgCFSqxXiOqLjPg1H7BP
	RcqUU5qB7CQdpcu0w5qljnvArAoxQYoig9OeCWrY1NoaTIFMYRuKV7Qif/z6xVwDA8Cv
	oTUTBpzZBKmAjm5Co05Aa2g6q2rEwm3GjMQEZ/7/wZ2NSt3lOjz6PcMfBwcoS4y+2sHS
	22zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SIC3Pbg2aX4RUxnfZ41Q2fo3LYBbuiIgjGCJAVkSg88=;
	b=ZwO/cIL8o/al+CtDHbkFFtRK4LmBV8bAJWk3skOd7y9qNnGrTxm6bB6um7SmcbY2Oh
	j6+9EtYi0LmiAZTOlWpeIqvG6XSGvIlYhSnYwnPrL6is1fk49v4A7PpWM5QekTu0tSO9
	fS2d6P0TUxUkP41pl7w1hh2Y3mi0WkAWWO4GbAvNjJ+3mruSW59H5OWiB1gAEuVNE/ha
	dq5Yuy4k5UZ7DLecJpWfqNBWYIyBCmq42OB6nlJeLY0mz7wgLch+4/0DdYmpL8MyfbNo
	SAfpysiKvPJEYpt8eNp+vipUXUoR1tzIik/skWWfaOjdV3ztJMyCAplRGYdUaEW9RX6k
	WSEw==
X-Gm-Message-State: AHPjjUgXL4siCRE4MSS8edRcLAXvj8NhcFBg67Zz5XePdZv7WoVMYQ09
	tXkefq6vR3uRNkecXjOOVLu39ue7tuvQlxZrJGQ+Rg==
X-Google-Smtp-Source: AOwi7QCz/BSd5FA8jlFNII1lvsazRbd8A3ovB79ay0xQ08vPwnmCR9lVhFF2v7WVRJvxFo0SXs9P1yXMa3xGRKL550Q=
X-Received: by 10.31.128.14 with SMTP id b14mr14405475vkd.56.1505341715233;
	Wed, 13 Sep 2017 15:28:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 15:28:34 -0700 (PDT)
In-Reply-To: <20170913170830.6ac2b8bb@seebsdell>
References: <20170913204659.1919-1-Martin.Jansa@gmail.com>
	<20170913205032.GD3288@jama> <20170913170830.6ac2b8bb@seebsdell>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Sep 2017 00:28:34 +0200
Message-ID: <CA+chaQcxHMzTwiAEQx4zPkVrbLHndUoVVS=yWz=hiOE43VZzNg@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] insane.bbclass: Add do_qa_pseudo function to check for common errors listed in pseudo.log
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
X-List-Received-Date: Wed, 13 Sep 2017 22:28:34 -0000
Content-Type: multipart/alternative; boundary="001a11428be033c06b055919ae7f"

--001a11428be033c06b055919ae7f
Content-Type: text/plain; charset="UTF-8"

OK, thanks.

Any insights to the first issue described in commit message? That we know
that is an Actual Problem, but hard to reproduce it.

I'm rebuilding one component over and over again and with pseudo 1.8.1 I
got this issue in 5 rebuilds from 1000, now in the same build with latest
pseudo 1.8.2 backported from oe-core/master I got this issue only 2 times
in 1000 iterations.

Hopefully this insane check will help discover similar issues even without
triggering the QA host-user-contamination check, so that we can detect such
issues even without really trying (it's now included in my regular "bitbake
world" builds which quite often trigger this QA host-user-contamination
issue in glibc-locale. And now we can correlate that with pseudo.log more
easily.

On Thu, Sep 14, 2017 at 12:08 AM, Seebs <seebs@seebs.net> wrote:

> On Wed, 13 Sep 2017 22:50:32 +0200
> Martin Jansa <martin.jansa@gmail.com> wrote:
>
> > inode mismatch:
> > '/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/
> systemd/1_234-r0/recipe-sysroot/etc/group'
> > ino 29361846 in db, 29361904 in request.
>
> Just to be clear about this:
>
> This is at least potentially an Actual Problem. It's probably not a
> good idea to habitually ignore these. A thing like this happening means
> that, at some point:
>
> 1. Something created etc/group, and it got inode 29361846 recorded in
> the database.
> 2. Something deleted etc/group, and did NOT record this to the database.
> 3. Something created etc/group, with inode 29361904.
>
> It's possible that the thing creating etc/group didn't record it to the
> database, and something else just referred to it later (like a stat
> call), or that this was generated by the request creating the entry.
>
> Either way, it means changes were made to a pseudo-managed hunk of
> filesystem without pseudo knowing about it, and that is generally bad.
>
> -s
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11428be033c06b055919ae7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, thanks.<div><br></div><div>Any insights to the first i=
ssue described in commit message? That we know that is an Actual Problem, b=
ut hard to reproduce it.</div><div><br></div><div>I&#39;m rebuilding one co=
mponent over and over again and with pseudo 1.8.1 I got this issue in 5 reb=
uilds from 1000, now in the same build with latest pseudo 1.8.2 backported =
from oe-core/master I got this issue only 2 times in 1000 iterations.</div>=
<div><br></div><div>Hopefully this insane check will help discover similar =
issues even without triggering the QA host-user-contamination check, so tha=
t we can detect such issues even without really trying (it&#39;s now includ=
ed in my regular &quot;bitbake world&quot; builds which quite often trigger=
 this QA host-user-contamination issue in glibc-locale. And now we can corr=
elate that with pseudo.log more easily.</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Thu, Sep 14, 2017 at 12:08 AM, Seebs <=
span dir=3D"ltr">&lt;<a href=3D"mailto:seebs@seebs.net" target=3D"_blank">s=
eebs@seebs.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D"">On Wed, 13 Sep 2017 22:50:32 +0200<br>
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; wrote:<br>
<br>
&gt; inode mismatch:<br>
&gt; &#39;/OE/build/oe-core/tmp-glibc/<wbr>work/core2-64-oe-linux/<wbr>syst=
emd/1_234-r0/recipe-<wbr>sysroot/etc/group&#39;<br>
&gt; ino 29361846 in db, 29361904 in request.<br>
<br>
</span>Just to be clear about this:<br>
<br>
This is at least potentially an Actual Problem. It&#39;s probably not a<br>
good idea to habitually ignore these. A thing like this happening means<br>
that, at some point:<br>
<br>
1. Something created etc/group, and it got inode 29361846 recorded in<br>
the database.<br>
2. Something deleted etc/group, and did NOT record this to the database.<br=
>
3. Something created etc/group, with inode 29361904.<br>
<br>
It&#39;s possible that the thing creating etc/group didn&#39;t record it to=
 the<br>
database, and something else just referred to it later (like a stat<br>
call), or that this was generated by the request creating the entry.<br>
<br>
Either way, it means changes were made to a pseudo-managed hunk of<br>
filesystem without pseudo knowing about it, and that is generally bad.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
-s<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11428be033c06b055919ae7f--
