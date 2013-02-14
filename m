Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U63XC-000700-RY
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 19:27:51 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2013 10:11:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,666,1355126400"; d="scan'208";a="285832543"
Received: from unknown (HELO [10.255.12.50]) ([10.255.12.50])
	by orsmga002.jf.intel.com with ESMTP; 14 Feb 2013 10:11:46 -0800
Message-ID: <511D28E2.5060704@linux.intel.com>
Date: Thu, 14 Feb 2013 10:11:46 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
References: <0dea01ce0ad2$92793530$b76b9f90$@st.com>
In-Reply-To: <0dea01ce0ad2$92793530$b76b9f90$@st.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Question about hanging after git clone try in Prelink
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
X-List-Received-Date: Thu, 14 Feb 2013 18:27:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


What version of OE-Core/POoky are you using? It would be helpful to know 
that.

If you are not using the Poky Distro, then you could try setting 
PREMIRRORS and/or use the own-mirrors.bbclass and set SOURCE_MIRROR_URL
to something like "http://downloads.yoctoproject.org/mirror/sources/"

Sau!


On 02/14/2013 08:44 AM, Giuseppe CONDORELLI wrote:
> Hi,
>
> due to local company restrictions, I cannot clone external git repository.
> During prelink-native fetch I catch the warning about that (given that the
> SRC_URI point to git) but then,
> trying other mirrors, system is able to download a tar.gz of the prelink.
> The strange thing is that however bitbake hangs with the error (that was a
> warning first) about the failure
> of SRC_URI catch. Why this? Should system be aware the given package was
> downloaded using mirrors?
> This happens also for mtd-utils.
> Please can you help me?
> Thanks,
> Giuseppe
>
> PS: if I rerun the process than it goes ok, obviously because it finds the
> tar.gz in download directory.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


