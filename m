Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF4871DD2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 10:26:28 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id v23so66464927qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 02:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jVSe7d9Y+ycjDrT+4As0NamU8rr92s8s1RTy83cc0g0=;
	b=TUNUKkRcV4ebZUWMJL+I0mnqSTZK/pU7NUveL7e5L2nbs/MPDiudu2EfhCQXZHB3hs
	+PP1Zqecl6hYoOiuecE21GvRfSV0M/QxFho0zCBCaPNpgblSWVDOv0xbq9Oifyz9F5B2
	GXPUlfsDbFRFLDu/zrxgOZT8donpzhZFrCF5zlYoggOZ55Yzi6qkaHQjkW8zO2XAkONo
	qeRJcAqPX761LKz+k6mHdyG/amXQdNprdUNdKQpBESr5TGYlgm+ayvuMUH2QBGUlP/g1
	lHI0917iX/mCGMryjjeafFQEPj8o6uuU9WwQvfuwOC6Lm8hd5vreLBnJjEQHKrmnQqQM
	qbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jVSe7d9Y+ycjDrT+4As0NamU8rr92s8s1RTy83cc0g0=;
	b=O6PQ8G5w9SYD6oz3JrseEzI3Slrr6xGJBBM0hO31aQFqlFR5towXg3vPwDAxY4AjHU
	ITYpBjrzm5Y/lwDp5oKt0bTnVy8FgRc94xPzFBD8H9bKlS6Xi8iFOt1Q4jC2IkoSCPVl
	ULsmou8PMIina/5bfo91zrNwvdZ4bvVwavFUuWr6R7br+umDNOED97Ax6TFSjPUjoc1o
	go7PS3WC4c4c4jSjkpbMUBTnEIVuqLQRddYb8ffiRyBagWHvcJ+fDswpNrwJZeaVJaFn
	Kn+UPUJBjhhF9GVJ5ENcNOaqm9w9skhJrV6o2JQhRgBUL0qzGI66XqHf8cbl1ypnH8RJ
	FTWg==
X-Gm-Message-State: AIkVDXK0xLDlPrwRMV4TuLH1BJdvEppf1OwQi/jQHvKoDQ8A6psK70yN0MhVsr+SbvLB9/9kRDzSbJEMhwgGjhOG
X-Received: by 10.237.36.208 with SMTP id u16mr1800865qtc.105.1485426388525;
	Thu, 26 Jan 2017 02:26:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 26 Jan 2017 02:26:08 -0800 (PST)
In-Reply-To: <20170120191710.17968-1-randy.e.witt@linux.intel.com>
References: <be9e6961aeb991fc0e0acc1118aa01cefe945593.1484866303.git.randy.e.witt@linux.intel.com>
	<20170120191710.17968-1-randy.e.witt@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jan 2017 10:26:08 +0000
Message-ID: <CAJTo0Lautqo1tzGF7Uc8H-+J6D9ogHbkSV7NH2cu=5mtyMe+vg@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] selftest/containerimage.py: Add container IMAGE_FSTYPES test
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
X-List-Received-Date: Thu, 26 Jan 2017 10:26:30 -0000
Content-Type: multipart/alternative; boundary=001a114104ce3a79c90546fcc801

--001a114104ce3a79c90546fcc801
Content-Type: text/plain; charset=UTF-8

FAIL [40.619s]: test_expected_files
(oeqa.selftest.containerimage.ContainerImageTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File
"/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/containerimage.py",
line 82, in test_expected_files
    self.assertEqual(result.output.split('\n'), expected_files)
AssertionError: Lists differ: ['tar:
/home/pokybuild/yocto-autobuilder/yo[191 chars]now'] != ['./', './etc/',
'./etc/default/', './etc/d[262 chars]kg/']

First differing element 0:
tar:
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/deploy/images/qemux86-64/container-test-image-qemux86.tar.bz2:
Cannot open: No such file or directory
./

Second list contains 16 additional elements.
First extra element 2:
./etc/default/

- ['tar: '
-
 '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/deploy/images/qemux86-64/container-test-image-qemux86.tar.bz2:
'
-  'Cannot open: No such file or directory',
-  'tar: Error is not recoverable: exiting now']
+ ['./',
+  './etc/',
+  './etc/default/',
+  './etc/default/postinst',
+  './etc/ld.so.cache',
+  './etc/timestamp',
+  './etc/version',
+  './run/',
+  './usr/',
+  './usr/bin/',
+  './usr/bin/theapp',
+  './var/',
+  './var/cache/',
+  './var/cache/ldconfig/',
+  './var/cache/ldconfig/aux-cache',
+  './var/cache/opkg/',
+  './var/lib/',
+  './var/lib/opkg/']

The test needs to handle tar failing, and appears to be confused as to
whether its building for qemux86 or qemux86-64 (see the path that tar tries
to list).

Ross

--001a114104ce3a79c90546fcc801
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FAIL [40.619s]: test_expected_files (oeqa.selftest.contain=
erimage.ContainerImageTests)<br>-------------------------------------------=
---------------------------<br>Traceback (most recent call last):<br>=C2=A0=
 File &quot;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selft=
est/build/meta/lib/oeqa/selftest/containerimage.py&quot;, line 82, in test_=
expected_files<br>=C2=A0 =C2=A0 self.assertEqual(result.output.split(&#39;\=
n&#39;), expected_files)<br>AssertionError: Lists differ: [&#39;tar: /home/=
pokybuild/yocto-autobuilder/yo[191 chars]now&#39;] !=3D [&#39;./&#39;, &#39=
;./etc/&#39;, &#39;./etc/default/&#39;, &#39;./etc/d[262 chars]kg/&#39;]<br=
><br>First differing element 0:<br>tar: /home/pokybuild/yocto-autobuilder/y=
octo-worker/nightly-oe-selftest/build/build/tmp/deploy/images/qemux86-64/co=
ntainer-test-image-qemux86.tar.bz2: Cannot open: No such file or directory<=
br>./<br><br>Second list contains 16 additional elements.<br>First extra el=
ement 2:<br>./etc/default/<br><br>- [&#39;tar: &#39;<br>- =C2=A0&#39;/home/=
pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tm=
p/deploy/images/qemux86-64/container-test-image-qemux86.tar.bz2: &#39;<br>-=
 =C2=A0&#39;Cannot open: No such file or directory&#39;,<br>- =C2=A0&#39;ta=
r: Error is not recoverable: exiting now&#39;]<br>+ [&#39;./&#39;,<br>+ =C2=
=A0&#39;./etc/&#39;,<br>+ =C2=A0&#39;./etc/default/&#39;,<br>+ =C2=A0&#39;.=
/etc/default/postinst&#39;,<br>+ =C2=A0&#39;./etc/ld.so.cache&#39;,<br>+ =
=C2=A0&#39;./etc/timestamp&#39;,<br>+ =C2=A0&#39;./etc/version&#39;,<br>+ =
=C2=A0&#39;./run/&#39;,<br>+ =C2=A0&#39;./usr/&#39;,<br>+ =C2=A0&#39;./usr/=
bin/&#39;,<br>+ =C2=A0&#39;./usr/bin/theapp&#39;,<br>+ =C2=A0&#39;./var/&#3=
9;,<br>+ =C2=A0&#39;./var/cache/&#39;,<br>+ =C2=A0&#39;./var/cache/ldconfig=
/&#39;,<br>+ =C2=A0&#39;./var/cache/ldconfig/aux-cache&#39;,<br>+ =C2=A0&#3=
9;./var/cache/opkg/&#39;,<br>+ =C2=A0&#39;./var/lib/&#39;,<br>+ =C2=A0&#39;=
./var/lib/opkg/&#39;]<div><br></div><div>The test needs to handle tar faili=
ng, and appears to be confused as to whether its building for qemux86 or qe=
mux86-64 (see the path that tar tries to list).</div><div><br></div><div>Ro=
ss</div></div>

--001a114104ce3a79c90546fcc801--
