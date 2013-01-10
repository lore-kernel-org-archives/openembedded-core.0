Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TtJHx-0000IX-Ve
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 15:39:28 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jan 2013 06:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,444,1355126400"; d="scan'208";a="244639295"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 10 Jan 2013 06:24:10 -0800
Message-ID: <50EECF09.1040205@intel.com>
Date: Thu, 10 Jan 2013 16:24:09 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <50EC3002.8050209@intel.com>
	<CADkTA4NFq_EoFY8H800ewKQMWEOMjfroqT0t3okRKJz5jEYZzw@mail.gmail.com>
	<50EEC93F.9060802@intel.com>
	<CADkTA4OJMeDCXFdFZVD20tuN04=UCSvpnb_89B706scUN-0Ytw@mail.gmail.com>
In-Reply-To: <CADkTA4OJMeDCXFdFZVD20tuN04=UCSvpnb_89B706scUN-0Ytw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-modules, do we need it anymore?
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
X-List-Received-Date: Thu, 10 Jan 2013 14:39:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/10/2013 04:10 PM, Bruce Ashfield wrote:
> I don't have any use for the rest of update-modules, so I don't disagree on
> that point. I'd just like to see a form of autoload support be continued if
> anything happens to update-modules. But since update-modules isn't
> mandatory, I suppose nothing drastic will happen to it regardless, but
> having
> a modern equivalent would be nice :)
> 
Just to be clear on this. Even if update-modules is removed, modules
will still be autoloaded by modutils.sh which is run in rcS.d. Also,
/etc/init.d/modutils.sh can be run separately.

Thanks,
Laurentiu


