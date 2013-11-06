Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 385EC6D44E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 18:32:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Nov 2013 10:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="404619989"
Received: from unknown (HELO [10.255.14.249]) ([10.255.14.249])
	by orsmga001.jf.intel.com with ESMTP; 06 Nov 2013 10:32:33 -0800
Message-ID: <527A8B41.1000002@linux.intel.com>
Date: Wed, 06 Nov 2013 10:32:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Carlos Rafael Giani <dv@pseudoterminal.org>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <527A5666.6040208@pseudoterminal.org>
	<CAJTo0LZ6LpU88=gnD_xYJzvzC+xg34vmSKFR2h3TS2daOXbfKw@mail.gmail.com>
	<527A8217.8090605@linux.intel.com>
	<527A8A2A.6040400@pseudoterminal.org>
In-Reply-To: <527A8A2A.6040400@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Request for moving Orc to OE-core
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
X-List-Received-Date: Wed, 06 Nov 2013 18:32:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2013 10:27 AM, Carlos Rafael Giani wrote:
> On 2013-11-06 18:53, Saul Wold wrote:
>> On 11/06/2013 07:47 AM, Burton, Ross wrote:
>>> On 6 November 2013 14:47, Carlos Rafael Giani <dv@pseudoterminal.org>
>>> wrote:
>>>> As preparation for upgrading the gstreamer1.0 recipes to 1.2 , I would
>>>> propose to move Orc into OE-core.
>>>> Without Orc, key elements of GStreamer (audioconvert, audioresample,
>>>> videoconvert, videoscale ..) are much slower.
>>>> Currently Orc is in meta-oe . Its recipe uses the most recent version
>>>> (0.4.18), which is the minimum Orc version that works with GStreamer
>>>> 1.2. If
>>>> Orc is in oe-core, it can be added to the
>>>> gstreamer1.0-plugins-base/good/bad/ugly recipes' default PACKAGECONFIG
>>>> lists.
>>>
>>> I agree with this, and have wanted to do this for a while now.
>>>
>>
>> Carlos,
>>
>> please make it so and thanks for working on the gstreamer update.
>>
>> Sau!
>>
>>> Ross
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>
> Moving Orc involves moving a file from one repo to the other. How is
> this usually handled?
> By submitting one patch to OE-core (adding Orc) and one to meta-oe
> (removing Orc) at the same time?

yup, this is the best way.

Sau!

> Or is there a better way?
>
>

