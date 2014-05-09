Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0FD6059B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 15:32:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2014 08:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1018,1389772800"; d="scan'208";a="529190650"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2014 08:31:31 -0700
Message-ID: <536CF4D3.6020701@linux.intel.com>
Date: Fri, 09 May 2014 08:31:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <1399591490-13000-1-git-send-email-mark.hatle@windriver.com>	<CAJTo0LZ75OkvT+yNkbczmqVT1=xSCu1PZainWDyWXAy8Frro+Q@mail.gmail.com>
	<536CF0E6.9060800@windriver.com>
In-Reply-To: <536CF0E6.9060800@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: Add /run/lock as a standard directory
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
X-List-Received-Date: Fri, 09 May 2014 15:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2014 08:14 AM, Mark Hatle wrote:
> On 5/9/14, 4:16 AM, Burton, Ross wrote:
>> On 9 May 2014 00:24, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> The /run/lock directory was being dynamically created during package
>>> install,
>>> but should have been owned by the base-files package.
>>
>> Doesn't do_install generate the /var/run/lock -> /run/lock symlink, as
>> /run is always a tmpfs so has to be populated on boot?
>>
>
> The /var/run/lock -> /run/lock symlink is generated, but the /run/lock
> is never created by anything that I could find.
>
> /run is not always a tmpfs...  We've got configurations where it's
> persistent.
>
> With that said, the fix may be incorrect though if something is
> generally used to create this as a tmpfs, which package would normally
> create the directory and populate it?  the volatiles code?
>

Ross is almost correct here, there is a link generated from via the 
volatiles file in initscripts recipe, which will be created during 
package install time.

Sau!

> --Mark
>
>> Ross
>>
>

