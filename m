Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id CF4086AC59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 10:41:03 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id v10so28451971qac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 02:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hKJ9hIawLv/lmLnG0jHzZS1JmBoENGW3a2gDSBu2DT4=;
	b=ED2iF4F09GjkygREMSW0hK96SqEKnQQ0h0I5mjLeioNMMJwW0g+eJndpVmHl0GTBaQ
	ZEGCBSmqRizVRPjZuZdYF7EDD1XQn+bcBFHM9ZWkfKmNF+S43kW0AQhVMQqJiB7Buds1
	YFEmkdSPHLC+QrLQXKx7kw+eTJ76R2kXKJPNsMaS6vRAnaLlp1N+DB3CeevFq1xQvHAs
	dGdbAsnEG2CnszvHY0sMPrfBkpuyxtAEuqeOnLIZor2ax9YnSV7lEw59xdA3Zz8h4Ngf
	R/CcIyHO4gzoGnAaaDsQ7OtWlIMiGbrd504huK59xGR8g/TbVcvHFu9HGcftedeisT8O
	X5MQ==
X-Gm-Message-State: ALoCoQkIQuaD3eQncOR4php7VyilCyMNXPbgp4m56Gj0zrByqYAP8rKdPhiD6Psr8bjCT1mGpLY9
X-Received: by 10.224.103.129 with SMTP id k1mr39954411qao.93.1422873664553;
	Mon, 02 Feb 2015 02:41:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 02:40:44 -0800 (PST)
In-Reply-To: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 10:40:44 +0000
Message-ID: <CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 10:41:07 -0000
Content-Type: multipart/alternative; boundary=047d7b66f74b5641bd050e1897e9

--047d7b66f74b5641bd050e1897e9
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 2 February 2015 at 10:02, Khem Raj <raj.khem@gmail.com> wrote:

> I have put together upgrade to gcc 4.9.2 as well as glibc 2.21 (
> upcoming ) on  a contrib branch ( top 2 patches) its has not got much
> testing besides x86 qemu thus far.
>

I'm seeing these failures when cherry-picking the top two commits to
current poky/master.

gcc-cross-initial:

| /data/poky-master/tmp/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/dwarf2cfi.c:
In function 'void expand_builtin_init_dwarf_reg_sizes(tree)':
|
/data/poky-master/tmp/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/dwarf2cfi.c:334:27:
error: 'struct gcc_target' has no member named 'dwarf_frame_reg_mode'

cross-localdef-native:

| In file included from glibc/locale/programs/locarchive.c:696:0:
| glibc/locale/programs/../../intl/l10nflist.c: In function
'_nl_normalize_codeset':
| glibc/locale/programs/../../intl/l10nflist.c:306:12: error: missing
binary operator before token "("
| glibc/locale/programs/../../intl/l10nflist.c:313:9: error:
'_nl_C_locobj_ptr' undeclared (first use in this function)
| glibc/locale/programs/../../intl/l10nflist.c:313:9: note: each undeclared
identifier is reported only once for each function it appears in

Ross

--047d7b66f74b5641bd050e1897e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Khem,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 2 February 2015 at 10:02, Khem =
Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_=
blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":1al" class=3D"" style=3D"overflow:hidden">I have put together upgrade =
to gcc 4.9.2 as well as glibc 2.21 (<br>
upcoming ) on=C2=A0 a contrib branch ( top 2 patches) its has not got much<=
br>
testing besides x86 qemu thus far.</div></blockquote></div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">I&#39;m seeing these failur=
es when cherry-picking the top two commits to current poky/master.</div><di=
v class=3D"gmail_extra"><br></div>gcc-cross-initial:</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_extra">| /data/poky-master/tmp/work-share=
d/gcc-4.9.2-r0/gcc-4.9.2/gcc/dwarf2cfi.c: In function &#39;void expand_buil=
tin_init_dwarf_reg_sizes(tree)&#39;:</div><div class=3D"gmail_extra">| /dat=
a/poky-master/tmp/work-shared/gcc-4.9.2-r0/gcc-4.9.2/gcc/dwarf2cfi.c:334:27=
: error: &#39;struct gcc_target&#39; has no member named &#39;dwarf_frame_r=
eg_mode&#39;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">cross-localdef-native:</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra"><div class=3D"gmail_extra">| In file included from =
glibc/locale/programs/locarchive.c:696:0:</div><div class=3D"gmail_extra">|=
 glibc/locale/programs/../../intl/l10nflist.c: In function &#39;_nl_normali=
ze_codeset&#39;:</div><div class=3D"gmail_extra">| glibc/locale/programs/..=
/../intl/l10nflist.c:306:12: error: missing binary operator before token &q=
uot;(&quot;</div><div class=3D"gmail_extra">| glibc/locale/programs/../../i=
ntl/l10nflist.c:313:9: error: &#39;_nl_C_locobj_ptr&#39; undeclared (first =
use in this function)</div><div class=3D"gmail_extra">| glibc/locale/progra=
ms/../../intl/l10nflist.c:313:9: note: each undeclared identifier is report=
ed only once for each function it appears in</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div></div></div>

--047d7b66f74b5641bd050e1897e9--
