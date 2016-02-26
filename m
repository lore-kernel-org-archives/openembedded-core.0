Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 28C40731CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 20:16:24 +0000 (UTC)
Received: (qmail 18462 invoked by uid 1003); 26 Feb 2016 20:16:25 -0000
Received: from unknown (HELO ?192.168.11.140?)
	(philip@opensdr.com@71.171.15.136)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	26 Feb 2016 20:16:25 -0000
To: Rudolf J Streif <rudolf.streif@gmail.com>, yocto@yoctoproject.org
References: <1456508168.11498.95.camel@linuxfoundation.org>
	<56D09D35.8040002@balister.org>
	<1456512644.11498.108.camel@linuxfoundation.org>
	<2042150.gN3rpHrprf@rjs-zotac.streifs.net>
From: Philip Balister <philip@balister.org>
Message-ID: <56D0B298.9050108@balister.org>
Date: Fri, 26 Feb 2016 15:16:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <2042150.gN3rpHrprf@rjs-zotac.streifs.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Yocto Project Status WW09
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
X-List-Received-Date: Fri, 26 Feb 2016 20:16:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 02/26/2016 02:52 PM, Rudolf J Streif wrote:
>>>>
>>>> * We're about to try and transition meta-yocto within meta-yocto to
>>>>
>>>>   meta-poky. The amount of pain this is causing is horrible :(.
>>>
>>> Thanks for doing this. Can you summarize the pain? Are there any
>>> important lessons here?
>>
>> The key lesson is our current "migration" code in OE-Core sucks and I
>> have some patches in progress which rewrite pieces of it in a way that
>> makes it more useful. I'm therefore trying to make some positives from
>> it.
>>
>> That said, I haven't found a way to make this work without leaving a
>> dummy layer.conf in the old location since a missing layer.conf file is
>> fatal to bitbake very early on before any migration code triggers.
>>
>> More should become clear when I post the patches, I've been holding off
>> that until I actually manage a patch set that works on the
>> autobuilder...
>>
>> Patches should be out over the weekend (in time for the freeze).
> 
> Sounds like a lot of work and potential for breaking things with little added 
> value other than a more consistent naming. What was the rationale for making 
> the change, if I may ask?

Consistent naming :) It does it make it much easier to explain what the
meta-yocto layer is for. This has been one source of a great deal of
confusion about how all the pieces come together.

I must admit, I'm surprised this is tricky. I look forward to seeing
what needs doing. Hopefully, it shows me things I can avoid in my work.

Philip

> 
> Thanks,
> :rjs
> 
> 

