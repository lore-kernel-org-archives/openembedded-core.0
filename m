Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs1Ce-0003zY-Gj
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 01:04:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Jan 2012 15:56:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101323821"
Received: from unknown (HELO [10.255.14.89]) ([10.255.14.89])
	by azsmga001.ch.intel.com with ESMTP; 30 Jan 2012 15:56:10 -0800
Message-ID: <4F272E1A.6040702@linux.intel.com>
Date: Mon, 30 Jan 2012 15:56:10 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Steve Sakoman <steve@sakoman.com>
References: <1327957970-15159-1-git-send-email-steve@sakoman.com>
	<4F27108D.4090303@linux.intel.com>
	<4F2715ED.9030109@linux.intel.com>
	<CAOSpxdajJLZSuzZS5qb4UPpjuS55ZWB=RR3a0oi9hNDF8J++Fw@mail.gmail.com>
In-Reply-To: <CAOSpxdajJLZSuzZS5qb4UPpjuS55ZWB=RR3a0oi9hNDF8J++Fw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/3] zypper: support signed repositories
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
X-List-Received-Date: Tue, 31 Jan 2012 00:04:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 03:29 PM, Steve Sakoman wrote:
> On Mon, Jan 30, 2012 at 2:13 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>
>> This would imply that we need to have a GPLv2 Version of the gnupg
>> recipe also, Steve if you had to look at or handle the newer GPLv3 gnupg
>> code itself, you may not be able to write the GPLv2 recipe or create patches
>> for it, can you arrange for someone to create that patch?
>
> OE-classic has a recipe for gnupg-1.4.10, so perhaps the safest
> approach would be to import that recipe since I *have* browsed the
> gnupg v2 code.
>
You mean v3 code no doubt.

> I know from experience that signed repositories won't work for that
> version as-is.  Zypper explicitly uses gpg2.
>
Any idea how much work there is there? Do you know of anyone that can 
help out with this?

> It *may* be that gpg and gpg2 are compatible enough that you could get
> away with a symlink and a v1.x version of gnupg.  Or perhaps one could
> patch zypper to try gpg if gpg2 isn't present.  Thoughts?
>
I think it would be clearer if we patch zypper for gpg instead of hiding 
behind a symlink.  Other tools that may want to use gpg2 might get the 
wrong thing.

Another possibility would be disable signed repos for non-GPLv3, but I 
am not wild about that idea since it's highly likely that a commercial 
vendor would want to provide signed repos in a non-GPLv3 device for 
security and sanity.

Sau!


> Steve
>


