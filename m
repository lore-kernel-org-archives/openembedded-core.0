Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RpoTj-0004df-13
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 23:04:35 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1RpoCV-0004ra-SL from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 13:46:47 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 24 Jan 2012 13:46:47 -0800
Received: from [172.30.9.40] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 24 Jan 2012 13:46:46 -0800
Message-ID: <4F1F26C6.8050501@mentor.com>
Date: Tue, 24 Jan 2012 14:46:46 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 24 Jan 2012 21:46:47.0725 (UTC)
	FILETIME=[AC211DD0:01CCDAE1]
Subject: [PATCH 0/3] systemtap enhancements
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
X-List-Received-Date: Tue, 24 Jan 2012 22:04:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

This provides several enhancements to the systemtap recipe to improve
end user experience.

Wade Farnsworth (3):
  Bump systemtap SRCREV
  systemtap: extend the recipe to build the native package
  systemtap: build and install uprobes.ko

 meta/recipes-kernel/systemtap/systemtap_git.bb |   63 ++++++++++++++++++++++--
 1 files changed, 59 insertions(+), 4 deletions(-)



