Return-Path: <anibal.limon@linaro.org>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 436D37F7A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 23:41:51 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y125so3065074vsb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 15:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=756eKmjiXjGd9z/KFacwlcJlcUpARWoYPZ8sI32bDy8=;
	b=B9GXCtePwLZhFRANASSyxAI529/Xzrspmzr9MHIRlF6TRmKGWTQw0u5qniudBNlRcy
	6mcB0aRattwex/2Rdv0rZWYs5J0fxwUYAly9aaM+EiEM3u8NHXL0kLBV9y4xrscCDiH8
	3w03oQA3q6dKJXdONW55ez8vDRtafaY696WQlzKprjceYPv/SougmikqW4jqCAjftry7
	F3/Fk1HGFRvZ6qnEYInA1EsHn4XTtIUqWH771htqBzztorCWlhu5wIQdaRpYLWCiVxM7
	2jh9rEibEoatmWum+ia0Y6j683s/ABS9RXPzwOPK8wbHCfb9pb7IvSdjiwcH46n9iYDs
	E3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=756eKmjiXjGd9z/KFacwlcJlcUpARWoYPZ8sI32bDy8=;
	b=B0UNbI4lUwRgM9Xmu1GyVE11Wr9enm2ygvXxR5o4qZBcQW51w4WW7B4GTmE9bwRquP
	ZXlV8StU0cYVrrBEUkNpKpggjSS4yXFKZa0QEsn534hacDlPPqQ4xd0aTx+htuZLAyFW
	NFlaW6JiRNmOhK9JO1jXbhDrh2jLCI5ro/AknRFMm7gdBhu81VzK8qjhoPmO18TcQU0N
	G76ylQ2FMom2BkCYpPG6N7v5y8tT+/ORDAEa8Ea1MIzVPgy0Mpr/heomLt8CRVCkDOiU
	9fmG5ZCALx4SL/49j52UFW+yenrxecUsx4K1vyIoM6V4+mn0UPUOQOyhjnnu2n319UAF
	beWQ==
X-Gm-Message-State: APjAAAV4ho0yxiotDt9uwSRerhU4xN8AZz2h7Ve07k66OdRuuk05m/z4
	ADR3FQWSsHz9ZMVeDzYpLFvUfEuddoRnG7j1TF0D1Q==
X-Google-Smtp-Source: APXvYqx1q4DlvurFhauzV9R/kVLUbBEE0QJqhh7d9Eg8QwrJ3GPnF7bv1S14CzwlmbswNlrfgOuYoNgwGX6F04+JHHc=
X-Received: by 2002:a67:fd63:: with SMTP id h3mr4540829vsa.221.1578526912169; 
	Wed, 08 Jan 2020 15:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20191203220624.26500-1-anibal.limon@linaro.org>
	<38e38eff-b81c-5e51-5397-213d970cca2d@intel.com>
In-Reply-To: <38e38eff-b81c-5e51-5397-213d970cca2d@intel.com>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Wed, 8 Jan 2020 17:41:41 -0600
Message-ID: <CA+_AqiuGZv_Q1d2p_puAusNJRyfXWXJuyMg+X0Q=Mqt64Ms0Kg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/meson.bbclass: Add inherit setuptools3
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
X-List-Received-Date: Wed, 08 Jan 2020 23:41:51 -0000
Content-Type: multipart/alternative; boundary="000000000000de6133059ba96f0b"

--000000000000de6133059ba96f0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 18 Dec 2019 at 14:31, Ross Burton <ross.burton@intel.com> wrote:

> On 03/12/2019 22:06, An=C3=ADbal Lim=C3=B3n wrote:
> > Fixes,
> >
> > ...
> > | Program python3 found: YES
> (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aa=
rch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-na=
tive/python3)
> > |
> > | meson.build:36:0: ERROR: <ExternalProgram 'python3' ->
> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/a=
arch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-n=
ative/python3']>
> is not a valid python or it is missing setuptools
> > |
> > | A full log can be found at
> /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aar=
ch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
> > | WARNING: exit code 1 from a shell command.
>
> Going back to this...
>
> Without this patch I get a different result:
>
> Program python3 found: YES
>
> (/data/poky-tmp/master/work/corei7-64-poky-linux/waffle/1.6.0-r0/recipe-s=
ysroot-native/usr/bin/python3-native/python3)
> Run-time dependency threads found: YES
> [ continues fine ]
>
> So what is the meson-log.txt saying?
>

Hi,

I'm debugging this issue again and found the root cause that is missing
_sysconfigdata module, in python3-native.bbclass is set
(_PYTHON_SYSCONFIGDATA_NAME) and fails if no python3 isn't available so it
relais on python3 target being added.

Reviewing python3 recipe _sysconfig_data thera are two possible fixes,

- Copy _sysconfig_data from /usr/lib/python-sysconfig to /usr/lib/pythonVER
(I will go for this one)

...
+
+do_install_append_class-native() {
+       cp ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
${D}/${libdir}/python${PYTHON_MAJMIN}
+}
+
...

- Find right _sysconfig_data in python3native.bbclass because the library
name is based on os-machine.

Regards,
Anibal

>
> Ross
>

--000000000000de6133059ba96f0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 18 Dec 2019 at 14:31, Ross Bu=
rton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 0=
3/12/2019 22:06, An=C3=ADbal Lim=C3=B3n wrote:<br>
&gt; Fixes,<br>
&gt; <br>
&gt; ...<br>
&gt; | Program python3 found: YES (/home/anibal.limon/linaro/oe-rpb-master/=
build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-s=
ysroot-native/usr/bin/python3-native/python3)<br>
&gt; |<br>
&gt; | meson.build:36:0: ERROR: &lt;ExternalProgram &#39;python3&#39; -&gt;=
 [&#39;/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/wor=
k/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python=
3-native/python3&#39;]&gt; is not a valid python or it is missing setuptool=
s<br>
&gt; |<br>
&gt; | A full log can be found at /home/anibal.limon/linaro/oe-rpb-master/b=
uild-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/build/mes=
on-logs/meson-log.txt<br>
&gt; | WARNING: exit code 1 from a shell command.<br>
<br>
Going back to this...<br>
<br>
Without this patch I get a different result:<br>
<br>
Program python3 found: YES <br>
(/data/poky-tmp/master/work/corei7-64-poky-linux/waffle/1.6.0-r0/recipe-sys=
root-native/usr/bin/python3-native/python3)<br>
Run-time dependency threads found: YES<br>
[ continues fine ]<br>
<br>
So what is the meson-log.txt saying?<br></blockquote><div><br></div><div>Hi=
,</div><div><br></div><div>I&#39;m debugging this issue again and found the=
 root cause that is missing _sysconfigdata module, in python3-native.bbclas=
s is set (_PYTHON_SYSCONFIGDATA_NAME) and fails if no python3 isn&#39;t ava=
ilable so it relais on python3 target being added.</div><div><br></div><div=
>Reviewing python3 recipe _sysconfig_data thera are two possible fixes,</di=
v><div><br></div><div>- Copy _sysconfig_data from /usr/lib/python-sysconfig=
 to /usr/lib/pythonVER (I will go for this one)</div><div><br></div><div>..=
.</div><div>+<br>+do_install_append_class-native() {<br>+ =C2=A0 =C2=A0 =C2=
=A0 cp ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py ${D}/${libdir}/=
python${PYTHON_MAJMIN}<br>+}<br>+<br></div><div>...</div><div><br></div><di=
v>- Find right=C2=A0_sysconfig_data in python3native.bbclass because the li=
brary name is based on os-machine.<br></div><div>=C2=A0</div><div>Regards,<=
/div><div>Anibal</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Ross<br>
</blockquote></div></div>

--000000000000de6133059ba96f0b--
