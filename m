Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2F92177E8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 06:35:18 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id w12so11603484wrc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 23:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2b6wxQILsW1WHSTCMGh0iCC8KWgznbpTDvCKXjZL2C8=;
	b=Ki1y0dLXDyxAnGGr01vC4f8do6NjLfQY7I3pS4bcp0myvwdnzl+pZTsoCWj4V1+psZ
	jOG/EOOsG7HHxdKFq4dGOSR0tAkonp6QqCRV1pWQ6eBuIFA9x07xOuNR0QbHwHfahWCM
	ZZO/baBYKHZ28gwB4rw6SCUHAcD9LhNSt+EO5zGm5gNlZHiRQWU8MktU+WAysfJuI3zv
	SefozA5IvT6DW4ncpOliHn9i7uWM96vcslQNnAC3MujgrPJyrtdkZSZU3jQTRqNq2kNw
	YzmQJMDREH4cXFhhVuxWFFwH8Yen4NN7s5zovl4frfhU/uETcOyV1Prp+sHk2V0fjtfu
	ckYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2b6wxQILsW1WHSTCMGh0iCC8KWgznbpTDvCKXjZL2C8=;
	b=TuIRyewKujpgLQ/bKvsDh2sVRSpN/Y+Bu+PDDNLnVLFl9rCaEFArM59XLeAeSsWpYY
	OT1CuQqnfku77TKKjAfX79xqpvV+OJ8WH88IkqTTzWdIETrXZEjn0bvKtwVTXY0UvpsZ
	PzCxSRJo0GQ3M4zZ6ZH5kIJiq8h3hTeht4aBBpv036x6wOIC14EfB0aeSwQ+6ZzntR3y
	8ugtCJK9zBAwScM1evtodc3NdFUvRZfq51YNXIz5TLu9bsO+DPDUW/ZVQIqWv4sFyGwr
	Gkx5/NK0f7w1AVwp+sLkMimflg4fVIAxXzd42Q7NLxga4ygmykok6KfGGr4LK5ztwKxk
	aBLQ==
X-Gm-Message-State: AHPjjUjSOHhu0YDtMQdoWDpR5vyaNptxwIN5xNQpBiVP0adlbxIvCJLH
	DkpKivur3qisEa2jmn2z909XuISut4n3ycLS0YE=
X-Google-Smtp-Source: AOwi7QBwTdNDm/PSm1SJwIUi2vZblxlhu7x7HZNPg2i6u6JFTdJkP12Y5MyrHF8hckEiHWZWr11k8med+oi6adxl4xg=
X-Received: by 10.46.25.23 with SMTP id p23mr3730686lje.37.1506407719916; Mon,
	25 Sep 2017 23:35:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.83.83 with HTTP; Mon, 25 Sep 2017 23:34:58 -0700 (PDT)
In-Reply-To: <CA+YB3rYipupFC2s_3gsfVSM6sZ5oAis1hAB491+tAXVEfEAPrg@mail.gmail.com>
References: <37a76fa5-4f25-56dd-9616-4b4b23fbb093@balister.org>
	<CAB=otbS8_F_Yhisc+ybm8X1m3GXBzCK1q16YjrWATDArwVf+Hw@mail.gmail.com>
	<bdabbc35-fa12-55ae-5387-54da9204fd55@topic.nl>
	<CAHUNapRuc6RHNZXHGdN0TO2A0EwRgkT53bqqqM-DcwqKzUz55w@mail.gmail.com>
	<9e86f719-bcf9-132e-3a82-8c924385710d@topic.nl>
	<646f4edc-ff9f-7f2e-37a7-260cbd2af60d@balister.org>
	<ab1501ba-e625-61ac-c6f5-ce676531a473@gmail.com>
	<c2911001-d598-9e20-8463-085d5f4910db@balister.org>
	<CA+YB3rYwurx0i8oUGUkwWA3JMzTBJtFsijP_V0t+ncYVbOkW6A@mail.gmail.com>
	<CAPybu_1T63Vcw9N3VgVgj45gcUM8UgPqRkSAwaHhvyxWFU0Ztg@mail.gmail.com>
	<1a067fa9-8e5e-1f18-709d-15df07518928@balister.org>
	<CAPybu_3tiZLD4vU6ZrH9iD4OB1wHibGWxFJ20wL_ynDeaLo-Yw@mail.gmail.com>
	<CA+YB3rYipupFC2s_3gsfVSM6sZ5oAis1hAB491+tAXVEfEAPrg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 26 Sep 2017 08:34:58 +0200
Message-ID: <CAPybu_3BveGWtVbPVTRebodxjzcMGN3zQAJCMnuKUoSxun8nfg@mail.gmail.com>
To: Jeff Osier-Mixon <jefro@jefro.net>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded Developer Meeting Oct 22, 2017 in Prague (before ELCE)
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
X-List-Received-Date: Tue, 26 Sep 2017 06:35:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, Sep 25, 2017 at 6:23 PM, Jeff Osier-Mixon <jefro@jefro.net> wrote:
> It certainly looks interesting! The  main issue is that our table is about
> 0.5 x 1.4 meters, so setting up demos as well as screens and keyboards may
> be a difficult task. I'll do what I can to set up a second table at the
> booth.

I have to bring it anyway. We can postpone the decision.

Regards!

>
> thanks!
>
> On Mon, Sep 25, 2017 at 7:08 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com> wrote:
>>
>> Hi
>>
>> On Mon, Sep 25, 2017 at 4:05 PM, Philip Balister <philip@balister.org>
>> wrote:
>> > On 09/25/2017 10:00 AM, Ricardo Ribalda Delgado wrote:
>> >> If you are looking for a "fun" demo. I plan to show our bottle scanner
>> >> to the ELCE showcase. I could ask my manager if we can leave it on the
>> >> yocto booth during the conference.
>> >>
>> >> We use yocto + our layer https://github.com/qtec/meta-qtec-core
>> >
>> > How large is it? Can you send us a photo?
>>
>> This is the last photo I have from the instrument. You can use the
>> 50cl beer bottle as a reference ;).
>>
>> You also need a screen + keyboard to see the results.
>>
>> >
>> > Philip
>> >
>> >>
>> >> Regards!
>> >>
>> >> On Fri, Sep 22, 2017 at 10:49 PM, Jeff Osier-Mixon <jefro@jefro.net>
>> >> wrote:
>> >>> If its relevance to YP and OE is able to be explained, it would be
>> >>> welcomed.
>> >>> The only issue I see is the size of the booth, which is tiny. However,
>> >>> we
>> >>> frequently spill out of our confined space, and I will locate a second
>> >>> table
>> >>> if we end up needing one. Great to see community effort on the demos!
>> >>>
>> >>> On Thu, Sep 21, 2017 at 1:56 PM, Philip Balister <philip@balister.org>
>> >>> wrote:
>> >>>>
>> >>>> On 09/21/2017 02:32 PM, akuster808 wrote:
>> >>>>>
>> >>>>>
>> >>>>> On 09/21/2017 01:27 PM, Philip Balister wrote:
>> >>>>>> On 09/20/2017 01:50 AM, Mike Looijmans wrote:
>> >>>>>>> On 18-09-17 18:25, Trevor Woerner wrote:
>> >>>>>>>> Hi Mike,
>> >>>>>>>>
>> >>>>>>>> On Mon, Sep 18, 2017 at 8:45 AM, Mike Looijmans
>> >>>>>>>> <mike.looijmans@topic.nl> wrote:
>> >>>>>>>>> I can probably bring some work (e.g. Zynq MPSoC board) and fun
>> >>>>>>>>> (settop box)
>> >>>>>>>>> hardware along to demonstrate what I'm using OE for.
>> >>>>>>>> Any chance you could set something up that could be on display at
>> >>>>>>>> the
>> >>>>>>>> Yocto booth during the conference?
>> >>>>>>> Depends on what I'll be able tug along in my luggage on the
>> >>>>>>> airplane,
>> >>>>>>> but whatever I can bring is probably suited for public display. A
>> >>>>>>> few
>> >>>>>>> circuit boards will certainly fit, so if the stand could provide a
>> >>>>>>> HDMI
>> >>>>>>> monitor (or TV) to connect them to that'd be awesome.
>> >>>>>> I'd love to see some different things on the stand. Make sure you
>> >>>>>> help
>> >>>>>> explain to people why the Yocto Porject and OpenEmbedded are
>> >>>>>> important
>> >>>>>> to you and your product.
>> >>>>> Philip,
>> >>>>>
>> >>>>> Since you are the OE rep to the Yocto Project, can you make sure
>> >>>>> this is
>> >>>>> OK with them. There could be space  or limitations at their booth.
>> >>>>
>> >>>> I mentioned it to Jefro, I'm also making a guess he has something
>> >>>> based
>> >>>> on a Xilinx product, who are members.
>> >>>>
>> >>>> Philip
>> >>>>
>> >>>>>
>> >>>>> Thanks,
>> >>>>> - Armin
>> >>>>>>
>> >>>>>> Philip
>> >>>>>>
>> >>>>>>
>> >>>>>>
>> >>>>>>> M.
>> >>>>>>>
>> >>>>>>>
>> >>>>>>> Kind regards,
>> >>>>>>>
>> >>>>>>> Mike Looijmans
>> >>>>>>> System Expert
>> >>>>>>>
>> >>>>>>> TOPIC Products
>> >>>>>>> Materiaalweg 4, NL-5681 RJ Best
>> >>>>>>> Postbus 440, NL-5680 AK Best
>> >>>>>>> Telefoon: +31 (0) 499 33 69 79
>> >>>>>>> E-mail: mike.looijmans@topicproducts.com
>> >>>>>>> Website: www.topicproducts.com
>> >>>>>>>
>> >>>>>>> Please consider the environment before printing this e-mail
>> >>>>>>>
>> >>>>>>>
>> >>>>>>> Visit us at the Space Tech Expo Europe (Stand E-71)
>> >>>>>>>
>> >>>>>
>> >>>>>
>> >>>> --
>> >>>> _______________________________________________
>> >>>> Openembedded-core mailing list
>> >>>> Openembedded-core@lists.openembedded.org
>> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >>>
>> >>>
>> >>>
>> >>>
>> >>> --
>> >>> Jeff Osier-Mixon - Open Source Community Manager, Intel Corporation
>> >>>
>> >>> --
>> >>> _______________________________________________
>> >>> Openembedded-core mailing list
>> >>> Openembedded-core@lists.openembedded.org
>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >>>
>> >>
>> >>
>> >>
>>
>>
>>
>> --
>> Ricardo Ribalda
>
>
>
>
> --
> Jeff Osier-Mixon - Open Source Community Manager, Intel Corporation



-- 
Ricardo Ribalda

