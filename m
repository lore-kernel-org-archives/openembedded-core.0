Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QX99c-0006m5-2N
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:46:24 +0200
Received: by wye20 with SMTP id 20so1020608wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 02:42:56 -0700 (PDT)
Received: by 10.227.201.144 with SMTP id fa16mr703790wbb.19.1308217376236;
	Thu, 16 Jun 2011 02:42:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gb6sm40831wbb.51.2011.06.16.02.42.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2011 02:42:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
Date: Thu, 16 Jun 2011 11:42:53 +0200
Message-Id: <C8886696-E481-481B-A90B-AEFBABB62823@dominion.thruhere.net>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/6] connman: Upgrade to version 0.75
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
X-List-Received-Date: Thu, 16 Jun 2011 09:46:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jun 2011, om 11:20 heeft Dongxiao Xu het volgende geschreven:

> Enable ofono plugin into sato image.
> Remove the fix-shutdown-ap-disconnect.patch since the original logic =
no longer exists.
> Add Upstream-Status information for patches.

I asked before, but I'll ask again, have you looked at the connman =
recipe in meta-oe?

Also consider turning on the tools, but that needs a more recent =
linux-libc-headers.=


