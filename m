Return-Path: <wallinux@gmail.com>
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id 004AC611CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:06:22 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id f10so20036876ils.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oYx76HTIyG+5/Yu6pxe25/9BAKzFlGdWVRBaLUU2yhQ=;
	b=kBkHOAQN1t+Sy8G0K/wxb5YRmUW0sLtHXF911a2e8CRArjzY2f2kP8fmJ4WvCXRAt4
	LC5YFdd9RiTlD9KgdRAiWNbZdGMYESmE91lzeyM81FJvEs7vf9ITecDQI+PEwusPEOmI
	yUOFniCmieEpEY7vZWtkFFtilE+PvpOleRoieo9SDzKSWvlNtBNOyKQtXWmgjXJHrL7h
	ByWH59yl9WsN8vTNCLveQe4b2+I2hRXipkJcRAuPhkfzElMrMiklIxIyUKdQ0hbBxi/N
	jpLf5iJg2EW7tYAsX35frR92oaRCfcD6HQiuLkjgFcaHTp2N16T+r2QwVjHYMu0u7Ple
	Y6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oYx76HTIyG+5/Yu6pxe25/9BAKzFlGdWVRBaLUU2yhQ=;
	b=WsqLieot/cYG5GO6PR5LbGSz6EBQf6S//EW+boexYYxTvP/i/W0kbZyrzrmAmDT58t
	hp1+gy60iGb+2KvOeWSg4LVEm47gdh1UsAKMH6k0bF9xxYuiR+3hANKU5T+lt07c30Nk
	c/x7A7qaf8yMz9kGKvWIuUacauYFj+wPytO0UDfzG81CIuXvr2iUEsfVLQLCuZ5UPHSj
	/7c/fGI/0Ea6T1mlBKY06L9E4++DjQgarsn+4ulNjRdrx1CNyk6t9bQq9eohBRItaalk
	B90HPGvsAmXsLvmIaygLFqRv4B4jgdkM1TliOXu6Orw3Dwbuf0BZxbNGRCcpAQ//Sp7u
	hdhA==
X-Gm-Message-State: APjAAAVJvDmlw34UbL/JBddd8/0SZeSbvBqgl1N65Xl2wA2VBQsgUxmY
	4sA7aaJ4nXBYKK/BK1sVo6ODgVL5O6Hjr/39qvk=
X-Google-Smtp-Source: APXvYqxFdVwI5w2dClWqT6WffcqOqo9c/dQ6Byk+4HohE1QcVqfijvB+lP1ZOe5y2kcXGZxgzj0zeo5RTAF0n2kklbA=
X-Received: by 2002:a92:5a86:: with SMTP id b6mr24840211ilg.108.1582106783547; 
	Wed, 19 Feb 2020 02:06:23 -0800 (PST)
MIME-Version: 1.0
References: <20200218132054.20341-1-wallinux@gmail.com>
	<CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
In-Reply-To: <CANNYZj9nm0eqo0NtHhEJiw7nLbnYQ8r1aazXk6mGn83VXc9VNA@mail.gmail.com>
From: Anders Wallin <wallinux@gmail.com>
Date: Wed, 19 Feb 2020 11:06:12 +0100
Message-ID: <CAF2baFdCF-NVmUa=meNhAN5BDBqLcS4k7F+EBWtUA1ekY6OVBg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
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
X-List-Received-Date: Wed, 19 Feb 2020 10:06:23 -0000
Content-Type: multipart/alternative; boundary="000000000000d4849d059eeaf092"

--000000000000d4849d059eeaf092
Content-Type: text/plain; charset="UTF-8"

Hi Alex,

I think it's better to use babeltrace2 since it's a new version of
babeltrace.
The dist packages uses babeltrace2 and the main application/program is
called babeltrace2.

Jonatan; Do you have any comment on the naming?

Regards
Anders Wallin


On Tue, Feb 18, 2020 at 2:56 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Thanks. May I request that this recipe is named babletrace, while
> babeltrace 1.x recipe is at the same time renamed to babeltrace1? I'd like
> to avoid adding version numbers to the 'latest' version. Lttng should at
> the same time be adjusted to use babeltrace1, as advised by upstream.
>
> Alex
>
> On Tue, 18 Feb 2020 at 14:21, Anders Wallin <wallinux@gmail.com> wrote:
>
>> Babeltrace 1 vs. Babeltrace 2
>>
>> The Babeltrace project exists since 2010. In 2020, Babeltrace 2 was
>> released.
>> Babeltrace 2 is a complete rewrite of the library, Python bindings, and
>> CLI. It
>> is plugin based and offers much more features and potential than
>> Babeltrace 1.
>>
>> Because Babeltrace 2 is still a young released project, some
>> distributions still
>> provide packages for the Babeltrace 1 project. Both projects can coexist
>> on the
>> same system as there are no common installed files.
>>
>> Signed-off-by: Anders Wallin <wallinux@gmail.com>
>> ---
>>  .../recipes-kernel/lttng/babeltrace2_2.0.1.bb | 26 +++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>>
>> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>> b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>> new file mode 100644
>> index 0000000000..d49a96faff
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
>> @@ -0,0 +1,26 @@
>> +SUMMARY = "Babeltrace2 - Trace Format Babel Tower"
>> +DESCRIPTION = "Babeltrace provides trace read and write libraries in
>> host side, as well as a trace converter, which used to convert LTTng 2.0
>> traces into human-readable log."
>> +HOMEPAGE = "http://babeltrace.org/"
>> +BUGTRACKER = "https://bugs.lttng.org/projects/babeltrace"
>> +LICENSE = "MIT & GPLv2 & LGPLv2.1 & BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
>> +
>> +DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
>> +
>> +SRC_URI = "git://
>> git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0"
>> +SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
>> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)$"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OECONF = "--disable-debug-info"
>> +
>> +PACKAGECONFIG ??= "manpages"
>> +PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native
>> xmlto-native"
>> +
>> +FILES_${PN}-staticdev += "${libdir}/babeltrace2/plugins/*.a"
>> +FILES_${PN} += "${libdir}/babeltrace2/plugins/*.so"
>> +
>> +ASNEEDED = ""
>> --
>> 2.25.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--000000000000d4849d059eeaf092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div><br></div><div>I think it&#39;s better to use=
 babeltrace2 since it&#39;s a new version of babeltrace.=C2=A0</div><div>Th=
e dist packages uses babeltrace2 and the main application/program is called=
 babeltrace2.</div><div><br></div><div>Jonatan; Do you have any comment on =
the naming?</div><div><br></div><div>Regards<br clear=3D"all"><div><div dir=
=3D"ltr" data-smartmail=3D"gmail_signature">Anders Wallin</div></div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Feb 18, 2020 at 2:56 PM Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Thanks. May I request that=C2=A0this=C2=A0recipe is named babletra=
ce, while babeltrace 1.x recipe is at the same time renamed to babeltrace1?=
 I&#39;d like to avoid adding version numbers to the &#39;latest&#39; versi=
on. Lttng should at the same time be adjusted to use babeltrace1, as advise=
d by upstream.<div><br></div><div>Alex</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 18 Feb 2020 at 14:21, A=
nders Wallin &lt;<a href=3D"mailto:wallinux@gmail.com" target=3D"_blank">wa=
llinux@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Babeltrace 1 vs. Babeltrace 2<br>
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

--000000000000d4849d059eeaf092--
