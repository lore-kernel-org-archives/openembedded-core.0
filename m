Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJTe5-0003G8-BO
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 18:49:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2011 09:46:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,341,1301900400"; d="scan'208";a="744555161"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 09:46:35 -0700
Message-ID: <4DC81A6B.3040708@linux.intel.com>
Date: Mon, 09 May 2011 09:46:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <BANLkTinK3Cqk=JxH-TH=xM395JUXN5rfTg@mail.gmail.com>
In-Reply-To: <BANLkTinK3Cqk=JxH-TH=xM395JUXN5rfTg@mail.gmail.com>
Subject: Re: fuse update
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
X-List-Received-Date: Mon, 09 May 2011 16:49:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2011 07:06 AM, Otavio Salvador wrote:
> Hello,
>
> I am migrating some stuff to oe-core and found it has fuse at
> meta-demoapps. It seems no recipes depends on fuse in oe-core and thus
> I am wondering how is better to deal with its updating as:
>
>   - should it be done in oe-core?
>   - should it be moved to meta-oe?
>
> The requirement for me to update it is due it being required by a new
> recipe I am adding to meta-oe and then it seems more logical to me to
> move fuse to meta-oe but I am curious to hear from others about it.
>
It would make sense for you to move it to meta-oe at this time, if we 
find more recipes require it our other layers are needed it, then we can 
consider it for oe-core.

Sau!

> Cheers,
>


