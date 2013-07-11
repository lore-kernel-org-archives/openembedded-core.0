Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDCCA6012D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 12:04:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6BC4dBU011945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 05:04:39 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 11 Jul 2013 05:04:37 -0700
Message-ID: <51DE9F53.4080608@windriver.com>
Date: Thu, 11 Jul 2013 20:04:35 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1373443071.git.hongxu.jia@windriver.com>
Subject: [PATCH V3 0/5] add nss for LSB library check (cover letter only)
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
X-List-Received-Date: Thu, 11 Jul 2013 12:04:37 -0000
Content-Type: multipart/alternative;
	boundary="------------080009010107010203040100"

--------------080009010107010203040100
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Change in V3:
1) Replace incorrect shebang line with `#!/usr/bin/env perl'.

Change in V2:
1) Rename the title of patch 1/5
2) Use ${libdir} rather than ${base_libdir} as the lib location
    which references the nss in meta-browser.


The following changes since commit dc86293f0444384e8ae5131fdd10b6cb077164b0:

   bitbake: HOB:Proper handle of SIGINT (2013-07-05 15:52:48 +0100)

are available in the git repository at:

   git://git.pokylinux.org/poky-contrib hongxu/fix-nss
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nss

Hongxu Jia (5):
   nspr: add native version
   packagegroup-core-lsb: add nss for LSB library check
   nss: add version 3.15.1
   nss: create checksum files for the nss libraries
   nss: fix incorrect shebang line of perl script

  .../packagegroups/packagegroup-core-lsb.bb         |   1 +
  meta/recipes-support/nspr/nspr_4.10.bb             |   2 +
  .../files/nss-fix-incorrect-shebang-of-perl.patch  | 110 ++++++++++++
  .../files/nss-fix-support-cross-compiling.patch    |  71 ++++++++
  .../files/nss-no-rpath-for-cross-compiling.patch   |  26 +++
  meta/recipes-support/nss/files/nss.pc.in           |  11 ++
  meta/recipes-support/nss/files/signlibs.sh         |  20 +++
  meta/recipes-support/nss/nss.inc                   | 187 +++++++++++++++++++++
  meta/recipes-support/nss/nss_3.15.1.bb             |   9 +
  9 files changed, 437 insertions(+)
  create mode 100644 meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch
  create mode 100644 meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
  create mode 100644 meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
  create mode 100644 meta/recipes-support/nss/files/nss.pc.in
  create mode 100644 meta/recipes-support/nss/files/signlibs.sh
  create mode 100644 meta/recipes-support/nss/nss.inc
  create mode 100644 meta/recipes-support/nss/nss_3.15.1.bb

-- 1.8.1.2


--------------080009010107010203040100
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-text-plain" wrap="true" graphical-quote="true"
      style="font-family: -moz-fixed; font-size: 12px;" lang="x-western">
      <pre wrap="">Change in V3: 
1) Replace incorrect shebang line with `#!/usr/bin/env perl'.

Change in V2:
1) Rename the title of patch 1/5
2) Use ${libdir} rather than ${base_libdir} as the lib location
   which references the nss in meta-browser.


The following changes since commit dc86293f0444384e8ae5131fdd10b6cb077164b0:

  bitbake: HOB:Proper handle of SIGINT (2013-07-05 15:52:48 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-nss
  <a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nss">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nss</a>

Hongxu Jia (5):
  nspr: add native version
  packagegroup-core-lsb: add nss for LSB library check
  nss: add version 3.15.1
  nss: create checksum files for the nss libraries
  nss: fix incorrect shebang line of perl script

 .../packagegroups/packagegroup-core-lsb.bb         |   1 +
 meta/recipes-support/nspr/nspr_4.10.bb             |   2 +
 .../files/nss-fix-incorrect-shebang-of-perl.patch  | 110 ++++++++++++
 .../files/nss-fix-support-cross-compiling.patch    |  71 ++++++++
 .../files/nss-no-rpath-for-cross-compiling.patch   |  26 +++
 meta/recipes-support/nss/files/nss.pc.in           |  11 ++
 meta/recipes-support/nss/files/signlibs.sh         |  20 +++
 meta/recipes-support/nss/nss.inc                   | 187 +++++++++++++++++++++
 meta/recipes-support/nss/nss_3.15.1.bb             |   9 +
 9 files changed, 437 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-fix-incorrect-shebang-of-perl.patch
 create mode 100644 meta/recipes-support/nss/files/nss-fix-support-cross-compiling.patch
 create mode 100644 meta/recipes-support/nss/files/nss-no-rpath-for-cross-compiling.patch
 create mode 100644 meta/recipes-support/nss/files/nss.pc.in
 create mode 100644 meta/recipes-support/nss/files/signlibs.sh
 create mode 100644 meta/recipes-support/nss/nss.inc
 create mode 100644 meta/recipes-support/nss/nss_3.15.1.bb

<div class="moz-txt-sig">-- 
1.8.1.2

</div></pre>
    </div>
  </body>
</html>

--------------080009010107010203040100--
