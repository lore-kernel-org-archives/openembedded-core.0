Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm6e0-0001ky-8s
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 19:12:08 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2012 10:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173024525"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2012 10:01:05 -0700
Message-ID: <4FF32550.6060606@linux.intel.com>
Date: Tue, 03 Jul 2012 10:01:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4FF320DD.8090301@palm.com>
In-Reply-To: <4FF320DD.8090301@palm.com>
Subject: Re: local.conf & bblayers.conf changes...
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
X-List-Received-Date: Tue, 03 Jul 2012 17:12:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 09:42 AM, Rich Pixley wrote:
> Where can I find a description of the recent changes and what I need to
> do to bring my files back up to current?
>
> What were the incompatible changes?
>
For bblayers.conf, we bumped the version becase we moved the BBPATH 
initial setting into the bblayers.conf to ensure we dont accidently 
pickup things in . because of the way a :: was being parsed.  See
this commit
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=5e3a61b40b7b697d83b41e7e247cd1f94eb7673c

Not sure what you mean about local.conf, since I am not sure of your 
starting point.

Sau!


> --rich
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


