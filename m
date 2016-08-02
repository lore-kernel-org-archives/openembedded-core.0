Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id AA37D6E660
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 17:33:07 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id 4so36564607oih.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 10:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+XjbP8YdUzv8FNz0oMb0ps87WZIzptAoTCdNcRooNBk=;
	b=p5Etp+VEDYpFklpQxdU8/BIWz2RCIKlXwcs9Esy/wkYSELcd1+YCea9XYDwiwm0f3O
	E/c9jVUKGu3yht9AO1yj35Zlamj/GhJxqv6Uaa14o+sTcgXhtnZzMMkIyrn3bFAOYfcM
	P0TcZEUf/KQdLkkJ0ZDMsHzPLQh9QhKXWRbBg+EtlI3dtn6ZYNglLxp98EJwBVFXAxyO
	b9SlUA03kBjW0cBkR0HXlHQsZ8mAoqoYTInz5yaSiGlntdAat+RTLLFj57aI+wF6IkGT
	wHLYoCP17RWVZrwCfilBwGfKEbLVxFK+KDxlNGTJ2TNmaBBKbLi4kz8dDGSv6VmCWLeh
	Ytiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+XjbP8YdUzv8FNz0oMb0ps87WZIzptAoTCdNcRooNBk=;
	b=SPfAHhAKdW+cfadLtqRteqngObqo+PbLDtryY+4N3vZczMSGYI/hRi4yNa+cZyNR+6
	9jMDcP6ZHOdU0xOvA/mMDj21pi1ii2IpbAC/vn9Cl1HzE92smg1Y598o4P9dgnorfKKz
	OCErurfSCoV3z23LcO7jxRtLhcwxKOKqEnSMOYT6DKakUiHP8sg9IHQSxH+xvdpFlSK8
	L508QTdzeJCkcymfbca0gQ2m2RgmKUf/ddcZ1LQgPU50dHkN2jmxtgTFGttzGhsC5IRz
	Is7ki/60yed4NXh8VmJa2+UOZa0cTNz3wQN6sOJ/uFwImHS1UrYAdGeTW1eCWmUN9sQM
	2viw==
X-Gm-Message-State: AEkooushsXhGANXmk1drflNjCu+D+GMXWmQ7olO3CDUgmY8T2DVdrg5oeez7IhsEK1HzGPI10hGCUrm9YJBezQ==
X-Received: by 10.157.46.75 with SMTP id c11mr41183296otd.46.1470159187994;
	Tue, 02 Aug 2016 10:33:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.248.164 with HTTP; Tue, 2 Aug 2016 10:33:07 -0700 (PDT)
In-Reply-To: <8ff3e451-c185-6b95-03e0-9669b838b0dc@jp.fujitsu.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
	<CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
	<8ff3e451-c185-6b95-03e0-9669b838b0dc@jp.fujitsu.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Tue, 2 Aug 2016 10:33:07 -0700
Message-ID: <CAOLEWZX0tzxjWu=xq9+_R87uFWfH9DOMminYBMEu2M-7igcxyg@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Tue, 02 Aug 2016 17:33:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hey, don't keep all the fun to yourself  :P

Let's take a look at the recipes and marge the best bits together; I
think I have an update on my end after getting some feedback with a
zebra label printer.

Fan, can you push/post your recipes somewhere today?  Feel free to
fork meta-small-arm-extra and we can take a look at merging.

Steve

On Mon, Aug 1, 2016 at 11:48 PM, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
>
>
> On 2016=E5=B9=B408=E6=9C=8802=E6=97=A5 02:24, Burton, Ross wrote:
>>
>>
>> On 1 August 2016 at 18:22, Stephen Arnold <stephen.arnold42@gmail.com
>> <mailto:stephen.arnold42@gmail.com>> wrote:
>>
>>     That's actually not a bad idea, but I need to crank out another
>>     abstract today (the deadline for special session snuck up on me).  W=
e
>>     kinda needed this for a project, but I think a tiny print server is
>>     always useful.  What's your plan?
>>
>>
>> Well my plan was:
>>
>> 1) say that someone should create meta-printing
>> 2) watch someone create meta-printing
>> 3) delete everything printing related in oe-core
>>
>> I can help a bit on (2) I guess...  Fan Xin, would you or anyone else at
>> Fujitsu (as you clearly have interest here) be able to help?
>
>
> Yes, Of course. Actually I am very pleased to do this.
> I am afraid I can not do it very well, but I will try my best.
>
> Fan
>
> --
>

