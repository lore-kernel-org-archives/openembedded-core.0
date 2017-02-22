Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5B697730E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:48:53 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id x35so4149260qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 06:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VzRmW9tZRrNQOtPJ0SXqKovnrOnX9X4Q+9MM6N9VGFE=;
	b=PYUjMWVXh6DgPTeqYt034ZwCR9p+yREKV6uAhoHfYlsBY70/Aeuf+hmfxsU3zctsiD
	LKpDWqJG+RFLdvtSFJ0r//e2aKEvhmmFzIQXI94B74BTZiEtV8Lzz1+J7u9/6UZ7AA1X
	mpC51SfoSiyhwvnxzU6oLncm6V3JVkrh1nitISwwzeDDUE+iz2d2Mmb5r5izjcLH2hM/
	kL4+UoPms1Rk60aoGYrfeObkuEiArS8iUAhn4NcyIT7U6aWzAVGlykf+jkygztOugiyB
	SxOuOHtzpo1FWeVfyg1eRQPoq8XjjIo6hyQFSUArvVh9mp48qqGZp4QNVySiGOoECwxV
	X1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VzRmW9tZRrNQOtPJ0SXqKovnrOnX9X4Q+9MM6N9VGFE=;
	b=lnOddr3mXL16LdeV4qjg/3mtq6la3V8NEOZDXbt1Pyg3r2Y3eOtKCBS8J7nikfXOiH
	SbI/RKB3ehHaArfo1E1da8DmAqk5vwRuWEBoc/K4zp2lJgPsQBpRoUJ/7vB5aQkAYBmX
	SQMHBpKNX0V8SUrdYwWh32HUr1cXHg/p0f8DCD1mmRnQsgWUzPVMxoRrKN3xOHacQ7bK
	lYnXTZ1lme1xBKXeqBLOqkswK2UtBOlsxjbxDOn1zgQZAtk1c+48KDR+i0zaqtpU/BxZ
	avLBrpvR8HMd78AdYZFY48Q0eavCmnSytNfO0VcsNHM1jfwVrfdQBOulfoEOhrSjqg1E
	9TdQ==
X-Gm-Message-State: AMke39lOtpw4SNwmHnJKvhyEZ7WVbFL7pxUDEkG6Ng8FJcexjidV9fzh+qzwt552ogLvOYR4LpozE6+5wEy2y1v1
X-Received: by 10.237.53.9 with SMTP id a9mr8055442qte.188.1487774935178; Wed,
	22 Feb 2017 06:48:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 22 Feb 2017 06:48:34 -0800 (PST)
In-Reply-To: <20170203070635.30804-1-tanuk@iki.fi>
References: <20170203070635.30804-1-tanuk@iki.fi>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Feb 2017 14:48:34 +0000
Message-ID: <CAJTo0LYdKoaFzbD2St_S3w7CAaGFXCyHDu8AXfphkeM0LvgOcw@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: 9.0 -> 10.0
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
X-List-Received-Date: Wed, 22 Feb 2017 14:48:54 -0000
Content-Type: multipart/alternative; boundary=001a11c0285e84a8e105491f982c

--001a11c0285e84a8e105491f982c
Content-Type: text/plain; charset=UTF-8

On 3 February 2017 at 07:06, Tanu Kaskinen <tanuk@iki.fi> wrote:

> Relase notes:
> https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/10.0/
>

I'm seeing a new warning now:

WARNING: pulseaudio-10.0-r0 do_package_qa: QA Issue: ELF binary
'/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/pulseaudio/10.0-r0/packages-split/pulseaudio-server/usr/bin/pulseaudio'
has relocations in .text [textrel]

Would you be able to identify where this comes from?

Ross

--001a11c0285e84a8e105491f982c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2017 at 07:06, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D=
"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex"><div id=3D"gmail-:7nk" class=3D"gmail-a3s gmail-aXjCH g=
mail-m15a02cd4778c4b3c">Relase notes:<br>
<a href=3D"https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/10.0/=
" rel=3D"noreferrer" target=3D"_blank">https://www.freedesktop.org/<wbr>wik=
i/Software/PulseAudio/<wbr>Notes/10.0/</a></div></blockquote></div><br>I&#3=
9;m seeing a new warning now:</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">WARNING: pulseaudio-10.0-r0 do_package_qa: QA Issue=
: ELF binary &#39;/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/pul=
seaudio/10.0-r0/packages-split/pulseaudio-server/usr/bin/pulseaudio&#39; ha=
s relocations in .text [textrel]<br></div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Would you be able to identify where this com=
es from?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a11c0285e84a8e105491f982c--
