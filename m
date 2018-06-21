Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5900374B11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 11:30:11 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id k16-v6so2828510wro.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 04:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=npRjFtm+0ZEpLjLjPCRwI6R81ST+wq9JU+q0YggcXoM=;
	b=tRCm4VNp35WAzHuVXpc+VTumAbCevOFxeNM8H8/Rlj+M0wZ6CW5KUaYG28sjafxZQs
	4LNY3BNni45bAh46Ebu0VS1neVMDxUVl5HaHj9xB3lfioZPhLC2e2k2qSINmCB6Fdnfr
	Gd5bzryiPyv05nvBmVCa/IYV8QULkpgvWCbd6tHTffVDUxtxsL8VQraDNdOj/7kZhXq2
	Klw0QEf5Og6Gt3espj7UvnjcAVjyBa2MN0uV+Jp1gNjxRD7nj2bUlr9tuyDKhxoVE9Qw
	nOoR1CIOiVXsNe4uOQh/fWhk5b/EXTB95kiy+n00HEO/XkKriMgMQogadswIQ5eapD+w
	9Lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=npRjFtm+0ZEpLjLjPCRwI6R81ST+wq9JU+q0YggcXoM=;
	b=DAPYntE7RhkJ0FnnY1/OlhPviqwTDQHX2IvjwUxUPUHywXgw2a70pEgzTgQE0skDQd
	ZeMh+GsmexfChRPUM4OzQ//kxJIjGn1rTTelDDoPyPuaNiKY9glTzs1bUeTL5guRHypu
	YZN7WbIw90d274ZKYjF4u+XELax1RZ/Wi6uoW5p9lw1Xy6/GuENNxuGeOVePOXE3AgoK
	HWg7IVdXayxwmaHkZ3iF95AC9yAWaQUTPM85aa2hgTXmOPdaDS8ofr1Xg+238w9lKaZx
	smEpaEHDmG1265otRemTICjvt3W7UAFnYr5kUodn+mdHqmnwSf0/4swbijGnDGCSU9Ap
	PxyA==
X-Gm-Message-State: APt69E1Ux/1g4jbyLS4+0zH0GgZJXSX0cd+NRr3I/V1DMLWl1ucKi9ux
	89RNAJQBWtORmLOsLzjrCFhkKTEn+yIxbiJ44Jk=
X-Google-Smtp-Source: ADUXVKJXt9Hmc00ajfY3SAR+not8Bf+ZVGRSJI6CpXqmsHaQbtTAZ4F/T4/at1IuO1RxQPFXYE936ojQofHBDOzGJXY=
X-Received: by 2002:adf:8462:: with SMTP id
	89-v6mr22980295wrf.138.1529580611785; 
	Thu, 21 Jun 2018 04:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1526944475.git.denys@ti.com>
	<b3a976f9a497296a3cecd524931f1e8ea048489f.1526944475.git.denys@ti.com>
	<CAAQYJAvkUet1eLhbLaAFd=QH=ReBc82CcKituaanwZpEXcZEiw@mail.gmail.com>
	<CAJTo0LaQjo2iUw1BGo18fmH+Mz0j7pnkq7ooX_Q7zNyYa-chVQ@mail.gmail.com>
	<20180619235320.GN19965@denix.org>
	<CAJTo0LaTOqJ=4qRY+BhktCPj6BgOj2Do1yp9XXtVZcZ4dgBSKQ@mail.gmail.com>
	<CA+chaQdwQVw+8e3Vz6pWNpv8_TY4R3vXUgCME=fWeHXBHcw1-g@mail.gmail.com>
	<CAJTo0LbaVbuZW9XS+pjusuH+wRY0Db3KBcGnN73H5aGNQhe0eA@mail.gmail.com>
In-Reply-To: <CAJTo0LbaVbuZW9XS+pjusuH+wRY0Db3KBcGnN73H5aGNQhe0eA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 21 Jun 2018 13:30:00 +0200
Message-ID: <CA+chaQfbRX-KmWaNzqebOd7G5fp=KyXYBy69yP1QDt=G3E4qmw@mail.gmail.com>
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
X-List-Received-Date: Thu, 21 Jun 2018 11:30:11 -0000
Content-Type: multipart/alternative; boundary="0000000000000557e3056f253d29"

--0000000000000557e3056f253d29
Content-Type: text/plain; charset="UTF-8"

It might be DEBUG_BUILD enabled in my builds, let me check.

On Thu, Jun 21, 2018 at 1:20 PM Burton, Ross <ross.burton@intel.com> wrote:

> Master builds fine for me, but interestingly I don't see that in my
> mtd-utils unpack.  Do you have patches?
>
> Ross
>
> On 21 June 2018 at 12:10, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Does this upgrade fix the build failure with gcc8?
> >
> > With current master I'm seeing:
> > super0.c:238:32: error: 'snprintf' output may be truncated before the
> last
> > format character [-Werror=format-truncation=]
> >
> > On Thu, Jun 21, 2018 at 12:33 PM Burton, Ross <ross.burton@intel.com>
> wrote:
> >>
> >> Sorry, no it doesn't.  I've just picked this in ross/mut but a
> >> follow-up patch to remove that mystery patch (can't see it being used
> >> in image generation anywhere) would be good.
> >>
> >> Ross
> >>
> >> On 20 June 2018 at 00:53, Denys Dmytriyenko <denis@denix.org> wrote:
> >> > On Tue, May 22, 2018 at 01:16:34PM +0100, Burton, Ross wrote:
> >> >> On 22 May 2018 at 08:49, Andrea Adami <andrea.adami@gmail.com>
> wrote:
> >> >> > I am just wondering about this patch:we carry it since 2009  [1]
> and
> >> >> > is still marked as pending.
> >> >> > Why was it necessary to ignore part of the filesystem? Can you
> >> >> > remember?
> >> >>
> >> >> Make that at least 2004.  This commit in oe-classic touches it:
> >> >>
> >> >> commit c70605ebdca81412a93b4d867de7931543193f26
> >> >> Author: Chris Larson <clarson@kergoth.com>
> >> >> Date:   Thu Dec 23 21:24:57 2004 +0000
> >> >>
> >> >>     Update mtd to a current snapshot, change the mkfs.jffs2 -i
> cmdline
> >> >> option to
> >> >>     -I, and rename mtd and mtd-native to mtd-utils and
> >> >> mtd-utils-native,
> >> >>     respectively.
> >> >>
> >> >> Prior history is lost to the git/bk migration unless anyone has a
> >> >> BitKeeper clone to mine...
> >> >
> >> > So, does this prevent the version upgrade from being merged?
> >> >
> >> > --
> >> > Denys
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000557e3056f253d29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It might be DEBUG_BUILD enabled in my builds, let me check=
.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Jun 21, 2018=
 at 1:20 PM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.=
burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Mas=
ter builds fine for me, but interestingly I don&#39;t see that in my<br>
mtd-utils unpack.=C2=A0 Do you have patches?<br>
<br>
Ross<br>
<br>
On 21 June 2018 at 12:10, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@g=
mail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; Does this upgrade fix the build failure with gcc8?<br>
&gt;<br>
&gt; With current master I&#39;m seeing:<br>
&gt; super0.c:238:32: error: &#39;snprintf&#39; output may be truncated bef=
ore the last<br>
&gt; format character [-Werror=3Dformat-truncation=3D]<br>
&gt;<br>
&gt; On Thu, Jun 21, 2018 at 12:33 PM Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:=
<br>
&gt;&gt;<br>
&gt;&gt; Sorry, no it doesn&#39;t.=C2=A0 I&#39;ve just picked this in ross/=
mut but a<br>
&gt;&gt; follow-up patch to remove that mystery patch (can&#39;t see it bei=
ng used<br>
&gt;&gt; in image generation anywhere) would be good.<br>
&gt;&gt;<br>
&gt;&gt; Ross<br>
&gt;&gt;<br>
&gt;&gt; On 20 June 2018 at 00:53, Denys Dmytriyenko &lt;<a href=3D"mailto:=
denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<br>
&gt;&gt; &gt; On Tue, May 22, 2018 at 01:16:34PM +0100, Burton, Ross wrote:=
<br>
&gt;&gt; &gt;&gt; On 22 May 2018 at 08:49, Andrea Adami &lt;<a href=3D"mail=
to:andrea.adami@gmail.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt; &gt;&gt; &gt; I am just wondering about this patch:we carry it sin=
ce 2009=C2=A0 [1] and<br>
&gt;&gt; &gt;&gt; &gt; is still marked as pending.<br>
&gt;&gt; &gt;&gt; &gt; Why was it necessary to ignore part of the filesyste=
m? Can you<br>
&gt;&gt; &gt;&gt; &gt; remember?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Make that at least 2004.=C2=A0 This commit in oe-classic =
touches it:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; commit c70605ebdca81412a93b4d867de7931543193f26<br>
&gt;&gt; &gt;&gt; Author: Chris Larson &lt;<a href=3D"mailto:clarson@kergot=
h.com" target=3D"_blank">clarson@kergoth.com</a>&gt;<br>
&gt;&gt; &gt;&gt; Date:=C2=A0 =C2=A0Thu Dec 23 21:24:57 2004 +0000<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0Update mtd to a current snapshot, chan=
ge the mkfs.jffs2 -i cmdline<br>
&gt;&gt; &gt;&gt; option to<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0-I, and rename mtd and mtd-native to m=
td-utils and<br>
&gt;&gt; &gt;&gt; mtd-utils-native,<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0respectively.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Prior history is lost to the git/bk migration unless anyo=
ne has a<br>
&gt;&gt; &gt;&gt; BitKeeper clone to mine...<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; So, does this prevent the version upgrade from being merged?<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Denys<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000000557e3056f253d29--
