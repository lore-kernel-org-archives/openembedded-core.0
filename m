Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5D77D6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Apr 2017 19:58:06 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id h123so17780792qke.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Apr 2017 12:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QlYD4Apox6LEcYDC0vyToYXLRvtW7R5J5TmPQM/F6gY=;
	b=xWrnoZ9JMVtYTv1nOkiUsJy6OsL+gopj5VLZXqN2lSMeQS70+yD7oHJh2rzkTBWnUs
	18PEzTBqYOsLAUbHDuxoVmeTyGCv+cHkn4Nz0DJB3Fgm+p8NHK0ZjImWrMDhteVKHuuv
	prCPGkVMBj8C1ryNoJzPT7n259ip915t2Meb8RvOwp9IzCNoevFogOf6CkQMA3lSS1rL
	CDhKzMOdH3B+dbta7E7VfcAfKHsYWEJuj5/VKHyK6TTGaGJRASClsfmttYKuFbcQMjm1
	O5cbnjxcHOb+kVg7wxSGxSLXDOWeObk3Qk4e6GWoLboPajWARX9VoVVfE5xCehPzR9r1
	z4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QlYD4Apox6LEcYDC0vyToYXLRvtW7R5J5TmPQM/F6gY=;
	b=ku2iE7mRN14fagFJhwpQjGSVLQJzkbZSARjvrkw41HBN1qbfeP8Ae+SVzGADSFmxm9
	oS1PW/brSC/SkhNvLZeBFDX/NPrBIGJfMSg1PM2YNW6lV7v/1cAt7D+dXRwomIU5AW0q
	MyKyb7Dl15EC+meVl194kyBYvBcYjpaiYeWiMRUzluMi0eLxKVkSQdpl8+ztongtwNUg
	91MlZ/7bTJ+KiwHxSKFS7thbOntcrHhyeEE72A6oWYpP3ZbqoXe/JALcleBd2vJjrbXb
	ATYO+D1SlCD429at/fiqYFz276i5QHqpj2uuV3mK8RVsqhm62R0B3sxc/kbPNiFvxs1I
	xZkw==
X-Gm-Message-State: AN3rC/5nU2CaJlmMFIo0aV2l5mm0nEAMA5QLQaBtY1+LVLRxIUHVjWMq
	xyuBlQC1bekCW+B9JG/ovdq0uy5kF++R3mI=
X-Received: by 10.55.214.208 with SMTP id p77mr23960794qkl.121.1492977487776; 
	Sun, 23 Apr 2017 12:58:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Sun, 23 Apr 2017 12:57:47 -0700 (PDT)
In-Reply-To: <41eab4c3d1f37b4dc2614de0a5654590dd7bc4b8.1492777818.git.alexander.kanavin@linux.intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
	<41eab4c3d1f37b4dc2614de0a5654590dd7bc4b8.1492777818.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 23 Apr 2017 20:57:47 +0100
Message-ID: <CAJTo0Lax=yRbSPo4pdp1we2RjVWSQNXXB65gdniLYz4Y1aJNQQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/11] oe-selftest: add a test for upstream version check regressions
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
X-List-Received-Date: Sun, 23 Apr 2017 19:58:08 -0000
Content-Type: multipart/alternative; boundary=001a1149d4f8d1221a054ddae868

--001a1149d4f8d1221a054ddae868
Content-Type: text/plain; charset=UTF-8

On 21 April 2017 at 13:40, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> The test runs an upstream version check, and then compares the
> list of recipes that failed the check (i.e. those where latest
> upstream version could not be established) against the list of
> known-broken upstreams. Mismatches either way (upstream check failed,
> recipe not in the exception list, or upstream check worked,
> recipe in exception list) fail the test.
>

This fails on the autobuilder:

FAIL [335.522s]: test_checkpkg (oeqa.selftest.distrodata.Distrodata)
----------------------------------------------------------------------
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/distrodata.py",
line 41, in test_checkpkg
    self.assertTrue(len(regressed_failures) == 0 and
len(regressed_successes) == 0, msg)
AssertionError: False is not true :
The following packages failed upstream version checks. Please fix them
using UPSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX
(when using tarballs) or UPSTREAM_CHECK_GITTAGREGEX (when using git). If an
upstream version check cannot be performed
(for example, if upstream does not use git tags), you can add the package
to list of exceptions in
meta-selftest/files/distrodata/checkpkg_exceptions.
kmscube
bmap-tools
libcap-ng
boost
The following packages have been checked successfully for upstream versions
(or they no longer exist in oe-core),
but are in the exceptions list in
meta-selftest/files/distrodata/checkpkg_exceptions. Please remove them from
that list.
x264


Ross

--001a1149d4f8d1221a054ddae868
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 April 2017 at 13:40, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D=
"gmail-:488" class=3D"gmail-a3s gmail-aXjCH gmail-m15b9088321639b46">The <s=
pan class=3D"gmail-il">test</span> runs an upstream version check, and then=
 compares the<br>
list of recipes that failed the check (i.e. those where latest<br>
upstream version could not be established) against the list of<br>
known-broken upstreams. Mismatches either way (upstream check failed,<br>
recipe not in the exception list, or upstream check worked,<br>
recipe in exception list) fail the <span class=3D"gmail-il">test</span>.</d=
iv></blockquote></div><br>This fails on the autobuilder:</div><div class=3D=
"gmail_extra"><br></div>FAIL [335.522s]: test_checkpkg (oeqa.selftest.distr=
odata.Distrodata)<br>------------------------------------------------------=
----------------<br>Traceback (most recent call last):<br>=C2=A0 File &quot=
;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/m=
eta/lib/oeqa/selftest/distrodata.py&quot;, line 41, in test_checkpkg<br>=C2=
=A0 =C2=A0 self.assertTrue(len(regressed_failures) =3D=3D 0 and len(regress=
ed_successes) =3D=3D 0, msg)<br>AssertionError: False is not true : <br>The=
 following packages failed upstream version checks. Please fix them using U=
PSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX<br>(when using tarballs) or UPSTREAM=
_CHECK_GITTAGREGEX (when using git). If an upstream version check cannot be=
 performed<br>(for example, if upstream does not use git tags), you can add=
 the package to list of exceptions in<br>meta-selftest/files/distrodata/che=
ckpkg_exceptions.<br>kmscube<br>bmap-tools<br>libcap-ng<br>boost<br>The fol=
lowing packages have been checked successfully for upstream versions (or th=
ey no longer exist in oe-core),<br>but are in the exceptions list in meta-s=
elftest/files/distrodata/checkpkg_exceptions. Please remove them from that =
list.<br>x264<br><br><br>Ross</div>

--001a1149d4f8d1221a054ddae868--
