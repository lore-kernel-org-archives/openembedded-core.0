Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RmqkF-0001Cp-2y
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 18:53:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Jan 2012 09:45:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96405340"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 16 Jan 2012 09:45:45 -0800
Message-ID: <4F146249.6080905@linux.intel.com>
Date: Mon, 16 Jan 2012 09:45:45 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326225078-18652-1-git-send-email-kergoth@gmail.com>
	<lyty41ro95.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CABcZANkAfrhbi13Mr4jfVmNsfkMG7hVF2KYw-MXN9GZHbKfE9A@mail.gmail.com>
In-Reply-To: <CABcZANkAfrhbi13Mr4jfVmNsfkMG7hVF2KYw-MXN9GZHbKfE9A@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>
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
X-List-Received-Date: Mon, 16 Jan 2012 17:53:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/16/2012 07:32 AM, Chris Larson wrote:
> On Thu, Jan 12, 2012 at 7:25 AM, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de>  wrote:
>> Christopher Larson<kergoth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> writes:
>>
>>> --- a/meta/recipes-core/ncurses/ncurses.inc
>>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>>> ...
>>> +# natives don't generally look in base_libdir
>>> +base_libdir_virtclass-native = "${libdir}"
>>
>> I do not think that this should be done per recipe (afais, at least
>> libusb is affected by the same issue).
>>
>> Adding '-L<baselibdir>' and the '-Wl,-rpath-link' + '-Wl,-rpath' options
>> to BUILD_LDFLAGS would be a more general solution.
>
> Alternatively, could simplify the layout of the native sysroot and
> adjust things in the native class. It could make a certain amount of
> sense, as it makes more sense for our structure for native to match
> the host than it does the target.

So, Chris, are you going to implement this and do we drop the ncurses 
patch for now?

Sau!


