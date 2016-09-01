Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob07.myregisteredsite.com
	(atl4mhob07.myregisteredsite.com [209.17.115.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA20731DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 05:14:14 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.209])
	by atl4mhob07.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	u815EEkc007860 for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2016 01:14:14 -0400
Received: (qmail 26524 invoked by uid 0); 1 Sep 2016 05:14:14 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.121?)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 1 Sep 2016 05:14:14 -0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
References: <lya8ftx7w4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1472662673.29583.90.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <57C7B924.8050802@topic.nl>
Date: Thu, 1 Sep 2016 07:14:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1472662673.29583.90.camel@linuxfoundation.org>
Subject: Re: Replacement for tslib?
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
X-List-Received-Date: Thu, 01 Sep 2016 05:14:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 31-08-16 18:57, Richard Purdie wrote:
> On Wed, 2016-08-31 at 17:42 +0200, Enrico Scholz wrote:
>> Hello,
>>
>> tslib is more or less mandatory for resistive touchscreens but it was
>> removed some days ago.  This breaks e.g. meta-qt5 layer which depends
>> on it.
>>
>> Is this removal really final (which would be really bad, because
>> resistive
>> touchscreens are used e.g. in industrial environments)?
>
> The underlying pressure was from xcalibrate never having been merged
> into x11 and hence needing to replace xtscal by xinput-calibrate. With
> that change, the need for tslib wasn't clear.
>
> Its was also frustrating having two sets of pointercal files, one for
> xinput-calibrate and one for tslib.
>
> That said, I can see the need for tslib and if that is the only way to
> support these touchscreens in qt5/qt4 we might have to reconsider that.
>
> Are you sure the kernel interfaces that xinput is using don't work for
> qt4/qt5? If not, we may need to reconsider tslib...

Once reason to use Qt is the fact that you don't need X11 for it. And tslib is 
the only calibration tool that seems to work properly with resistive touchscreens.

