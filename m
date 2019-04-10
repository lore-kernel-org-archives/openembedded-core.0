Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 836857D903
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:27:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r4so2937086wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Gd1VcYx59aytMz1fjrpR/BAXV/Us3q0ClmQ2LsznMoc=;
	b=UN4RSr5i76t2SHE40fxDgWSIXwWCQwVuFnChrMdp3l2XqTze96TRuqnijkW41E3sN6
	I3Ar4vhPck+zpEZqdHKJYAdLaFyeY8axuNwVH9atb5RWyrR1x2KgkVXD/V3FiXGKu/P6
	cunnfUjBm61KHzCNswALElWsg+iOrqM0xlF1aeEl//Vjn7e1/2JZnqoUbDRiPQ19kKz1
	tkt3wwc7Q9HDbX4qiqYHQnNZ5SEwD/SEauxTekg2OLZ4S3X2bMFoEWXO8UFA/1029xYb
	EodN2e6U6OFAb9JvOHiP9AphDpI09o/zoeQvRBLYQ2aVHaT4pwFqyEGwkLgqIRdC8hw9
	zOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=Gd1VcYx59aytMz1fjrpR/BAXV/Us3q0ClmQ2LsznMoc=;
	b=BJUdYQO9H+vOwyYVXzWh1dqGhaXpnqNwkBGtfU141u4e4zW+2vTMxaumpn04WwBJ4E
	qI7ksndXDKWdx4IlAlOY1P5A/CkQKTZLNQvJC4fSnZc+j4D7j/ee+thybjqfqgIJuBJ6
	Iehnfp7aHZCEdH/j2oGKZb6G3SNR4Ur98Q/okIhYaLGn85dm4g2tSwar7qPXTuRX7oNm
	XMIIT44Ry/jyeJbOrffGKNT9EhpJfESW3j1n85rOFUjL4KcKMH5u4L1d4R7j0euDDKnS
	EurVO9OE9jrmh9EP3NugF3N7WwCrNqz35FFW/BFyy3JWLFOBpZ3bhqQa11h4zl7iIG9X
	MMkQ==
X-Gm-Message-State: APjAAAX0coDqs/MMUxxblqqsx345anwsJK/miaCeaFhX/xkhMyAoaF1S
	2lzgd51+og39NZrmHKTKABl9Nsm6jBg=
X-Google-Smtp-Source: APXvYqw/oJPiZvyV69QMgOEVg0uvv60/q6ya4gMq2I6PKpq3x0Y3zMtxLReNG0Z/Nf3RZ3mOkEU0qw==
X-Received: by 2002:adf:df08:: with SMTP id y8mr3057442wrl.91.1554902874952;
	Wed, 10 Apr 2019 06:27:54 -0700 (PDT)
Received: from [172.16.50.58] ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id
	a9sm34106279wrt.29.2019.04.10.06.27.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Apr 2019 06:27:54 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1554628807.git.akuster808@gmail.com>
	<CA+chaQd2dqK4LyTeKRwROvSwtwFC23GO9fWB3GpFTwGz91ytMQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a728c338-9186-d78c-4864-0050b40f432d@gmail.com>
Date: Wed, 10 Apr 2019 18:57:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQd2dqK4LyTeKRwROvSwtwFC23GO9fWB3GpFTwGz91ytMQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/16] thud-next patch review
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
X-List-Received-Date: Wed, 10 Apr 2019 13:27:54 -0000
Content-Type: multipart/alternative;
	boundary="------------DFB18D1A63BD3A63628D99E7"
Content-Language: en-US

--------------DFB18D1A63BD3A63628D99E7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4/10/19 3:01 AM, Martin Jansa wrote:
> Please don't forget to include:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-March/28=
0094.html
> and similar one for sumo:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-March/28=
0093.html
> in the next pull.
Thanks for the reminder. My focus on this batch was getting more of the
automated QA bits in.

- armin
> I don't see them included in any thud-next/thud-nmut branches.
>
> On Sun, Apr 7, 2019 at 11:24 AM Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     There are the commit I intend on sending a pull request for in two
>     days. Tuesday my timezone (IST)
>
>     Please provide feedback by then if there are any issues. This is
>     mostly OEQA changes. They have been througt the AB a-full and passe=
d.
>
>     The following changes since commit
>     45032e30be70503faeee468159b216031b729309:
>
>     =C2=A0 build-appliance-image: Update to thud head revision (2019-03=
-27
>     23:22:49 +0000)
>
>     are available in the git repository at:
>
>     =C2=A0 git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib>
>     stable/thud-nmut
>     =C2=A0 http://cgit.openembedded.org//log/?h=3Dstable/thud-nmut
>
>     Armin Kuster (1):
>     =C2=A0 Revert "boost: update to 1.69.0"
>
>     Chen Qi (1):
>     =C2=A0 pkgdata.py: avoid target-sdk-dummy-provides to mess things u=
p
>
>     Mazliana (1):
>     =C2=A0 oeqa/manual/bsp-hw.json: add non-IA tests
>
>     Richard Purdie (2):
>     =C2=A0 resulttool: Allow store to work on single files
>     =C2=A0 resulttool: Allow extraction of ptest data
>
>     Sudhir Sharma (1):
>     =C2=A0 oeqa/manual: Add manual runtime 'compliance' testcases to js=
on
>
>     Yeoh Ee Peng (6):
>     =C2=A0 oeqa/manual/toaster: transfer manual toaster test cases to o=
eqa
>     =C2=A0 oeqa/manual/toaster: updated test id naming
>     =C2=A0 resulttool/manualexecution: Standardize input check
>     =C2=A0 resulttool/manualexecution: Enable display full steps withou=
t press
>     =C2=A0 =C2=A0 enter
>     =C2=A0 resulttool/manualexecution: Fixed step sorted by integer
>     =C2=A0 resulttool/manualexecution: Refactor and simplify codebase
>
>     sangeeta jain (4):
>     =C2=A0 oeqa/manual/sdk.json: Updated toolchain tarball to core-imag=
e-sato
>     =C2=A0 oeqa/manual/bsp-hw.json: test id updated and obsolete test c=
ases
>     =C2=A0 =C2=A0 removed
>     =C2=A0 oeqa/manual/compliance-test.json: test id updated and missin=
g test
>     =C2=A0 =C2=A0 cases added
>     =C2=A0 oeqa/manual/kernel-dev.json: test id updated
>
>     =C2=A0meta/lib/oeqa/manual/bsp-hw.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 264 +-
>     =C2=A0meta/lib/oeqa/manual/compliance-test.json=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 194 ++
>     =C2=A0meta/lib/oeqa/manual/kernel-dev.json=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A036 +-
>     =C2=A0meta/lib/oeqa/manual/sdk.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A014 +-
>     =C2=A0meta/lib/oeqa/manual/toaster-managed-mode.json=C2=A0 =C2=A0 =C2=
=A0| 2572
>     ++++++++++++++++++++
>     =C2=A0meta/lib/oeqa/manual/toaster-unmanaged-mode.json=C2=A0 =C2=A0=
| 1170 +++++++++
>     =C2=A0meta/lib/oeqa/selftest/cases/pkgdata.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +
>     =C2=A0...bjam-native_1.69.0.bb <http://bjam-native_1.69.0.bb> =3D>
>     bjam-native_1.68.0.bb <http://bjam-native_1.68.0.bb>} |=C2=A0 =C2=A0=
 0
>     =C2=A0.../boost/{boost-1.69.0.inc =3D> boost-1.68.0.inc}=C2=A0 =C2=A0=
|=C2=A0 =C2=A0 4 +-
>     =C2=A0meta/recipes-support/boost/boost.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +
>     =C2=A0...-arch-instruction-set-flags-we-do-that-o.patch} |=C2=A0 =C2=
=A023 +-
>     =C2=A0...ucibility-add-file-directive-to-assembler.patch |=C2=A0 24=
3 ++
>     =C2=A0.../boost/{boost_1.69.0.bb <http://boost_1.69.0.bb> =3D>
>     boost_1.68.0.bb <http://boost_1.68.0.bb>}=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A0 6 +-
>     =C2=A0scripts/lib/resulttool/manualexecution.py=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A061 +-
>     =C2=A0scripts/lib/resulttool/resultutils.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A039 +-
>     =C2=A0scripts/lib/resulttool/store.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A023 +-
>     =C2=A016 files changed, 4467 insertions(+), 184 deletions(-)
>     =C2=A0create mode 100644 meta/lib/oeqa/manual/compliance-test.json
>     =C2=A0create mode 100644 meta/lib/oeqa/manual/toaster-managed-mode.=
json
>     =C2=A0create mode 100644 meta/lib/oeqa/manual/toaster-unmanaged-mod=
e.json
>     =C2=A0rename meta/recipes-support/boost/{bjam-native_1.69.0.bb
>     <http://bjam-native_1.69.0.bb> =3D> bjam-native_1.68.0.bb
>     <http://bjam-native_1.68.0.bb>} (100%)
>     =C2=A0rename meta/recipes-support/boost/{boost-1.69.0.inc =3D>
>     boost-1.68.0.inc} (85%)
>     =C2=A0rename
>     meta/recipes-support/boost/boost/{0001-Don-t-set-up-arch-instructio=
n-set-flags-we-do-that-o.patch
>     =3D>
>     0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch} (9=
3%)
>     =C2=A0create mode 100644
>     meta/recipes-support/boost/boost/reproducibility-add-file-directive=
-to-assembler.patch
>     =C2=A0rename meta/recipes-support/boost/{boost_1.69.0.bb
>     <http://boost_1.69.0.bb> =3D> boost_1.68.0.bb
>     <http://boost_1.68.0.bb>} (56%)
>
>     --=20
>     2.7.4
>
>     --=20
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------DFB18D1A63BD3A63628D99E7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/10/19 3:01 AM, Martin Jansa wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQd2dqK4LyTeKRwROvSwtwFC23GO9fWB3GpFTwGz91ytMQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Please don't forget to include:
          <div><a
href="http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280094.html"
              moz-do-not-send="true">http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280094.html</a><br>
          </div>
          <div>and similar one for sumo:</div>
          <div><a
href="http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280093.html"
              moz-do-not-send="true">http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280093.html</a></div>
          <div>in the next pull.</div>
        </div>
      </div>
    </blockquote>
    Thanks for the reminder. My focus on this batch was getting more of
    the automated QA bits in.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CA+chaQd2dqK4LyTeKRwROvSwtwFC23GO9fWB3GpFTwGz91ytMQ@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr">
          <div>I don't see them included in any thud-next/thud-nmut
            branches.</div>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Sun, Apr 7, 2019 at 11:24
          AM Armin Kuster &lt;<a href="mailto:akuster808@gmail.com"
            moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">There
          are the commit I intend on sending a pull request for in two
          days. Tuesday my timezone (IST)<br>
          <br>
          Please provide feedback by then if there are any issues. This
          is mostly OEQA changes. They have been througt the AB a-full
          and passed.<br>
          <br>
          The following changes since commit
          45032e30be70503faeee468159b216031b729309:<br>
          <br>
            build-appliance-image: Update to thud head revision
          (2019-03-27 23:22:49 +0000)<br>
          <br>
          are available in the git repository at:<br>
          <br>
            git://<a
            href="http://git.openembedded.org/openembedded-core-contrib"
            rel="noreferrer" target="_blank" moz-do-not-send="true">git.openembedded.org/openembedded-core-contrib</a>
          stable/thud-nmut<br>
            <a
            href="http://cgit.openembedded.org//log/?h=stable/thud-nmut"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://cgit.openembedded.org//log/?h=stable/thud-nmut</a><br>
          <br>
          Armin Kuster (1):<br>
            Revert "boost: update to 1.69.0"<br>
          <br>
          Chen Qi (1):<br>
            pkgdata.py: avoid target-sdk-dummy-provides to mess things
          up<br>
          <br>
          Mazliana (1):<br>
            oeqa/manual/bsp-hw.json: add non-IA tests<br>
          <br>
          Richard Purdie (2):<br>
            resulttool: Allow store to work on single files<br>
            resulttool: Allow extraction of ptest data<br>
          <br>
          Sudhir Sharma (1):<br>
            oeqa/manual: Add manual runtime 'compliance' testcases to
          json<br>
          <br>
          Yeoh Ee Peng (6):<br>
            oeqa/manual/toaster: transfer manual toaster test cases to
          oeqa<br>
            oeqa/manual/toaster: updated test id naming<br>
            resulttool/manualexecution: Standardize input check<br>
            resulttool/manualexecution: Enable display full steps
          without press<br>
              enter<br>
            resulttool/manualexecution: Fixed step sorted by integer<br>
            resulttool/manualexecution: Refactor and simplify codebase<br>
          <br>
          sangeeta jain (4):<br>
            oeqa/manual/sdk.json: Updated toolchain tarball to
          core-image-sato<br>
            oeqa/manual/bsp-hw.json: test id updated and obsolete test
          cases<br>
              removed<br>
            oeqa/manual/compliance-test.json: test id updated and
          missing test<br>
              cases added<br>
            oeqa/manual/kernel-dev.json: test id updated<br>
          <br>
           meta/lib/oeqa/manual/bsp-hw.json                   |  264 +-<br>
           meta/lib/oeqa/manual/compliance-test.json          |  194 ++<br>
           meta/lib/oeqa/manual/kernel-dev.json               |   36 +-<br>
           meta/lib/oeqa/manual/sdk.json                      |   14 +-<br>
           meta/lib/oeqa/manual/toaster-managed-mode.json     | 2572
          ++++++++++++++++++++<br>
           meta/lib/oeqa/manual/toaster-unmanaged-mode.json   | 1170
          +++++++++<br>
           meta/lib/oeqa/selftest/cases/pkgdata.py            |    1 +<br>
           ...<a href="http://bjam-native_1.69.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">bjam-native_1.69.0.bb</a>
          =&gt; <a href="http://bjam-native_1.68.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">bjam-native_1.68.0.bb</a>}
          |    0<br>
           .../boost/{boost-1.69.0.inc =&gt; boost-1.68.0.inc}   |    4
          +-<br>
           meta/recipes-support/boost/boost.inc               |    1 +<br>
           ...-arch-instruction-set-flags-we-do-that-o.patch} |   23 +-<br>
           ...ucibility-add-file-directive-to-assembler.patch |  243 ++<br>
           .../boost/{<a href="http://boost_1.69.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">boost_1.69.0.bb</a>
          =&gt; <a href="http://boost_1.68.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">boost_1.68.0.bb</a>} 
             |    6 +-<br>
           scripts/lib/resulttool/manualexecution.py          |   61 +-<br>
           scripts/lib/resulttool/resultutils.py              |   39 +-<br>
           scripts/lib/resulttool/store.py                    |   23 +-<br>
           16 files changed, 4467 insertions(+), 184 deletions(-)<br>
           create mode 100644 meta/lib/oeqa/manual/compliance-test.json<br>
           create mode 100644
          meta/lib/oeqa/manual/toaster-managed-mode.json<br>
           create mode 100644
          meta/lib/oeqa/manual/toaster-unmanaged-mode.json<br>
           rename meta/recipes-support/boost/{<a
            href="http://bjam-native_1.69.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">bjam-native_1.69.0.bb</a>
          =&gt; <a href="http://bjam-native_1.68.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">bjam-native_1.68.0.bb</a>}
          (100%)<br>
           rename meta/recipes-support/boost/{boost-1.69.0.inc =&gt;
          boost-1.68.0.inc} (85%)<br>
           rename
meta/recipes-support/boost/boost/{0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
          =&gt;
          0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch}
          (93%)<br>
           create mode 100644
meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch<br>
           rename meta/recipes-support/boost/{<a
            href="http://boost_1.69.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">boost_1.69.0.bb</a>
          =&gt; <a href="http://boost_1.68.0.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">boost_1.68.0.bb</a>}
          (56%)<br>
          <br>
          -- <br>
          2.7.4<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------DFB18D1A63BD3A63628D99E7--
