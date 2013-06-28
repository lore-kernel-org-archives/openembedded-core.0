Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19D616AEDE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 13:16:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5SDEs5a005129
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2013 06:14:54 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 28 Jun 2013 06:14:48 -0700
Message-ID: <51CD8C13.2070409@windriver.com>
Date: Fri, 28 Jun 2013 08:13:55 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LY--AwQsoe8LKxdqFptoa7TXd2AhqexP6XvnC_Ua+v52Q@mail.gmail.com>
	<CANyK_8eBqvC7nSKzE8Dg2imQ31+_9RdGqB5_GbuKB6YSaHw04w@mail.gmail.com>
In-Reply-To: <CANyK_8eBqvC7nSKzE8Dg2imQ31+_9RdGqB5_GbuKB6YSaHw04w@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Fri, 28 Jun 2013 13:16:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/13 5:20 AM, Paul Barker wrote:
> On 27 June 2013 15:21, Burton, Ross <ross.burton@intel.com> wrote:
>> On 27 June 2013 15:08, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
>>>
>>> A number of vendors are providing a modified version, so checking
>>> for just the version string is not enough.  We also need to check
>>> if the patch for the issue has been applied.  We use a modified
>>> version of the reproduced to check for the issue.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>
>> Verified that this detects the 3.82 in Debian's experimental
>> repository that is well and truly broken.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>
>
> This picks out the current version of make in Arch Linux as broken
> despite it having a patch for bug #30612. I'm not sure if this is
> intended, could be that the applied patch isn't a complete fix. I
> don't have time to dig into this, just thought it'd be useful to you
> to know.

This is exactly why the check is being done.  From what I found there are a 
number of make versions on various distros that only have partial fixes for bug 
30612.

For the RedHat/Fedora bug I filed, see:
  https://bugzilla.redhat.com/show_bug.cgi?id=975597

The test case, and a patch to the missing commit are listed.

 
http://git.savannah.gnu.org/cgit/make.git/commit/?id=b06b8c64a29a5ba3a8daecd829fa2f98d42cb285

> If you know what fix you're looking for, the applied patches and build
> script can be seen at
> https://projects.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/make

Looking at that list, it appears the commit referenced above is indeed the one 
missing.

--Mark

> Thanks,
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
>


