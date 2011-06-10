Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUrvY-0002Os-DN
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 04:58:28 +0200
Received: by pxj1 with SMTP id 1so1463874pxj.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 19:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=YoJcKCArSpp+IGbtXoW9MtjKURsGvbTKFcmybpm4/Kc=;
	b=GefDFT//Sc84MvNM+w54kJyJC5dfk7sxwUGRR+nxBXMtuWe+Q58ScWS7BxC2CfSiiL
	LalzantdO/++M/5gn7P350KmkHmLoxJ3QTHmrEp1f1VSc1BmbAW3nNYjisOeaHZXqMVk
	Pnc295U3mkfSvEIQG1bCuvLpVe09X5b47y1is=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=j0oWk+yve6ROck/gK+ZaxFUkwPsOpjd/AAaNaLWskW2MIOkMHpSPQ87/ImuS2CNGjL
	ASdQGLf1M6ddQTFR4mROYfuKA2hPYgYLFVI4OdyV+YPagMrAI7J+L+cVNl+iOmTXjM0d
	7ob4gi87NxQX6FWEsDpPeHyz+2lMUPBnNEC1M=
Received: by 10.142.166.20 with SMTP id o20mr272474wfe.121.1307674503702;
	Thu, 09 Jun 2011 19:55:03 -0700 (PDT)
Received: from [172.23.8.101] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id d15sm2363268wfl.6.2011.06.09.19.55.01
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 19:55:02 -0700 (PDT)
Message-ID: <4DF18783.6050303@gmail.com>
Date: Thu, 09 Jun 2011 19:54:59 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4DE850E8.2050701@windriver.com> <4DF14BE9.7080704@intel.com>
	<4DF15C93.7090606@mentor.com>
In-Reply-To: <4DF15C93.7090606@mentor.com>
Subject: Re: [Yocto] The design document for ccache-native
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
X-List-Received-Date: Fri, 10 Jun 2011 02:58:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2011 04:51 PM, Tom Rini wrote:
> On 06/09/2011 03:40 PM, Saul Wold wrote:
>> On 06/02/2011 08:11 PM, wenzong fan wrote:
>>> Hi Folks,
>>>
>>> Please help me to review the design document for ccache-native, and
>>> I also have two questions about it, any answers or suggestions are
>>> appreciated.
>>>
>>> * Feature name: ccache-native
>>>      Priority: P3; M2
>>>      Owner: Wenzong Fan
>>>      Summary: Integrate ccache-native to yocto
>>>
>>> * Description:
>>> Bitbake supports the 'CCACHE Mechanism', but 'ccache' hasn't been
>>> included by poky/yocto, just add it as a native tool.
>>>
>>> * Usage:
>>> Build ccache as a native tool by default and enable it for speeding
>>> target packages build.
>>>
>>> * Implementation:
>>> 1) Copy bb file from OE upstream to:
>>>        meta/recipes-devtools/ccache/
>>>
>>> 2) Update bb file to get the latest ccache_3.1.5 and split the single
>>> bb file to:
>>>        'ccache_3.1.5.bb', 'ccache.inc'
>>>
>>> 3) Enable ccache in the native tools building.
>>>
>> You will need to have it be a dependency pretty early on in the build.
>> Additionally, this is a bit a new part to this task, we want to have the
>> default CCACHE_DIR for the build default to a directory in TMPDIR
>> instead of the user's home directory.  This will mean setting an
>> environment variable somewhere early also.
>
> Can we instead veto ccache and remove it from the bitbake docs?  I can't
> count the number of times I've run into what I can only imagine are
> ccache conflicts to explain why a random build failure with ccache in use.
>

It works on some hosts somewhat reliably and is unpredictable on some as 
you say. I think keeping it optional is probably the right thing but 
making it default may not be a good thing.


