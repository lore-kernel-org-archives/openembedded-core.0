Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sj49d-00065c-B5
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 09:56:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 25 Jun 2012 00:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115673357"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Jun 2012 00:45:09 -0700
Message-ID: <4FE81705.1030703@linux.intel.com>
Date: Mon, 25 Jun 2012 00:45:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340560914.git.sgw@linux.intel.com>
	<B0A816B5-77AF-4371-AAC8-FF4A4D78D0A9@dominion.thruhere.net>
In-Reply-To: <B0A816B5-77AF-4371-AAC8-FF4A4D78D0A9@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 00/14] Package Updating
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
X-List-Received-Date: Mon, 25 Jun 2012 07:56:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/24/2012 12:27 PM, Koen Kooi wrote:
>
> Op 24 jun. 2012, om 20:03 heeft Saul Wold het volgende geschreven:
>
>> Richard,
>>
>> Here is a patch of updates.
>
> How were those tested?
>
Koen:


I tested these in a variety of ways, depending on the usage in the 
overall environment.  Obviously I built them both from within a clean 
build area and a build env that contained shared state from prior 
builds. As seen earlier today, I found an issue with a couple of patches 
that built on my initial testing, but then failed later.

Then I checked what the target dependencies might be for the libraries 
and built a target image that included those, such as webkit for libidn.
Most of these packages are in the core-image-lsb, so I built that and 
ran the target binaries with --help and -V (or --version) to ensure they 
at least start up.

In some cases, such as libxml-simple-perl, it's used in the build system 
and is therefore tested as part of a core build when using 
gnome-icon-theme handling.

If you have further concerns, please let me know.

Thanks
	Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


