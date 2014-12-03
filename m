Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 55F2F60232
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 16:57:48 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id b13so12439222qcw.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 08:57:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Xwx9oKfnoI2uhxEEgSLFR3x6jqKSBVftqjptWt++ZfA=;
	b=gonqIUxqRSzsjEQR4uQIVbUI2I6oomW1lIG2hITgFi2eovfMYz2LkDtNJbqr5g9bAA
	QKkLOJ8o7N+I/VB8YR7ciLLGym1V16kM29/vtH1KPVHUkEdrAt5VuWaexoyhm4FGOzh4
	MpqpfEU4UtX8mh7hbRZbIhlvXg3ScL4TVyaO/FA19/1KOOI0GvzplazG7WHgrN8uaP4j
	Y3ut6eLjP42ALqFTpNRT65l5Ogzfbn0Ud5aZZJ383UtXU6SeoEY1BXLn2KD202GbJ1I6
	9yOxo8/xuViwnOcCr2XYrdYk2h2JrxDFTDRo7tw1IdKmIMDtE17rMVs1gcsghlxkaj52
	WdPw==
X-Gm-Message-State: ALoCoQnKYTJrcMIBR/bEnPIXIlgTzqZ3Z3RsNSIg9L+0oZ4CmxUAQW1J6nN5pQ+fm6dp0QwMXk70
X-Received: by 10.224.25.146 with SMTP id z18mr9263088qab.17.1417625869302;
	Wed, 03 Dec 2014 08:57:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 08:57:29 -0800 (PST)
In-Reply-To: <4ad594f0f15f07635962aacf07b749beaaba7e1e.1417552133.git.sgw@linux.intel.com>
References: <cover.1417552133.git.sgw@linux.intel.com>
	<4ad594f0f15f07635962aacf07b749beaaba7e1e.1417552133.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 16:57:29 +0000
Message-ID: <CAJTo0LbkmmYGaWwmDMM8ECevGgkEVsqvunf08L27GP3i72T1xQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] libgpg-error: Update to 1.17
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
X-List-Received-Date: Wed, 03 Dec 2014 16:57:49 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8ac05d54bb050952beb1

--047d7bdc8ac05d54bb050952beb1
Content-Type: text/plain; charset=UTF-8

On 3 December 2014 at 01:18, Saul Wold <sgw@linux.intel.com> wrote:

> Added do_compile_prepend() copy an architecture specific header file.
>

This works on everything but qemuarm:

| ./mkheader linux-gnueabi arm-poky-linux-gnueabi
 /data/poky-master/tmp/work/armv5te-poky-linux-gnueabi/libgpg-error/1.17-r0/libgpg-error-1.17/src/
gpg-error.h.in \
|                    ../config.h 1.17 0x011100 >gpg-error.h
|
/data/poky-master/tmp/work/armv5te-poky-linux-gnueabi/libgpg-error/1.17-r0/libgpg-error-1.17/src/
gpg-error.h.in:320: error including
`/data/poky-master/tmp/work/armv5te-poky-linux-gnueabi/libgpg-error/1.17-r0/libgpg-error-1.17/src/syscfg/lock-obj-pub.linux-gnueabi.h':
No such file or directory

Note that the machine name is linux-gnueabi on qemuarm, everything else
uses linux-gnu.  Surely there's a programmatic way of doing this... :/

Ross

--047d7bdc8ac05d54bb050952beb1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 December 2014 at 01:18, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div style=3D"overflow:hidden">Added do_compi=
le_prepend() copy an architecture specific header file.<br></div></blockquo=
te></div><br>This works on everything but qemuarm:</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">| .=
/mkheader linux-gnueabi arm-poky-linux-gnueabi =C2=A0/data/poky-master/tmp/=
work/armv5te-poky-linux-gnueabi/libgpg-error/1.17-r0/libgpg-error-1.17/src/=
<a href=3D"http://gpg-error.h.in" target=3D"_blank">gpg-error.h.in</a> \</d=
iv><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0../config.h 1.17 0x011100 &gt;gpg-error.h</div><=
div class=3D"gmail_extra">| /data/poky-master/tmp/work/armv5te-poky-linux-g=
nueabi/libgpg-error/1.17-r0/libgpg-error-1.17/src/<a href=3D"http://gpg-err=
or.h.in:320" target=3D"_blank">gpg-error.h.in:320</a>: error including `/da=
ta/poky-master/tmp/work/armv5te-poky-linux-gnueabi/libgpg-error/1.17-r0/lib=
gpg-error-1.17/src/syscfg/lock-obj-pub.linux-gnueabi.h&#39;: No such file o=
r directory</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Note that the machine name is linux-gnueabi on qemuarm, everything el=
se uses linux-gnu.=C2=A0 Surely there&#39;s a programmatic way of doing thi=
s... :/</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div></div>

--047d7bdc8ac05d54bb050952beb1--
