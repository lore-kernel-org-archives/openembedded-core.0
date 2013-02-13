Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1U5eas-0005oV-Jj
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 16:49:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1DFXwuu019108
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 07:33:58 -0800 (PST)
Received: from [128.224.168.151] (128.224.168.151) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 13 Feb 2013 07:33:55 -0800
Message-ID: <511BB265.8030505@windriver.com>
Date: Wed, 13 Feb 2013 17:33:57 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: systemd services in the rootfs
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
X-List-Received-Date: Wed, 13 Feb 2013 15:50:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
following the transition of the systemd.bbclass from meta-openembedded 
to oe-core, I stumbled upon on what seems to me a missing feature that 
has not been brought along in the new systemd.bbclass in oe-core. Seems 
that if one does not explicitly specify the inclusion of the packages 
containing the systemd services in a packagegroup or image recipe or use 
some other mechanism that will determine the addition of these packages 
in the final rootfs, then the root filesystem will not contain the 
systemd services. Even though DISTRO_FEATURES_INITMAN="systemd" is set. 
The meta-openembedded systemd.bbclass, needed no additional adding of 
the systemd related packages, just RRECOMMENDED and things worked as 
expected. Shouldn't the DISTRO_FEATURES_INITMAN do just that? Is it 
something that still needs to be done on the systemd.bbclass or would 
you suggest that from now on we will have to manually add the systemd 
packages in packagegroups, image recipes etc?

Thank you,
Florin


