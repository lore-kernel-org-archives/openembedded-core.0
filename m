Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UCiDK-0005HL-SC
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 04:06:53 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r252oLib021970
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Mar 2013 18:50:21 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 4 Mar 2013 18:50:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Mar 2013 10:50:14 +0800
Message-ID: <cover.1362398320.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH V4 0/1]fix native package compile error with gcc 4.3.4 on x86 host
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 03:06:54 -0000
Content-Type: text/plain

Change from V3: as Richard suggested, patch sanity.bbclass to test if necessary
to add march to BUILD_CFLAG when the gcc version is older than 4.5

Test case:
:~> bitbake packagegroup-toolset-native
WARNING: Host distribution "SUSE Linux Enterprise Desktop 11" has not been
validated with this version of the build system; you may possibly experience
unexpected failures. It is recommended that you use a tested distribution.
ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
Either fix the cause of this error or at your own risk disable the checker(see sanity.conf).
    Following is the list of potential problems / advisories:
    Your gcc version is older than 4.5, please add the following param to local.conf
         BUILD_CFLAGS_append = " -march=native"

[YOCTO #3563]

The following changes since commit 7ed45239631796086c78546776096f62ea090718:

  bitbake: siggen: add quotes around variable values to see whitespace (2013-03-04 11:38:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/sanity-check-march
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/sanity-check-march

Hongxu Jia (1):
  sanity.bbclass:check if necessary to add march to BUILD_CFLAGS

 meta/classes/sanity.bbclass |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
1.7.10.4



