Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6ltb-0002pW-L0
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 19:17:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Aug 2012 10:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="215382005"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2012 10:05:20 -0700
Message-ID: <503E4BD0.5090903@linux.intel.com>
Date: Wed, 29 Aug 2012 10:05:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <1343052252-4154-1-git-send-email-radu.moisan@intel.com>
	<lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<500E50C5.8000403@intel.com>
	<CABcZANkJhW+yER52vnbXSywxd-mhpNTPrFixL6R27thmMRmhMg@mail.gmail.com>
	<CAJTo0LYT5Jup6SXnmA62+Wy8sua94BdB_VwuHJ8erK1gshaYFw@mail.gmail.com>
	<CAEsOVNcVB5zp7rhN4LP7ANx3hDq51kFQt_0L=O5=YLU6Qp_D-Q@mail.gmail.com>
	<CABcZANkfFMgTxeQWzpKe2d2NqhMYaz27q-dnfW5m7-BJO2yygQ@mail.gmail.com>
	<CAEsOVNd1DB0M5pNndxMLt4bdMwRCADPBLv9pw9pC_TELPwXAVA@mail.gmail.com>
	<CAJTo0LYU_DpA9oywH9wCu9DHwJR-B7iJk6_nPiT=SAGGNSGVwA@mail.gmail.com>
	<503E1DB9.2050300@intel.com>
In-Reply-To: <503E1DB9.2050300@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kmod: Handle undefined O_CLOEXEC
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
X-List-Received-Date: Wed, 29 Aug 2012 17:17:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2012 06:48 AM, Radu Moisan wrote:
>
> On 08/15/2012 10:32 PM, Burton, Ross wrote:
>> On 15 August 2012 20:27, McClintock Matthew-B29882
>> <B29882@freescale.com> wrote:
>>> I've been doing something similar and it's been working OK. -  I think
>>> we should apply Ross's patch.
>> Radu's, not mine.
>>
>> Ross
> What's happening with this one? Is it going to me merged or something
> needs to be changed. As I see the comments, it should be fine.
>
Radu,

I think that Matthew's patch was merged

[OE-core] [PATCH v2] kmod-native_git.bb: fix builds for hosts with older 
libc

Did this not fix this issue?

Sau!


> Radu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


