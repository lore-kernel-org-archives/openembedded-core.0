Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 747DE6FF97
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 16:39:28 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id k129so19144894iof.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QyIIVf/y2fVBu1D2JPR3iLzW/Ybep477yQHxX7YkAOs=;
	b=qEtc22zLwrosnoUnJ7kdII27F7MC2ZmN38Ab93AlL93nsjtEXwa8a07u03SDk4CUjW
	jplicDW8CZukAItzEOQr+rZTD9N8XrGbGF4cilf9GYL9gBJkFHyZfP+FVVlxhkM9P+6o
	hf2i5cg5G+d+YtI/UVL61Ervp9MfvlwJFm5Xr6i24jWfpSjBfL6sWs8Trorh9rv67QSI
	QVD8GqODmCfu/EiZ+oqidmcvmzuA1zeRVekXaX4sznUgAhkMcgy2WzFBNsbqt6YLhGSp
	LRU3w4CPoDKQV2/kuh3SHdq+vNwm9hGRI6d/SsM3/Rzp3zdTYa2zJripVU/Rt84d5vfT
	TOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QyIIVf/y2fVBu1D2JPR3iLzW/Ybep477yQHxX7YkAOs=;
	b=VuWFIGOwXxbgG/SrNj+xm6izFhcvPYyO+8vxM8MjkT5KqgNvpDA2YBPxcfTp+v5gC4
	5clkwEc7C6igdVaRatx+0L5dpcxeoETemGdTB/yU7Kv5kU7eQpT/rOqhLj+jCcQMPD26
	J07lcxxqbnatFAuP7p9ZRHczyYOiZvI59lxm+e+ihw+fjjllHBRnBDHY27q+2lvhIQZT
	HCOCBkEFPkY+mX4oWq3XVXKLd+9jkCDjfMwdDGZLNqG4xTWl8abWPueALCjBhMKR3kWt
	4elSkEgdmNOlPIhLloR1YZFEB6aIQ2YKx7VYxDfsam7/3CEcaRCrjmhNjpIrvorgW0AB
	OzBw==
X-Gm-Message-State: AOPr4FVBvUZni69LS/vv1oWsm/SfrlYThX3AUjFqxVOb84DStsNhZICILCDf2gyWt3wiQpiVMWxzt4TnIXSLIw==
X-Received: by 10.107.2.70 with SMTP id 67mr39983184ioc.70.1462811968857; Mon,
	09 May 2016 09:39:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Mon, 9 May 2016 09:39:09 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B61181DEFA@ORSMSX112.amr.corp.intel.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<CAJTo0LadzExDXkkX9a6r1TTO2aQhTQ+kY82mV_-BLqs6jYnFFA@mail.gmail.com>
	<CABcZANmJe_UvZ6zeuMTwiyx9X+xY9ATD9XVW7ESrskMtjPL4YQ@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61181DEFA@ORSMSX112.amr.corp.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 9 May 2016 09:39:09 -0700
Message-ID: <CABcZAN=jh=+8PMVw2YMw41Aax1hmssjOVe24SG9XhjB4HgQuwQ@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Mon, 09 May 2016 16:39:30 -0000
Content-Type: multipart/alternative; boundary=001a11396814c6eda905326b7350

--001a11396814c6eda905326b7350
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 9:35 AM, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

> Two additional GNU_HASH related errors were observed (breaking some
> builds) that seem to be related to the patch:
>
>
>
> ERROR: bash-3.2.48-r11 do_package_qa: QA Issue: No GNU_HASH in the elf
> binary:
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packages-split/bash-ptest/usr/lib/bash/ptest/tests/recho'
>
> No GNU_HASH in the elf binary:
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packages-split/bash-ptest/usr/lib/bash/ptest/tests/zecho'
>
> No GNU_HASH in the elf binary:
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packages-split/bash-ptest/usr/lib/bash/ptest/tests/printenv'
> [ldflags]
>
> ERROR: bash-3.2.48-r11 do_package_qa: QA run found fatal errors. Please
> consider fixing them.
>
>
>
>
>
> ERROR: service-0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the elf
> binary:
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work/core2-64-poky-linux/service/0.1-r0/packages-split/service/usr/sbin/skeleton-test'
> [ldflags]
>

Huh, I must not have had ptest enabled in my test builds. Thanks, will take
a look.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11396814c6eda905326b7350
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 9, 2016 at 9:35 AM, Bystricky, Juro <span dir=3D"ltr">&lt;<=
a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky=
@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Two additional GNU_HASH related error=
s were observed (breaking some builds) that seem to be related to the patch=
:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">ERROR: bash-3.2.48-r11 do_package_qa:=
 QA Issue: No GNU_HASH in the elf binary: &#39;/home/pokybuild/yocto-autobu=
ilder/yocto-worker/nightly-non-gpl3/build/build/tmp/work/i586-poky-linux/ba=
sh/3.2.48-r11/packages-split/bash-ptest/usr/lib/bash/ptest/tests/recho&#39;=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">No GNU_HASH in the elf binary: &#39;/=
home/pokybuild/yocto-autobuilder/yocto-worker/nightly-non-gpl3/build/build/=
tmp/work/i586-poky-linux/bash/3.2.48-r11/packages-split/bash-ptest/usr/lib/=
bash/ptest/tests/zecho&#39;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">No GNU_HASH in the elf binary: &#39;/=
home/pokybuild/yocto-autobuilder/yocto-worker/nightly-non-gpl3/build/build/=
tmp/work/i586-poky-linux/bash/3.2.48-r11/packages-split/bash-ptest/usr/lib/=
bash/ptest/tests/printenv&#39;
 [ldflags]<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">ERROR: bash-3.2.48-r11 do_package_qa:=
 QA run found fatal errors. Please consider fixing them.<u></u><u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">ERROR: service-0.1-r0 do_package_qa: =
QA Issue: No GNU_HASH in the elf binary: &#39;/home/pokybuild/yocto-autobui=
lder/yocto-worker/nightly-qa-skeleton/build/build/tmp/work/core2-64-poky-li=
nux/service/0.1-r0/packages-split/service/usr/sbin/skeleton-test&#39;
 [ldflags]</span></p></div></div></blockquote><div><br></div><div>Huh, I mu=
st not have had ptest enabled in my test builds. Thanks, will take a look.<=
/div></div>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphic=
s</div></div>
</div></div>

--001a11396814c6eda905326b7350--
