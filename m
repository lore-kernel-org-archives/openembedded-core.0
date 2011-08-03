Received: from mail-pz0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qodpx-0000vS-Hn
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:58:25 +0200
Received: by pzk34 with SMTP id 34so873739pzk.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=sB8PkBNIR7/3HHZsaw0KNnQ7CbCYu1bT9w9Iu+J3qMQ=;
	b=sWo4nrmdw2vLqkSh05d+L2u2PKzyb14gJY0+ZZO3O8ym2Mu4737oy9nF6amfLMJAOj
	WsH5umNv3xDGqjfShABm16fCpCwH0gorNK9Lw/0ngq4o7RPgjGCGmfbTqU63ToJ4+mD7
	IBVC8A+a3bVjkHPj7Fj4KeVwtpdhO1Mu2/Ii0=
Received: by 10.142.101.11 with SMTP id y11mr5058654wfb.256.1312386841342;
	Wed, 03 Aug 2011 08:54:01 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t18sm132759wfk.10.2011.08.03.08.54.00
	(version=SSLv3 cipher=OTHER); Wed, 03 Aug 2011 08:54:00 -0700 (PDT)
Message-ID: <4E396F17.8020400@gmail.com>
Date: Wed, 03 Aug 2011 08:53:59 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <3C9A62B9-7C88-4DF0-A379-8E58955B89CD@kernel.crashing.org>
	<A8C5CE71-29E0-4C18-9D66-7CE0EFAE4782@kernel.crashing.org>
	<1312374341.2344.661.camel@rex>
	<A39C067A-56CC-4019-9E2A-EC8DD9039677@kernel.crashing.org>
In-Reply-To: <A39C067A-56CC-4019-9E2A-EC8DD9039677@kernel.crashing.org>
Subject: Re: help with gcc-configure-common bug
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
X-List-Received-Date: Wed, 03 Aug 2011 15:58:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2011 05:50 AM, Kumar Gala wrote:
>> Ah, I can help here:)
>> >
>> >  We only have one gcc source checkout with the shared work directory.
>> >  Each multilib (or sdk build) needs to customise SYSTEMLIBS depending on
>> >  its configuration. This is why its being done in the defaults.h file in
>> >  ${B} instead of files in ${S}.
>> >
>> >  We likely should do the substitutions in ${S} at unpack time to make
>> >  this clearer.
>> >
>> >  Cheers,
>> >
>> >  Richard
>> >
> Post some patches to address this, so take a look.
>

I have reposted the same patch after testing. I can now boot x86_64 qemu
and all other qemu sato-images build fine too. Here is the reposted patch.

http://patches.openembedded.org/patch/9131/

Thanks

-Khem



