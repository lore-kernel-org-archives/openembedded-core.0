Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA1771C5F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 15:15:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jan 2017 07:15:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="52652422"
Received: from unknown (HELO [10.219.4.164]) ([10.219.4.164])
	by orsmga004.jf.intel.com with ESMTP; 26 Jan 2017 07:15:28 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Christopher Larson <clarson@kergoth.com>
References: <cover.1485247027.git.mariano.lopez@linux.intel.com>
	<f375139dfac77be3c12335a6a302582368ceeb13.1485247027.git.mariano.lopez@linux.intel.com>
	<CABcZANn9jc51biiwD=0v9izwzovbpwaE0bLtnpBX3VE=oVLfiQ@mail.gmail.com>
	<1485345378.30673.88.camel@linuxfoundation.org>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <9d6ac8ff-f401-06fd-689c-05bf11eb209d@linux.intel.com>
Date: Thu, 26 Jan 2017 09:16:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485345378.30673.88.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package_ipk.bbclass: Add check for empty lines in DESCRIPTION
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
X-List-Received-Date: Thu, 26 Jan 2017 15:15:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 25/01/17 05:56, Richard Purdie wrote:
> On Tue, 2017-01-24 at 11:52 -0700, Christopher Larson wrote:
>> On Tue, Jan 24, 2017 at 1:37 AM, <mariano.lopez@linux.intel.com>
>> wrote:
>>> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>>>
>>> opkg uses empty lines as separator for next package and if an ipk
>>> file was packaged with empty lines in DESCRIPTION opkg won't be
>>> able to handle such ipk file, this happens at execution time.
>>>
>>> This commit will add a check for empty lines in DESCRIPTION when
>>> generating to ipk package to avoid this issue.
>>>
>>> [YOCTO #10677]
>>>
>>> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
>>>
>> Could it handle a line with just a space, or a period? Could you not
>> replace the lines with that instead, rather than aborting?
> FWIW package_deb uses ".".

Also opkg will strip() the lines, so an empty space is not a option here.

>
> Also, please use bb.fatal() calls with caution, I just removed several
> from that class. In this case its perhaps ok but often the correct
> thing to do is raise an exception of some kind. This means bitbake will
> generate a usable traceback rather than simply printing the fatal
> message. In this case the message is probably fine but there were
> several cases where a traceback was a much better idea as the fatal
> message wasn't enough to debug with.

Fair enough, I will consider this advice when using bb.fatal()

Regards,
Mariano

