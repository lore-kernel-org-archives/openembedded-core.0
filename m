Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke@linux.intel.com>) id 1QWIpA-0006gN-MF
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 03:53:48 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jun 2011 18:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,361,1304319600"; d="scan'208";a="17845646"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2011 18:49:18 -0700
Received: from [10.239.22.57] (unknown [10.239.22.57])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 0DA3D6A4482;
	Mon, 13 Jun 2011 18:49:11 -0700 (PDT)
Message-ID: <4DF6BE1C.40801@linux.intel.com>
Date: Tue, 14 Jun 2011 09:49:16 +0800
From: Yu Ke <ke@linux.intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>	<BANLkTikZxd4Gg0b0nanMupmdYBf-3LUp7g@mail.gmail.com>	<201106131700.37382.paul.eggleton@intel.com>
	<BANLkTikCsx_dWk85Cih3cdFox6-vudWYHg@mail.gmail.com>
In-Reply-To: <BANLkTikCsx_dWk85Cih3cdFox6-vudWYHg@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Subject: Re: [PATCH] RFC - combo layer repo tool
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
X-List-Received-Date: Tue, 14 Jun 2011 01:53:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011/6/14 0:37, Otavio Salvador wrote:
> On Mon, Jun 13, 2011 at 16:00, Paul Eggleton<paul.eggleton@intel.com>  wrote:
>> On Monday 13 June 2011 16:33:47 Otavio Salvador wrote:
>>> I think it is duplicating many features of git submodule. It seems
>>> more logical to put a script above git submodule rather then use a
>>> full repository for it.
>>
>> You're right in that git submodule provides a lot of these things. However,
>> submodules don't give us the ability to split out and maintain just certain
>> subdirectories / files; this allows us to bring in parts of external layers
>> where the parts of that layer we want are not split out neatly into a
>> subdirectory.
>
> I will give the script a try and see how it behave to us.
>

Thanks for trying this. Any feedback is welcome.

Regards
Ke


