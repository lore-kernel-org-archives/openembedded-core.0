Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 28042603FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:05:31 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id w18so24818910itj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 02:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8jcED2ukc3n8T8VhimrcryawXsQRu2L4V6qE83H1AxA=;
	b=hNqfGPWtPU7MkxdLO6FxqWpY4jzjE5sHFsz1x3a38qE45ViApJrqIB2J7Yb3RTwFZ2
	GYrKLjR7dVyBcCkriUNGTHCxeCI9iKl5/uCB14Z5SGeDb2hT2gGvplEPxae78bayyPS5
	j3hSCsJOoJHGCJoffw1tmW9ahctVGLmhfSZ933GFEJe8jzAK4SGwZCQL4pZuho2qspnX
	rx35j7jAgjgd6Av2uhYayLlEnxl/zqqV2/mlClOXLkjXzEHbSV5T0o6PU/zK15rZxOAm
	2ByOjr3iq02HWGbPs0oBV54Pw3fBwmrP+yTvxSEeieCUIhpJ4w3ypNsuwfTY3DWDeDAW
	Mm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8jcED2ukc3n8T8VhimrcryawXsQRu2L4V6qE83H1AxA=;
	b=EPDJM5bxvkxISvIvsPxJ4f08kHzSuJBrLnYX3M+ge5vSKq9btSEHySKIWJitg3h8//
	Q1Rv5+P1jBapTKQc50sjIqiMA1XgIymiGOdv3J4Gi1TTUvJyBXgFsALjmzSjvw2QoD0X
	xeSpEIsB3007vPYD/5cVFJkrkaK1Nyl/PQOR96foxzYqPY//f8i2FTxCCVZcPrSuO1Rt
	ciTIWi9gUXSwHLNRhzY41bnp2iAe2okjkWdaOlkMc8v1+4Bx6w7Rnn7Mp2SmmEnq5xtk
	jKrPepfkM2n0PtxLtFvpxiQMNnPI52Iy/95oXrJLIEiZAkkboIKGvuGMUf9uW3n9wgcq
	ufOA==
X-Gm-Message-State: APjAAAWVa8Kxih2jrqst58EMen1PgGCqGOKb3lhbrCpEe0Db+fffFA3S
	/8gH9UHOR6L9T4FchaRgK3suoAOhK3sYqjNnkmg=
X-Google-Smtp-Source: APXvYqxHx3aWBStvwnzm5eNQsFxcUatp8/gJabxiEdOj/G5pFi7DUxrgR5ZM/PEYGtEFH2L8w9e3u2vFrIG7sE37w+g=
X-Received: by 2002:a24:6d5:: with SMTP id 204mr646755itv.122.1552986332833;
	Tue, 19 Mar 2019 02:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1552962581.git.akuster808@gmail.com>
In-Reply-To: <cover.1552962581.git.akuster808@gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 19 Mar 2019 10:05:21 +0100
Message-ID: <CAB2nKc-1Q2A0w8m62FeBR+1=7RMKJ5MQwzUFMy9xq8kDWy=KeA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/26] thud patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 09:05:34 -0000
Content-Type: multipart/alternative; boundary="000000000000b5ae9405846ece0c"

--000000000000b5ae9405846ece0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Regarding target-sdk-provides-dummy: add more perl modules to avoid
populate_sdk failure patch, I had to complete it with following bbappend:

DUMMYPROVIDES_append =3D "\
    perl-module-warnings-register \
    perl-module-config \
    perl-module-overloading \
    perl-module-warnings \
    perl-module-file-temp \
"

Don't know if we should rework Chen Qi patch or create a new one.
By the way, can't we add every empty perl packages in dummy automatically?

Best regards,
Vincent

Le mar. 19 mars 2019 =C3=A0 03:37, Armin Kuster <akuster808@gmail.com> a =
=C3=A9crit :

> Responses should be made by Wed March 20th 22:00:00 UTC 2019
>
> The following changes since commit
> f5a57e939e626a5b7c6de5b51799ca602ed355ed:
>
>   mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:13 +0000)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib stable/thud-next
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/thud-ne=
xt
>
> Alexander Kanavin (1):
>   ca-certificates: upgrade 20180409 -> 20190110
>
> Andr=C3=A9 Draszik (1):
>   systemd: RDEPENDS on util-linux-umount
>
> Changqing Li (1):
>   libsndfile1: Security fix CVE-2018-19432
>
> Chen Qi (1):
>   target-sdk-provides-dummy: add more perl modules to avoid populate_sdk
>     failure
>
> Douglas Royds (1):
>   libpam: libpamc is licensed under its own BSD-style licence
>
> George McCollister (1):
>   systemd: fix CVE-2019-6454
>
> Jonathan Rajotte-Julien (3):
>   lttng-ust: update to 2.10.3
>   lttng-modules: update to 2.10.9
>   lttng-tools: update to 2.9.11
>
> Mark Hatle (10):
>   gitsm.py: Fix when a submodule is defined, but not initialized
>   gitsm.py: Add support for alternative URL formats from submodule files
>   tests/fetch.py: Add alternative gitsm test case
>   gitsm.py: Optimize code and attempt to resolve locking issue
>   gitsm.py: revise unpack
>   gitsm.py: Rework the shallow fetcher and test case
>   gitsm.py: Refactor the functions and simplify the class
>   gitsm.py: Fix relative URLs
>   gitsmy.py: Fix unpack of submodules of submodules
>   gitsm: The fetcher did not process some recursive submodules properly.
>
> Ming Liu (1):
>   rm_work: sort the value of do_build dependencies
>
> Oleksandr Kravchuk (1):
>   target-sdk-provides-dummy: add perl-module-overload
>
> Richard Purdie (3):
>   target-sdk-provides-dummy: Extend to -dev and -src packages
>   systemd: Update recent CVE patches
>   kernel: Ensure an initramfs is added if configured
>
> Robert Yang (1):
>   send-error-report: Add --no-ssl to use http protocol
>
> Ross Burton (1):
>   libpng: fix CVE-2019-7317
>
>  bitbake/lib/bb/fetch2/gitsm.py                     | 253
> +++++++++------------
>  bitbake/lib/bb/tests/fetch.py                      |  70 +++++-
>  meta/classes/kernel.bbclass                        |   4 +-
>  meta/classes/rm_work.bbclass                       |   3 +-
>  .../recipes-core/meta/target-sdk-provides-dummy.bb |  14 ++
>  ...-not-store-the-iovec-entry-for-process-co.patch |   6 +-
>  ...ld-set-a-limit-on-the-number-of-fields-1k.patch |  56 -----
>  ...nald-set-a-limit-on-the-number-of-fields.patch} |  93 ++++++--
>  ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |  49 ++++
>  .../0027-journal-fix-syslog_parse_identifier.patch |  77 -------
>  ...not-remove-multiple-spaces-after-identifi.patch |  84 -------
>  .../systemd/systemd/CVE-2019-6454.patch            | 210 +++++++++++++++=
++
>  ...e-receive-an-invalid-dbus-message-ignore-.patch |  61 +++++
>  meta/recipes-core/systemd/systemd_239.bb           |  10 +-
>  meta/recipes-extended/pam/libpam_1.3.0.bb          |   4 +-
>  ...ose-sk-wmem-in-sock_exceed_buf_limit-trac.patch |  67 ------
>  ...g-modules_2.10.7.bb =3D> lttng-modules_2.10.9.bb} |   5 +-
>  ...ow-multiple-attempts-to-connect-to-relayd.patch |  17 +-
>  ...{lttng-tools_2.9.5.bb =3D> lttng-tools_2.9.11.bb} |   4 +-
>  .../{lttng-ust_2.10.1.bb =3D> lttng-ust_2.10.3.bb}   |   4 +-
>  .../libpng/libpng/CVE-2019-7317.patch              |  20 ++
>  meta/recipes-multimedia/libpng/libpng_1.6.36.bb    |   3 +-
>  .../libsndfile/libsndfile1/CVE-2018-19432.patch    | 115 ++++++++++
>  .../libsndfile/libsndfile1_1.0.28.bb               |   1 +
>  ...tes_20180409.bb =3D> ca-certificates_20190110.bb} |   2 +-
>  scripts/send-error-report                          |  11 +-
>  26 files changed, 758 insertions(+), 485 deletions(-)
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number=
-of-fields-1k.patch
>  rename
> meta/recipes-core/systemd/systemd/{0026-journal-remote-set-a-limit-on-the=
-number-of-fields-i.patch
> =3D> 0025-journald-set-a-limit-on-the-number-of-fields.patch} (47%)
>  create mode 100644
> meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE=
-2018-16866.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0027-journal-fix-syslog_parse_identifie=
r.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0028-journal-do-not-remove-multiple-spa=
ces-after-identifi.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-me=
ssage-ignore-.patch
>  delete mode 100644
> meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-so=
ck_exceed_buf_limit-trac.patch
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.10.7.bb =3D>
> lttng-modules_2.10.9.bb} (85%)
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.9.5.bb =3D>
> lttng-tools_2.9.11.bb} (97%)
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb =3D>
> lttng-ust_2.10.3.bb} (90%)
>  create mode 100644
> meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch
>  create mode 100644
> meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.patch
>  rename meta/recipes-support/ca-certificates/{ca-certificates_20180409.bb
> =3D> ca-certificates_20190110.bb} (98%)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b5ae9405846ece0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Armin, <br></div><div><br></div><=
div>Regarding=20
target-sdk-provides-dummy: add more perl modules to avoid populate_sdk fail=
ure patch, I had to complete it with following bbappend:<br></div><div><br>=
</div><div>DUMMYPROVIDES_append =3D &quot;\<br>=C2=A0=C2=A0=C2=A0 perl-modu=
le-warnings-register \<br>=C2=A0=C2=A0=C2=A0 perl-module-config \<br>=C2=A0=
=C2=A0=C2=A0 perl-module-overloading \<br>=C2=A0=C2=A0=C2=A0 perl-module-wa=
rnings \<br>=C2=A0=C2=A0=C2=A0 perl-module-file-temp \<br>&quot;</div><div>=
<br></div><div>Don&#39;t know if we should rework=20
Chen Qi patch or create a new one. <br></div><div>By the way, can&#39;t we =
add every empty perl packages in dummy automatically?<br></div><div><br></d=
iv><div>Best regards,</div><div>Vincent<br></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 19 mars=
 2019 =C3=A0=C2=A003:37, Armin Kuster &lt;<a href=3D"mailto:akuster808@gmai=
l.com">akuster808@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Responses should be made by Wed Mar=
ch 20th 22:00:00 UTC 2019<br>
<br>
The following changes since commit f5a57e939e626a5b7c6de5b51799ca602ed355ed=
:<br>
<br>
=C2=A0 mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:13 +0000)=
<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/poky-contrib</a> stable/th=
ud-next<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Dstable/thud-next" rel=3D"noreferrer" target=3D"_blank">http://git.yoctop=
roject.org/cgit.cgi/poky-contrib/log/?h=3Dstable/thud-next</a><br>
<br>
Alexander Kanavin (1):<br>
=C2=A0 ca-certificates: upgrade 20180409 -&gt; 20190110<br>
<br>
Andr=C3=A9 Draszik (1):<br>
=C2=A0 systemd: RDEPENDS on util-linux-umount<br>
<br>
Changqing Li (1):<br>
=C2=A0 libsndfile1: Security fix CVE-2018-19432<br>
<br>
Chen Qi (1):<br>
=C2=A0 target-sdk-provides-dummy: add more perl modules to avoid populate_s=
dk<br>
=C2=A0 =C2=A0 failure<br>
<br>
Douglas Royds (1):<br>
=C2=A0 libpam: libpamc is licensed under its own BSD-style licence<br>
<br>
George McCollister (1):<br>
=C2=A0 systemd: fix CVE-2019-6454<br>
<br>
Jonathan Rajotte-Julien (3):<br>
=C2=A0 lttng-ust: update to 2.10.3<br>
=C2=A0 lttng-modules: update to 2.10.9<br>
=C2=A0 lttng-tools: update to 2.9.11<br>
<br>
Mark Hatle (10):<br>
=C2=A0 gitsm.py: Fix when a submodule is defined, but not initialized<br>
=C2=A0 gitsm.py: Add support for alternative URL formats from submodule fil=
es<br>
=C2=A0 tests/fetch.py: Add alternative gitsm test case<br>
=C2=A0 gitsm.py: Optimize code and attempt to resolve locking issue<br>
=C2=A0 gitsm.py: revise unpack<br>
=C2=A0 gitsm.py: Rework the shallow fetcher and test case<br>
=C2=A0 gitsm.py: Refactor the functions and simplify the class<br>
=C2=A0 gitsm.py: Fix relative URLs<br>
=C2=A0 gitsmy.py: Fix unpack of submodules of submodules<br>
=C2=A0 gitsm: The fetcher did not process some recursive submodules properl=
y.<br>
<br>
Ming Liu (1):<br>
=C2=A0 rm_work: sort the value of do_build dependencies<br>
<br>
Oleksandr Kravchuk (1):<br>
=C2=A0 target-sdk-provides-dummy: add perl-module-overload<br>
<br>
Richard Purdie (3):<br>
=C2=A0 target-sdk-provides-dummy: Extend to -dev and -src packages<br>
=C2=A0 systemd: Update recent CVE patches<br>
=C2=A0 kernel: Ensure an initramfs is added if configured<br>
<br>
Robert Yang (1):<br>
=C2=A0 send-error-report: Add --no-ssl to use http protocol<br>
<br>
Ross Burton (1):<br>
=C2=A0 libpng: fix CVE-2019-7317<br>
<br>
=C2=A0bitbake/lib/bb/fetch2/gitsm.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 253 +++++++++------------<br>
=C2=A0bitbake/lib/bb/tests/fetch.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 70 +++++-<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0meta/classes/rm_work.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0.../recipes-core/meta/<a href=3D"http://target-sdk-provides-dummy.bb"=
 rel=3D"noreferrer" target=3D"_blank">target-sdk-provides-dummy.bb</a> |=C2=
=A0 14 ++<br>
=C2=A0...-not-store-the-iovec-entry-for-process-co.patch |=C2=A0 =C2=A06 +-=
<br>
=C2=A0...ld-set-a-limit-on-the-number-of-fields-1k.patch |=C2=A0 56 -----<b=
r>
=C2=A0...nald-set-a-limit-on-the-number-of-fields.patch} |=C2=A0 93 ++++++-=
-<br>
=C2=A0...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |=C2=A0 49 ++++<br=
>
=C2=A0.../0027-journal-fix-syslog_parse_identifier.patch |=C2=A0 77 -------=
<br>
=C2=A0...not-remove-multiple-spaces-after-identifi.patch |=C2=A0 84 -------=
<br>
=C2=A0.../systemd/systemd/CVE-2019-6454.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 210 +++++++++++++++++<br>
=C2=A0...e-receive-an-invalid-dbus-message-ignore-.patch |=C2=A0 61 +++++<b=
r>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_239.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_239.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0meta/recipes-extended/pam/<a href=3D"http://libpam_1.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libpam_1.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0...ose-sk-wmem-in-sock_exceed_buf_limit-trac.patch |=C2=A0 67 ------<=
br>
=C2=A0...<a href=3D"http://g-modules_2.10.7.bb" rel=3D"noreferrer" target=
=3D"_blank">g-modules_2.10.7.bb</a> =3D&gt; <a href=3D"http://lttng-modules=
_2.10.9.bb" rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.10.9.bb</a=
>} |=C2=A0 =C2=A05 +-<br>
=C2=A0...ow-multiple-attempts-to-connect-to-relayd.patch |=C2=A0 17 +-<br>
=C2=A0...{<a href=3D"http://lttng-tools_2.9.5.bb" rel=3D"noreferrer" target=
=3D"_blank">lttng-tools_2.9.5.bb</a> =3D&gt; <a href=3D"http://lttng-tools_=
2.9.11.bb" rel=3D"noreferrer" target=3D"_blank">lttng-tools_2.9.11.bb</a>} =
|=C2=A0 =C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://lttng-ust_2.10.1.bb" rel=3D"noreferrer" target=
=3D"_blank">lttng-ust_2.10.1.bb</a> =3D&gt; <a href=3D"http://lttng-ust_2.1=
0.3.bb" rel=3D"noreferrer" target=3D"_blank">lttng-ust_2.10.3.bb</a>}=C2=A0=
 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../libpng/libpng/CVE-2019-7317.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 20 ++<br>
=C2=A0meta/recipes-multimedia/libpng/<a href=3D"http://libpng_1.6.36.bb" re=
l=3D"noreferrer" target=3D"_blank">libpng_1.6.36.bb</a>=C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +-<br>
=C2=A0.../libsndfile/libsndfile1/CVE-2018-19432.patch=C2=A0 =C2=A0 | 115 ++=
++++++++<br>
=C2=A0.../libsndfile/<a href=3D"http://libsndfile1_1.0.28.bb" rel=3D"norefe=
rrer" target=3D"_blank">libsndfile1_1.0.28.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://tes_20180409.bb" rel=3D"noreferrer" target=3D"_b=
lank">tes_20180409.bb</a> =3D&gt; <a href=3D"http://ca-certificates_2019011=
0.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates_20190110.bb</a>}=
 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/send-error-report=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +-<br>
=C2=A026 files changed, 758 insertions(+), 485 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0025-journald-se=
t-a-limit-on-the-number-of-fields-1k.patch<br>
=C2=A0rename meta/recipes-core/systemd/systemd/{0026-journal-remote-set-a-l=
imit-on-the-number-of-fields-i.patch =3D&gt; 0025-journald-set-a-limit-on-t=
he-number-of-fields.patch} (47%)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-fix=
-out-of-bounds-read-CVE-2018-16866.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0027-journal-fix=
-syslog_parse_identifier.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0028-journal-do-=
not-remove-multiple-spaces-after-identifi.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/sd-bus-if-we-rec=
eive-an-invalid-dbus-message-ignore-.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-n=
et-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch<br>
=C2=A0rename meta/recipes-kernel/lttng/{<a href=3D"http://lttng-modules_2.1=
0.7.bb" rel=3D"noreferrer" target=3D"_blank">lttng-modules_2.10.7.bb</a> =
=3D&gt; <a href=3D"http://lttng-modules_2.10.9.bb" rel=3D"noreferrer" targe=
t=3D"_blank">lttng-modules_2.10.9.bb</a>} (85%)<br>
=C2=A0rename meta/recipes-kernel/lttng/{<a href=3D"http://lttng-tools_2.9.5=
.bb" rel=3D"noreferrer" target=3D"_blank">lttng-tools_2.9.5.bb</a> =3D&gt; =
<a href=3D"http://lttng-tools_2.9.11.bb" rel=3D"noreferrer" target=3D"_blan=
k">lttng-tools_2.9.11.bb</a>} (97%)<br>
=C2=A0rename meta/recipes-kernel/lttng/{<a href=3D"http://lttng-ust_2.10.1.=
bb" rel=3D"noreferrer" target=3D"_blank">lttng-ust_2.10.1.bb</a> =3D&gt; <a=
 href=3D"http://lttng-ust_2.10.3.bb" rel=3D"noreferrer" target=3D"_blank">l=
ttng-ust_2.10.3.bb</a>} (90%)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/libpng/libpng/CVE-2019-731=
7.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE=
-2018-19432.patch<br>
=C2=A0rename meta/recipes-support/ca-certificates/{<a href=3D"http://ca-cer=
tificates_20180409.bb" rel=3D"noreferrer" target=3D"_blank">ca-certificates=
_20180409.bb</a> =3D&gt; <a href=3D"http://ca-certificates_20190110.bb" rel=
=3D"noreferrer" target=3D"_blank">ca-certificates_20190110.bb</a>} (98%)<br=
>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000b5ae9405846ece0c--
