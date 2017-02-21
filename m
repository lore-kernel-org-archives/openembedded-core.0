Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id EF59072F8E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:25:46 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id 89so81946683wrr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 09:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=brRdp7Jz1Nbp0MCt8+cM+htDtFbudM3RHLBDCzGRkVc=;
	b=aN3Xy4+NDSg2nK63cs1iX3gwfjydKESKqkWdP/lJRakOHJ+ExxsAHnkkriWKvJDWfF
	vHFsbDelUGRExVHXzvQqlIckg3d+OljbZ+qWkayrRQXh6ZCsZE3dgKYLjzyuxJQG2aoy
	0/WT46FWwbC3GjinqVuiQetUCzRkIo0yteeH0tj/rn04LjqwLAz1k0KETW7TX9Zi10Tx
	hpDaD5qHxkvPbfdWCndfObOXQig/pJu4inqFFnKdQQRVaZXz+tsQjgtpurtLLRD9ESpM
	+/lSPB0O1Q9jFrhy7mEvx/74orh4G+x/PtoXkLDlEUjfJwjU+SHFYYZTzgAvyaSPK6VE
	45uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=brRdp7Jz1Nbp0MCt8+cM+htDtFbudM3RHLBDCzGRkVc=;
	b=RhZxnsRBPmQUPdXxtIzHTqZsop3ZxAMtlbmfCLpP1AGEwlDCdjBUxgg8z0Fb3V1Tom
	YWLlfmRUYGAS5gg5d3Hn7o21VnQPYF0ppP/YMxZRjUggZInCz95yrS0CMUIUNumiuf2/
	puAw1tqfC2Uj7droRfG1Oncby219/0dsC7h++KZDDas1GxHncQ0egGXbIIftjWDWpa1e
	sAdvZHxLzSyYzinoBmy0UO96lrJWYpOyJYPIoR7zpL2sMkNg/E530zhYM6Mo59yz9HC2
	6iPwcoTtxfNUAD/zaPul4xmhCoFPrE7FLMoE77omA5cbBQAjeNO/VPlXTTXqFsGXKqy8
	sCmQ==
X-Gm-Message-State: AMke39lBvuq5Bg3MmvMZcrLABJu/xT7cIyW76/ow2IdUQaIO0QSRw1cVgIRscPffQ+zvL9rjtsAZoUcppVMKog==
X-Received: by 10.223.154.162 with SMTP id a31mr16577527wrc.145.1487697947518; 
	Tue, 21 Feb 2017 09:25:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.212.30 with HTTP; Tue, 21 Feb 2017 09:25:46 -0800 (PST)
In-Reply-To: <20170221131229.20126-0-nathan@nathanrossi.com>
References: <20170221131229.20126-0-nathan@nathanrossi.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Feb 2017 18:25:46 +0100
Message-ID: <CA+chaQe5oOf5dXuh4GKyt2irMebkSkGpU5Ad-PqoNjBYCwaRGw@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Alistair Francis <alistai@xilinx.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/4] Make qemu.inc useful for generic use
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
X-List-Received-Date: Tue, 21 Feb 2017 17:25:47 -0000
Content-Type: multipart/alternative; boundary=f403045f546ab1ef8105490dab57

--f403045f546ab1ef8105490dab57
Content-Type: text/plain; charset=UTF-8

It's not caused by these changes, but also probably not fixed by these
changes, so this is just FYI

Currently qemu-native fails to build on hosts with glibc-2.25:

| qga/commands-posix.o: In function `dev_major_minor':
|
/OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2.8.0-r0/qemu-2.8.0/qga/commands-posix.c:656:
undefined reference to `major'
|
/OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2.8.0-r0/qemu-2.8.0/qga/commands-posix.c:657:
undefined reference to `minor'
| collect2: error: ld returned 1 exit status
| make: *** [Makefile:322: qemu-ga] Error 1

linux-user/strace.o: In function `print_mknodat':
/OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2.8.0-r0/qemu-2.8.0/linux-user/strace.c:2010:
undefined reference to `major'
/OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2.8.0-r0/qemu-2.8.0/linux-user/strace.c:2011:
undefined reference to `minor'
linux-user/strace.o: In function `print_mknod':
/OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2.8.0-r0/qemu-2.8.0/linux-user/strace.c:1990:
undefined reference to `major'
/OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2.8.0-r0/qemu-2.8.0/linux-user/strace.c:1991:
undefined reference to `minor'
collect2: error: ld returned 1 exit status

Including sys/sysmacros in these files works, there is a patch in review
upstream with proper fix:

https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg03548.html


On Tue, Feb 21, 2017 at 2:12 PM, Nathan Rossi <nathan@nathanrossi.com>
wrote:

> This series is intended to make the qemu.inc more generic and useful for
> other recipes to use. This is achieved by moving version specific
> patches, task steps and ptest support into the qemu_*.bb recipe,
> additionally improvements are made to the PACKAGECONFIG options and
> changes to the configure step are made to allow for the configuration to
> be more complete as well as easier to override/modify.
> ---
> Changes in v2:
>  * Rebased on top of current master
>  * Updated changes for QEMU 2.8.0 recipe
>
>
> Nathan Rossi (4):
>   qemu: Improve and add PACKAGECONFIG options
>   qemu: Consolidate EXTRA_OECONF
>   qemu: Convert KVMOPTS to PACKAGECONFIG
>   qemu: Move recipe version specific patches and features to recipe
>
>  meta/recipes-devtools/qemu/qemu.inc      | 84
> +++++++++++++-------------------
>  meta/recipes-devtools/qemu/qemu_2.8.0.bb | 33 ++++++++++++-
>  2 files changed, 65 insertions(+), 52 deletions(-)
>
> --
> 2.11.0
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f546ab1ef8105490dab57
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It&#39;s not caused by these changes, but also probab=
ly not fixed by these changes, so this is just FYI</div><div><br></div><div=
>Currently qemu-native fails to build on hosts with glibc-2.25:</div><div><=
br></div><div>| qga/commands-posix.o: In function `dev_major_minor&#39;:</d=
iv><div>| /OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-nativ=
e/2.8.0-r0/qemu-2.8.0/qga/commands-posix.c:656: undefined reference to `maj=
or&#39;</div><div>| /OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/=
qemu-native/2.8.0-r0/qemu-2.8.0/qga/commands-posix.c:657: undefined referen=
ce to `minor&#39;</div><div>| collect2: error: ld returned 1 exit status</d=
iv><div>| make: *** [Makefile:322: qemu-ga] Error 1</div><div><br></div><di=
v><div>linux-user/strace.o: In function `print_mknodat&#39;:</div><div>/OE/=
build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2.8.0-r0/qem=
u-2.8.0/linux-user/strace.c:2010: undefined reference to `major&#39;</div><=
div>/OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2.8.=
0-r0/qemu-2.8.0/linux-user/strace.c:2011: undefined reference to `minor&#39=
;</div><div>linux-user/strace.o: In function `print_mknod&#39;:</div><div>/=
OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2.8.0-r0/=
qemu-2.8.0/linux-user/strace.c:1990: undefined reference to `major&#39;</di=
v><div>/OE/build/owpb/webos-ports/tmp-glibc/work/x86_64-linux/qemu-native/2=
.8.0-r0/qemu-2.8.0/linux-user/strace.c:1991: undefined reference to `minor&=
#39;</div><div>collect2: error: ld returned 1 exit status</div></div><div><=
br></div><div>Including sys/sysmacros in these files works, there is a patc=
h in review upstream with proper fix:</div><div><br></div><div><a href=3D"h=
ttps://lists.gnu.org/archive/html/qemu-devel/2016-12/msg03548.html">https:/=
/lists.gnu.org/archive/html/qemu-devel/2016-12/msg03548.html</a><br></div><=
div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Tue, Feb 21, 2017 at 2:12 PM, Nathan Rossi <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:nathan@nathanrossi.com" target=3D"_blank">nathan@nathanrossi.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This series is =
intended to make the qemu.inc more generic and useful for<br>
other recipes to use. This is achieved by moving version specific<br>
patches, task steps and ptest support into the qemu_*.bb recipe,<br>
additionally improvements are made to the PACKAGECONFIG options and<br>
changes to the configure step are made to allow for the configuration to<br=
>
be more complete as well as easier to override/modify.<br>
---<br>
Changes in v2:<br>
=C2=A0* Rebased on top of current master<br>
=C2=A0* Updated changes for QEMU 2.8.0 recipe<br>
<br>
<br>
Nathan Rossi (4):<br>
=C2=A0 qemu: Improve and add PACKAGECONFIG options<br>
=C2=A0 qemu: Consolidate EXTRA_OECONF<br>
=C2=A0 qemu: Convert KVMOPTS to PACKAGECONFIG<br>
=C2=A0 qemu: Move recipe version specific patches and features to recipe<br=
>
<br>
=C2=A0meta/recipes-devtools/qemu/<wbr>qemu.inc=C2=A0 =C2=A0 =C2=A0 | 84 +++=
++++++++++-----------------<wbr>--<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.8.0.bb" rel=3D"no=
referrer" target=3D"_blank">qem<wbr>u_2.8.0.bb</a> | 33 ++++++++++++-<br>
=C2=A02 files changed, 65 insertions(+), 52 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.11.0<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045f546ab1ef8105490dab57--
