Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA315719B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 08:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 2E77E31A63ED;
	Fri, 11 Nov 2016 09:53:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id J64H4NBdiS9d; Fri, 11 Nov 2016 09:53:19 +0100 (CET)
Received: from [172.22.22.61] (55d475ce.access.ecotel.net [85.212.117.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 2691C31A6340;
	Fri, 11 Nov 2016 09:53:18 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Jolley, Stephen K" <stephen.k.jolley@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E572AE52E@fmsmsx111.amr.corp.intel.com>
	<e188c300-ce1b-4591-cb87-81a1497bbf34@opendreambox.org>
	<1478613085.23123.137.camel@linuxfoundation.org>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <c2bf93e9-5aa6-1849-487c-3a30336b9a0f@opendreambox.org>
Date: Fri, 11 Nov 2016 09:53:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478613085.23123.137.camel@linuxfoundation.org>
Subject: Re: Yocto Project Status WW45 - UPDATED
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
X-List-Received-Date: Fri, 11 Nov 2016 08:53:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 08.11.2016 14:51, Richard Purdie wrote:
> On Tue, 2016-11-08 at 11:00 +0100, Andreas Oberritter wrote:
>> Hello Stephen,
>>
>> On 04.11.2016 18:06, Jolley, Stephen K wrote:
>>>
>>> ·        There was a challenging taskhash mismatch test case this
>>> week
>>> which has resulted in some significant debugging improvements for
>>> taskhashes and basehashes which are now in master.
>> is there an entry in bugzilla about this issue, or can you please add
>> a reference to the actual commits in master? I'm facing a similar
>> issue, so it might be helpful for me to backport them to the branch
>> I'm using.
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=0a4a6d6956a10aa0a6589de12b0b2380a9f0a7d9
> 
> has info in the commit message. You also want:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=589f08aa852dd43af5d05d698cfa917bec084210
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=157947efc7e505e01baafb33ec93fe2f485308fe
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f6b0c60664e86fec55d282f1ea41238abd74712d
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=71c837611690ab4bec1656a58d13ca48e7c6a6e6

I backported these patches to krogoth. I think I would never have found
the cause for my taskhash mismatch without them. Thank you very much!

Best regards,
Andreas

> 
> Cheers,
> 
> Richard
> 


