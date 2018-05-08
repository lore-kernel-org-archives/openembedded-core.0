Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 314CA74EC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 09:06:29 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id j7-v6so19049649vkc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 02:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PIHGZlRWUVq+wkFywT8/kHil1kcflMkuAit3EIR7MKo=;
	b=u2L/gicrNOJNNM3Yoxfz2ydOf8o0hhJG1EAWmVr5z19WxgeBPDLwsd8J9gOQuQpdYK
	kJUUO9WzKvSBXxJE2FvaBDBW45JbZd7VeHWK3XjwXrvEsZU0kV+l9LF+FjB22hioFDvd
	q4I0treZERxPzQZ9onWWYwJKyhZg5UgHHnUb8yU+zAqua45VqJu6i5us/AIK1XMh9Bmn
	ANHNpe17vN2HmZ059vliQuDG2f9vUhH4W6VyRNSWmdkezfuTMIighb+X2w8HdctLQJl5
	G5x6Z2mdFXuhL868Npn2G85AHu6uW/gbtOJkx3z92SUy7gUaqWWhVRMWElWqMxUXdXq3
	GqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PIHGZlRWUVq+wkFywT8/kHil1kcflMkuAit3EIR7MKo=;
	b=HhLJ64jqengy5AbRSjXGWEukugXoX8SGmpsbgFJ0c9QVmAwbtSQVhd2l5ZwTS86piN
	o+/5YWeY+3JddIG1epBxgRbQsmZPgpRS3217TjawBcZPuQWEw81NsoVp0oN18DW0t6ZC
	3IxBotEeqRliNH4jJMtVboRUzQWWKqTsdU8mU7vaxmfjnYG3XRSZWJKgnx6LndxdL0vT
	yP7NR796J+uV4wY8Obvuir5H16/UexprrKpygE/WKNDg8ElunbMiZuHTXMDhkipo7tG7
	5xuljud9QAkvpl1GLMh0YBuz3JrIdoonoDjS4QdMNyRF5Opn9ca80+cxtDf//JeOZT42
	sqFQ==
X-Gm-Message-State: ALQs6tBHunrBFDS03NwgO6vdV26f8pRD7Tz9/dh1trMGroR5ozqLf5o1
	3k83waGx+/UrCl2CKtD9TjOKBHrNGwpxvZq5+jA=
X-Google-Smtp-Source: AB8JxZrAPYND7T7DFHf5XhRL9oyyAbC5PRgAbjQB2KAjSD8h5ZzmXRS9C134lBNwXcDc4TGSCfs86isTsV1zdMNJW2U=
X-Received: by 2002:a1f:1551:: with SMTP id
	78-v6mr19740577vkv.174.1525770390357; 
	Tue, 08 May 2018 02:06:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Tue, 8 May 2018 02:06:29 -0700 (PDT)
In-Reply-To: <1525765207.3857.101.camel@linuxfoundation.org>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VK+Um4wa6F2EVzQTNiwa8LC1nhTEQrLqH2GBuSzCkbWw@mail.gmail.com>
	<1525765207.3857.101.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 8 May 2018 02:06:29 -0700
Message-ID: <CAJ86T=UJUqrzyutyKf01HR1MDTN1YbYz+ovXkUTj+DARu1XW3w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 0/6] SRC_URI updates and minor build fixes
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
X-List-Received-Date: Tue, 08 May 2018 09:06:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 8, 2018 at 12:40 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-05-07 at 18:22 -0700, Andre McCurdy wrote:
>> On Tue, Mar 20, 2018 at 7:42 PM, Andre McCurdy <armccurdy@gmail.com>
>> wrote:
>> >
>> > Daisy has now (long since) left upstream maintenance and entered
>> > into
>> > community support. As a member of a community which still actively
>> > develops against this version of OE, I would like to propose the
>> > following updates.
>> Ping.
>>
>> Are these kind of updates OK? Or are there objections to the
>> community
>> trying to support historical releases? There are many millions of
>> devices in the field that I know of which are still being actively
>> developed and maintained on top of OE 1.6.
>
> We've discussed "long term" branches for a while. I suggest that we
> collect together people who are will to maintain such things and let
> them push to a namespace in poky-contrib initially, perhaps in other
> repos eventually where we collect these things together.
>
> Perhaps poky-contrib extended-life/daisy?
>
> If there is common agreement, a group of people could collaborate on
> such a branch too...

Although there are multiple groups still actively developing against
OE 1.6 I fear I may be the only one who has any interest in doing so
in public. Hoping for a "group of people" to show up and collaborate
on a branch in poky-contrib may be asking for too much.

