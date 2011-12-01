Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RWAGk-0007OB-AG
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 18:17:58 +0100
Received: by faaa19 with SMTP id a19so1381534faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=QrxkIFEPmTu8l6jgJM0o3peuPwsw9xaRtKtwCD+G90I=;
	b=CZZH4HInALgoSCJlGYW17xRGs0m3qy7vHYSTYazdM2EQIduAXmk4YQYy/YCgSaGYyC
	NCQjwU3uveExIrzgz6LcpgPm90ASNyA97SIBLDvdHw2DHFQKl+5gKc3yJAKgdQVZx6Yv
	2BFLDavcbCpfbEcImRMlniA+05ZOyOQ+HCgK4=
MIME-Version: 1.0
Received: by 10.180.4.167 with SMTP id l7mr5438431wil.51.1322759476463; Thu,
	01 Dec 2011 09:11:16 -0800 (PST)
Received: by 10.216.159.147 with HTTP; Thu, 1 Dec 2011 09:11:16 -0800 (PST)
In-Reply-To: <4ED70FBF.6020308@intel.com>
References: <4ED6CC1E.5040504@windriver.com>
	<4ED70FBF.6020308@intel.com>
Date: Thu, 1 Dec 2011 12:11:16 -0500
Message-ID: <CADkTA4MERvy7koht=gg_P-tTUYkfegNDK4B6Gw7oapYm+cC+qA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: linux-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 01 Dec 2011 17:17:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2011 at 12:25 AM, Saul Wold <saul.wold@intel.com> wrote:
> On 11/30/2011 04:36 PM, Bruce Ashfield wrote:
>>
>> Richard/Saul,
>>
>> FYI: I can't get git-send email to work over the hotel wifi, so
>> I can't chain the patches to this email. If you want me to send
>> the patches separately, let me know. But for now, this is the
>> best I can do.
>>
>> This pull request represents a collection of changes that were
>> part of yocto M1 work, and that set the stage for more updates
>> that will follow in the not too distant future.
>>
>> I've bumped the 3.0 kernel to the 3.0.10 baseline (3.0.11 is
>> out, but not in this merge request) and updated our -rt patches
>> to the latest upstream -rt series.
>>
>> This also drops the 2.6.34 recipe and leaves it to be supported
>> in previous releases. If there's somewhere else I should be
>> putting it, let me know and I'll put it there.
>>
>> The kernel revision updates have been built and boot tested by
>> Tom and myself. And we have't seen any problems.
>>
>> Also included in this are some changes to kernel tools that
>> prepare to move the kernel tools into the kernel tree itself.
>> They also move us to doing configuration auditing using the
>> merge_config script that Darren and John Stultz have been
>> working on.
>>
>> And finally there's a small tweak to install the kernel tools
>> via Makefile in the package itself, something that I recall
>> Richard mentioning to me over 2 years ago a meeting .. so I thought
>> I'd finally get to it.
>>
>> Cheers,
>>
>> Brucedvhart@linux.intel.com
>>
>> cc: Tom Zanussi <tom.zanussi@intel.com>
>> cc: Darren Hart <dvhart@linux.intel.com>
>>
>> The following changes since commit
>> d7cd934376ae1edaf7055ec635eb3c85fdbf58b3:
>>
>> squashfs-tools: fix PR, those should start with 'r' (2011-11-30 23:37:44
>> +0000)
>>
>> are available in the git repository at:
>> git://git.pokylinux.org/poky-contrib zedd/kernel
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel
>>
>> Bruce Ashfield (7):
>> kern-tools: add pre_config and merge_config.sh to the list of tools
>> kernel-yocto: support allnoconfig base configuration
>> linux-yocto: remove 2.6.34 recipes
>> linux-yocto: v3.0.9 + enhancements
>> linux-yocto: v3.0.10 + rt27
>> linux-yocto: prefer in-tree tools to external ones
>> kern-tools: use Makefile provided install rules
>>
>> meta/classes/kernel-yocto.bbclass | 24 +++++++++-
>> .../kern-tools/kern-tools-native_git.bb | 15 ++----
>> meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb | 38 ---------------
>> meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb | 8 ++--
>> meta/recipes-kernel/linux/linux-yocto_2.6.34.bb | 49 -------------------=
-
>> meta/recipes-kernel/linux/linux-yocto_3.0.bb | 18 ++++----
>> 6 files changed, 39 insertions(+), 113 deletions(-)
>> delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_2.6.34.bb
>> delete mode 100644 meta/recipes-kernel/linux/linux-yocto_2.6.34.bb
>>
>
> I had a problem with this change set, it gave me the following:
>
> NOTE: Error expanding variable do_kernel_checkout =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | ETA:
> 00:00:07
> ERROR: Unable to parse
> /intel/poky/distro/meta/recipes-kernel/linux-libc-headers/linux-libc-head=
ers-yocto_git.bb

Aha. None of my BSPs use this, so I didn't see it. I'll have to
re-send this post M1, since
I'll be on a plane soon and can't resend this before next week.

Cheers,

Bruce

>
> during parsing.
>
> Sau!
>
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


