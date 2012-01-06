Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rj7D8-0004vQ-Bj
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 11:39:47 +0100
Received: by werm13 with SMTP id m13so1110318wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 02:32:22 -0800 (PST)
Received: by 10.216.138.73 with SMTP id z51mr2608722wei.55.1325845941957;
	Fri, 06 Jan 2012 02:32:21 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fi6sm140163461wib.2.2012.01.06.02.32.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jan 2012 02:32:21 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <0642f4ea3b43b7753405481c5f4999cf9f822142.1325840474.git.dongxiao.xu@intel.com>
Date: Fri, 6 Jan 2012 11:32:19 +0100
Message-Id: <15DFFA35-B02B-463A-8CBA-9EBD369CC406@dominion.thruhere.net>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
	<0642f4ea3b43b7753405481c5f4999cf9f822142.1325840474.git.dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 4/7] packageinfo.bbclass: add a new bbclass to pass package information
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
X-List-Received-Date: Fri, 06 Jan 2012 10:39:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 6 jan. 2012, om 10:05 heeft Dongxiao Xu het volgende geschreven:

> packageinfo.bbclass is to pass the accurate package information to
> clients (e.g. Hob), including PN, PV, RDEPENDS, PKGSIZE, etc.

Why not reuse buildhistory for this?




