Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5A8719CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 03:23:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB83NDst027645
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 7 Dec 2016 19:23:13 -0800
Received: from server.local (128.224.21.238) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 7 Dec 2016 19:23:12 -0800
To: Trevor Woerner <twoerner@gmail.com>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
	<48f1e3e16ca28e1194d6024689d000cb6ffc303c.1480711764.git.bruce.ashfield@windriver.com>
	<1481058881.17535.58.camel@intel.com>
	<20161206230222.5411d7b6@nuc.betafive.co.uk>
	<CAHUNapQ847n7e=acLQ+hkLqziqaP8EQg5_0wrw5oJ9i9+Tw6tg@mail.gmail.com>
	<78eef00e-4156-bdbf-cda1-688ae0495414@windriver.com>
	<CAHUNapSr5a2cuKN1xiK=2K0S+zkwMA7J0ALfe1hUZAVgXv2Fpw@mail.gmail.com>
	<CAHUNapQxmOANi1FinaTiXH+J2VdyvH4g5y2zRJydBso6epf00A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <462cfa93-c10d-c705-d380-3d1236fca597@windriver.com>
Date: Wed, 7 Dec 2016 22:23:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAHUNapQxmOANi1FinaTiXH+J2VdyvH4g5y2zRJydBso6epf00A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] kern-tools: fix processing for no branch meta-data
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
X-List-Received-Date: Thu, 08 Dec 2016 03:23:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-12-07 6:50 PM, Trevor Woerner wrote:
> On Wed, Dec 7, 2016 at 1:05 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>> On Wed, Dec 7, 2016 at 11:18 AM, Bruce Ashfield
>> <bruce.ashfield@windriver.com> wrote:
>>> With the attached patch, I see nothing else that is named  in /tmp/
>>>
>>> If you have the cycles, can you give it a try and let me know ?
>>
>> Yes, I'm giving it a whirl right now. Thanks!
>
> That patch looks good, how soon can it land? ;-)

For my part, I'll send it first thing tomorrow along with some version
bumps to the kernel.

>
> I'm sure there's still something in the build that is creating
> temporary files in /tmp. I'm not sure which process is doing it, I
> have no reason to suspect it's the kernel tools (in fact I think it
> happens too early in the build to be the kernel tools), and the tmp
> files that are created are named with temporary names (e.g.
> /tmp/tmp.2wavbhTlDU) so they shouldn't interfere with multiple users
> building on the same machine. Each build appears to create two such
> temp files that aren't cleaned up at the end of the build. Not a big
> deal. I don't think it's something new that was introduced recently
> (but I'd have to do more investigation to verify).

I noticed one mktemp file leaking when I was fixing the bug at hand
today. I made a note to loop back and have a look for where an early
exit is skipping clean up.

If it is the tools, I'll fix it along with the patch I did today.

Bruce

>


