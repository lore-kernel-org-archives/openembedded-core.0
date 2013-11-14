Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E384F6D588
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 18:01:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Nov 2013 09:57:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="435347750"
Received: from unknown (HELO [10.255.15.61]) ([10.255.15.61])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2013 10:01:13 -0800
Message-ID: <52850FE8.3040409@linux.intel.com>
Date: Thu, 14 Nov 2013 10:01:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1384433183.git.Qi.Chen@windriver.com>	<a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>	<5284CFAD.2060903@mlbassoc.com>	<1384436557.17320.62.camel@phil-desktop.brightsign>
	<5284F119.8010903@windriver.com>
In-Reply-To: <5284F119.8010903@windriver.com>
Subject: Re: [PATCH 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Thu, 14 Nov 2013 18:01:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2013 07:49 AM, Mark Hatle wrote:
> On 11/14/13, 7:42 AM, Phil Blundell wrote:
>> On Thu, 2013-11-14 at 06:27 -0700, Gary Thomas wrote:
>>> Also, is "-" actually valid?  I seem to recall having problems when
>>> my build
>>> tree had the hyphen ("-") in the path.
>>
>> Paths with "-" in certainly work for me.  If there are any recipes which
>> break in that situation then we should just fix them.
>
> We found an issue with paths that -start- with a '-', there are
> apparently many places where paths are passed into various shell, and
> the initial '-' can be read as an argument identifier.
>

I think that I saw an email talking about "-D" in the TMPDIR caused some 
some recipes to pick that up as a CFLAG define and cause problems

Sau!

>> OE already has quite a range of baroque restrictions on what sort of
>> TMPDIR you are allowed to use (no nfs, no symlinks in the path, no
>> spaces in the name) and every new prohibition represents a loss in
>> usability.  This patch as proposed already forbids a whole range of
>> characters, including things like "+", and I think that disallowing "-"
>> as well would be a step too far.
>
> I don't believe Qi Chen sent it to the list, but we built path names
> with all of the special characters and tried to run builds.  The
> specific list is based on the results of those tests.  The other items
> are already broken, and we're trying to be explicit with this for end
> users.  (Note, it's really the TMPDIR that matters.. the 'build'
> directory is a lot more flexible.)
>
> --Mark
>
>> p.
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

