Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1S7nwB-0005Uf-Go
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 14:08:19 +0100
Received: by wibhj13 with SMTP id hj13so2192985wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DqFrWUcpxd9K42Tnks9cfp8qPpT7Q9hd5wcxjwxu81I=;
	b=bIXC9bErXAeBnygMgsXYW3VOmRwN58RqnFpOvpX6vF0FTx3Ivzxd7poEgvak/qtXBF
	0cvX39w1P21kScdjtScAvszN6J4a7zMnT5qDRXiP0Sh35+oumJ9kjgPskzOM0d1z7Pu+
	x8J3lO6QbeOGJ8sWHeTQA9NALws4d7B4Up0ISbughIJm6xmRDM5Jiplj0XRRJVXl3tqT
	r1txePt+ySasQrrmHPbsyqCoLjOap1EXCN2eDEvOYczM8OJj7zXW2b25kx2HGhmFB63V
	+TF1Y6rIcW0qiqPjJkjhRUOAIIJJ4+3MVp0Wa3kLMiCLn/dXVfqKSnoS+Ae6//QfMpnm
	zraA==
MIME-Version: 1.0
Received: by 10.180.105.194 with SMTP id go2mr6096143wib.22.1331729974366;
	Wed, 14 Mar 2012 05:59:34 -0700 (PDT)
Received: by 10.216.28.196 with HTTP; Wed, 14 Mar 2012 05:59:34 -0700 (PDT)
In-Reply-To: <2970280.1QavEf7R15@helios>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<5205752.2zb4P1afWQ@helios>
	<CADkTA4M6XgC3vo-GR5MnK1HcS58tz0-WrwSX0KOhaeRMMhqnvA@mail.gmail.com>
	<2970280.1QavEf7R15@helios>
Date: Wed, 14 Mar 2012 08:59:34 -0400
Message-ID: <CADkTA4OdMwB4gPNaYF7paaY9TLZV5YuQgqAVXzK4wT1pCxtrCw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] linux-yocto-tiny: add dependency on xz-native
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
X-List-Received-Date: Wed, 14 Mar 2012 13:08:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 14, 2012 at 8:39 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Bruce,
>
> On Wednesday 14 March 2012 08:29:20 Bruce Ashfield wrote:
>> In this case, you wouldn't go through the fragments, you'd just add one that
>> turns it on when you want it. Don't audit a defconfig, push the few options
>> that you want onto the build.
>
> I'm not sure what you mean here, in the context of generically figuring out
> whether lzma is needed...?

Maybe I misread/misunderstood the question at hand then :) Let me just
rephrase it this way, we have the recipe and the control in this case, so
adding the dependency and making sure that the kernel option to use
it via a config fragment is valid .. which is what you did, minus the fragment,
and we don't really need the fragment, since we know it is on.

You could audit the constructed .config as well, since that's the final word
on whether it actually makes it into the kernel build, but also not really
required here.

So consider this random noise, before I drank my coffee this morning :)

Cheers,

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


