Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDEE6F863
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:11:31 +0000 (UTC)
Message-ID: <5323545F.5080205@communistcode.co.uk>
Date: Fri, 14 Mar 2014 19:11:27 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
	<53235105.4060205@linux.intel.com>
In-Reply-To: <53235105.4060205@linux.intel.com>
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
X-List-Received-Date: Fri, 14 Mar 2014 19:11:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 14/03/2014 18:57, Saul Wold wrote:
> On 03/14/2014 11:34 AM, Paul Barker wrote:
>> I'm stuck using Dylan for a project as I need a 3.2 series kernel.
>> Building on my current development machine I ran into two failures:
>>
>> eglibc-initial, do_configure: Make 4.0 isn't recognised
>>
>> This can be fixed by backporting
>> a678243d6e4add90c1e9459da42de34d3724db5d (already in Dora).
>>
>> linux-yocto_3.2: do_patch: Unsupported version of git (1.9.0)
>>
>> I fixed this by removing git-native from ASSUME_PROVIDED in
>> meta/conf/bitbake.conf so that git-native-1.8.1.4 was built and used.
>> That isn't something we should commit in Dylan but may be useful for
>> others to know the solution if they run into the same problem.
>>
> Can't you use the buildtools tarball?  It includes the right version of
> make and git.

Indeed, this is what I do on my ArchLinux machines when something is too 
new; it's just a simple sourcing of an environment file before the build 
and you're good to go.

Cheers,

>
> Sau!
>
>> Thanks,
>>

