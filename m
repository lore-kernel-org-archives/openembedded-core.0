Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1U1E0C-0005zV-Of
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 11:37:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Feb 2013 02:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="256094276"
Received: from dell-desktop (HELO [10.237.105.59]) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 01 Feb 2013 02:22:02 -0800
Message-ID: <510B9749.6040801@intel.com>
Date: Fri, 01 Feb 2013 12:22:01 +0200
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1359710522-26839-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LZ3tvB6t13utWrzXhqE7mx58ypkFosUdtwj=XuMbPXRNw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ3tvB6t13utWrzXhqE7mx58ypkFosUdtwj=XuMbPXRNw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] polkit: Enable systemd support
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
X-List-Received-Date: Fri, 01 Feb 2013 10:37:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 02/01/2013 11:44 AM, Burton, Ross wrote:
> On 1 February 2013 09:22, Radu Moisan <radu.moisan@intel.com> wrote:
>> enable/disable support as relevant
> Please write a more verbose comment, something along the lines of
> "systemd is auto-detected unless disabled explicitly, potentially
> contaminating sstate".
>
>> +# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to DEPENDS
> It's not picked up by shlibs because it's a dbus call not a library
> call, and that's *RDEPENDS* not depends.

I did change that manually because I assumed it was a typo. However it 
make sense to add consolekit as a runtime dependency, but the 
documentation specifically says PACKAGECONFIG will add to DEPENDS. How 
is it different in this patch? The PACKAGECONFIG[systemd] is clearly 
specifying a build time dependency, why the PACKAGECONFIG[consolekit] is 
specifying a runtime dependency? How can I discriminate in this context?

Radu


