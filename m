Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 12EFC65C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 23:58:10 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id a108so7935185qge.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 15:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=maYUEvuLeVM3D7MdUU1hspaSAkElSUaAKMWR+M86VjQ=;
	b=YCG0V+LlZpCD3P5lYi1KEnxuzBkjUlmhYeGUuL8igldY/uN+XgLn8N+DhPT/3m4uQM
	helnZATAbwVTsJef+BmxXKQEQLLWiKBSUC+FWg8ZKahg/Q6qrQjQV2aiCN+BVMARlPoC
	y2C4adKVeFiDtvODTEX063ucSPmKYHsLg4G10cXP4YDBMNKVQiFL+IPSZMzBL9QCxwwv
	Z2vzv389K9ZY83/WxJ+XWBPP0sUbcVDCjQUZEBLlqQCuAfHd6c5dMIKlGITyYPQd9BcK
	Vi+OhHdmmkfmn3rgMj6qmzXhwBEa3/ZHNAbJBm7d4e7l9eG63B+MZZNrkNVYQrCZuZF7
	LpeQ==
X-Gm-Message-State: ALoCoQmoKLoWCvRFhDD52azvGS4tPi9zRGyVxMw5KH0rDC1noG9mOm+VK2ZQDV2TPIq8BWJ3LuXa
X-Received: by 10.224.2.135 with SMTP id 7mr57782535qaj.64.1415750291194; Tue,
	11 Nov 2014 15:58:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Tue, 11 Nov 2014 15:57:50 -0800 (PST)
In-Reply-To: <e5de510ded9ca2d3d09f9c1e4f8ab46fb4603ab0.1412068157.git.Chong.Lu@windriver.com>
References: <cover.1412068156.git.Chong.Lu@windriver.com>
	<e5de510ded9ca2d3d09f9c1e4f8ab46fb4603ab0.1412068157.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Nov 2014 23:57:50 +0000
Message-ID: <CAJTo0LYgKr+dRTuHNh19vo8-V4vRDRzZhaGRBmJFMMi0ZrqFrA@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] strace: Upgrade to 4.9
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
X-List-Received-Date: Tue, 11 Nov 2014 23:58:16 -0000
Content-Type: multipart/alternative; boundary=001a11c3defa32a02605079e0d44

--001a11c3defa32a02605079e0d44
Content-Type: text/plain; charset=UTF-8

On 30 September 2014 10:33, Chong Lu <Chong.Lu@windriver.com> wrote:

> Remove two backported patches:
> 0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
> strace-fix-64-bit-process-detection.patch
>
> Update two patches to fit new version:
> Makefile-ptest.patch
> strace-add-configure-options.patch
>
> Add coreutils, grep and gawk to RDEPENDS_${PN}-ptest for making
> ptest pass.
>

This is failing on the minnow autobuilder:

|
/home/pokybuild/yocto-autobuilder/yocto-worker/minnow/build/build/tmp/work/core2-32-poky-linux/strace/4.9-r0/strace-4.9/unwind.c:29:30:
fatal error: libunwind-ptrace.h: No such file or directory

Maybe there's an optional dependency on unwind which was being rebuilt as
strace was being built?

Ross

--001a11c3defa32a02605079e0d44
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 September 2014 10:33, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div id=3D":2na" class=3D"" style=3D"over=
flow:hidden">Remove two backported patches:<br>
0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch<br>
<span class=3D"">strace</span>-fix-64-bit-process-detection.patch<br>
<br>
Update two patches to fit new version:<br>
Makefile-ptest.patch<br>
<span class=3D"">strace</span>-add-configure-options.patch<br>
<br>
Add coreutils, grep and gawk to RDEPENDS_${PN}-ptest for making<br>
ptest pass.</div></blockquote></div><div class=3D"gmail_extra"><br></div>Th=
is is failing on the minnow autobuilder:</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">| /home/pokyb=
uild/yocto-autobuilder/yocto-worker/minnow/build/build/tmp/work/core2-32-po=
ky-linux/strace/4.9-r0/strace-4.9/unwind.c:29:30: fatal error: libunwind-pt=
race.h: No such file or directory</div><div><br></div><div>Maybe there&#39;=
s an optional dependency on unwind which was being rebuilt as strace was be=
ing built?</div><div><br>Ross</div></div></div>

--001a11c3defa32a02605079e0d44--
