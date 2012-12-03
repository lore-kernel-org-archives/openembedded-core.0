Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tfc2T-0005gn-Qr
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 20:50:50 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Dec 2012 11:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,209,1355126400"; d="scan'208";a="251238982"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.44])
	by orsmga002.jf.intel.com with ESMTP; 03 Dec 2012 11:36:26 -0800
Message-ID: <50BCFF3A.9010408@linux.intel.com>
Date: Mon, 03 Dec 2012 11:36:26 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20121203144920.55C841035D@opal>
	<20121203191542.GG3354@jama.jama.net>
In-Reply-To: <20121203191542.GG3354@jama.jama.net>
Subject: Re: [oe-commits] Saul Wold : util-linux: Update to 2.22.1
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
X-List-Received-Date: Mon, 03 Dec 2012 19:50:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2012 11:15 AM, Martin Jansa wrote:
> On Mon, Dec 03, 2012 at 02:49:20PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: ac807121ce3ba965f3e2a4f664a60ae4e33ce550
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=ac807121ce3ba965f3e2a4f664a60ae4e33ce550
>>
>> Author: Saul Wold <sgw@linux.intel.com>
>> Date:   Fri Nov 16 19:51:34 2012 +0000
>>
>> util-linux: Update to 2.22.1
>>
>> Fix the configure-sbindir test, which was not working correctly
>> add a patch to configure to correctly test if the prefixes are
>> conatined in libdir so they don't duplicate.
>>
>> Removed aarch64 patch since it been merged into this version
>>
>> Rebased util-linux-ng-replace-siginterrupt.patch
>
> This seems to autodetect systemd if available and cause some unpackaged
> files
>
> util-linux-2.22.1: util-linux: Files/directories were installed but not
> shipped
>    /lib/systemd
>    /lib/systemd/system
>    /lib/systemd/system/uuidd.socket
>    /lib/systemd/system/uuidd.service
>
> I should be resolved by meta-systemd, by adding bbappend (that's what I
> did for pcsc-lite doing the same).
>
> But maybe oe-core should explicitly disable systemd for meta-systemd to
> explicitly enable it back.
>
Sorry about that, I know that Khem also had some changes that I am 
looking at, I have not looked to see if they address the issue.

Sau!

> Cheers,
>
>>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>   meta/recipes-core/util-linux/util-linux.inc        |   21 +++++++++++--------
>>   .../util-linux/add-aarch64-support.patch           |   18 -----------------
>>   .../util-linux/util-linux/configure-sbindir.patch  |   15 +++++++++----
>>   .../util-linux/util-linux/fix-configure.patch      |   20 +++++++++++++++++++
>>   .../util-linux/uclibc-__progname-conflict.patch    |   14 ++++++------
>>   .../util-linux-ng-replace-siginterrupt.patch       |   15 +++++++------
>>   .../{util-linux_2.21.2.bb => util-linux_2.22.1.bb} |   10 ++++----
>>   7 files changed, 62 insertions(+), 51 deletions(-)
>>
>> Diff:   http://git.openembedded.org/?p=openembedded-core.git/?a=commitdiff;h=ac807121ce3ba965f3e2a4f664a60ae4e33ce550
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


