Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 234B0771B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 11:11:00 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id n5-v6so5218685wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7EwoUj7sfOl8ofggXUl0pvXjw7wSNfpozK6pjD8XWfs=;
	b=tF5OZZBJcj/nh3DJRUTxUjrhOWUaA3pc0UPGK7O+WufvHfaaiuzLb8iJGxOkJTaPUw
	isSEWgvL3vCApDKfRq/Dc8tnKUThK+oR+yVIrd3zgeFaN2wen8+Xf9kSoR7xwY5xxf1A
	o73/OKhfKPAAuKaZIFqzkhWIdXsKVpM501mpJL8slXc8DGQyJ3wIKP0I8K5VIEdcXs/U
	IV/KfnSuNhloLvrYJX7mMQV2F7E3w+gRKbuAPJEL1oKlD7DzimuBaub9Iw/qiHWdber/
	sUUKVB7412uZSsQunRPVOVtPRzkskumZgh0cKEsNrA3G7v8GfIE35WUVhVIUgkshLu8/
	AYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7EwoUj7sfOl8ofggXUl0pvXjw7wSNfpozK6pjD8XWfs=;
	b=YEbvmk8e7vL14k2Q5aywgKJHxxJFqw4IiZLLkCrHuTWjqJPV+hGIu6SASgXEwhrkzR
	hjqWTasnx9k7aezVqEpiHYRKCTCHxXVBN7SMFPkN/U/EQSGxdRAdb0eHpfLCFyeiEUzW
	N8Nbn6HdPWfR6uEtlsjbbUn2jtusv7TNzdZiqgbrMAJ75HqAijWyy+2gf2YlzDaR4Vxt
	8MJofCrWAN30CI1rlDWJQDiqBAZDKqiA+kY9ejrwCVXPMU5fAxxaHTq39ssIXflwjO+O
	H/qInoCwR6mm3GOpOyv7Gi22b097RMmzeJf9iSL0N+QUeQToPih0r0vkMZVixvp1tmSN
	qPXg==
X-Gm-Message-State: APt69E2tPUcozewTqbcUgJV96f3J5zEf7ePLY4R9zQaGt903jfqQTzva
	WNqH2TyZmysdqU8CLTeYIu6gdYU4EoWf8sr9z/U=
X-Google-Smtp-Source: ADUXVKL9c6pWpe4bxUzX/BtkbmPfORWWFo41Lu9hQILGVc9lpW7jyZSEnQPQNZ28PMsRnj9Qgu+FOrw7AtFcpXCOmsE=
X-Received: by 2002:a1c:988d:: with SMTP id
	a135-v6mr5101784wme.79.1529579461632; 
	Thu, 21 Jun 2018 04:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1526944475.git.denys@ti.com>
	<b3a976f9a497296a3cecd524931f1e8ea048489f.1526944475.git.denys@ti.com>
	<CAAQYJAvkUet1eLhbLaAFd=QH=ReBc82CcKituaanwZpEXcZEiw@mail.gmail.com>
	<CAJTo0LaQjo2iUw1BGo18fmH+Mz0j7pnkq7ooX_Q7zNyYa-chVQ@mail.gmail.com>
	<20180619235320.GN19965@denix.org>
	<CAJTo0LaTOqJ=4qRY+BhktCPj6BgOj2Do1yp9XXtVZcZ4dgBSKQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaTOqJ=4qRY+BhktCPj6BgOj2Do1yp9XXtVZcZ4dgBSKQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Jun 2018 13:10:50 +0200
Message-ID: <CA+chaQdwQVw+8e3Vz6pWNpv8_TY4R3vXUgCME=fWeHXBHcw1-g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] mtd-utils: upgrade 2.0.1 -> 2.0.2
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
X-List-Received-Date: Thu, 21 Jun 2018 11:11:01 -0000
Content-Type: multipart/alternative; boundary="000000000000776af8056f24f8ae"

--000000000000776af8056f24f8ae
Content-Type: text/plain; charset="UTF-8"

Does this upgrade fix the build failure with gcc8?

With current master I'm seeing:
super0.c:238:32: error: 'snprintf' output may be truncated before the last
format character [-Werror=format-truncation=]

On Thu, Jun 21, 2018 at 12:33 PM Burton, Ross <ross.burton@intel.com> wrote:

> Sorry, no it doesn't.  I've just picked this in ross/mut but a
> follow-up patch to remove that mystery patch (can't see it being used
> in image generation anywhere) would be good.
>
> Ross
>
> On 20 June 2018 at 00:53, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Tue, May 22, 2018 at 01:16:34PM +0100, Burton, Ross wrote:
> >> On 22 May 2018 at 08:49, Andrea Adami <andrea.adami@gmail.com> wrote:
> >> > I am just wondering about this patch:we carry it since 2009  [1] and
> >> > is still marked as pending.
> >> > Why was it necessary to ignore part of the filesystem? Can you
> remember?
> >>
> >> Make that at least 2004.  This commit in oe-classic touches it:
> >>
> >> commit c70605ebdca81412a93b4d867de7931543193f26
> >> Author: Chris Larson <clarson@kergoth.com>
> >> Date:   Thu Dec 23 21:24:57 2004 +0000
> >>
> >>     Update mtd to a current snapshot, change the mkfs.jffs2 -i cmdline
> option to
> >>     -I, and rename mtd and mtd-native to mtd-utils and mtd-utils-native,
> >>     respectively.
> >>
> >> Prior history is lost to the git/bk migration unless anyone has a
> >> BitKeeper clone to mine...
> >
> > So, does this prevent the version upgrade from being merged?
> >
> > --
> > Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000776af8056f24f8ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does this upgrade fix the build failure with gcc8?<div><br=
></div><div>With current master I&#39;m seeing:</div><div>super0.c:238:32: =
error: &#39;snprintf&#39; output may be truncated before the last format ch=
aracter [-Werror=3Dformat-truncation=3D]<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr">On Thu, Jun 21, 2018 at 12:33 PM Burton, Ross =
&lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Sorry, no it doesn&#39;t.=C2=
=A0 I&#39;ve just picked this in ross/mut but a<br>
follow-up patch to remove that mystery patch (can&#39;t see it being used<b=
r>
in image generation anywhere) would be good.<br>
<br>
Ross<br>
<br>
On 20 June 2018 at 00:53, Denys Dmytriyenko &lt;<a href=3D"mailto:denis@den=
ix.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<br>
&gt; On Tue, May 22, 2018 at 01:16:34PM +0100, Burton, Ross wrote:<br>
&gt;&gt; On 22 May 2018 at 08:49, Andrea Adami &lt;<a href=3D"mailto:andrea=
.adami@gmail.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt; &gt; I am just wondering about this patch:we carry it since 2009=
=C2=A0 [1] and<br>
&gt;&gt; &gt; is still marked as pending.<br>
&gt;&gt; &gt; Why was it necessary to ignore part of the filesystem? Can yo=
u remember?<br>
&gt;&gt;<br>
&gt;&gt; Make that at least 2004.=C2=A0 This commit in oe-classic touches i=
t:<br>
&gt;&gt;<br>
&gt;&gt; commit c70605ebdca81412a93b4d867de7931543193f26<br>
&gt;&gt; Author: Chris Larson &lt;<a href=3D"mailto:clarson@kergoth.com" ta=
rget=3D"_blank">clarson@kergoth.com</a>&gt;<br>
&gt;&gt; Date:=C2=A0 =C2=A0Thu Dec 23 21:24:57 2004 +0000<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Update mtd to a current snapshot, change the mk=
fs.jffs2 -i cmdline option to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0-I, and rename mtd and mtd-native to mtd-utils =
and mtd-utils-native,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0respectively.<br>
&gt;&gt;<br>
&gt;&gt; Prior history is lost to the git/bk migration unless anyone has a<=
br>
&gt;&gt; BitKeeper clone to mine...<br>
&gt;<br>
&gt; So, does this prevent the version upgrade from being merged?<br>
&gt;<br>
&gt; --<br>
&gt; Denys<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000776af8056f24f8ae--
