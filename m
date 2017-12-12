Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD9D87198F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 14:06:56 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f190so24470131ita.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oef5wEw8gaWwOf09BZD3ZisLZUTlTIuMNyCoMQM0RnI=;
	b=Jb8Pdm0fD9/WML0bDC1GC3I+Ga3Zuwb14IXlc1PYgeHwI3pUhNCaV7HXy+QF91JJyK
	MLdDDmL/Ogl9y8iboTufUd9Y2UyhcX/x3cMyd3dJ+ABtcsWr/YD4C0l3l4/z7g75BZGn
	QxAc413XQxD2DJy/o1q2BGY81/qwGktsQTK4ayvi2IR9ztA/JcCpO7OTu2NO5RcsUhdo
	vB2cRVUTR08g5vYcI6TFafMx68bjHVOFGoee2xmY5niLgbn0hYFfnwpetOJ19Lvl7431
	LA/RKz/ZPZzbk1EAdGjZ3v+2RTaLezqFhftPOW0BIiq2mxbGVP2pJsnP8PMWZtriVsRn
	iVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oef5wEw8gaWwOf09BZD3ZisLZUTlTIuMNyCoMQM0RnI=;
	b=AacJxVJkgZSffs+4eFrXKHX4wStmfjHV9uwFqMnxRbzIYtBc9J9THpdBljzcKR8GbV
	h0MPxYmD+t9WSwkTS7ISGu9RmV4eCxYMPhv8lF0le5DBkM1p0MUur5DbdMp6cCsMOk+m
	v0dXbkEazf1GyPoMH0j/me7709egPqXZSe55q8HGeKC+gKmqiAExaDUDgabLL47fOmjG
	ePJusql2qKK2xUTQJ1atvGZsOd3zcYSBQwb4qN4c5yVGtBUPB5CMDbOawtikvazsxX1K
	4ZB+OCyJew0BaGb8VBQMTefIvM8DUHTT8dOvpzb47lybYrvbXfMljomTQFOXiCJobIuX
	PKpQ==
X-Gm-Message-State: AKGB3mKMuvdIwSmMKg8TROXLxtyqvluFs34Sg5dttXbdSoirfCXgQ1eL
	14NDRpyFiRVOkVUleZjft25ULEaVjmrVT7yKc68=
X-Google-Smtp-Source: ACJfBouT4P16ylSQUqZWmFTOkEbcPo8Suw7fQrurj25zYSgynQtkIXEqnSco2NAfbsRALApeiphr/SHkzPC4WmUENlQ=
X-Received: by 10.107.81.24 with SMTP id f24mr5158270iob.63.1513087617806;
	Tue, 12 Dec 2017 06:06:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.90.200 with HTTP; Tue, 12 Dec 2017 06:06:37 -0800 (PST)
In-Reply-To: <CAJTo0LaPCqFQ9asGmRUpEZ4G146GT42j0xQvMVpsW3xOeddN4Q@mail.gmail.com>
References: <20171212132755.30556-1-stefan@agner.ch>
	<CAJTo0LaPCqFQ9asGmRUpEZ4G146GT42j0xQvMVpsW3xOeddN4Q@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 12 Dec 2017 15:06:37 +0100
Message-ID: <CAB2nKc9iYxkAU7UQSLk0t5_9T2XhyuGcCe7mH5xhDtTvQNDF_g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] waf.bbclass: explicitly pass bindir and libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 14:06:56 -0000
Content-Type: multipart/alternative; boundary="089e0825cc30f937f205602529ce"

--089e0825cc30f937f205602529ce
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

Does it fail with V1?

Best regards,
Vincent

2017-12-12 15:00 GMT+01:00 Burton, Ross <ross.burton@intel.com>:

> On 12 December 2017 at 13:27, Stefan Agner <stefan@agner.ch> wrote:
>
>> On some build hosts distros (e.g. Fedora 26) waf tries to be
>> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
>> This obviously is not what we want for 32-bit targets and usually
>> fails in the do_package phase:
>>   WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue:
>> gstreamer1.0-plugins-imx: Files/directories were installed but not shipped
>> in any package:
>>     /usr/lib64/libgstimxcommon.so.0
>>
>> Waf knows prefix, bindir and libdir as default options. Explicitly
>> pass those three.
>>
>
> Obviously not.
>
> ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function failed: do_configure
> (log file is located at /data/poky-tmp/master/build/
> work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.
> do_configure.17278)
> ERROR: Logfile of failure stored in: /data/poky-tmp/master/build/
> work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278
> Log data follows:
> | DEBUG: Executing shell function do_configure
> | waf [commands] [options]
> |
> | Main commands (example: ./waf build -j4)
> |   build    : executes the build
> |   clean    : cleans the project
> |   configure: configures the project
> |   dist     : makes a tarball for redistributing the sources
> |   distcheck: checks if the project compiles (tarball from 'dist')
> |   distclean: removes the build directory
> |   install  : installs the targets on the system
> |   list     : lists the targets to execute
> |   step     : executes tasks in a step-by-step fashion, for debugging
> |   uninstall: removes the targets installed
> |   update   : updates the plugins from the *waflib/extras* directory
> |
> | waf: error: no such option: --bindir
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--089e0825cc30f937f205602529ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<div><br></div><div>Does it fail with V1?</div><di=
v><br></div><div>Best regards,</div><div>Vincent</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">2017-12-12 15:00 GMT+01:00 Burto=
n, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" targ=
et=3D"_blank">ross.burton@intel.com</a>&gt;</span>:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div dir=3D"ltr"><span class=3D"">On 12 December 2017 at 13:27, =
Stefan Agner <span dir=3D"ltr">&lt;<a href=3D"mailto:stefan@agner.ch" targe=
t=3D"_blank">stefan@agner.ch</a>&gt;</span> wrote:<br></span><div class=3D"=
gmail_extra"><div class=3D"gmail_quote"><span class=3D""><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
On some build hosts distros (e.g. Fedora 26) waf tries to be<br>
smart about libdir detection and defaults to [EXEC_PREFIX/lib64].<br>
This obviously is not what we want for 32-bit targets and usually<br>
fails in the do_package phase:<br>
=C2=A0 WARNING: gstreamer1.0-plugins-imx-0.13.<wbr>0-r0 do_package: QA Issu=
e: gstreamer1.0-plugins-imx: Files/directories were installed but not shipp=
ed in any package:<br>
=C2=A0 =C2=A0 /usr/lib64/libgstimxcommon.so.<wbr>0<br>
<br>
Waf knows prefix, bindir and libdir as default options. Explicitly<br>
pass those three.<br></blockquote><div><br></div></span><div>Obviously not.=
</div><div><br></div><div>ERROR: eglinfo-x11-1.0.0-r0 do_configure: Functio=
n failed: do_configure (log file is located at /data/poky-tmp/master/build/=
<wbr>work/corei7-64-poky-linux/<wbr>eglinfo-x11/1.0.0-r0/temp/log.<wbr>do_c=
onfigure.17278)</div><div>ERROR: Logfile of failure stored in: /data/poky-t=
mp/master/build/<wbr>work/corei7-64-poky-linux/<wbr>eglinfo-x11/1.0.0-r0/te=
mp/log.<wbr>do_configure.17278</div><div>Log data follows:</div><div>| DEBU=
G: Executing shell function do_configure</div><div>| waf [commands] [option=
s]</div><div>|</div><div>| Main commands (example: ./waf build -j4)</div><d=
iv>| =C2=A0 build =C2=A0 =C2=A0: executes the build</div><div>| =C2=A0 clea=
n =C2=A0 =C2=A0: cleans the project</div><div>| =C2=A0 configure: configure=
s the project</div><div>| =C2=A0 dist =C2=A0 =C2=A0 : makes a tarball for r=
edistributing the sources</div><div>| =C2=A0 distcheck: checks if the proje=
ct compiles (tarball from &#39;dist&#39;)</div><div>| =C2=A0 distclean: rem=
oves the build directory</div><div>| =C2=A0 install =C2=A0: installs the ta=
rgets on the system</div><div>| =C2=A0 list =C2=A0 =C2=A0 : lists the targe=
ts to execute</div><div>| =C2=A0 step =C2=A0 =C2=A0 : executes tasks in a s=
tep-by-step fashion, for debugging</div><div>| =C2=A0 uninstall: removes th=
e targets installed</div><div>| =C2=A0 update =C2=A0 : updates the plugins =
from the *waflib/extras* directory</div><div>|</div><div>| waf: error: no s=
uch option: --bindir</div><span class=3D"HOEnZb"><font color=3D"#888888"><d=
iv><br></div><div>Ross=C2=A0</div></font></span></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--089e0825cc30f937f205602529ce--
