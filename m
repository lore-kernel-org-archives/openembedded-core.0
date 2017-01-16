Return-Path: <geoffrey.levillain@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id C8E6A71A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 12:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 8D7871EE09C2;
	Mon, 16 Jan 2017 13:54:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 5abd+qYy2NZt; Mon, 16 Jan 2017 13:54:25 +0100 (CET)
Received: from [10.1.75.240] (gre92-5-82-237-199-7.fbx.proxad.net
	[82.237.199.7])
	by idris.smile.fr (Postfix) with ESMTPSA id 6D8831EE1C4B;
	Mon, 16 Jan 2017 13:54:25 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170103111203.25132-1-geoffrey.levillain@smile.fr>
	<1483444144.4367.48.camel@linuxfoundation.org>
	<791f2aff-f9cf-03e6-8dff-9319a5dee775@smile.fr>
From: Geoffrey Levillain <geoffrey.levillain@smile.fr>
Message-ID: <992bc488-432f-d7b0-7f32-16f791d6a7c5@smile.fr>
Date: Mon, 16 Jan 2017 13:54:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <791f2aff-f9cf-03e6-8dff-9319a5dee775@smile.fr>
Subject: Re: [PATCH 1/1] image.bbclass: reactivate do_fetch, do_unpack and do_patch
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
X-List-Received-Date: Mon, 16 Jan 2017 12:54:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2017 14:23, Geoffrey Levillain wrote :
> On 03/01/2017 12:49, Richard Purdie wrote :
>> On Tue, 2017-01-03 at 12:12 +0100, Geoffrey Levillain wrote:
>>> Running fetch/unpack/patch can be used to get some image-specific
>>> configurations files to apply with a function in the
>>> ROOTFS_POSTPROCESS_COMMAND variable.
>>>
>>> Hence delete the "noexec" line corresponding to these tasks so we can
>>> run them when needed.
>> You could make this argument for the other noexec lines too and nothing
>> does this by default as far as I'm aware. Could you not do something
>> like:
>>
>> python () {
>>      d.delVarFlag("do_fetch", "noexec")
>> }
>>
>> in your specific recipes which need this?
>>
>> Cheers,
>>
>> Richard
>
> Other noexec lines are more related to program compilation,
> I think that fetch configuration files to apply is a more generic case
> for images.
>
> The argument could work for do_install but there is a risk of overwrite
> with other version of same config files, image-specific configuration
> must be on higher priority, so there is a need to install them after
> every other task (to eventually overwrite less specific config. files).
>
> I could do the delVarFlag thing but I think that fetch image-specific 
> file
> is generic, and that the noexec flag here doesn't save much time anyway.
>
> Regards,
>
> Geoffrey Levillain
Is the patch still "on hold", or is it "dropped" ?


Regards,

Geoffrey Levillain

