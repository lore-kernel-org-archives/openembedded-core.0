Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.3956.1591231148707708048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 17:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zdf8Ur/3;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id x1so4123433ejd.8
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 17:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KsBP9CdYOBz1/mno+MzlunPYyPcYBq/506pSLeTUkb8=;
        b=Zdf8Ur/3LrbLOwmq/PGzNes8zEQMTVnmVH9QrKqYrAgHokkdetXkXtcSUyMRLlMM5u
         x+tLQCcrG0PYNz9Wf838gon6s9iagNNM/2VXJt3zvFhSlEYJ0y8dWKQSXTJilH9PdPQK
         +1ygaVZs4bQsNiTAuzTwKjzrqbb5yHBPPfAa6+dGSJ+3bbq9v+jttm4Lw9O9E1Pn4/3C
         PoaTuzO9z2GJ/7jCoax2p4ebrsWdfckuRFE8I8glInEj3OFZsty5fp9OZwnJJAyBx9Sx
         ARNU5vxb3x01a4tUhcm7X1OTe+0owADHQ1m8hjpEANNfLCsrfOejekmAhY0wWPCHNAK9
         D0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KsBP9CdYOBz1/mno+MzlunPYyPcYBq/506pSLeTUkb8=;
        b=TNIE10G01/8ffOHQcysLKPMsJ1yG2a9UDLNtqpchSqR+vKfvcEJRDycp93QjeRr0IM
         pLrjLmcNP+GLxuUL4NLZsyGbwX1Cit7zk+cpReFKnpF95G5islCATD5IyiMPTFRl0niN
         U7VXTn0AvFcCFrOA978/Cwi58JzOzymdpttoufuhsPfhjzrtU6bO+j0+YzmmjhdXiUKg
         t3rRYZh8bUkww/FqpqCpp/Cd3yuZ1mvGjsgGfniEv13o+UiTsAwBj3gkpqX8o1TYXooV
         xhdn3FERh1mAABGO9u47BtksBSTfBtiTNdX1Oee3yfD+pXDCsg3RPDuA2Hz74XBCx1n4
         xzCA==
X-Gm-Message-State: AOAM532Pw32y4uR15nzxWeDYawHlZfEyc2Eo0L/5cesJPQ5eNd92gKHu
	i3MoastZJsEKSslpCH64Sg61uu3TTA11/U9eJHs=
X-Google-Smtp-Source: ABdhPJw/KUUBl7mh5+xvTwbEnM823uRFb7tEBsjZttVBNSds2405wtFG2VKWYeT3aJWl9TBr2OV0J/5GQhUQJbtpTfQ=
X-Received: by 2002:a17:906:c812:: with SMTP id cx18mr1716462ejb.94.1591231147026;
 Wed, 03 Jun 2020 17:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591197295.git.steve@sakoman.com> <fa08dc08-22f5-f82f-58dc-02b976acdf2b@gmail.com>
 <20200603173620.GY17660@denix.org> <a4714244-b570-1f18-185c-22d3a4a9c80f@gmail.com>
 <CA+chaQcnHdYcjUGGDJ0aPrjKAghJpjpHy=FrbPGMC0ms4YGS2g@mail.gmail.com> <CAJdd5GZ7NyPgCX25OB4Aa11zfkDOByUrmToRpcHbbKGi+s1vpw@mail.gmail.com>
In-Reply-To: <CAJdd5GZ7NyPgCX25OB4Aa11zfkDOByUrmToRpcHbbKGi+s1vpw@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2020 02:38:55 +0200
Message-ID: <CA+chaQf13pdeXSZNVuZv5aGWR0QEfa+VD3VE9SLnshnG-n=E-A@mail.gmail.com>
Subject: Re: [OE-core][dunfell 0/5] Patch review
To: Joshua Watt <jpewhacker@gmail.com>
Cc: akuster <akuster808@gmail.com>, Denys Dmytriyenko <denis@denix.org>, 
	Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000462e0605a7375ffc"

--000000000000462e0605a7375ffc
Content-Type: text/plain; charset="UTF-8"

I've sent the patch for meta-python now, but I see that I've sent it only
for version 11 (not 12 from "layer.conf: Bump OE-Core layer version" which
is being backported here and was merged to master just few hours ago in
https://git.openembedded.org/openembedded-core/commit/?id=2d503b27e7c88cee9a37c79c4605c77b11f230b6).
Sending v2 now.

On Thu, Jun 4, 2020 at 2:11 AM Joshua Watt <jpewhacker@gmail.com> wrote:

>
>
> On Wed, Jun 3, 2020, 6:33 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> I think we still need corresponding LAYERDEPENDS_meta-python update which
>> isn't in master yet (and I haven't noticed it on the list).
>>
>> Joshua: did I overlook it somewhere or should I send it?
>>
>
> I didn't send it because the layer version bump wasn't added to oe-core
> until yesterday. If you can send the patch that would be great.
>
> Thanks
>
>
>> On Wed, Jun 3, 2020 at 7:45 PM akuster <akuster808@gmail.com> wrote:
>>
>>>
>>>
>>> On 6/3/20 10:36 AM, Denys Dmytriyenko wrote:
>>> > On Wed, Jun 03, 2020 at 10:33:55AM -0700, akuster wrote:
>>> >> Does someone have the complementary set of patches for meta-openbedded
>>> >> to remove these?
>>> >
>>> https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
>>> >
>>> https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
>>> >
>>> > Do you want me to re-submit them with [dunfell] tag?
>>> nah, the commits work of me. Thanks
>>>
>>> - armin
>>> >
>>> >
>>> >> - armin
>>> >>
>>> >> On 6/3/20 8:33 AM, Steve Sakoman wrote:
>>> >>> Pending final approval for an exception to LTS policy in this case
>>> please
>>> >>> review this patch series and have comments back by end of day
>>> Thursday.
>>> >>>
>>> >>> For details on the motivation for this change see:
>>> >>>
>>> >>>
>>> https://lists.openembedded.org/g/openembedded-architecture/message/1085
>>> >>>
>>> >>> The following changes since commit
>>> ef5af31f406076107402694f5d6afb27b240eba6:
>>> >>>
>>> >>>   linux-yocto/5.4: update to v5.4.43 (2020-06-01 07:19:09 -1000)
>>> >>>
>>> >>> are available in the Git repository at:
>>> >>>
>>> >>>   git://git.openembedded.org/openembedded-core-contrib
>>> stable/dunfell-nut
>>> >>>
>>> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
>>> >>>
>>> >>> Joshua Watt (5):
>>> >>>   pycryptodome: Import from meta-python
>>> >>>   pyelftools: Import from meta-python
>>> >>>   python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
>>> >>>   python3-pyelftools: Upgrade 0.25 -> 0.26
>>> >>>   layer.conf: Bump OE-Core layer version
>>> >>>
>>> >>>  meta/conf/distro/include/maintainers.inc      |  5 +++-
>>> >>>  meta/conf/layer.conf                          |  2 +-
>>> >>>  .../python/python-pycryptodome.inc            | 26
>>> +++++++++++++++++++
>>> >>>  .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
>>> >>>  .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
>>> >>>  .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
>>> >>>  6 files changed, 59 insertions(+), 2 deletions(-)
>>> >>>  create mode 100644
>>> meta/recipes-devtools/python/python-pycryptodome.inc
>>> >>>  create mode 100644 meta/recipes-devtools/python/
>>> python3-pycryptodome_3.9.7.bb
>>> >>>  create mode 100644 meta/recipes-devtools/python/
>>> python3-pycryptodomex_3.9.7.bb
>>> >>>  create mode 100644 meta/recipes-devtools/python/
>>> python3-pyelftools_0.26.bb
>>> >>>
>>> >>>
>>> >>>
>>> >>
>>>
>>> 
>>>
>>

--000000000000462e0605a7375ffc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve sent the patch for meta-python now, but I se=
e that I&#39;ve sent it only for version 11 (not 12 from &quot;layer.conf: =
Bump OE-Core layer version&quot; which is being backported here and was mer=
ged to master just few hours ago in=C2=A0<a href=3D"https://git.openembedde=
d.org/openembedded-core/commit/?id=3D2d503b27e7c88cee9a37c79c4605c77b11f230=
b6">https://git.openembedded.org/openembedded-core/commit/?id=3D2d503b27e7c=
88cee9a37c79c4605c77b11f230b6</a>). Sending v2 now.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 4, 202=
0 at 2:11 AM Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com">jpewha=
cker@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3, 2020, 6:33 PM Martin Jans=
a &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr">I think we still need corresponding LAYERDEPE=
NDS_meta-python update which isn&#39;t in master yet (and I haven&#39;t not=
iced it on the list).<div><br></div><div>Joshua: did I overlook it somewher=
e or should I send it?</div></div></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">I didn&#39;t send it because the layer versio=
n bump wasn&#39;t added to oe-core until yesterday. If you can send the pat=
ch that would be great.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Thanks</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3=
, 2020 at 7:45 PM akuster &lt;<a href=3D"mailto:akuster808@gmail.com" rel=
=3D"noreferrer" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 6/3/20 10:36 AM, Denys Dmytriyenko wrote:<br>
&gt; On Wed, Jun 03, 2020 at 10:33:55AM -0700, akuster wrote:<br>
&gt;&gt; Does someone have the complementary set of patches for meta-openb=
edded<br>
&gt;&gt; to remove these?<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3Da8f3c00d8d113b46a49584682e10435157d516ca" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://git.openembedded.org/meta-openembedded/commit/?i=
d=3Da8f3c00d8d113b46a49584682e10435157d516ca</a><br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3D7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">https://git.openembedded.org/meta-openembedded/commit/?i=
d=3D7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3</a><br>
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
itecture/message/1085" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://lists.openembedded.org/g/openembedded-architecture/message/1085</a><br>
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
embedded-core-contrib" rel=3D"noreferrer noreferrer" target=3D"_blank">git.=
openembedded.org/openembedded-core-contrib</a> stable/dunfell-nut<br>
&gt;&gt;&gt;=C2=A0 =C2=A0<a href=3D"http://cgit.openembedded.org/openembed=
ded-core-contrib/log/?h=3Dstable/dunfell-nut" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">http://cgit.openembedded.org/openembedded-core-contrib/l=
og/?h=3Dstable/dunfell-nut</a><br>
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
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pycryptodome_3=
.9.7.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++<br>
&gt;&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pycryptodomex_3.9.=
7.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pycryptodomex=
_3.9.7.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++++<br>
&gt;&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-pyelftools_0.26.bb=
" rel=3D"noreferrer noreferrer" target=3D"_blank">python3-pyelftools_0.26.b=
b</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++++<br>
&gt;&gt;&gt;=C2=A0 6 files changed, 59 insertions(+), 2 deletions(-)<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python-=
pycryptodome.inc<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=
=
=3D"http://python3-pycryptodome_3.9.7.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">python3-pycryptodome_3.9.7.bb</a><br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=
=
=3D"http://python3-pycryptodomex_3.9.7.bb" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">python3-pycryptodomex_3.9.7.bb</a><br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=
=
=3D"http://python3-pyelftools_0.26.bb" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">python3-pyelftools_0.26.bb</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt; <br>
<br>
<br>
</blockquote></div>
</blockquote></div></div></div>
</blockquote></div>

--000000000000462e0605a7375ffc--
