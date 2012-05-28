Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZ2ta-0003j1-A7
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 18:34:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 May 2012 09:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="145474197"
Received: from unknown (HELO helios.localnet) ([10.252.120.22])
	by orsmga001.jf.intel.com with ESMTP; 28 May 2012 09:23:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Mon, 28 May 2012 17:23:55 +0100
Message-ID: <3418839.G4f3PdLdKK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAOHjBZsnd8aZjp5ZAvPZ2p3R9AmxGoLXZhVMQjOJxS8Bto61BA@mail.gmail.com>
References: <CAOHjBZsyWoca=JkLy==aqwYGwLeYYrNgR6PwwWMyNVjP0LSv5g@mail.gmail.com>
	<5252895.1gMWNIkXN5@helios>
	<CAOHjBZsnd8aZjp5ZAvPZ2p3R9AmxGoLXZhVMQjOJxS8Bto61BA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to query installed rpm packages
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
X-List-Received-Date: Mon, 28 May 2012 16:34:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 May 2012 17:30:34 Giuseppe Condorelli wrote:
> Well, I added ROOTFS_POSTPROCESS_COMMAND += "list_installed_packages ; " in
> the image recipe I want to build.
> Build went right but I don't know where to find the output the
> list_installed_packages has provided.
> Any suggestion? Am I wrong?

All list_installed_packages does is print a list of the packages; if you just 
add it to ROOTFS_POSTPROCESS_COMMAND the output will be going into the log file 
for the image task which is probably not what you want. If you wanted to 
proceed with this I think you'd need to redirect the output to some file 
somewhere - this is easily done by instead calling your own shell function and 
then calling list_installed_packages > path/to/some_output_file.txt within it. 
However it sounds like buildhistory will do what you want here anyway.
 
Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


