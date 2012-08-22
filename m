Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe@deserted.net>) id 1T4Gw9-0001cA-CP
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 21:49:57 +0200
Received: by yhjj56 with SMTP id j56so1010238yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 12:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=zFuaSNFd+Wa/MpmONIvAqAwGKVTQ64jTy40eYnqbTzg=;
	b=O3UzZZS0xRaSSz4QiP/ubXuwcQudQPPeUNoHJqP0reXxFnwKS5CMx1RiNeDvAcO3QU
	mHOar987TadPPPpkr1ovUOd35QjmBC9zDdbppM9LUGRNoeS4Vv0iegnap5z4VUlk93Ie
	hrQmgm9Bihu3Ug0T6gEW0tQ5Ybljo6/ScbmRN6df0HWDcWyO7l1rMWXci4ru2o3I//YX
	ad+nFx0pe1wkNFS1CgRtjOTp9aN/ZjmzPUEX/M/8Lm1jBXGFQVj9Izr4a5JPivscTmcW
	fBPy7OOGJz1fTbVuhZo7xzNIWtpQOYhQ9pOLxHaLwoPsIKqJBeed846R9MsWRv/XhVjG
	W6Gg==
MIME-Version: 1.0
Received: by 10.50.95.200 with SMTP id dm8mr3406932igb.60.1345664271292; Wed,
	22 Aug 2012 12:37:51 -0700 (PDT)
Received: by 10.50.60.34 with HTTP; Wed, 22 Aug 2012 12:37:51 -0700 (PDT)
In-Reply-To: <CABcZANkyW52k-h1zfpA482b4+q4GyV_nZU2e=giKJExeqWws0A@mail.gmail.com>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<2E13D0D74D03406FAF576083ED655376@gmail.com>
	<CANBf+V29JZm0SqE_YgvAB9PxR7SOvQOUGzGAVKkm6en7ZsGysw@mail.gmail.com>
	<CABcZANkyW52k-h1zfpA482b4+q4GyV_nZU2e=giKJExeqWws0A@mail.gmail.com>
Date: Wed, 22 Aug 2012 15:37:51 -0400
Message-ID: <CANBf+V0XGvR=qSwCSfKBZN6Z5y6sLeYwu-7XUYO_U5ampFZ==A@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: Chris Larson <kergoth@gmail.com>
X-Gm-Message-State: ALoCoQkKVPTLrDBDXey8lZf7f/+TAe6od01BrLgiabuTzftbjNkAXFS8SURNBSnB1dttcoAk+8bo
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Proposal: Creating meta-networking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 19:49:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 22, 2012 at 3:22 PM, Chris Larson <kergoth@gmail.com> wrote:
> On Wed, Aug 22, 2012 at 11:59 AM, Joe MacDonald <joe@deserted.net> wrote:
>> On Wed, Aug 22, 2012 at 2:20 PM, Christopher Larson <kergoth@gmail.com> wrote:
>>> On Friday, June 15, 2012 at 8:15 AM, Joe MacDonald wrote:
>>>
>>> We've been talking about this on-and-off at Wind River for a while now,
>>> but it now seems like a reasonable time to bring a proposal to the OE
>>> community at large. We're thinking about creating a new layer to house
>>> recipes, etc. for networking packages. I'll try to address what seem to
>>> be the most immediate questions (certainly the ones we've been thinking
>>> most about any time I've discussed this with anyone):
>>>
>>> Has their been any progress on the creation of this layer?
>>
>> Absolutely.  I think at least some of my mail on the subject have been
>> bouncing from the lists but the short version is at the end of July
>> the existing "meta-openembedded" pieces were done in my tree and there
>> was a list of stuff that needed fixing in migrating the oe-classic
>> bits into the new meta-networking layer (the list I laid out in my
>> initial email).  I was on vacation between then and Monday, so
>> nothing's happened since then but this week I'm back looking at the
>> best way to handle these older recipes that are in need of love in
>> order to work with the current meta-oe and we should be good to go.  I
>> think what's likely to happen is there will be some of them updated
>> right away and others will be integrated and updated soon after.
>
> Sounds good, thanks for the update. Is this repository-in-progress
> available somewhere public yet?

Yep, sure is, though I'd discourage using it as a basis for work right
now as I'm not guaranteeing a clean history on it.  It's full of dead
branches and options I'd been working through with Koen.

So now that you know what you're getting into, my current WIP is here:

https://github.com/joeythesaint/meta-oe/tree/meta-networking-reordered-1

You can expect that the top commit (dd48fb590) will not be present at
all in the final version but everything leading up to it will likely
remain unchanged in the final version, I think we're mostly settled on
those being sensible.  Though since this is still a WIP I plan to
rebase the whole branch before sending any kind of pull request.

-- 
Joe MacDonald
:wq


