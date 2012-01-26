Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RqV9A-0002Tf-70
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 20:38:12 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1RqV1d-0006Wc-6H from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 11:30:25 -0800
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 26 Jan 2012 11:30:24 -0800
Received: from [172.30.9.43] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 26 Jan 2012 11:30:23 -0800
Message-ID: <4F21A9CF.3020103@mentor.com>
Date: Thu, 26 Jan 2012 12:30:23 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com>
In-Reply-To: <4F1F26C6.8050501@mentor.com>
X-OriginalArrivalTime: 26 Jan 2012 19:30:24.0761 (UTC)
	FILETIME=[F3876690:01CCDC60]
Subject: [PATCH v2 0/3] systemtap enhancements
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
X-List-Received-Date: Thu, 26 Jan 2012 19:38:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This provides several enhancements to the systemtap recipe to improve
end user experience.

- v2: Move uprobes bits to a separate recipe per Khem's request.

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



