Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.3521.1591229489081931145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 17:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PM/ZeJ2p;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id e1so4198213wrt.5
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 17:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GiXZ+mQV7Y/+XYmvL9XuTJ2na7i0mbwHJQYEtjj478A=;
        b=PM/ZeJ2pAqYcZ71e8u1Tx6/j3MfYOlIFv+ClNPYoGvQppfPI8pJN5O/EL9F31624wR
         yKFopnUT+w8thH2CgD6pKMlv+6rCdUpDqARENd0PMDSPoyL4wDhK49gzNE8CxCHdAXxW
         sO6+Oi+AN4lOqmk2Y5V7oX/30hfPw+m/VSQdHe8nvvaT7+wVo4U6TmR0EYmS03EUhWl9
         7faLSvVIZjCp1BMblP0XCytyOIO3lQ4wOOJXTqwAZP0egVHDvGha4RAbEi7B+RMhPgDm
         zl0Wl78xZV/5qe3gXoDxUxwsZO9Adg5bl8Ct0w29N/cVsvoM35iiKdvRzS9J9VS1Garo
         Xtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GiXZ+mQV7Y/+XYmvL9XuTJ2na7i0mbwHJQYEtjj478A=;
        b=tvRkXPNbnP0P1Gr/L8Sho8BSzuaOnP6oupUCILUz5q8RM9vL0fuHHNOrEeHeWM0dBI
         TqJyqYpYJ41jLfpLycDTCEdNad/c0yNiYWEwaMgvCK/UHLCeSBKd8P+NAS2fzwiXa3Xr
         t/qQYcN84TMFR/AURwdsjITHuTc+H3mQ/xpEISCyw/X1C5dvvooP1JFvkRD65eWn9W6u
         J4RW46xyteBQ7e29s59R+IXRFNRPnR55zWTYi7pUbSGtofrwnfn3RY7ahLjIwvMYJZYJ
         l9AMVF1Zv1wTSxkIhwgKWdhaTgl/7uL2cKA59qIxrF0n+AfdWuqfzlAzfa3KIqlNSrtw
         2wOQ==
X-Gm-Message-State: AOAM532SaP5iQfE32y5eHFciLMABtCwMKxLTK3ecXWBtOM/nEEGNJRo+
	gx3Tr1PJRETRABEJtgwq66KxlnRvzFrRAszSZnI=
X-Google-Smtp-Source: ABdhPJzD2lAv3MzQ87hQuMsSSfbe3f0dkfgJ1vyJ0xb25r1hkE+5Dnlrv7y3IPYBT/KEO9nhXqPCP4uGefn21xAja1s=
X-Received: by 2002:adf:f245:: with SMTP id b5mr1653938wrp.303.1591229487416;
 Wed, 03 Jun 2020 17:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591197295.git.steve@sakoman.com> <fa08dc08-22f5-f82f-58dc-02b976acdf2b@gmail.com>
 <20200603173620.GY17660@denix.org> <a4714244-b570-1f18-185c-22d3a4a9c80f@gmail.com>
 <CA+chaQcnHdYcjUGGDJ0aPrjKAghJpjpHy=FrbPGMC0ms4YGS2g@mail.gmail.com>
In-Reply-To: <CA+chaQcnHdYcjUGGDJ0aPrjKAghJpjpHy=FrbPGMC0ms4YGS2g@mail.gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Wed, 3 Jun 2020 19:11:16 -0500
Message-ID: <CAJdd5GZ7NyPgCX25OB4Aa11zfkDOByUrmToRpcHbbKGi+s1vpw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 0/5] Patch review
To: Martin Jansa <martin.jansa@gmail.com>
Cc: akuster <akuster808@gmail.com>, Denys Dmytriyenko <denis@denix.org>, 
	Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005a884905a736fc10"

--0000000000005a884905a736fc10
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 3, 2020, 6:33 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> I think we still need corresponding LAYERDEPENDS_meta-python update which
> isn't in master yet (and I haven't noticed it on the list).
>
> Joshua: did I overlook it somewhere or should I send it?
>

I didn't send it because the layer version bump wasn't added to oe-core
until yesterday. If you can send the patch that would be great.

Thanks


> On Wed, Jun 3, 2020 at 7:45 PM akuster <akuster808@gmail.com> wrote:
>
>>
>>
>> On 6/3/20 10:36 AM, Denys Dmytriyenko wrote:
>> > On Wed, Jun 03, 2020 at 10:33:55AM -0700, akuster wrote:
>> >> Does someone have the complementary set of patches for meta-openbedded
>> >> to remove these?
>> >
>> https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
>> >
>> https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
>> >
>> > Do you want me to re-submit them with [dunfell] tag?
>> nah, the commits work of me. Thanks
>>
>> - armin
>> >
>> >
>> >> - armin
>> >>
>> >> On 6/3/20 8:33 AM, Steve Sakoman wrote:
>> >>> Pending final approval for an exception to LTS policy in this case
>> please
>> >>> review this patch series and have comments back by end of day
>> Thursday.
>> >>>
>> >>> For details on the motivation for this change see:
>> >>>
>> >>>
>> https://lists.openembedded.org/g/openembedded-architecture/message/1085
>> >>>
>> >>> The following changes since commit
>> ef5af31f406076107402694f5d6afb27b240eba6:
>> >>>
>> >>>   linux-yocto/5.4: update to v5.4.43 (2020-06-01 07:19:09 -1000)
>> >>>
>> >>> are available in the Git repository at:
>> >>>
>> >>>   git://git.openembedded.org/openembedded-core-contrib
>> stable/dunfell-nut
>> >>>
>> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
>> >>>
>> >>> Joshua Watt (5):
>> >>>   pycryptodome: Import from meta-python
>> >>>   pyelftools: Import from meta-python
>> >>>   python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
>> >>>   python3-pyelftools: Upgrade 0.25 -> 0.26
>> >>>   layer.conf: Bump OE-Core layer version
>> >>>
>> >>>  meta/conf/distro/include/maintainers.inc      |  5 +++-
>> >>>  meta/conf/layer.conf                          |  2 +-
>> >>>  .../python/python-pycryptodome.inc            | 26
>> +++++++++++++++++++
>> >>>  .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
>> >>>  .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
>> >>>  .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
>> >>>  6 files changed, 59 insertions(+), 2 deletions(-)
>> >>>  create mode 100644
>> meta/recipes-devtools/python/python-pycryptodome.inc
>> >>>  create mode 100644 meta/recipes-devtools/python/
>> python3-pycryptodome_3.9.7.bb
>> >>>  create mode 100644 meta/recipes-devtools/python/
>> python3-pycryptodomex_3.9.7.bb
>> >>>  create mode 100644 meta/recipes-devtools/python/
>> python3-pyelftools_0.26.bb
>> >>>
>> >>>
>> >>>
>> >>
>>
>> 
>>
>

--0000000000005a884905a736fc10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jun 3, 2020, 6:33 PM Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I think we still ne=
ed corresponding LAYERDEPENDS_meta-python update which isn&#39;t in master =
yet (and I haven&#39;t noticed it on the list).<div><br></div><div>Joshua: =
did I overlook it somewhere or should I send it?</div></div></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I didn&#39;t send i=
t because the layer version bump wasn&#39;t added to oe-core until yesterda=
y. If you can send the patch that would be great.=C2=A0</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Thanks</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, =
Jun 3, 2020 at 7:45 PM akuster &lt;<a href=3D"mailto:akuster808@gmail.com" =
target=3D"_blank" rel=3D"noreferrer">akuster808@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
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

--0000000000005a884905a736fc10--
