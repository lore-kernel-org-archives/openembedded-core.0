Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UOF6K-0001l3-Jy
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 00:27:18 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so2197819wgg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=1z5Wbpg0TBLDbkpeY8/J1nmwC/2O7nICzhMS2dDXPgc=;
	b=wGniQclcyuJXE+/Lb+NOSEc6VkWIRSMlKdkG9obe856HbBnjffTfLs8ha+F6DKCcGa
	h3XkYlrQe9syINOdThpyefvVgcPNoDpJB4QVQef+penEJGGTEydEbRjybvORQEyIn/sN
	phrKOauofn0IRVDCHENQPRly1hkKV3XJ0SZA6/w0lwTK9G2vTcE0o+9Q3tXaI+TX95Gh
	Olc8pBQbWlBQ9u1k4IfiHKxNrAdcMujZMjWfF3mF1oT/voelcbzH/N5Q/UAQMKP0f6b6
	fnpXBDjKD1UMDAewSpGfJeN1BIqWlQQTslNB65dnM1FzJ8eKRitE3MCsJc/UGJNa7Wtf
	5nXw==
MIME-Version: 1.0
X-Received: by 10.180.82.33 with SMTP id f1mr1304124wiy.13.1365199801969; Fri,
	05 Apr 2013 15:10:01 -0700 (PDT)
Received: by 10.194.243.137 with HTTP; Fri, 5 Apr 2013 15:10:01 -0700 (PDT)
In-Reply-To: <CABcZANnvkcKCA14uuOjFcK6tRdNhy27m-+bPAjQbd=W2FK+HJw@mail.gmail.com>
References: <515E976C.8060302@linaro.org> <20130405212038.GG3191@jama>
	<CABcZANnvkcKCA14uuOjFcK6tRdNhy27m-+bPAjQbd=W2FK+HJw@mail.gmail.com>
Date: Sat, 6 Apr 2013 00:10:01 +0200
Message-ID: <CA+chaQdLwM_iLaCA=aq19q941CEKKAhbJb9L8Oe=TVd4sDU9wA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does support for external toolchains working in current OE?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 22:27:19 -0000
Content-Type: multipart/alternative; boundary=f46d041826da3e708804d9a45913

--f46d041826da3e708804d9a45913
Content-Type: text/plain; charset=UTF-8

I've already tried that, systemd's configure does not respect that.


On Sat, Apr 6, 2013 at 12:08 AM, Chris Larson <clarson@kergoth.com> wrote:

>
> On Fri, Apr 5, 2013 at 2:20 PM, Martin Jansa <martin.jansa@gmail.com>wrote:
>
>> On Fri, Apr 05, 2013 at 11:20:44AM +0200, Marcin Juszkiewicz wrote:
>> > For last few months I am working on fixing Linaro binary cross
>> > toolchains and their support in OpenEmbedded. Got to point when they
>> > work (both AArch64 and ARMv7a ones) for single packages but problem
>> > starts when I want to create image...
>>
>> Today I got different king of issue with external toolchain.
>>
>> systemd is using AC_PATH_TOOL(OBJCOPY, objcopy)
>> but host prefix in OE is not the same as in binary toolchain (different
>> TARGET_VENDOR)
>> so it looks for configure:14545: checking for
>> arm-foo-linux-gnueabi-objcopy
>> while binary toolchain has only
>> arm-bar-linux-gnueabi-objcopy
>>
>> and because arm-foo-linux-gnueabi-objcopy wasn't found it continues:
>> configure:14588: checking for objcopy
>> configure:14606: found /usr/bin/objcopy
>> and bam a lot later when it tries objcopy from host on some arm lib
>>
>> Interesting that systemd is first recipe in our image where I've noticed
>> issues like this
>>
>> Any idea how to easily resolve this without checking every configure.ac
>> how it's looking for e.g. objcopy?
>
>
> export OBJCOPY in the environment to the one based on TARGET_PREFIX rather
> than TARGET_SYS, and it'll use that.
> --
> Christopher Larson
>

--f46d041826da3e708804d9a45913
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve already tried that, systemd&#39;s configure does =
not respect that.</div><div class=3D"gmail_extra"><br><br><div class=3D"gma=
il_quote">On Sat, Apr 6, 2013 at 12:08 AM, Chris Larson <span dir=3D"ltr">&=
lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div><div class=3D"h5"><br><div class=3D"gmail_quote">On Fri, Apr 5, 2013 a=
t 2:20 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jans=
a@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:=
<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Fri, Apr 05, 2013 at 11:20:44AM +020=
0, Marcin Juszkiewicz wrote:<br>
&gt; For last few months I am working on fixing Linaro binary cross<br>
&gt; toolchains and their support in OpenEmbedded. Got to point when they<b=
r>
&gt; work (both AArch64 and ARMv7a ones) for single packages but problem<br=
>
&gt; starts when I want to create image...<br>
<br>
</div>Today I got different king of issue with external toolchain.<br>
<br>
systemd is using AC_PATH_TOOL(OBJCOPY, objcopy)<br>
but host prefix in OE is not the same as in binary toolchain (different TAR=
GET_VENDOR)<br>
so it looks for configure:14545: checking for arm-foo-linux-gnueabi-objcopy=
<br>
while binary toolchain has only =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 arm-bar-linux-gnueabi-objcopy<br>
<br>
and because arm-foo-linux-gnueabi-objcopy wasn&#39;t found it continues:<br=
>
configure:14588: checking for objcopy<br>
configure:14606: found /usr/bin/objcopy<br>
and bam a lot later when it tries objcopy from host on some arm lib<br>
<br>
Interesting that systemd is first recipe in our image where I&#39;ve notice=
d<br>
issues like this<br>
<br>
Any idea how to easily resolve this without checking every <a href=3D"http:=
//configure.ac" target=3D"_blank">configure.ac</a><br>
how it&#39;s looking for e.g. objcopy?</blockquote></div><br></div></div>ex=
port OBJCOPY in the environment to the one based on TARGET_PREFIX rather th=
an TARGET_SYS, and it&#39;ll use that.<span class=3D"HOEnZb"><font color=3D=
"#888888"><br>
-- <br>Christopher Larson</font></span></div></div>
</blockquote></div><br></div>

--f46d041826da3e708804d9a45913--
