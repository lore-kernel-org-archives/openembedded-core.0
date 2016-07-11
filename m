Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDD960797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 11:47:15 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id r2so143463047oih.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 04:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l7aUOPbmW86e6rgemhW8jZraJ7Cx6LOXxAzSU1wqLUk=;
	b=FgWADGedxLQmxgV8yBzDQNdMJLBdDsKqUTJNCi4dgAt1ll8T6FJoOmPtDp5AT+Dh2F
	gTH1UzIdlZ6HNB5er9EwQiNbspxMJhECStCOBN45qgdcVdzQXEzxaRmRyQt/TiA6lH05
	4JxfXXisCnD0N+HTy9VFYMkFK0aRIhuM7nA1lf4fixtabFjg7enQjoUJVuBxwOk2lZSb
	OK6pCtEZQe7AS6HO6veGEILTXz8la3nDD6nQtjuLVVm5V/wcGp5+uYgCqwG9VQTnSKln
	D7IY07x8nqq4DcgrRZDVBzu8wiZ/mxgmehXEJXWrVftwI+rPbzDdso0shmJ6u1Vrfu1H
	X76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l7aUOPbmW86e6rgemhW8jZraJ7Cx6LOXxAzSU1wqLUk=;
	b=F2Xucf8UvQQqjOvw3nDahFM+4ib+jOdqiX1bVWmcO790QufZsKKNr2K8QrJnkysYKf
	HRFroiKdcBFqiKgFTrM6MzoBesZQvF4GIl5iK3AlUIbH2k99fG5PyMyFPnQSWTJZB/L9
	sxogFi4F0nlBIzYirIGSRU8SG3jEXJfU4om+aoEHuewY5UygdgSalJ3JTN9XbbNyms7+
	fziZ3W3AxrWIkA3F9wnzc4u+hfIYRKzLls57WWI7M3VdGIQaRSWdB5RSeDqM0N2PHxLz
	MmxAQLAniiyj7h4TV8jYbapCkF0dq6EhUrj3ut8ELvb0ZwZtRFJzHdLyNYiDxZ5HUAw6
	2gVw==
X-Gm-Message-State: ALyK8tIn/T6ZzlODhtohDNUHo0kzaZv9DOXfU5XzXtUp97J3ILWQ/RMbnv6jQVDVoxbRa+GhmmS/LsqU70zfMZuo
X-Received: by 10.157.33.244 with SMTP id s107mr10436478otb.120.1468237636296; 
	Mon, 11 Jul 2016 04:47:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.199.134 with HTTP; Mon, 11 Jul 2016 04:46:46 -0700 (PDT)
In-Reply-To: <CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com>
References: <cover.1467905611.git.jussi.kukkonen@intel.com>
	<b0ba31b71ad1e9d540ab007713fe034a3bc1f7d1.1467905611.git.jussi.kukkonen@intel.com>
	<CAJTo0LZ67c7MXQrsBYzK6c+dQ3DGq0Xp5To+pz64qo=Cu8qeKQ@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 11 Jul 2016 14:46:46 +0300
Message-ID: <CAHiDW_G_NZWhoq-Grt=jjpc4H+pkkuOdbGL7kf5Omho1dLhNFA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] python-six: Add to oe-core
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
X-List-Received-Date: Mon, 11 Jul 2016 11:47:16 -0000
Content-Type: multipart/alternative; boundary=001a114933ecc1f6af05375ab6b1

--001a114933ecc1f6af05375ab6b1
Content-Type: text/plain; charset=UTF-8

On 8 July 2016 at 23:17, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 7 July 2016 at 16:39, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>
>> +do_compile_append() {
>> +    ${PYTHON} setup.py -q bdist_egg --dist-dir ./
>> +}
>> +do_install_append() {
>> +    install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
>> +}
>>
>
> Is this actually required?  The setuptools class should be doing all the
> magic, and this appears to be building and installing an egg, which we
> generally try not to do.
>

If eggs are not wanted (and that seems to make sense) then these functions
should be removed  ... but I don't understand the commit that introduced
this (6b4cee975 in meta-oe):

    python-six: Error fix for recipes depend on python-six

    If you bitbake recipes which depends on python-six such as
    python-cryptography. And also your network is not very well.
    Error will occur as following:
       Download error on https://pypi.python.org/simple/six/:
       [Errno -5] No address associated with hostname -- Some packages may
not be found!
        Couldn't find index page for 'six' (maybe misspelled?)
        No local packages or download links found for six
    So add do_compile_append() to fix it.

Not sure where a URL like that comes from or why it would be accessed
during build? Li Xin, any comment?

I'll send a revised patch without the appends.
  - Jussi

--001a114933ecc1f6af05375ab6b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 8=
 July 2016 at 23:17, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><s=
pan><br><div class=3D"gmail_quote">On 7 July 2016 at 16:39, Jussi Kukkonen =
<span dir=3D"ltr">&lt;<a href=3D"mailto:jussi.kukkonen@intel.com" target=3D=
"_blank">jussi.kukkonen@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"=
><div>+do_compile_append() {<br>
+=C2=A0 =C2=A0 ${PYTHON} setup.py -q bdist_egg --dist-dir ./<br>
+}<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/<=
br>
+}</div></blockquote></div><br></span>Is this actually required?=C2=A0 The =
setuptools class should be doing all the magic, and this appears to be buil=
ding and installing an egg, which we generally try not to do.</div></div></=
blockquote><div><br></div><div>If eggs are not wanted (and that seems to ma=
ke sense) then these functions should be removed =C2=A0... but I don&#39;t =
understand the commit that introduced this (6b4cee975 in meta-oe):</div><di=
v><div><br></div><div>=C2=A0 =C2=A0 python-six: Error fix for recipes depen=
d on python-six<br></div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 I=
f you bitbake recipes which depends on python-six such as</div><div>=C2=A0 =
=C2=A0 python-cryptography. And also your network is not very well.</div><d=
iv>=C2=A0 =C2=A0 Error will occur as following:</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0Download error on <a href=3D"https://pypi.python.org/simple/six/"=
 target=3D"_blank">https://pypi.python.org/simple/six/</a>:</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0[Errno -5] No address associated with hostname -- S=
ome packages may not be found!</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Couldn=
&#39;t find index page for &#39;six&#39; (maybe misspelled?)</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 No local packages or download links found for six<=
/div><div>=C2=A0 =C2=A0 So add do_compile_append() to fix it.</div></div><d=
iv><br></div><div>Not sure where a URL like that comes from or why it would=
 be accessed during build? Li Xin, any comment?=C2=A0</div><div><br></div><=
div>I&#39;ll send a revised patch without the appends.</div><div>=C2=A0 - J=
ussi<br></div></div></div></div>

--001a114933ecc1f6af05375ab6b1--
