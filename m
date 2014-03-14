Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8470B6EAB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 18:57:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Mar 2014 11:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,656,1389772800"; d="scan'208";a="500092896"
Received: from unknown (HELO [10.255.13.124]) ([10.255.13.124])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2014 11:57:10 -0700
Message-ID: <53235105.4060205@linux.intel.com>
Date: Fri, 14 Mar 2014 11:57:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
In-Reply-To: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
Subject: Re: [dylan] Backport request
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
X-List-Received-Date: Fri, 14 Mar 2014 18:57:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2014 11:34 AM, Paul Barker wrote:
> I'm stuck using Dylan for a project as I need a 3.2 series kernel.
> Building on my current development machine I ran into two failures:
>
> eglibc-initial, do_configure: Make 4.0 isn't recognised
>
> This can be fixed by backporting
> a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).
>
> linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)
>
> I fixed this by removing git-native from ASSUME_PROVIDED in
> meta/conf/bitbake.conf so that git-native-1.8.1.4 was built and used.
> That isn't something we should commit in Dylan but may be useful for
> others to know the solution if they run into the same problem.
>
Can't you use the buildtools tarball?  It includes the right version of 
make and git.

Sau!

> Thanks,
>

