Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RtOvR-0006d4-5Y
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 20:36:01 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1RtOnk-0001qH-3W from wade_farnsworth@mentor.com ;
	Fri, 03 Feb 2012 11:28:04 -0800
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 3 Feb 2012 11:28:03 -0800
Received: from [172.30.8.16] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 3 Feb 2012 11:28:03 -0800
Message-ID: <4F2C3541.5000409@mentor.com>
Date: Fri, 3 Feb 2012 12:28:01 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
In-Reply-To: <4F21A9CF.3020103@mentor.com>
X-OriginalArrivalTime: 03 Feb 2012 19:28:03.0713 (UTC)
	FILETIME=[F2C32F10:01CCE2A9]
Subject: [PATCH v3 0/3] systemtap enhancements
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
X-List-Received-Date: Fri, 03 Feb 2012 19:36:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This provides several enhancements to the systemtap recipe to improve
end user experience.

- v2: Move uprobes bits to a separate recipe
- v3: Fix -native[sdk] DEPENDS in systemtap_git.bb
      Change to ALLOW_EMPTY_${PN} in systemtap-uprobes_git.bb
      Updated SRCREV to pull stable version 1.7

Wade Farnsworth (3):
  Bump systemtap SRCREV
  systemtap: extend the recipe to build the native package
  systemtap: build and install uprobes.ko

 .../systemtap/systemtap-uprobes_git.bb             |   42 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   22 +++-------
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   16 +++++++
 3 files changed, 65 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
 create mode 100644 meta/recipes-kernel/systemtap/systemtap_git.inc



