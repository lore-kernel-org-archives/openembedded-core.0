Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5171.1613463848621642100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5F83838C1285
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.8.0 SUCCEEDED
Message-ID: <MADEUP.16642CD2D9A892D9.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148119
Content-Type: multipart/mixed; boundary="===============6644957133997950119=="

--===============6644957133997950119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.7.4-2.8.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6644957133997950119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpyt
 hon-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpyt
 hon-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.c
 python-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgp
 u.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-
 39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc"
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py was added
  /usr/lib/python3.9/site-packages/pygments/lexers/cddl.py was added
  /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py was added
  /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py was added
  /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/styles/material.py was added
  /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py was added

--===============6644957133997950119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pygments: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/python3-pygments: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.7.4.tar.gz" to "https://files.pythonhosted.org/packages/source/P/Pygments/Pygments-2.8.0.tar.gz"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/sit
 e-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/sit
 e-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/sit
 e-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/
 site-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/sit
 e-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3
 .9/site-packages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 5766590 to 6106140 (+6%)
packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info -> /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info, added "/usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py /usr/lib/python3.9/site-packages/pygments/styles/material.py /usr/lib/python3.9/site-pa
 ckages/pygments/lexers/cddl.py /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py"
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.9/site-packages/Pygments-2.7.4-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/Pygments-2.8.0-py3.9.egg-info
  /usr/lib/python3.9/site-packages/pygments/lexers/amdgpu.py was added
  /usr/lib/python3.9/site-packages/pygments/lexers/cddl.py was added
  /usr/lib/python3.9/site-packages/pygments/lexers/futhark.py was added
  /usr/lib/python3.9/site-packages/pygments/lexers/graphviz.py was added
  /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/amdgpu.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/cddl.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/futhark.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/lexers/__pycache__/graphviz.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/styles/material.py was added
  /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/material.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/styles/__pycache__/zenburn.cpython-39.pyc was added
  /usr/lib/python3.9/site-packages/pygments/styles/zenburn.py was added

--===============6644957133997950119==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.7.4-2.8.0.patch"

From 8687a7f1eae747e6da07bfc24aa56dcc29ba0df8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 22:06:42 +0000
Subject: [PATCH] python3-pygments: upgrade 2.7.4 -> 2.8.0

---
 .../{python3-pygments_2.7.4.bb => python3-pygments_2.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.7.4.bb => python3-pygments_2.8.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.7.4.bb b/meta/recipes-devtools/python/python3-pygments_2.8.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.7.4.bb
rename to meta/recipes-devtools/python/python3-pygments_2.8.0.bb
index 24bbaaf38c..6c8afc5095 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.7.4.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.8.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "df49d09b498e83c1a73128295860250b0b7edd4c723a32e9bc0d295c7c2ec337"
+SRC_URI[sha256sum] = "37a13ba168a02ac54cc5891a42b1caec333e59b66addb7fa633ea8a6d73445c0"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.17.1


--===============6644957133997950119==--
