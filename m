Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe@deserted.net>) id 1T4Gzt-0001jH-Pb
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 21:53:49 +0200
Received: by yenm1 with SMTP id m1so1014765yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 12:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=loS6XrgPccp+bXBvcR1xCozkqlhavG9Rr8b4lFybmDg=;
	b=HY7LEpjBZ2KErNsHv9WNrh+2qov6dxReVNg/tt/U+4MgDYs1yHqHTTwRZiV6k/ViXL
	jMlWsANzp0M7sLDBVMqHn5SEU0k0EKljol8sxhywrvTTCwJaU/46Okpj4qY3Py+CZJL8
	+fux/3AcOvQKm/NVa6BFw2u47dMakqhRblOdSrOkonh7AbL8jYLvMAe7LwO1qmuYJbCm
	wl6+tWEgoW+qR/piB7QT4xKvrSxQL3CHN3hs4sEj0A0Qbk0Tuq+lCWinX88IhmBy9oLv
	p3R84bexDmKhx2fUxuMh+MZsxShhubB+2ESRJ2RXyJHHRiCzpGRRZCRGU2bvta2N/Saa
	ZMUg==
MIME-Version: 1.0
Received: by 10.50.100.137 with SMTP id ey9mr3374855igb.61.1345664503576; Wed,
	22 Aug 2012 12:41:43 -0700 (PDT)
Received: by 10.50.60.34 with HTTP; Wed, 22 Aug 2012 12:41:43 -0700 (PDT)
In-Reply-To: <CANBf+V0XGvR=qSwCSfKBZN6Z5y6sLeYwu-7XUYO_U5ampFZ==A@mail.gmail.com>
References: <CANBf+V3=LvWkE28TR1qNR-NpLd60EGroEqmXQqypXAUUZ0pv-Q@mail.gmail.com>
	<2E13D0D74D03406FAF576083ED655376@gmail.com>
	<CANBf+V29JZm0SqE_YgvAB9PxR7SOvQOUGzGAVKkm6en7ZsGysw@mail.gmail.com>
	<CABcZANkyW52k-h1zfpA482b4+q4GyV_nZU2e=giKJExeqWws0A@mail.gmail.com>
	<CANBf+V0XGvR=qSwCSfKBZN6Z5y6sLeYwu-7XUYO_U5ampFZ==A@mail.gmail.com>
Date: Wed, 22 Aug 2012 15:41:43 -0400
Message-ID: <CANBf+V2j=GsOOYY+OMs-hrGH8-KFedOsLORRpaJg=Uh8w41yTw@mail.gmail.com>
From: Joe MacDonald <joe@deserted.net>
To: Chris Larson <kergoth@gmail.com>
X-Gm-Message-State: ALoCoQlk7eGBPArJDxn0iBil+WKP73LGiqB8sBxc8YydLXQ8+kofmQhFQTHllQPRen/tFqK+2KGl
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
X-List-Received-Date: Wed, 22 Aug 2012 19:53:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 22, 2012 at 3:37 PM, Joe MacDonald <joe@deserted.net> wrote:
> On Wed, Aug 22, 2012 at 3:22 PM, Chris Larson <kergoth@gmail.com> wrote:
>> On Wed, Aug 22, 2012 at 11:59 AM, Joe MacDonald <joe@deserted.net> wrote:
>>> On Wed, Aug 22, 2012 at 2:20 PM, Christopher Larson <kergoth@gmail.com> wrote:
>>>> On Friday, June 15, 2012 at 8:15 AM, Joe MacDonald wrote:
>>>>
>>>> We've been talking about this on-and-off at Wind River for a while now,
>>>> but it now seems like a reasonable time to bring a proposal to the OE
>>>> community at large. We're thinking about creating a new layer to house
>>>> recipes, etc. for networking packages. I'll try to address what seem to
>>>> be the most immediate questions (certainly the ones we've been thinking
>>>> most about any time I've discussed this with anyone):
>>>>
>>>> Has their been any progress on the creation of this layer?
>>>
>>> Absolutely.  I think at least some of my mail on the subject have been
>>> bouncing from the lists but the short version is at the end of July
>>> the existing "meta-openembedded" pieces were done in my tree and there
>>> was a list of stuff that needed fixing in migrating the oe-classic
>>> bits into the new meta-networking layer (the list I laid out in my
>>> initial email).  I was on vacation between then and Monday, so
>>> nothing's happened since then but this week I'm back looking at the
>>> best way to handle these older recipes that are in need of love in
>>> order to work with the current meta-oe and we should be good to go.  I
>>> think what's likely to happen is there will be some of them updated
>>> right away and others will be integrated and updated soon after.
>>
>> Sounds good, thanks for the update. Is this repository-in-progress
>> available somewhere public yet?
>
> Yep, sure is, though I'd discourage using it as a basis for work right
> now as I'm not guaranteeing a clean history on it.  It's full of dead
> branches and options I'd been working through with Koen.
>
> So now that you know what you're getting into, my current WIP is here:
>
> https://github.com/joeythesaint/meta-oe/tree/meta-networking-reordered-1
>
> You can expect that the top commit (dd48fb590) will not be present at
> all in the final version but everything leading up to it will likely
> remain unchanged in the final version, I think we're mostly settled on
> those being sensible.  Though since this is still a WIP I plan to
> rebase the whole branch before sending any kind of pull request.

Oh, and right after sending that I realize that what's currently in my
github tree doesn't have the style cleanups yet (PRIORITY fields,
metadata ordering, etc.) so even the earlier ones still have some
changes coming.  Sorry about that.

-- 
Joe MacDonald
:wq


