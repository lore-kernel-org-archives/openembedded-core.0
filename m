Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 92E826025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 15:58:20 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id w12-v6so3176111otj.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 08:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MP7qVwUO6lOMKSQn8zUdWvF/qUSmUVpM1ekHhqoDSBo=;
	b=jTpY2xZyjzPo9zhUw8EbaBQ6SfhhrHrVVkyOymcfzWRgBl2S3wHfRXBddf8DeFlZAL
	GVzfYWwKmwDLTrL06vpn9oyY5wqwC9jcAu3kdfH0GdxPc3/vloIaFB3xOwy0R8x25QkV
	evil0IA3fy7N5YmsfsX7Lz3P4uSWHkkkBURdWul5r8LqVysEh/wmAK5IYrxAE8neJI7n
	qgS/1qkDmDHkZs5B1k7jSMomqIvU7FEbOKDQbQsooEsXMR8ltrfg0LFFxQvsJ6BkMzH7
	LtcXrcJIhFEPTqvsFktPl7cX5BLyV9DPiwAsrYdcqmhHb2cEJucbrdX7zSVOlXqh5Ptv
	eMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MP7qVwUO6lOMKSQn8zUdWvF/qUSmUVpM1ekHhqoDSBo=;
	b=AT7+L3LTq7tIuBUCc5xB9TwQ/0IaMVbfT8l8owLqbPc1JvxShqBVBPRlHGyjSMI+AF
	bjhBzo6LK9gZ6TtUJIdyNgAR7bNbHdyg9XMoziKcBEZKLqHive/ojHHwEwi2fVQgqJqO
	KQPlJRr1+HVAukuLA3efLC+e+/u/XJPaXQ0jtz0uxZ5Fs9brE3aObil6bBLVdehZabTi
	HRUcvJ+9MCADE8BAeHRQDpWi7lSSkisiJq57uAET/pfZxHzqDI/cxt5p6ld4dfNUFDpw
	4eNNhf5huiX7Fxwsa71EVqvFeWCmvrPgCEjpx5l7GQ0DX9cUDx3PS5e45WUCESoPrBAE
	DMig==
X-Gm-Message-State: AElRT7GYdQPXrvr5vI5/3++vqruvYIqZaD1n2bz7vd0jrvGI7jgG12wP
	YLMN22hPoYmWvu7SxdYcJ1wp4HSdWVk4NAcx7jnilg==
X-Google-Smtp-Source: AIpwx4/vovd0VuzbUCc3tyeKteQKcsEQlPcz+h96b2IkNNEgXTgQLri/haIFzP1cFGTEVnopi7Hi3Hk156QYWqEseCQ=
X-Received: by 2002:a9d:281b:: with SMTP id
	m27-v6mr2486238otb.89.1522252701781; 
	Wed, 28 Mar 2018 08:58:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Wed, 28 Mar 2018 08:58:01 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.1803280841200.21653@sjc-ads-6991.cisco.com>
References: <1522042927-29046-1-git-send-email-kamensky@cisco.com>
	<CAJTo0LY4JsGtTM1a==RQiRaemZ3__LpbBmQkBOLBi_+gJfBmxg@mail.gmail.com>
	<1522071403.11431.62.camel@linuxfoundation.org>
	<alpine.LRH.2.00.1803280841200.21653@sjc-ads-6991.cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Mar 2018 16:58:01 +0100
Message-ID: <CAJTo0LZURAAXKFfXqFOkQugMe0wE4yKd7sxckRDOpdfE5_eWBw@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: fix qemuarm64 intermediate kernel hang in raid6_select_algo func
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
X-List-Received-Date: Wed, 28 Mar 2018 15:58:20 -0000
Content-Type: text/plain; charset="UTF-8"

Not as embarrassing as the people who reviewed the patch and didn't notice that!

Ahem.

Ross

On 28 March 2018 at 16:46, Victor Kamensky <kamensky@cisco.com> wrote:
>
>
> On Mon, 26 Mar 2018, Richard Purdie wrote:
>
>> On Mon, 2018-03-26 at 11:31 +0100, Burton, Ross wrote:
>>>
>>> An early winner of Patch of the Day in my books.
>>
>>
>> Indeed, getting this one fixed is great as it has been messing up a lot
>> of builds, thanks!
>
>
> Thank you guys.
>
> FYI and it is a quite emabarissing: I forgot to do "git add" for .bb
> file to update SRC_URI with the patch that I tested. So now it is
> really has no effect :(. I will send catch up patch with SRC_URI
> update (one that I really tested) as soon as I finish retesting it
> on top of latest tree. Sorry about that. I just noticed that while I
> reviewed lastest today pulled tree.
>
> Thanks,
> Victor
>
>> Cheers,
>>
>> Richard
>>
>

