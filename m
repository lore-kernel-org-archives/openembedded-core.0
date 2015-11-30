Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 77EEB605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:26:49 +0000 (UTC)
Received: (qmail 20394 invoked by uid 1003); 30 Nov 2015 14:26:49 -0000
Received: from unknown (HELO ?192.168.11.124?)
	(philip@opensdr.com@108.44.110.59)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	30 Nov 2015 14:26:49 -0000
To: Andre McCurdy <armccurdy@gmail.com>
References: <565A634F.4020508@balister.org>
	<CAJ86T=VT051Y_=hEOpiPLs=CYZ=qgRg-a1HOVoGauDR8xJuVCw@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <565C5CA0.9020906@balister.org>
Date: Mon, 30 Nov 2015 09:26:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VT051Y_=hEOpiPLs=CYZ=qgRg-a1HOVoGauDR8xJuVCw@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Should the devmem2 recipe move to oe-core?
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
X-List-Received-Date: Mon, 30 Nov 2015 14:26:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 11/30/2015 02:09 AM, Andre McCurdy wrote:
> On Sat, Nov 28, 2015 at 6:30 PM, Philip Balister <philip@balister.org> wrote:
>> I was poking at the layer index and ran across this:
>>
>> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=devmem
>>
>> The recipe appears in 4 layers.
>>
>> Should we just move it to openembedded-core?
> 
> The busybox version appears to be better maintained (it's gained
> support for 64bit data types, which is still missing from the
> original), so maybe better to recommend the busybox version instead.

I think there is "some issue" with the busybix version, possibly related
to automatic readback after write. I'll ask around.

Philip

> 
>> I wonder how easy it would
>> be to have the layer index report duplicate recipes?
>>
>> Philip
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

