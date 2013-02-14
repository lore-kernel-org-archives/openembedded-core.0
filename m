Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1U62BM-0005l9-Vz
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 18:01:13 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob102.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUR0Uh7kox14OTIk2So8fa8DXUAdin9wN@postini.com;
	Thu, 14 Feb 2013 16:45:12 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 517C2386
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 16:44:36 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 10B4245F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 16:44:36 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AXU68995 (AUTH condorg);
	Thu, 14 Feb 2013 17:44:35 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Feb 2013 17:44:34 +0100
Message-ID: <0dea01ce0ad2$92793530$b76b9f90$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac4K0pBICMQxroUtQc+qr5KqVANhFw==
Subject: Question about hanging after git clone try in Prelink
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
X-List-Received-Date: Thu, 14 Feb 2013 17:01:15 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: it

Hi,

due to local company restrictions, I cannot clone external git repository.
During prelink-native fetch I catch the warning about that (given that the
SRC_URI point to git) but then,
trying other mirrors, system is able to download a tar.gz of the prelink.
The strange thing is that however bitbake hangs with the error (that was a
warning first) about the failure
of SRC_URI catch. Why this? Should system be aware the given package was
downloaded using mirrors?
This happens also for mtd-utils.
Please can you help me?
Thanks,
Giuseppe

PS: if I rerun the process than it goes ok, obviously because it finds the
tar.gz in download directory.



