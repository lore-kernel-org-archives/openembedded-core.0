Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rms3e-0006LE-4i
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 20:17:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jan 2012 11:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99205642"
Received: from btwarden-mobl1.amr.corp.intel.com (HELO [10.7.199.167])
	([10.7.199.167])
	by orsmga002.jf.intel.com with ESMTP; 16 Jan 2012 11:09:53 -0800
Message-ID: <4F147601.3070902@linux.intel.com>
Date: Mon, 16 Jan 2012 11:09:53 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1326225078-18652-1-git-send-email-kergoth@gmail.com>
	<lyty41ro95.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CABcZANkAfrhbi13Mr4jfVmNsfkMG7hVF2KYw-MXN9GZHbKfE9A@mail.gmail.com>
	<4F146249.6080905@linux.intel.com>
In-Reply-To: <4F146249.6080905@linux.intel.com>
Subject: Re: [PATCH] ncurses-native: install to libdir, not base_libdir
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
X-List-Received-Date: Mon, 16 Jan 2012 19:17:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/01/12 09:45, Saul Wold wrote:
> On 01/16/2012 07:32 AM, Chris Larson wrote:
>> On Thu, Jan 12, 2012 at 7:25 AM, Enrico Scholz
>> <enrico.scholz@sigma-chemnitz.de> wrote:
>>> Christopher Larson<kergoth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> writes:
>>>
>>>> --- a/meta/recipes-core/ncurses/ncurses.inc
>>>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>>>> ...
>>>> +# natives don't generally look in base_libdir
>>>> +base_libdir_virtclass-native = "${libdir}"
>>>
>>> I do not think that this should be done per recipe (afais, at least
>>> libusb is affected by the same issue).
>>>
>>> Adding '-L<baselibdir>' and the '-Wl,-rpath-link' + '-Wl,-rpath' options
>>> to BUILD_LDFLAGS would be a more general solution.
>>
>> Alternatively, could simplify the layout of the native sysroot and
>> adjust things in the native class. It could make a certain amount of
>> sense, as it makes more sense for our structure for native to match
>> the host than it does the target.
>
> So, Chris, are you going to implement this and do we drop the ncurses
> patch for now?

We need to merge something to resolve this issue sooner rather than 
later, I had to apply this change in order to build on a system without 
ncurses installed.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


