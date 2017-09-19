Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 92A7277DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 08:10:14 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id k101so8108598iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 01:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=gKOgf4f+dVaGfkwQXFkhcZkbTrlFb2P2lWpXr+7r2lM=;
	b=sTtT1wrr7CSoc23sC9Nz22ZsS+pvskB6uj6V4ES7XYEgNIlawbQMzYkZeqgqq0050C
	/8lKH7OSHjTw7ufpq8W+kRntvUaw+wvVxNxw/DdGrsY++qEU68RVA1idMVZiBVMTcYJQ
	Ud5a4YXMPX6UDQf9KQpZD57mukVk61gG/1jJzj1K76YQTNksuVs+LYrl5sbK94yyKEcl
	NsHX5z5iulWKFM7uL0UCAPLxWnpd44bFpBiskEX3r7OQEJjYadMCIhUcXFAFcKXqVQoR
	0IrIm+DH+mMIyla8W2rC86RB4lsJ7HNXFw+/wEt7A1BIRLd4VSJD7gabZaWCdYit9O27
	L9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=gKOgf4f+dVaGfkwQXFkhcZkbTrlFb2P2lWpXr+7r2lM=;
	b=DHFXwEEFlJJUe3y1+6VNz1BZycu18QGL8HrWpWFiTmKX61q70SZnfIii9M2OCj/IKC
	qKZbcU2MahswFR0A8rO55mQTNjEo7PwXqxFCJAGcQ+t5pJij5kEXBeMjALUDHHZqq38z
	lf2jLt7sK0r+S3awrrggPzox5FV2K+u8byoJHHAGq5khQDBcC2bSsDj7A3rdQQPRzc8r
	gj5k351q/8Uu+y2r+DvhOif5lrip6iB4pq1jElM+l1FSfPF6M61NO/suvDvoJpZS1nmj
	ZoJTCQ0NUaJV/5S8Npxvk7zBjOsBjQz2N3QmZP53zVSL+uQjWHHM7ia7mbfcHzJMHhBJ
	KKUw==
X-Gm-Message-State: AHPjjUhluEfNUNa6Ohn2iPc0t2kgaILDtGFpmS/c2PIbG29eaUa/ZcIb
	XF3Xx8VFEB4XcPyck6FEMhsCwR5/nEv/YBbTsG3JtonD
X-Google-Smtp-Source: AOwi7QBjHoQ6pzqwY4Iwuwn7fC8Z/Xw3OCw1//o7TV3rs9RWc+FNj9JRzL07xW8CTFr3Ag4i9Dr/g+/0ijqHxdKamw0=
X-Received: by 10.107.32.70 with SMTP id g67mr807474iog.77.1505808615296; Tue,
	19 Sep 2017 01:10:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 01:09:54 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 09:09:54 +0100
Message-ID: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Use of github /archive/ tarballs in SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 08:10:14 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2c9d863c05598663fe"

--001a1140ae2c9d863c05598663fe
Content-Type: text/plain; charset="UTF-8"

Hi,

Some people have insisted for a long time that the dynamically generated
/archive/ tarballs at github cannot be trusted for long-term stability, as
they are generated using git-archive.  Others said that git-archive takes
measures to ensure the files are identical, and basic testing does indeed
show that.  Personally I was on the fence: a dynamically generated tarball
that is cached *could* change, but the git-archive generates the same file
list and the tools are stable.

Then the tarball for one of Erlang's repositories changed, and was noticed
by the checksum in the recipe (thanks Gunnar Andersson for reporting
this).  The extracted contents are identical, but the tarball itself has
changed.  I'm presuming this is due to the old tarball expiring in their
cache, and a newly generated tarball using a later version of tar.

So we now have documented evidence that this can and does happen, and it's
quite frustrating when this happens.  So, I suggest that use of github.com
/archive/ URLs be considered a bad practise for the primary SRC_URI tarball.

I'm working my way through the recipes in oe-core that use /archive/ and
replacing them with either maintainer-generated tarballs or git clones, but
there are a number of recipes in meta-oe which could do with fixing:

$ git grep -l -E github\\.com/.*/archive/
meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
meta-oe/recipes-connectivity/libuv/libuv_1.11.0.bb
meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
meta-oe/recipes-kernel/crash/crash_7.1.9.bb
meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb
meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
meta-oe/recipes-test/gtest/gtest_1.8.0.bb
meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_5.2.bb
meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.015.bb

Ross

--001a1140ae2c9d863c05598663fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Some people have insisted for a lon=
g time that the dynamically generated /archive/ tarballs at github cannot b=
e trusted for long-term stability, as they are generated using git-archive.=
=C2=A0 Others said that git-archive takes measures to ensure the files are =
identical, and basic testing does indeed show that.=C2=A0 Personally I was =
on the fence: a dynamically generated tarball that is cached *could* change=
, but the git-archive generates the same file list and the tools are stable=
.</div><div><br></div><div>Then the tarball for one of Erlang&#39;s reposit=
ories changed, and was noticed by the checksum in the recipe (thanks Gunnar=
 Andersson for reporting this).=C2=A0 The extracted contents are identical,=
 but the tarball itself has changed.=C2=A0 I&#39;m presuming this is due to=
 the old tarball expiring in their cache, and a newly generated tarball usi=
ng a later version of tar.</div><div><br></div><div>So we now have document=
ed evidence that this can and does happen, and it&#39;s quite frustrating w=
hen this happens.=C2=A0 So, I suggest that use of <a href=3D"http://github.=
com">github.com</a> /archive/ URLs be considered a bad practise for the pri=
mary SRC_URI tarball.</div><div><br></div><div>I&#39;m working my way throu=
gh the recipes in oe-core that use /archive/ and replacing them with either=
 maintainer-generated tarballs or git clones, but there are a number of rec=
ipes in meta-oe which could do with fixing:</div><div><br></div><div><div>$=
 git grep -l -E github\\.com/.*/archive/</div><div>meta-initramfs/recipes-d=
evtools/grubby/<a href=3D"http://grubby_8.40.bb">grubby_8.40.bb</a></div><d=
iv>meta-multimedia/recipes-support/gst-instruments/<a href=3D"http://gst-in=
struments_0.2.3.bb">gst-instruments_0.2.3.bb</a></div><div>meta-multimedia/=
recipes-support/libsrtp/<a href=3D"http://libsrtp_1.5.2.bb">libsrtp_1.5.2.b=
b</a></div><div>meta-networking/recipes-support/geoip/<a href=3D"http://geo=
ip-perl_1.50.bb">geoip-perl_1.50.bb</a></div><div>meta-oe/recipes-connectiv=
ity/libuv/<a href=3D"http://libuv_1.11.0.bb">libuv_1.11.0.bb</a></div><div>=
meta-oe/recipes-connectivity/libwebsockets/<a href=3D"http://libwebsockets_=
2.1.0.bb">libwebsockets_2.1.0.bb</a></div><div>meta-oe/recipes-devtools/pro=
tobuf/<a href=3D"http://protobuf-c_1.2.1.bb">protobuf-c_1.2.1.bb</a></div><=
div>meta-oe/recipes-devtools/python/<a href=3D"http://python-cpuset_1.5.7.b=
b">python-cpuset_1.5.7.bb</a></div><div>meta-oe/recipes-extended/boinc/<a h=
ref=3D"http://boinc-client_7.6.33.bb">boinc-client_7.6.33.bb</a></div><div>=
meta-oe/recipes-graphics/libvncserver/<a href=3D"http://libvncserver_0.9.11=
.bb">libvncserver_0.9.11.bb</a></div><div>meta-oe/recipes-graphics/openjpeg=
/<a href=3D"http://openjpeg_2.1.1.bb">openjpeg_2.1.1.bb</a></div><div>meta-=
oe/recipes-kernel/crash/<a href=3D"http://crash_7.1.9.bb">crash_7.1.9.bb</a=
></div><div>meta-oe/recipes-multimedia/mplayer/<a href=3D"http://mpv_0.24.0=
.bb">mpv_0.24.0.bb</a></div><div>meta-oe/recipes-support/hunspell/<a href=
=3D"http://hunspell_1.6.1.bb">hunspell_1.6.1.bb</a></div><div>meta-oe/recip=
es-support/lm_sensors/<a href=3D"http://lmsensors_3.4.0.bb">lmsensors_3.4.0=
.bb</a></div><div>meta-oe/recipes-test/gtest/<a href=3D"http://gtest_1.8.0.=
bb">gtest_1.8.0.bb</a></div><div>meta-perl/recipes-perl/libmodule/<a href=
=3D"http://libmodule-pluggable-perl_5.2.bb">libmodule-pluggable-perl_5.2.bb=
</a></div><div>meta-perl/recipes-perl/libmodule/<a href=3D"http://libmodule=
-runtime-perl_0.015.bb">libmodule-runtime-perl_0.015.bb</a></div></div><div=
><br></div><div>Ross</div></div>

--001a1140ae2c9d863c05598663fe--
