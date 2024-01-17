Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B604EC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 22:44:13 +0000 (UTC)
Subject: Re: [PATCH 1/2] perl: Add option to prevent COMPLEMENTARY_GLOB from ignoring perl-modules
To: openembedded-core@lists.openembedded.org
From: "Lyu, William" <william.lyu@windriver.com>
X-Originating-Location: Collingwood, Ontario, CA (174.92.25.101)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Jan 2024 14:44:04 -0800
References: <CANNYZj_CPwSSG1G95gGkaS72komPiXgZ8M=kDLJu_r2JW2M8dA@mail.gmail.com>
In-Reply-To: <CANNYZj_CPwSSG1G95gGkaS72komPiXgZ8M=kDLJu_r2JW2M8dA@mail.gmail.com>
Message-ID: <13946.1705531444990133170@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7plrfCAFM7m6GjSGupLc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 22:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193949

--7plrfCAFM7m6GjSGupLc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have iteratively added the following 45 modules, and I still not at the p=
oint of covering all perl-module-* dependencies for openssl-test. Should I =
continue on with this effort? Using "perl-module-force-all" is a lot more c=
onvenient without conflicting with any existing usage of "perl-modules" - e=
ven including the ones that depends on "perl-modules" having the property o=
f being a soft dependency ("perl-modules" RRECOMMENDS all of its packages).

William

List of perl-module-* I have iteratively added up to this point:

perl-module-base
perl-module-carp
perl-module-config
perl-module-constant
perl-module-cwd
perl-module-data-dumper
perl-module-digest-sha
perl-module-encode
perl-module-errno
perl-module-exporter
perl-module-fcntl
perl-module-feature
perl-module-file-basename
perl-module-file-compare
perl-module-file-copy
perl-module-file-glob
perl-module-filehandle
perl-module-file-path
perl-module-file-spec
perl-module-file-spec-functions
perl-module-file-temp
perl-module-findbin
perl-module-getopt-long
perl-module-getopt-std
perl-module-io-select
perl-module-io-socket
perl-module-ipc-cmd
perl-module-ipc-open2
perl-module-lib
perl-module-list-util
perl-module-math-bigint
perl-module-mime-base64
perl-module-parent
perl-module-pod-html
perl-module-pod-usage
perl-module-posix
perl-module-scalar-util
perl-module-storable
perl-module-strict
perl-module-test-harness
perl-module-test-more
perl-module-time-local
perl-module-utf8
perl-module-vars
perl-module-warnings

--7plrfCAFM7m6GjSGupLc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I have iteratively added the following 45 modules, and I still not at th=
e point of covering all perl-module-* dependencies for openssl-test. Should=
 I continue on with this effort? Using "perl-module-force-all" is a lot mor=
e convenient without conflicting with any existing usage of "perl-modules" =
- even including the ones that depends on "perl-modules" having the propert=
y of being a soft dependency ("perl-modules" RRECOMMENDS all of its package=
s).&nbsp;<br /><br />William<br /><br />List of perl-module-* I have iterat=
ively added up to this point:</p>
<div style=3D"padding-left: 30px;">perl-module-base</div>
<div style=3D"padding-left: 30px;">perl-module-carp</div>
<div style=3D"padding-left: 30px;">perl-module-config</div>
<div style=3D"padding-left: 30px;">perl-module-constant</div>
<div style=3D"padding-left: 30px;">perl-module-cwd</div>
<div style=3D"padding-left: 30px;">perl-module-data-dumper</div>
<div style=3D"padding-left: 30px;">perl-module-digest-sha</div>
<div style=3D"padding-left: 30px;">perl-module-encode</div>
<div style=3D"padding-left: 30px;">perl-module-errno</div>
<div style=3D"padding-left: 30px;">perl-module-exporter</div>
<div style=3D"padding-left: 30px;">perl-module-fcntl</div>
<div style=3D"padding-left: 30px;">perl-module-feature</div>
<div style=3D"padding-left: 30px;">perl-module-file-basename</div>
<div style=3D"padding-left: 30px;">perl-module-file-compare</div>
<div style=3D"padding-left: 30px;">perl-module-file-copy</div>
<div style=3D"padding-left: 30px;">perl-module-file-glob</div>
<div style=3D"padding-left: 30px;">perl-module-filehandle</div>
<div style=3D"padding-left: 30px;">perl-module-file-path</div>
<div style=3D"padding-left: 30px;">perl-module-file-spec</div>
<div style=3D"padding-left: 30px;">perl-module-file-spec-functions</div>
<div style=3D"padding-left: 30px;">perl-module-file-temp</div>
<div style=3D"padding-left: 30px;">perl-module-findbin</div>
<div style=3D"padding-left: 30px;">perl-module-getopt-long</div>
<div style=3D"padding-left: 30px;">perl-module-getopt-std</div>
<div style=3D"padding-left: 30px;">perl-module-io-select</div>
<div style=3D"padding-left: 30px;">perl-module-io-socket</div>
<div style=3D"padding-left: 30px;">perl-module-ipc-cmd</div>
<div style=3D"padding-left: 30px;">perl-module-ipc-open2</div>
<div style=3D"padding-left: 30px;">perl-module-lib</div>
<div style=3D"padding-left: 30px;">perl-module-list-util</div>
<div style=3D"padding-left: 30px;">perl-module-math-bigint</div>
<div style=3D"padding-left: 30px;">perl-module-mime-base64</div>
<div style=3D"padding-left: 30px;">perl-module-parent</div>
<div style=3D"padding-left: 30px;">perl-module-pod-html</div>
<div style=3D"padding-left: 30px;">perl-module-pod-usage</div>
<div style=3D"padding-left: 30px;">perl-module-posix</div>
<div style=3D"padding-left: 30px;">perl-module-scalar-util</div>
<div style=3D"padding-left: 30px;">perl-module-storable</div>
<div style=3D"padding-left: 30px;">perl-module-strict</div>
<div style=3D"padding-left: 30px;">perl-module-test-harness</div>
<div style=3D"padding-left: 30px;">perl-module-test-more</div>
<div style=3D"padding-left: 30px;">perl-module-time-local</div>
<div style=3D"padding-left: 30px;">perl-module-utf8</div>
<div style=3D"padding-left: 30px;">perl-module-vars</div>
<div style=3D"padding-left: 30px;">perl-module-warnings</div>

--7plrfCAFM7m6GjSGupLc--

