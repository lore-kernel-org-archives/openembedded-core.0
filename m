Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RuPyD-0002UK-1i
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 15:55:05 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1RuPqQ-0002s2-Gz from wade_farnsworth@mentor.com ;
	Mon, 06 Feb 2012 06:47:02 -0800
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 6 Feb 2012 06:46:10 -0800
Received: from [172.30.10.43] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 6 Feb 2012 06:47:01 -0800
Message-ID: <4F2FE7E4.9040902@mentor.com>
Date: Mon, 6 Feb 2012 07:47:00 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
	<4F2C3541.5000409@mentor.com>
In-Reply-To: <4F2C3541.5000409@mentor.com>
X-OriginalArrivalTime: 06 Feb 2012 14:46:10.0000 (UTC)
	FILETIME=[10A4A500:01CCE4DE]
Subject: [PATCH v4 0/3] systemtap enhancements
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
X-List-Received-Date: Mon, 06 Feb 2012 14:55:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This provides several enhancements to the systemtap recipe to improve
end user experience.

- v2: Move uprobes bits to a separate recipe
- v3: Fix -native[sdk] DEPENDS in systemtap_git.bb
      Change to ALLOW_EMPTY_${PN} in systemtap-uprobes_git.bb
      Updated SRCREV to pull stable version 1.7
- v4: Reset PR due to change in PV for systemtap_git.bb
      Make systemtap-uprobes_git.bb inherit gettext

Wade Farnsworth (3):
  systemtap: bump SRCREV to grab version 1.7
  systemtap: extend the recipe to build the native package
  systemtap: build and install uprobes.ko

 .../systemtap/systemtap-uprobes_git.bb             |   42 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   22 +++-------
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   16 +++++++
 3 files changed, 65 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
 create mode 100644 meta/recipes-kernel/systemtap/systemtap_git.inc



