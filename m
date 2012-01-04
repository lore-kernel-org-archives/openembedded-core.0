Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiFFE-0004Qq-5W
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 02:02:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2012 16:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92668717"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 16:54:58 -0800
Message-ID: <4F03A361.3000408@linux.intel.com>
Date: Tue, 03 Jan 2012 16:54:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Colin Walters <walters@verbum.org>
References: <1325616533.23339.10.camel@lenny>
In-Reply-To: <1325616533.23339.10.camel@lenny>
X-Mailman-Approved-At: Thu, 05 Jan 2012 11:54:29 +0100
Cc: poky <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH] rpm: Move postinsts to /var
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
X-List-Received-Date: Wed, 04 Jan 2012 01:02:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2012 10:48 AM, Colin Walters wrote:
> My OS has read-only bind mounts over most directories (including
> /etc), with the exception of /var.  Since these scripts need to
> be run once and then deleted, it's better for me if these are in
> /var, and won't hurt anyone else for them to be there.
>
>You fixed this for RPM, does it exist for deb and ipkg also?

Sau!


>
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky


