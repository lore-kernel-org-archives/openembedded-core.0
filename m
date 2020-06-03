Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.3001.1591227225638079913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 16:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VDp2cvZ+;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id w7so3185100edt.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 16:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=965Dd6d55w6dkA/90Y6spSmpy+gxAHpU2YcWZwRup20=;
        b=VDp2cvZ+hANpeFAD6IfpRuVzJPGQwMUOv5QcKlcIIUSRsc15OVQwG5bOgBShkUfQU6
         /Zs18yLmSOHkqIr/iv/uF9/0l7aC9wGnF1qU/ePhr6km+YZE8Q2AWgRWWtEltwNQpUYW
         6fJuwY8sLnken57NSfHsfArT27JWhrZ79+DqHqjh5RxIWI1KanS/ZXN8sWJ0ZaGnZ9KK
         fqDDtl/3g5DiJyOZ36mxdUj4nuxs08xfKBqiAg2cWO1mydF2QIHVLGe7tBP7sj+kVCH8
         46xPHW7csioBlspCclpGOlNJDf5E1T4WAv71RNmGyZHnf35Uv98oT7eNYQmCizrQzC7o
         c6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=965Dd6d55w6dkA/90Y6spSmpy+gxAHpU2YcWZwRup20=;
        b=HSsPpzd+Kt4auRZmErP3Oabs4rdbetWg5nxIlKsUREym9s/i8uXObPy53NEcO/dbHn
         oOkNEo4aNwcW2UhjFW0tfUphnz2BbpNsNOdmqoHkayXNnegI7QEcb4I+UZCJt/oGzEqA
         v8F0lC9O5pyhMNzcDpndVXdLu2bgAEVxJefyQZ4uT0Gj9RH6kUuYOPmE5ndfqxWO4mNQ
         pkngowSSbjGqzyfs3px1LYNSHu7HQZk3v7T6WaEFOC5p91Rko3+sCjLKelcvryky1Sn8
         qMUjFyPDHk+UxqEVjGx/BuA+QCYh697XNe4TAfXjtdFgXng9FwGzByGJ981c8iJARxmO
         0lrA==
X-Gm-Message-State: AOAM5330GC9FL3K9U3cHNmifU9r9m8cyDmla6oWl3tW184ozebYz4WLc
	UUGh1aNY5lVItS3EyRhzcRlg4BvV1oRwFWNLv1I=
X-Google-Smtp-Source: ABdhPJwjakqprekgJIB1TDTQ+u8exwi71h8JiYozuShfFO8Egc1Jqa3wvP8ioW93uuDcwDlUmofdu9TvhWpv3G6ly+Y=
X-Received: by 2002:a05:6402:362:: with SMTP id s2mr1762328edw.337.1591227224240;
 Wed, 03 Jun 2020 16:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591197295.git.steve@sakoman.com> <fa08dc08-22f5-f82f-58dc-02b976acdf2b@gmail.com>
 <20200603173620.GY17660@denix.org> <a4714244-b570-1f18-185c-22d3a4a9c80f@gmail.com>
In-Reply-To: <a4714244-b570-1f18-185c-22d3a4a9c80f@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2020 01:33:33 +0200
Message-ID: <CA+chaQcnHdYcjUGGDJ0aPrjKAghJpjpHy=FrbPGMC0ms4YGS2g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 0/5] Patch review
To: akuster <akuster808@gmail.com>, Joshua Watt <jpewhacker@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000075365105a7367574"

--00000000000075365105a7367574
Content-Type: text/plain; charset="UTF-8"

I think we still need corresponding LAYERDEPENDS_meta-python update which
isn't in master yet (and I haven't noticed it on the list).

Joshua: did I overlook it somewhere or should I send it?

On Wed, Jun 3, 2020 at 7:45 PM akuster <akuster808@gmail.com> wrote:

>
>
> On 6/3/20 10:36 AM, Denys Dmytriyenko wrote:
> > On Wed, Jun 03, 2020 at 10:33:55AM -0700, akuster wrote:
> >> Does someone have the complementary set of patches for meta-openbedded
> >> to remove these?
> >
> https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
> >
> https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
> >
> > Do you want me to re-submit them with [dunfell] tag?
> nah, the commits work of me. Thanks
>
> - armin
> >
> >
> >> - armin
> >>
> >> On 6/3/20 8:33 AM, Steve Sakoman wrote:
> >>> Pending final approval for an exception to LTS policy in this case
> please
> >>> review this patch series and have comments back by end of day Thursday.
> >>>
> >>> For details on the motivation for this change see:
> >>>
> >>>
> https://lists.openembedded.org/g/openembedded-architecture/message/1085
> >>>
> >>> The following changes since commit
> ef5af31f406076107402694f5d6afb27b240eba6:
> >>>
> >>>   linux-yocto/5.4: update to v5.4.43 (2020-06-01 07:19:09 -1000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   git://git.openembedded.org/openembedded-core-contrib
> stable/dunfell-nut
> >>>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
> >>>
> >>> Joshua Watt (5):
> >>>   pycryptodome: Import from meta-python
> >>>   pyelftools: Import from meta-python
> >>>   python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
> >>>   python3-pyelftools: Upgrade 0.25 -> 0.26
> >>>   layer.conf: Bump OE-Core layer version
> >>>
> >>>  meta/conf/distro/include/maintainers.inc      |  5 +++-
> >>>  meta/conf/layer.conf                          |  2 +-
> >>>  .../python/python-pycryptodome.inc            | 26 +++++++++++++++++++
> >>>  .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
> >>>  .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
> >>>  .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
> >>>  6 files changed, 59 insertions(+), 2 deletions(-)
> >>>  create mode 100644
> meta/recipes-devtools/python/python-pycryptodome.inc
> >>>  create mode 100644 meta/recipes-devtools/python/
> python3-pycryptodome_3.9.7.bb
> >>>  create mode 100644 meta/recipes-devtools/python/
> python3-pycryptodomex_3.9.7.bb
> >>>  create mode 100644 meta/recipes-devtools/python/
> python3-pyelftools_0.26.bb
> >>>
> >>>
> >>>
> >>
>
> 
>

--00000000000075365105a7367574
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think we still need corresponding LAYERDEPENDS_meta-pyth=
on update which isn&#39;t in master yet (and I haven&#39;t noticed it on th=
e list).<div><br></div><div>Joshua: did I overlook it somewhere or should I=
 send it?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jun 3, 2020 at 7:45 PM akuster &lt;<a href=3D"mail=
to:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 6/3/20 10:36 AM, Denys Dmytriyenko wrote:<br>
&gt; On Wed, Jun 03, 2020 at 10:33:55AM -0700, akuster wrote:<br>
&gt;&gt; Does someone have the complementary set of patches for meta-openb=
edded<br>
&gt;&gt; to remove these?<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3Da8f3c00d8d113b46a49584682e10435157d516ca" rel=3D"noreferrer" target=3D"=
_blank">https://git.openembedded.org/meta-openembedded/commit/?id=3Da8f3c00=
d8d113b46a49584682e10435157d516ca</a><br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3D7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3" rel=3D"noreferrer" target=3D"=
_blank">https://git.openembedded.org/meta-openembedded/commit/?id=3D7aee545=
a61c4f91d5e462d5b46b1b8f9a8bad1e3</a><br>
&gt;<br>
&gt; Do you want me to re-submit them with [dunfell] tag?<br>
nah, the commits work of me. Thanks<br>
<br>
- armin<br>
&gt;<br>
&gt;<br>
&gt;&gt; - armin<br>
&gt;&gt;<br>
&gt;&gt; On 6/3/20 8:33 AM, Steve Sakoman wrote:<br>
&gt;&gt;&gt; Pending final approval for an exception to LTS policy in this=
 case please<br>
&gt;&gt;&gt; review this patch series and have comments back by end of day=
 Thursday.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; For details on the motivation for this change see:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-arch=
itecture/message/1085" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-architecture/message/1085</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The following changes since commit ef5af31f406076107402694f5d=
6afb27b240eba6:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0linux-yocto/5.4: update to v5.4.43 (2020-06-01 07=
:19:09 -1000)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; are available in the Git repository at:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.openembedded.org/open=
embedded-core-contrib" rel=3D"noreferrer" target=3D"_blank">git.openembedde=
d.org/openembedded-core-contrib</a> stable/dunfell-nut<br>
&gt;&gt;&gt;=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/openembed=
ded-core-contrib/log/?h=3Dstable/dunfell-nut" rel=3D"noreferrer" target=3D"=
_blank">http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dsta=
ble/dunfell-nut</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Joshua Watt (5):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0pycryptodome: Import from meta-python<br>
&gt;&gt;&gt;=C2=A0 =C2=A0pyelftools: Import from meta-python<br>
&gt;&gt;&gt;=C2=A0 =C2=A0python3-pycryptodome(x): Upgrade 3.9.4 -&gt; 3.9.=
7<br>
&gt;&gt;&gt;=C2=A0 =C2=A0python3-pyelftools: Upgrade 0.25 -&gt; 0.26<br>
&gt;&gt;&gt;=C2=A0 =C2=A0layer.conf: Bump OE-Core layer version<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 5 +++-<br>
&gt;&gt;&gt;=C2=A0 meta/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt;&gt;=C2=A0 .../python/python-pycryptodome.inc=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 | 26 +++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pycryptodome_3.9.7=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycryptodome_3.9.7.bb</a>=
=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++<br>
&gt;&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pycryptodomex_3.9.=
7.bb" rel=3D"noreferrer" target=3D"_blank">python3-pycryptodomex_3.9.7.bb</=
a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++<br>
&gt;&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pyelftools_0.26.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-pyelftools_0.26.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++<br>
&gt;&gt;&gt;=C2=A0 6 files changed, 59 insertions(+), 2 deletions(-)<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python-=
pycryptodome.inc<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=
=
=3D"http://python3-pycryptodome_3.9.7.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-pycryptodome_3.9.7.bb</a><br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=
=
=3D"http://python3-pycryptodomex_3.9.7.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-pycryptodomex_3.9.7.bb</a><br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=
=
=3D"http://python3-pyelftools_0.26.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-pyelftools_0.26.bb</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt; <br>
<br>
<br>
</blockquote></div>

--00000000000075365105a7367574--
