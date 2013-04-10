Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UPt0H-00089Y-CI
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 13:15:49 +0200
Received: from atl4mhob12.myregisteredsite.com
	(atl4mhob12.myregisteredsite.com [209.17.115.50])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r3AAwMd8003175 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 06:58:28 -0400
Received: from mail.hostingplatform.com ([10.30.71.210])
	by atl4mhob12.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r3AAwKjJ010292 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 06:58:20 -0400
Received: (qmail 16096 invoked by uid 0); 10 Apr 2013 10:58:20 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 10 Apr 2013 10:58:20 -0000
Message-ID: <516545CC.6010605@topic.nl>
Date: Wed, 10 Apr 2013 12:58:20 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <20130228231551.3998F5022B@opal> <20130306062358.GC14869@jama>
	<5136F97E.1030906@topic.nl> <51487A22.5080900@topic.nl>
	<CAJTo0Lb8vkk1yJ1Ax747BGu8rf9BVYUSOToEPxiB+WiS3iXtbg@mail.gmail.com>
	<CAJTo0LZuX0-EeAXzBa=_LzOPw3=0h=Am0tU50-7wkmxYnJHsog@mail.gmail.com>
In-Reply-To: <CAJTo0LZuX0-EeAXzBa=_LzOPw3=0h=Am0tU50-7wkmxYnJHsog@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Busybox mdev INITSCRIPT_PARAMS gets lost
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
X-List-Received-Date: Wed, 10 Apr 2013 11:15:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2013 12:24 PM, Burton, Ross wrote:
> Hi Mike,
>
> On 10 April 2013 11:07, Burton, Ross <ross.burton@intel.com> wrote:
>>> This used to work just fine about a month ago, but it's suddenly broken. Has
>>> something changed in update-rc handling?
>>
>> Did you resolve this?  We just noticed the same thing is happening to
>> udev too.  I'm digging into it now but any leads (or a fix!) would be
>> appreciated.

Never found the cause, both work and home situations kept me from 
investigating further.

> My patch "update-rc.d: correctly look up the initscript params with
> overrides" fixes this for udev, and presumably mdev too.

Looks like a good catch. I will still post a patch for mdev starting too 
late (it should start at 03 just like udev does) when I find the time to 
spend a little time on it (either at work or as a hobby...)

Mike.



