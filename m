Received: from bluegiga.fi ([194.100.31.45] helo=darkblue.bluegiga.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Lauri.Hintsala@bluegiga.com>) id 1S3LuQ-00085f-By
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 07:24:06 +0100
Received: from [10.1.1.28] ([10.1.1.28]) by darkblue.bluegiga.com with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 2 Mar 2012 08:15:37 +0200
Message-ID: <4F506587.50904@bluegiga.com>
Date: Fri, 02 Mar 2012 08:15:35 +0200
From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Lightning/1.0b2 Thunderbird/3.1.19
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>	<1330613948.31767.12.camel@ted>
	<4F4F918B.4010404@mlbassoc.com>	<4F4F9552.8040107@mlbassoc.com>
	<1330616672.31767.23.camel@ted>	<4F4F9B21.3000407@mlbassoc.com>	<CAP9ODKqmYL2QPDJk8AdDOxoL+EZ+B4y7OwLbsZ-+NDRLjxz3+Q@mail.gmail.com>
	<4F4F9E70.7010807@mlbassoc.com>
In-Reply-To: <4F4F9E70.7010807@mlbassoc.com>
X-OriginalArrivalTime: 02 Mar 2012 06:15:37.0131 (UTC)
	FILETIME=[E25B87B0:01CCF83B]
Subject: Re: [PATCH] initscripts: Properly handle new timestamp format
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
X-List-Received-Date: Fri, 02 Mar 2012 06:24:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2012 06:06 PM, Gary Thomas wrote:
>>> As far as I can recall (which is a really long time), 'date' has always
>>> wanted the format MMDDHHmm[YYYY], so I think that's what we should
>>> expect.
>>> That format doesn't compare easily which is why the timestamp was
>>> changed
>>> (not by me) to a more ISO standard YYYYMMDDHHmm. If busybox has 64-bit
>>> math enabled, then this can be compared with no problems, it just has
>>> to be munged into the format 'date' wants.
>>
>> So we can have compat and 64-bit math and have it properly behaving?
>
> Yes, I believe so. I'll work up the patch and test it now.


It might be very helpful for other developers if 64-bit math requirement 
of busybox would be documented somewhere.

BR,
Lauri


