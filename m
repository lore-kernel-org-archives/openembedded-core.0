Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qis9E-0001cu-Pr
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 20:02:29 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jul 2011 10:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,223,1309762800"; d="scan'208";a="31699175"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2011 10:58:22 -0700
Message-ID: <4E24743E.4080603@linux.intel.com>
Date: Mon, 18 Jul 2011 10:58:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <2ACEB6D6-846E-479C-AAE1-5C43687FD581@dominion.thruhere.net>
In-Reply-To: <2ACEB6D6-846E-479C-AAE1-5C43687FD581@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Incomplete licensing in recipes
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
X-List-Received-Date: Mon, 18 Jul 2011 18:02:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2011 02:40 AM, Koen Kooi wrote:
> Hi,
>
> I was looking at the testlab output for licensing [1] and noticed that eglibc(-locale) and libcap2 just say (L)GPL and don't specify the version, was that intended?
>
eglibc is easily fixed.

libcap2 is pretty vague, the License file just mentions GPL with no 
version reference and there is no COPYING file.  I will query Andrew 
Morgan directly to see if he has a version in mind.

> regards,
>
> Koen
>
> [1] http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/tree/hawkboard/eglibc/systemd-image/installed-package-licenses.txt?h=yocto&id=ff185d46e0da70dba80a540a9d7d6757cd213931
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


