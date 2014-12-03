Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1F40360673
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 13:10:50 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id q107so10974728qgd.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 05:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NUmPEY/SZdn8tJmzL2yu+Jm6zVgUC/s/BsZmMcijEPk=;
	b=CQdlyZc/cnqhYrB5s36IZLanZdMRcBea/o4D9NWSneu4nPIja1vIrBqzfVz9YEOk3s
	t4fUXLBpBc/s06AOzAwsvRzBN8pAAaojlJImVThU95ERF0dVVzuxWK87JPeAw4f/dB4j
	mjZPvSp8yXWG1bTqtbC054xVeLacqVJOJxfAQRzn1dul3pm4FS5khYtNjLZRBh2K2f3W
	XTfTuoCVlEw99uNeATVyL4YqgGqmECtJ74IMT3WDxjjKy7rdcByTT4bhaUOqMynhWVCI
	UEb0k3G+IrUC726qNgyDGi70K37v3gSDOwcw9Nojn93/beQ5Tir6HyJhS5koAnsJo0cI
	2y8A==
X-Gm-Message-State: ALoCoQk4UrD0Oo5NbNQ8wOOdDdtfoeXP7TFfvZ9u8qby7CiydX/OaMtL+/aqQTGPQDjxMcpXMjdD
X-Received: by 10.140.38.170 with SMTP id t39mr7733745qgt.15.1417612251055;
	Wed, 03 Dec 2014 05:10:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 05:10:30 -0800 (PST)
In-Reply-To: <8740d1ee8174975ad7b14b888d6358e9340e49f4.1417552133.git.sgw@linux.intel.com>
References: <cover.1417552133.git.sgw@linux.intel.com>
	<8740d1ee8174975ad7b14b888d6358e9340e49f4.1417552133.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 13:10:30 +0000
Message-ID: <CAJTo0LYxQ28CM4pPi7aCkVnU5BHHyawZK0=jmswBTDmdwGRMAQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libaio: Upgrade to 3.110
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
X-List-Received-Date: Wed, 03 Dec 2014 13:10:54 -0000
Content-Type: multipart/alternative; boundary=001a11c12196a7892805094f9295

--001a11c12196a7892805094f9295
Content-Type: text/plain; charset=UTF-8

Hi Saul,

On 3 December 2014 at 01:18, Saul Wold <sgw@linux.intel.com> wrote:

> libaio does not build with PIE flags enabled
>

This failed in *some* (but not all) of the autobuilder jobs:

| io_queue_init.os: In function `io_queue_init':
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_queue_init.c:33:
undefined reference to `__stack_chk_fail_local'
| io_queue_release.os: In function `io_queue_release':
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_queue_release.c:27:
undefined reference to `__stack_chk_fail_local'
| io_queue_wait.os: In function `io_queue_wait_0_4':
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_queue_wait.c:30:
undefined reference to `__stack_chk_fail_local'
| io_queue_run.os: In function `io_queue_run':
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_queue_run.c:39:
undefined reference to `__stack_chk_fail_local'
| io_getevents.os: In function `__io_getevents_0_4':
|
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_getevents.c:25:
undefined reference to `__stack_chk_fail_local'
|
io_getevents.os:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_getevents.c:55:
more undefined references to `__stack_chk_fail_local' follow

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/113/steps/BuildImages/logs/stdio

Ross

--001a11c12196a7892805094f9295
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Saul,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 3 December 2014 at 01:18, Saul =
Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D=
"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border=
-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div=
 id=3D":892" class=3D"" style=3D"overflow:hidden">libaio does not build wit=
h PIE flags enabled<br></div></blockquote></div><div class=3D"gmail_extra">=
<br></div>This failed in *some* (but not all) of the autobuilder jobs:</div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_extra">| io_queue_init.=
os: In function `io_queue_init&#39;:</div><div class=3D"gmail_extra">| /hom=
e/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/=
work/i586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_queue_init.c:3=
3: undefined reference to `__stack_chk_fail_local&#39;</div><div class=3D"g=
mail_extra">| io_queue_release.os: In function `io_queue_release&#39;:</div=
><div class=3D"gmail_extra">| /home/pokybuild/yocto-autobuilder/yocto-worke=
r/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/libaio/0.3.110-r0/li=
baio-0.3.110/src/io_queue_release.c:27: undefined reference to `__stack_chk=
_fail_local&#39;</div><div class=3D"gmail_extra">| io_queue_wait.os: In fun=
ction `io_queue_wait_0_4&#39;:</div><div class=3D"gmail_extra">| /home/poky=
build/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i=
586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_queue_wait.c:30: und=
efined reference to `__stack_chk_fail_local&#39;</div><div class=3D"gmail_e=
xtra">| io_queue_run.os: In function `io_queue_run&#39;:</div><div class=3D=
"gmail_extra">| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-=
lsb/build/build/tmp/work/i586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/s=
rc/io_queue_run.c:39: undefined reference to `__stack_chk_fail_local&#39;</=
div><div class=3D"gmail_extra">| io_getevents.os: In function `__io_geteven=
ts_0_4&#39;:</div><div class=3D"gmail_extra">| /home/pokybuild/yocto-autobu=
ilder/yocto-worker/nightly-x86-lsb/build/build/tmp/work/i586-poky-linux/lib=
aio/0.3.110-r0/libaio-0.3.110/src/io_getevents.c:25: undefined reference to=
 `__stack_chk_fail_local&#39;</div><div class=3D"gmail_extra">| io_getevent=
s.os:/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-lsb/build/b=
uild/tmp/work/i586-poky-linux/libaio/0.3.110-r0/libaio-0.3.110/src/io_getev=
ents.c:55: more undefined references to `__stack_chk_fail_local&#39; follow=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><a hr=
ef=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/bu=
ilds/113/steps/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org=
/main/builders/nightly-x86-lsb/builds/113/steps/BuildImages/logs/stdio</a><=
br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div></div>

--001a11c12196a7892805094f9295--
