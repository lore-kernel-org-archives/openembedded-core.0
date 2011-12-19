Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rchw4-00036t-Mj
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 19:27:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Dec 2011 10:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89173158"
Received: from rmoore1-desk5.amr.corp.intel.com (HELO [10.7.199.156])
	([10.7.199.156])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2011 10:20:37 -0800
Message-ID: <4EEF8073.2040205@linux.intel.com>
Date: Mon, 19 Dec 2011 10:20:35 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4EEBC476.20108@linux.intel.com>
In-Reply-To: <4EEBC476.20108@linux.intel.com>
Subject: Re: UDEV-145??
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
X-List-Received-Date: Mon, 19 Dec 2011 18:27:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 16/12/11 14:21, Saul Wold wrote:
> 
> Does anyone know why we might be keeping this older version around?  I
> know that in the past there were kernel <-> udev issues. Are most usages
> now using current kernels and udev?

I was wondering the same thing. I have a WIP patch series to drop the
old version and the old inc file.

Further I'd like to try and get meta-oe using at least most of the
oe-core udev, I've not looked at the differences there yet.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


