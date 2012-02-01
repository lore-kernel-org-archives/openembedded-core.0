Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rset4-0008Pz-5c
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 19:26:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Feb 2012 10:18:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119221105"
Received: from unknown (HELO [10.255.14.103]) ([10.255.14.103])
	by fmsmga002.fm.intel.com with ESMTP; 01 Feb 2012 10:18:30 -0800
Message-ID: <4F2981F6.9090701@linux.intel.com>
Date: Wed, 01 Feb 2012 10:18:30 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CALbNGRSKUfru5Z-jAJmywTieJUALfLAZgxW_NEhLBK8W5pw1VA@mail.gmail.com>
In-Reply-To: <CALbNGRSKUfru5Z-jAJmywTieJUALfLAZgxW_NEhLBK8W5pw1VA@mail.gmail.com>
Subject: Re: accessing variables
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
X-List-Received-Date: Wed, 01 Feb 2012 18:26:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 01/02/12 10:15, Andreas Müller wrote:
> another stupid question from my side:
>
> do
>
> bb.data.getVar('foo', d, 1)
>
> and
>
> d.getVar('foo', 1)
>
> access the same data?

Yes.

The first is calling the class method and passing in an instance of a 
data object, the second is calling the method on the object directly.

Either way you're using the same data object, d.

The latter is more pythonic and we've been slowly moving the code 
towards that style.

Also for stylistic reasons please use True/False rather than 1/0 for the 
final parameter.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


