Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLP49-0004H8-Jl
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:52:33 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 01 Nov 2011 17:46:18 -0700
Received: by faan26 with SMTP id n26so7399835faa.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 17:46:16 -0700 (PDT)
Received: by 10.223.15.10 with SMTP id i10mr4371670faa.17.1320194776485;
	Tue, 01 Nov 2011 17:46:16 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id y8sm2031950faj.10.2011.11.01.17.46.14
	(version=SSLv3 cipher=OTHER); Tue, 01 Nov 2011 17:46:15 -0700 (PDT)
Message-ID: <4EB092D4.40300@intel.com>
Date: Tue, 01 Nov 2011 17:46:12 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319725711.git.bruce.ashfield@windriver.com>
	<CADkTA4NcNdQVFXuVXC5r7u64ZX9bEZp6VW-dHxPd=EhB7sXX-w@mail.gmail.com>
In-Reply-To: <CADkTA4NcNdQVFXuVXC5r7u64ZX9bEZp6VW-dHxPd=EhB7sXX-w@mail.gmail.com>
Subject: Re: [PATCH 0/3] RFC v3: provide 3.0.x and 3.1 libc headers
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
X-List-Received-Date: Wed, 02 Nov 2011 00:52:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2011 05:41 PM, Bruce Ashfield wrote:
> On Thu, Oct 27, 2011 at 10:32 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com>  wrote:
>> Richard,
>>
>> Here's v3 of the series, the details are below.
>
> I see no comments on v3. So I'm just bumping the thread. Should I send
> a separate
> pull request for this, or is this sufficient ?
>

Appears that RP merged them in the last day or so.  So I guess this is
sufficent, consider them merged into OE-Core!

Thanks
	Sau!


> Bruce
>
> p.s. yes, I realize that everyone is catching up, I just didn't want
> to forget myself that
> this is out, but not merged or in a known state.
>
>>
>> Changes since v2:
>>
>>   - moved more code into the .inc file
>>   - modifed the python code to not import unnecessary functions and
>>    to use d.get/setVar.
>>   - Included an optional patch 3/3 to remove 2.6 based header recipes.
>>    Whether you want this or not .. is up to you!
>>
>> Changes since v1:
>>
>>   - factored common code out into the .inc file. Captured in patch 1/2
>>   - patch 2/2 is the introduction of the new headers
>>
>> v1 Email is included below:
>>
>> Here's a RFC patch for updating the toolchain linux-libc headers to 3.x
>> variants.
>>
>> The reason I'm calling it a RFC is:
>>
>>   - I wrote some anonymous python code (and I'm no python coder) to
>>     deal with 2.6 / 3.0 tgz location differences. This could have
>>     also been done with a variable set in the recipes and used by
>>     the .inc. I wasn't sure of the preferred approach, hence the RFC.
>>     I'll take no offense corrections here.
>>
>>   - I changed the .inc, but didn't bump the PR of the existing recipes
>>     and didn't remove the existing 2.6 variants. If either of these
>>     should have been done, let me know and I'll respin.
>>
>>   - I bumped the default to be 3.1. If that's too agressive for the
>>     default, and we'd prefer 3.0.8, let me know and I'll respin.
>>
>> I built and booted all the qemu machines with the 3.1 kernel headers.  So
>> from the testing I was able to do, this looks to be safe and ready to go.
>>
>> This is based on my yocto repo, I also did the changes in my oe-core
>> repository, but I don't have a oe-core contrib branch that I could push to,
>> so I chose to send the yocto variant. If someone points me to who I email for
>> an oe-core contrib branch, I can push that variant as well.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>> The following changes since commit fc94f925e848684244a38dcffe15cb1192dfbed8:
>>   Martin Jansa (1):
>>         libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: bump PR to rebuild after perl upgrade
>>
>> are available in the git repository at:
>>
>>   git://git.pokylinux.org/poky-contrib zedd/libc-headers-v3
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/libc-headers-v3
>>
>> Bruce Ashfield (3):
>>   linux-libc-headers: factor common code into linux-libc-headers.inc
>>   linux-libc-headers: provide 3.0.x and 3.1 headers
>>   linux-libc-headers: remove older recipes
>>
>>   meta/conf/distro/include/tcmode-default.inc        |    2 +-
>>   .../linux-libc-headers/linux-libc-headers.inc      |   62 +++++++++++++++++++-
>>   .../linux-libc-headers_2.6.37.2.bb                 |   53 -----------------
>>   .../linux-libc-headers_2.6.39.bb                   |   54 -----------------
>>   .../linux-libc-headers/linux-libc-headers_3.0.8.bb |    7 ++
>>   .../linux-libc-headers/linux-libc-headers_3.1.bb   |    7 ++
>>   6 files changed, 74 insertions(+), 111 deletions(-)
>>   delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
>>   delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
>>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
>>   create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>



