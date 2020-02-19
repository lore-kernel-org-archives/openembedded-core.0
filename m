Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
	[209.85.217.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2E40860C3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:50:01 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id a2so15121572vso.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IP9n6X4H1cyCIAT22v2vHUwWeBUjdkRHpOUhOvUKFic=;
	b=mduxtny1KaD+YbFGQfi8Q1AIB2Ezcd22Ax1LfFGZE859oR0WwHCCBIN3FfxAmSU/lr
	pt2oJi0O0YF4AgMaGc4sPYLAmDLGlo/B7meICu2fmxNYVAOJghESi9hnsV+bPPZNJ6U8
	wzsEANk9Z/ttkckNkUNEoTrLrr3WFzCM4X6AtayZhZxwZBY90B+4NTWLFK2U6k/M3hTl
	NdRdyXLmapQh6xHBnkkwEb0B9uA3r3OCbhnkjuANw762wLrlUgrUd0MM/BD+Jd4GnItt
	16hLItnqfQ+AsgzIOdVZCXFXmni3I7ljID9ArX2JQlrDLZ/D9OTmBH1tT/uNlysdTFTC
	1cxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IP9n6X4H1cyCIAT22v2vHUwWeBUjdkRHpOUhOvUKFic=;
	b=GUSlGjPSCFBv05PKGQ49KIPF1gFwgqQEFBnlAEaA99TXVIjykkrMX5PhsGcskrUfq9
	NLepLec8WVKxIhHvngSHfLE/xeyGSY+QSfbjFrF6eZyvyPwOu6sFdSEZiXvdRkSv1yT+
	EJPvSOi1jPSxtcQJFbskBC8Rirc75oMAbeCIYZif2+oeD8uenG8MMs29hSZooOIWFS8T
	xKQ83ybpkIUJlkWGgI+B8SUfHgna+KdASvmZn+4Li16zZVRd8sPCRrX+GId5xAeh2ji3
	Apw3hytURn9sr8oAgx7Djx9s8LlKNiDiunaeRYWgiUjXljIIoC6n9sEMkUHLFzWXHIxp
	g95Q==
X-Gm-Message-State: APjAAAXAn9RVDZDh2KGLx9mPEexw5RNdPCvDodKumBWnN9Pyey3CVk+v
	Pvyh5s/205/jfzDManXYZa1NT//gxYCBzaUmhi8=
X-Google-Smtp-Source: APXvYqwKs5F40FedqYxWkmOzHyXaHp4kgX3mSyFu/7ooea4Fuxhl5ATjbkWOEB8dp3LKERJoQQYfg6aPUWXqIZ7c3hM=
X-Received: by 2002:a05:6102:757:: with SMTP id
	v23mr13658800vsg.35.1582109402723; 
	Wed, 19 Feb 2020 02:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20200218132054.20341-1-wallinux@gmail.com>
	<CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
	<CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
In-Reply-To: <CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Feb 2020 11:50:26 +0100
Message-ID: <CANNYZj_YbzPaZhcrDeUWB6Dfan_voKzdo1Fio2XOiuwFvkBBvg@mail.gmail.com>
To: Anders Wallin <wallinux@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace2: added 2.0.1
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
X-List-Received-Date: Wed, 19 Feb 2020 10:50:02 -0000
Content-Type: multipart/alternative; boundary="000000000000f1f8ea059eeb8cae"

--000000000000f1f8ea059eeb8cae
Content-Type: text/plain; charset="UTF-8"

Basically I would like to maintain the principle that a recipe without a
version number is the 'latest' version, and staying on an older version has
to be an opt-in decision. There are already things like python3 and
gstreamer10 in core, and I would want to have less of that.

Alex

On Wed, 19 Feb 2020 at 11:06, Anders Wallin <wallinux@gmail.com> wrote:

> Hi Alex,
>
> I think it's better to use babeltrace2 since it's a new version of
> babeltrace.
> The dist packages uses babeltrace2 and the main application/program is
> called babeltrace2.
>
> Jonatan; Do you have any comment on the naming?
>
> Regards
> Anders Wallin
>
>
> On Tue, Feb 18, 2020 at 2:56 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Thanks. May I request that this recipe is named babletrace, while
>> babeltrace 1.x recipe is at the same time renamed to babeltrace1? I'd like
>> to avoid adding version numbers to the 'latest' version. Lttng should at
>> the same time be adjusted to use babeltrace1, as advised by upstream.
>>
>> Alex
>>
>> On Tue, 18 Feb 2020 at 14:21, Anders Wallin <wallinux@gmail.com> wrote:
>>
>>> Babeltrace 1 vs. Babeltrace 2
>>>
>>> The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was
>>> released.
>>> Babeltrace 2 is a complete rewrite of the library, Python bindings, and
>>> CLI. It
>>> is plugin based and offers much more features and potential than
>>> Babeltrace 1.
>>>
>>> Because Babeltrace 2 is still a young released project, some
>>> distributions still
>>> provide packages for the Babeltrace 1 project. Both projects can coexist
>>> on the
>>> same system as there are no common installed files.
>>>
>>> Signed-off-by: Anders Wallin <wallinux@gmail.com>
>>> ---
>>>  .../recipes-kernel/lttng/babeltrace2_2.0.1.bb | 26 +++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>>>
>>> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>>> b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>>> new file mode 100644
>>> index 0000000000..d49a96faff
>>> --- /dev/null
>>> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>>> @@ -0,0 +1,26 @@
>>> +SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
>>> +DESCRIPTION = "Babeltrace provides trace read and write libraries in
>>> host side, as well as a trace converter, which used to convert LTTng 2.0
>>> traces into human-readable log."
>>> +HOMEPAGE = "http://babeltrace.org/"
>>> +BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
>>> +LICENSE = "MIT & GPLv2 & LGPLv2.1 & BSD-2-Clause"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
>>> +
>>> +DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>>> +
>>> +SRC_URI = "git://
>>> git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0"
>>> +SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
>>> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +inherit autotools pkgconfig
>>> +
>>> +EXTRA_OECONF = "--disable-debug-info"
>>> +
>>> +PACKAGECONFIG ??= "manpages"
>>> +PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native
>>> xmlto-native"
>>> +
>>> +FILES_${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
>>> +FILES_${PN} += "${libdir}/babeltrace2/plugins/*.so"
>>> +
>>> +ASNEEDED = ""
>>> --
>>> 2.25.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>

--000000000000f1f8ea059eeb8cae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Basically I would like to maintain the principle that a re=
cipe without a version number is the &#39;latest&#39; version, and staying =
on an older version has to be an opt-in decision. There are already things =
like python3 and gstreamer10 in core, and I would want to have less of that=
.<div><br></div><div>Alex</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 19 Feb 2020 at 11:06, Anders Wallin =
&lt;<a href=3D"mailto:wallinux@gmail.com">wallinux@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr">Hi Alex,<div><br></div><div>I t=
hink it&#39;s better to use babeltrace2 since it&#39;s a new version of bab=
eltrace.=C2=A0</div><div>The dist packages uses babeltrace2 and the main ap=
plication/program is called babeltrace2.</div><div><br></div><div>Jonatan; =
Do you have any comment on the naming?</div><div><br></div><div>Regards<br =
clear=3D"all"><div><div dir=3D"ltr">Anders Wallin</div></div><br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Feb 18, 2020 at 2:56 PM Alexander Kanavin &lt;<a href=3D"mailto:alex.ka=
navin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr">Thanks. May I request that=C2=A0th=
is=C2=A0recipe is named babletrace, while babeltrace 1.x recipe is at the s=
ame time renamed to babeltrace1? I&#39;d like to avoid adding version numbe=
rs to the &#39;latest&#39; version. Lttng should at the same time be adjust=
ed to use babeltrace1, as advised by upstream.<div><br></div><div>Alex</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, 18 Feb 2020 at 14:21, Anders Wallin &lt;<a href=3D"mailto:wallinux=
@gmail.com" target=3D"_blank">wallinux@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);pad=
ding-left:1ex">Babeltrace 1 vs. Babeltrace 2<br>
<br>
The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was release=
d.<br>
Babeltrace 2 is a complete rewrite of the library, Python bindings, and CLI=
. It<br>
is plugin based and offers much more features and potential than Babeltrace=
 1.<br>
<br>
Because Babeltrace 2 is still a young released project, some distributions =
still<br>
provide packages for the Babeltrace 1 project. Both projects can coexist on=
 the<br>
same system as there are no common installed files.<br>
<br>
Signed-off-by: Anders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com" targ=
et=3D"_blank">wallinux@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a> | 26 +++++++++++=
++++++++<br>
=C2=A01 file changed, 26 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/lttng/<a href=3D"http://babelt=
race2_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</=
a><br>
<br>
diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a> b/meta/re=
cipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=3D"noreferre=
r" target=3D"_blank">babeltrace2_2.0.1.bb</a><br>
new file mode 100644<br>
index 0000000000..d49a96faff<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace2_2.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">babeltrace2_2.0.1.bb</a><br>
@@ -0,0 +1,26 @@<br>
+SUMMARY =3D &quot;Babeltrace2 - Trace Format Babel Tower&quot;<br>
+DESCRIPTION =3D &quot;Babeltrace provides trace read and write libraries i=
n host side, as well as a trace converter, which used to convert LTTng 2.0 =
traces into human-readable log.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://babeltrace.org/" rel=3D"noreferrer" t=
arget=3D"_blank">http://babeltrace.org/</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://bugs.lttng.org/projects/babeltrace=
" rel=3D"noreferrer" target=3D"_blank">https://bugs.lttng.org/projects/babe=
ltrace</a>&quot;<br>
+LICENSE =3D &quot;MIT &amp; GPLv2 &amp; LGPLv2.1 &amp; BSD-2-Clause&quot;<=
br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da6a458c13f18385b7bc5069a6d=
7b176e&quot;<br>
+<br>
+DEPENDS =3D &quot;glib-2.0 util-linux popt bison-native flex-native&quot;<=
br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.linuxfoundation.org/diamon/b=
abeltrace.git;branch=3Dstable-2.0" rel=3D"noreferrer" target=3D"_blank">git=
.linuxfoundation.org/diamon/babeltrace.git;branch=3Dstable-2.0</a>&quot;<br=
>
+SRCREV =3D &quot;06df58f89ee51b1a2c6a2c187ec3f15691633910&quot;<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)$&quot;<b=
r>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools pkgconfig<br>
+<br>
+EXTRA_OECONF =3D &quot;--disable-debug-info&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;manpages&quot;<br>
+PACKAGECONFIG[manpages] =3D &quot;, --disable-man-pages, asciidoc-native x=
mlto-native&quot;<br>
+<br>
+FILES_${PN}-staticdev +=3D &quot;${libdir}/babeltrace2/plugins/*.a&quot;<b=
r>
+FILES_${PN} +=3D &quot;${libdir}/babeltrace2/plugins/*.so&quot;<br>
+<br>
+ASNEEDED =3D &quot;&quot;<br>
-- <br>
2.25.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000f1f8ea059eeb8cae--
