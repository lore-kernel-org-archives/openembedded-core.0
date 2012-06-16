Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe@deserted.net>) id 1SfwgL-0006n0-LR
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 19:21:05 +0200
Received: by vbbfr13 with SMTP id fr13so2262448vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 10:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=oCGfF1sX9FHqF3t5JxDXkZrzH4RZsgXDj0o6iMwaiGI=;
	b=fOlP4Dd+S2SRm36mPNOt2gytang/cWmR1FfEelbKjkTQhcpLM/VRLIouuCMn8eLubC
	E0Hi8zhnyqc2WyDnxf0CeWJL0aavBLSKQwYgYWMtPy/RNjnuG6elJpPfFI8lGVtJlBaU
	7fZi7Uaq5V3+3hfORyqtNR2BXammnoKi11x5YhNpqdHdCbLPJMWhF52y+g4qgZHxFmvt
	Qe1TwBr53eokQqHN/8n2pmJIQuCar9sz/13m70J6ukfmJ8hUyDNUPPpdzwYs/8Zc7E6l
	93abf0WQRGbJ4zk2KBJ8iwLuIEBm3Uip6tTD7xx1D0mlKxS3WVZ+UXhzfq9FyAal4fZC
	v4ZQ==
MIME-Version: 1.0
Received: by 10.52.70.163 with SMTP id n3mr4142416vdu.64.1339866625049; Sat,
	16 Jun 2012 10:10:25 -0700 (PDT)
Sender: joe@deserted.net
Received: by 10.52.169.1 with HTTP; Sat, 16 Jun 2012 10:10:24 -0700 (PDT)
In-Reply-To: <4FDB9332.6010807@balister.org>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<4FDB57DB.5090407@gmail.com>
	<CAP9ODKrkmDNCzXcK3wDqypxZW6Le44004rcO7e5CiW4HD5o-AA@mail.gmail.com>
	<CAK18fxGOAi40Tzduw99=fQMf_cn9sySqr=dvJzRncNCutjjyaw@mail.gmail.com>
	<4FDB9332.6010807@balister.org>
Date: Sat, 16 Jun 2012 13:10:24 -0400
X-Google-Sender-Auth: REi1K-FtTtqJaJGKZKKjiiL21Cg
Message-ID: <CANBf+V3pAYvHuZdp_5fv33QQwZJTOiLqusZuZHUQ1yDjZCyyPw@mail.gmail.com>
From: Joe MacDonald <joe.macdonald@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlLRM9HqiHVuOHiLIW4Jmjh64RHu75wT+NfWHwXuK3Aa6qsbQiPPKRPrzFJFhXfBLUnfqxx
Subject: Re: Proposal: Creating meta-networking
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
X-List-Received-Date: Sat, 16 Jun 2012 17:21:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 15, 2012 at 3:55 PM, Philip Balister <philip@balister.org> wrote:
> On 06/15/2012 02:55 PM, Andrei Gherzan wrote:
>> On Fri, Jun 15, 2012 at 9:08 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:
>>
>>> On Fri, Jun 15, 2012 at 12:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> I think creating a networking layer is fine idea, alongside meta-oe,
>>>> as a separate layer in meta-openembedded repo. Reshuffling recipes
>>>> from meta-oe into different layers is fine. I would like to avoid copies.
>>>
>>> I'd prefer if it used another git repository; people needing to use it
>>> shouldn't be forced to clone whole meta-oe.
>>>
>>> This would be my proposal as well. To have this as a separate layer.
>
> meta-oe already hosts several layers. It is kind of nice not to have to
> clone a slowly increasing number of git repos. Rather clone a few and
> manage the layers within them.

I'm inclined to agree.  I see the value in keeping this in meta-oe,
but my goal with this layer is that it's as self-contained as
possible.  Meaning that it could be used by someone building a small,
network connected system.  I'm thinking there'd be value in reflecting
in the layer itself by being a separate repo that can be cloned
independent of the rest of meta-oe.

I can definitely see both sides of the debate, though.

> My larger concern with the networking layer, is what layers will it
> depend on? Will the layer dependencies change based on the distro
> features? This is the hardest thing to get right with layer grouping.

Agreed.  The intent is for it to not depend on any layers other than
oe-core.  The reality will likely be something short of that ideal,
but what I`ve been playing with as my proof-of-concept is nicely
self-contained.  You bring up a really good point, though, about layer
dependencies changing based on distro features.  I think that`s
something that we`d have to manage carefully.

-J.


