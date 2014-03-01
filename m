Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 918AF6F36F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Mar 2014 18:22:39 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id oy12so40283veb.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Mar 2014 10:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=t2Y5CCvtDV2TNrFnueMpuqrjWLV/72wZx9GnK7AAzJ4=;
	b=Ru+qFLZ2eUb/zrSbWTiNA42j3dzTyxuizjgJe2EGGJpJbp9tsk8PJPdDtRGhc758K0
	UH4pvZQ5RXzWN7/fBqgXgw5baafE6GUVvgb37b0RjAy4FQUgrxj0+8VGwUhGPI4nSuex
	hhtLgssDMnHlocd98PzyX8vm720CCk3xC7+6esJRd63wfbp7bEZ0l/zifqzxY+a9WfV3
	D+wM/7vqidh8V18u3+U6MsjZtaDCzacYI5R5EZDDrcoGplU+yBskaDLf/11VWLSxD1/g
	sw9DpbpmWQ2j+AmEKfITKbsWxrXhRCfysB1eZzMCA0h556EdVIzKyNjCJQn7O8fyDgMg
	wCXA==
X-Received: by 10.220.250.203 with SMTP id mp11mr8852232vcb.2.1393698159859;
	Sat, 01 Mar 2014 10:22:39 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Sat, 1 Mar 2014 10:21:59 -0800 (PST)
In-Reply-To: <CAP9ODKpqMHG239UczMVLhiGEhvz_X6ppuiV_yD2pEvjzP510sw@mail.gmail.com>
References: <1393507701-22512-1-git-send-email-david.nystrom@enea.com>
	<20140227142404.GB3534@lpalcu-linux> <530F4D46.1060401@enea.com>
	<20140227151815.GC3534@lpalcu-linux> <530F9913.4080704@gmail.com>
	<CAP9ODKpqMHG239UczMVLhiGEhvz_X6ppuiV_yD2pEvjzP510sw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 1 Mar 2014 18:21:59 +0000
X-Google-Sender-Auth: 9cXRDwRRO84wC740La4XHbrmPcw
Message-ID: <CANyK_8ejpbY1VTZkfmFFcnvtFTZgH9B288vzmaH9iWf9Q-nAhQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] Attempt to unify predefined package feed handling
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
X-List-Received-Date: Sat, 01 Mar 2014 18:22:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 1 March 2014 18:10, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Hello David,
>
> On Thu, Feb 27, 2014 at 4:59 PM, David Nystr=F6m <david.c.nystrom@gmail.c=
om>
> wrote:
>>
>>
>> On 2014-02-27 16:18, Laurentiu Palcu wrote:
>>>
>>> On Thu, Feb 27, 2014 at 03:35:50PM +0100, David Nystr=F6m wrote:
>>>>
>>>> On 2014-02-27 15:24, Laurentiu Palcu wrote:
>>>>>
>>>>> Hi David,
>>>>>
>>>>> My comments/questions below.
>>>>
>>>> Thank you for your detailed comments on the RFC.
>>>> I will return with V2, where your comments are addressed when the
>>>> general approach is Acked.
>>>>
>>>> What do you think about the general approach ?
>>>
>>> I think the approach is ok. I don't know a simpler way than this to add
>>> package feeds into the image.
>>
>>
>> OK, there seems to be no screaming objections from other parties either.
>>
>> I'll resend v2
>
>
> I understand why you are adding this here but I think it'd be good to the
> settings to be put in a package so in a product we may add extra
> repositories updating the package.
>
> I am trying to think now how this could be done (or optionally done).
>
> What you think?

+1

I'd rather have '/etc/opkg/base-feeds.conf' (for example) generated
and placed into a package which is then installed on the rootfs. That
would make it easy to distribute an update to that in the future. I'm
not sure how difficult/easy that would be.

>
> Other point, PACKAGE_FEED_URIS could be change to PACKAGE_FEED_URI as it
> matches SRC_URI for example.
>

+1

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

