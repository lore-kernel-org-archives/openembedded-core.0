Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-10.prod.phx3.secureserver.net
	(p3plsmtpa07-10.prod.phx3.secureserver.net [173.201.192.239])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC4165C91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 17:08:53 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa07-10.prod.phx3.secureserver.net with 
	id FV8p1p00S0BVjqb01V8rtV; Fri, 14 Nov 2014 10:08:51 -0700
Message-ID: <54663721.8080003@pabigot.com>
Date: Fri, 14 Nov 2014 11:08:49 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1414861479-5493-1-git-send-email-pab@pabigot.com>	<1414861479-5493-2-git-send-email-pab@pabigot.com>	<CAJTo0LZMvL-7bTvf_ou6PHmMpZXa81GWb3murA6t5EfceQXOow@mail.gmail.com>
	<54663213.9030709@pabigot.com>
In-Reply-To: <54663213.9030709@pabigot.com>
Subject: Re: [PATCH 1/3] pseudo: default --without-passwd-fallback
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
X-List-Received-Date: Fri, 14 Nov 2014 17:08:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2014 10:47 AM, Peter A. Bigot wrote:
> On 11/14/2014 10:16 AM, Burton, Ross wrote:
>> Hi Peter,
>>
>> Something in this series isn't working nicely with multilib enabled.
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/pseudo 
>> is the branch I was testing it in, hopefully I pulled in all the 
>> right pieces.
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/102 
>> is current master building for multilib and succeeding.
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/105 
>> is ross/pseudo which fails at rootfs time.
>>
>> Will you be able to investigate this? (or tell me I merged the wrong 
>> patches).
>
> Interesting.  I have several theories.
>
> Can you tell me where to find the exact configurations and scripts 
> necessary to replicate what the autobuilder is doing?

NM; found https://wiki.yoctoproject.org/wiki/Regression_Test which seems 
to be a starting point.

Peter

