Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5C68970259
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:50:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2014 15:50:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,661,1400050800"; d="scan'208";a="573088943"
Received: from unknown (HELO [10.255.13.46]) ([10.255.13.46])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2014 15:50:41 -0700
Message-ID: <53C45EC0.6070801@linux.intel.com>
Date: Mon, 14 Jul 2014 15:50:40 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: akuster <akuster@mvista.com>, 
	OE-core <openembedded-core@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <53C45BD7.1020104@mvista.com>
In-Reply-To: <53C45BD7.1020104@mvista.com>
Subject: Re: /etc/os-release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jul 2014 22:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2014 03:38 PM, akuster wrote:
> Hello all,
>
> I noticed some reference to /etc/os-release in some recipes. Where can I
> find the initial creation of /etc/os-release? If one is not created,
> would there desire to have one?
>
Really?  We reference it in the meta/lib/oe/lsb.py release_dict_file() 
function to search for LSB information of the host machine to identify 
the host distro version information.

Can you be specific about which recipes are using os-release, I did do a 
search.

Sau!

> regards,
> Armin

