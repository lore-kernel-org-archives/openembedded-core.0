Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SNQ6S-0000hb-0Z
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 16:55:28 +0200
Received: by eaae1 with SMTP id e1so306975eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 07:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=13O2c/BFPxXubb2UkvtOIKoy7kjpc9kEGmE7j7O4fIU=;
	b=oZDADrB55fJOshXU+Ssqbqspp4khXJDTfgXttJ/9WVrdzSq3/d8tITrRvbBFwvb2QX
	oxsVH7//OOhModrHX2a92ofeC3yPBK1EWtcBuU4XwkUzNDCzycnVcSyIFeQUdbeFCbeQ
	bXDPpRW8+n4Hl/QYj4fwv0F88p//BQeCDMTpse8Vsy2JMRGGAcn4bdJtCPRrZELfxgNh
	KGpiO0CSshCcE159DzxLUEMzW/efyuxry/QExRKqSaokf/3jN+B61L9wptayu72W3RMC
	GDiSlqTgX+u7QMx7pMYQAsDjEeI3Xzf7FvHFJQW7HDSG4iZPLjCdIJn0p95As52SasMa
	hIQw==
Received: by 10.14.96.196 with SMTP id r44mr1659471eef.87.1335451550845;
	Thu, 26 Apr 2012 07:45:50 -0700 (PDT)
Received: from [172.20.1.24] (ip5451781a.direct-adsl.nl. [84.81.120.26])
	by mx.google.com with ESMTPS id r44sm15545595eef.2.2012.04.26.07.45.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 07:45:49 -0700 (PDT)
References: <cover.1335439784.git.Martin.Jansa@gmail.com>
	<e0f2862c212677d238136b7331fdd29c50b2fd6b.1335439784.git.Martin.Jansa@gmail.com>
	<9FF057B5-BEFA-4A3B-8A77-BA1AB463650A@dominion.thruhere.net>
	<20120426135530.GD3646@jama.jama.net>
In-Reply-To: <20120426135530.GD3646@jama.jama.net>
Mime-Version: 1.0 (1.0)
Message-Id: <17342969-FB77-40A1-8B9B-39F294D84FB3@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (9B176)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 26 Apr 2012 16:46:30 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmYvuFTcDdAVI5eWr5geNrIWRc9jvhvsUOkOq3VnerUlD/L5cK805poBfAPAOeynQU85qra
Subject: Re: [PATCH 2/2] opkg-utils: bump SRCREV for Packages cache fix and other fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2012 14:55:28 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 26 apr. 2012 om 15:55 heeft Martin Jansa <martin.jansa@gmail.com> het vol=
gende geschreven:

> On Thu, Apr 26, 2012 at 03:51:38PM +0200, Koen Kooi wrote:
>>=20
>>=20
>> Op 26 apr. 2012 om 15:19 heeft Martin Jansa <martin.jansa@gmail.com> het v=
olgende geschreven:
>>=20
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>> .../opkg-utils/opkg-utils/add-license-field.patch  |   39 -----------
>>> .../opkg-utils/arfile_header_split.patch           |   27 -------
>>> .../opkg-utils/index-ignore-filenotfound.patch     |   73 --------------=
------
>>> .../opkg-utils/opkg-utils/mtime-int.patch          |   30 --------
>>> .../opkg-utils/opkg-utils/shebang.patch            |   46 ------------
>>> meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    7 +--
>>> 6 files changed, 1 insertions(+), 221 deletions(-)
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/add-licen=
se-field.patch
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/arfile_he=
ader_split.patch
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/index-ign=
ore-filenotfound.patch
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int=
.patch
>>> delete mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shebang.p=
atch
>>>=20
>>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/add-license-fie=
ld.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.pat=
ch
>>> deleted file mode 100644
>>> index 0d33459..0000000
>>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils/add-license-field.patc=
h
>>> +++ /dev/null
>>> @@ -1,39 +0,0 @@
>>> -Add knowledge about License field in ipk headers
>>> -
>>> -Upstream-Status: Pending
>>> -
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> -
>>> -Index: opkg-utils/opkg.py
>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ---- opkg-utils.orig/opkg.py    2010-11-01 04:52:35.000000000 -0700
>>> -+++ opkg-utils/opkg.py    2011-07-13 15:18:03.900037344 -0700
>>> -@@ -145,6 +145,7 @@
>>> -         self.priority =3D None
>>> -         self.tags =3D None
>>> -         self.fn =3D fn
>>> -+        self.license =3D None
>>> -=20
>>> -         if fn:
>>> -             # see if it is deb format
>>> -@@ -319,6 +320,12 @@
>>> -     def get_section(self, section):
>>> -         return self.section
>>> -=20
>>> -+    def set_license(self, license):
>>> -+        self.license =3D license
>>> -+
>>> -+    def get_license(self, license):
>>> -+        return self.license
>>> -+
>>> -     def get_file_list(self):
>>> -         if not self.fn:
>>> -             return []
>>> -@@ -425,6 +432,7 @@
>>> -         if self.description: out =3D out + "Description: %s\n" % (self=
.description)
>>> -         if self.oe: out =3D out + "OE: %s\n" % (self.oe)
>>> -         if self.homepage: out =3D out + "HomePage: %s\n" % (self.homep=
age)
>>> -+        if self.license: out =3D out + "License: %s\n" % (self.license=
)
>>> -         if self.priority: out =3D out + "Priority: %s\n" % (self.prior=
ity)
>>> -         if self.tags: out =3D out + "Tags: %s\n" % (self.tags)
>>> -         out =3D out + "\n"
>>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_s=
plit.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split=
.patch
>>> deleted file mode 100644
>>> index b679f8b..0000000
>>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils/arfile_header_split.pa=
tch
>>> +++ /dev/null
>>> @@ -1,27 +0,0 @@
>>> -From: Scott Anderson <o2e@saaworld.com>
>>> -Subject: ipkg-utils: Make arfile.py handle six digit UIDs
>>> -   =20
>>> -    Essentially, the problem is that arfile.py is splitting the ar head=
er with
>>> -    white-space instead of fixed-width fields, so two fields would get t=
reated
>>> -    as a single field.  This makes things better than before as it now h=
onors
>>> -    the fixed field widths.
>>> -   =20
>>> -Upstream-Status: Pending (there is no upstream after openmoko imploded)=

>>> -
>>> ---- ipkg-utils/arfile.py.orig    2010-09-29 13:38:15.000000000 -0700
>>> -+++ ipkg-utils/arfile.py    2010-10-01 16:06:00.000000000 -0700
>>> -@@ -74,7 +74,12 @@
>>> -             if l =3D=3D "\n":
>>> -                 l =3D self.f.readline()
>>> -                 if not l: break
>>> -             l =3D l.replace('`', '')
>>> --            descriptor =3D l.split()
>>> -+            # Field lengths from /usr/include/ar.h:
>>> -+            ar_field_lens =3D [ 16, 12, 6, 6, 8, 10, 2 ]
>>> -+            descriptor =3D []
>>> -+            for field_len in ar_field_lens:
>>> -+                descriptor.append(l[:field_len].strip())
>>> -+                l =3D l[field_len:]
>>> - #            print descriptor
>>> -             size =3D int(descriptor[5])
>>> -             memberName =3D descriptor[0][:-1]
>>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-fi=
lenotfound.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-=
filenotfound.patch
>>> deleted file mode 100644
>>> index f0f0fcf..0000000
>>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils/index-ignore-filenotfo=
und.patch
>>> +++ /dev/null
>>> @@ -1,73 +0,0 @@
>>> -If we're building an image and some package rebuilds while this is happ=
ening
>>> -some package can be removed/added to the ipk deploy directory. The imag=
e will
>>> -not depend on this package so we can safely ignore these cases rather t=
han=20
>>> -error out.
>>> -
>>> -RP - 26/8/09
>>> -
>>> -Upstream-Status: Inappropriate [embedded specific]
>>> -
>>> -Index: opkg-utils/opkg-make-index
>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ---- opkg-utils.orig/opkg-make-index    2009-08-26 17:21:26.000000000 +0=
100
>>> -+++ opkg-utils/opkg-make-index    2009-08-27 16:11:22.000000000 +0100
>>> -@@ -96,6 +96,7 @@
>>> - files=3Dglob(pkg_dir + '/*.ipk') + glob(pkg_dir + '/*.deb')
>>> - files.sort()
>>> - for filename in files:
>>> -+  try:
>>> -      basename =3D os.path.basename(filename)
>>> -      pkg =3D None
>>> -      fnameStat =3D os.stat(filename)
>>> -@@ -130,6 +131,12 @@
>>> -                to_morgue(basename)
>>> -           if opt_s:
>>> -                print filename
>>> -+  except OSError:
>>> -+      sys.stderr.write("Package %s disappeared on us!\n" % (filename))=

>>> -+      continue
>>> -+  except IOError:
>>> -+      sys.stderr.write("Package %s disappeared on us!\n" % (filename))=

>>> -+      continue
>>> -=20
>>> - pkgsStampsFile =3D open(stamplist_filename, "w")
>>> - for f in pkgsStamps.keys():
>>> -@@ -148,6 +155,7 @@
>>> - names =3D packages.packages.keys()
>>> - names.sort()
>>> - for name in names:
>>> -+  try:
>>> -      pkg =3D packages.packages[name]
>>> -      if locales_dir and pkg.depends:
>>> -          depends =3D string.split(pkg.depends, ',')
>>> -@@ -165,6 +173,13 @@
>>> -      if (verbose):
>>> -           sys.stderr.write("Writing info for package %s\n" % (pkg.pack=
age,))
>>> -      print pkg
>>> -+  except OSError:
>>> -+      sys.stderr.write("Package %s disappeared on us!\n" % (name))
>>> -+      continue
>>> -+  except IOError:
>>> -+      sys.stderr.write("Package %s disappeared on us!\n" % (name))
>>> -+      continue
>>> -+
>>> - if packages_filename:
>>> -      sys.stdout.close()
>>> -      sys.stdout =3D old_stdout
>>> -@@ -197,7 +197,15 @@
>>> - names =3D packages.packages.keys()
>>> - names.sort()
>>> - for name in names:
>>> --     for fn in packages[name].get_file_list():
>>> -+     try:
>>> -+          fnlist =3D packages[name].get_file_list()
>>> -+     except OSError, e:
>>> -+          sys.stderr.write("Package %s disappeared on us!\n" % (name))=

>>> -+          continue
>>> -+     except IOError, e:
>>> -+          sys.stderr.write("Package %s disappeared on us!\n" % (name))=

>>> -+          continue
>>> -+     for fn in fnlist:
>>> -           (h,t) =3D os.path.split(fn)
>>> -           if not t: continue
>>> -           if not files.has_key(t): files[t] =3D name+':'+fn
>>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch=
 b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
>>> deleted file mode 100644
>>> index 483a62a..0000000
>>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
>>> +++ /dev/null
>>> @@ -1,30 +0,0 @@
>>> -Convert mtime to int before comparing it
>>> -
>>> -The st_mtime attribute (which is a float) is compared against a value
>>> -from the timestamp database, which was stored as an integer there.
>>> -
>>> -When working on a filesystem with precise timestamps the comparision
>>> -will fail nearly everytime hence.
>>> -
>>> -Although it might be possible to enhance the database to store the
>>> -fractional part too, this will complicate things more than we would
>>> -gain by this change.
>>> -
>>> -Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>>> -
>>> -Upstream-Status: Pending
>>> -(Contacting the original author, no response yet.)
>>> -
>>> -Index: opkg-utils/opkg-make-index
>>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> ---- opkg-utils.orig/opkg-make-index
>>> -+++ opkg-utils/opkg-make-index
>>> -@@ -100,7 +100,7 @@ for filename in files:
>>> -      pkg =3D None
>>> -      fnameStat =3D os.stat(filename)
>>> -      if old_pkg_hash.has_key(basename):
>>> --          if pkgsStamps.has_key(basename) and fnameStat.st_mtime =3D=3D=
 pkgsStamps[basename]:
>>> -+          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) =3D=
=3D pkgsStamps[basename]:
>>> -             if (verbose):
>>> -                sys.stderr.write("Found %s in Packages\n" % (filename,)=
)
>>> -             pkg =3D old_pkg_hash[basename]
>>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch b=
/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
>>> deleted file mode 100644
>>> index f6a2ef9..0000000
>>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils/shebang.patch
>>> +++ /dev/null
>>> @@ -1,46 +0,0 @@
>>> -Use python via the PATH, rather than hardcoding /usr/bin/python
>>> -
>>> -Upstream-Status: Pending
>>> -
>>> -Signed-off-by: Christopher Larson <kergoth@gmail.com>
>>> -
>>> ---- opkg-utils.orig/opkg-list-fields
>>> -+++ opkg-utils/opkg-list-fields
>>> -@@ -1,4 +1,4 @@
>>> --#!/usr/bin/python
>>> -+#!/usr/bin/env python
>>> -=20
>>> - import sys, opkg
>>> -=20
>>> ---- opkg-utils.orig/opkg-make-index
>>> -+++ opkg-utils/opkg-make-index
>>> -@@ -1,4 +1,4 @@
>>> --#!/usr/bin/python
>>> -+#!/usr/bin/env python
>>> -=20
>>> - import sys, os, posixpath
>>> - from glob import glob
>>> ---- opkg-utils.orig/opkg-show-deps
>>> -+++ opkg-utils/opkg-show-deps
>>> -@@ -1,4 +1,4 @@
>>> --#!/usr/bin/python
>>> -+#!/usr/bin/env python
>>> -=20
>>> - import sys, os, posixpath
>>> - from glob import glob
>>> ---- opkg-utils.orig/opkg-unbuild
>>> -+++ opkg-utils/opkg-unbuild
>>> -@@ -1,4 +1,4 @@
>>> --#!/usr/bin/python
>>> -+#!/usr/bin/env python
>>> -=20
>>> - import sys, os, re
>>> -=20
>>> ---- opkg-utils.orig/opkg-update-index
>>> -+++ opkg-utils/opkg-update-index
>>> -@@ -1,4 +1,4 @@
>>> --#!/usr/bin/env python2.1
>>> -+#!/usr/bin/env python
>>> -=20
>>> - import sys, os
>>> - from glob import glob
>>> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/r=
ecipes-devtools/opkg-utils/opkg-utils_git.bb
>>> index 4fe4038..1996c75 100644
>>> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
>>> @@ -6,16 +6,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9=
ba36caa9b7df079bae19f \
>>>                    file://opkg.py;beginline=3D1;endline=3D18;md5=3D15917=
491ad6bf7acc666ca5f7cc1e083"
>>> RDEPENDS_${PN} =3D "python"
>>> RDEPENDS_${PN}_virtclass-native =3D ""
>>> -SRCREV =3D "16665959c330b5958c0f0f4624a9ca7f823f98de"
>>> +SRCREV =3D "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
>>> PV =3D "0.1.8+git${SRCPV}"
>>> PR =3D "r1"
>>=20
>> PR bump?
>=20
> PV is incremented by SRCREV change, isn't it?

Only locally and gone when TMPDIR gets emptied. I'm tempted to propose to re=
moving it from PV everywhere since it's causing a ton of problems in the mul=
ti-master autobuild setup I'm using.

Regards,

Koen





>=20
> Do you want me to remove/reset PR?
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


