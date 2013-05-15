Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UcXYr-0003DO-Mc
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 11:00:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 May 2013 01:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,675,1363158000"; d="scan'208";a="337543892"
Received: from unknown (HELO [10.255.12.183]) ([10.255.12.183])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2013 01:41:34 -0700
Message-ID: <51934A31.2080905@linux.intel.com>
Date: Wed, 15 May 2013 11:41:21 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Slater, Joseph" <joe.slater@windriver.com>
References: <007BD92917A2324FA403BCF9A464CF8436FC7143@ALA-MBA.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8436FC7143@ALA-MBA.corp.ad.wrs.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: distrodata.bbclass
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
X-List-Received-Date: Wed, 15 May 2013 09:00:13 -0000
X-List-Received-Date: Wed, 15 May 2013 09:00:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2013 12:39 AM, Slater, Joseph wrote:
> Hi,
>
> I see this class for generating a report of package data, but I don't
> see it ever
>
> being used.  Is there info about how to use it?
>
The Package Reporting System (http://packages.yoctoproject.org) backend 
uses the distrodata class, it's not included by default because it reads 
data in the meta-yocto/conf/distro/include files and increases the load 
time and variable space.

To use it you would need to inherit the distrodata class and also 
include the files in meta-yocto/conf/distro/include (or equivalents for 
your distro).

There are a couple of tasks that can operate on recipes, world or 
universe (includes every recipe, to be used for validation, not 
buildable in the normal case).

There are 4 main tasks that can be run:
distrodata
- generate a CSV file in tmp/logs that will create a Bill of Materials 
like spreadsheet, listing all the recipes with version and license info.

checkpkg
- does some basic sanity checking of package information and distro 
maintenance

distro_check
- tries to match our recipe names with a Full Distros like Ubuntu, 
Fedora, OpenSuSeE and produces a CVS report

checklicense
- validates licenses, this could be depreated now, it was primarily used 
in the early days of the Yocto Project to check the license data.

Let me know if this helps.

Sau!



> Joe
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


