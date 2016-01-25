Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7CD6C73206
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 17:33:17 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id q21so159369651iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 09:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OnYm9AYmU6CBAcxjw82KJdlzMjLqzVaUCt+UWH4mvH0=;
	b=Rphu4RtsUlsS8J/TVs5Di8weO8pejmiv58+i+o+dhEO6oTJkgYmnsD13OjXZA8NOuo
	yZ62DvPAgJ7mZ172q+o/dhBOYx1sEEuCtiXnDvVxPdlRvklIWYWNlSvUbP1r4yx5SJsm
	R2JD7MuFh8eOBhfVcTjrs2f3NedBJOCvNzjUFu9Pv3gfwGG+L+td2XfaAmJI24oFH252
	+FB3bNrBP7pWFfw8iasURRJxlO7sdchiqBvb85OjGnuUPXVK2mCETJgVubiaduelrhJw
	MPWWt7bQw+WBDTuUGrh4my9cbphdZSmygqkvh1+sP+atWhn1LENgxHsuhyHyXueVytz6
	T7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=OnYm9AYmU6CBAcxjw82KJdlzMjLqzVaUCt+UWH4mvH0=;
	b=drXygyIkLWrDGxNTuDGrIgCxgZ75FZxrU6Wzfurjyej+nBE3CxzKocZ8qS7NNqfP9a
	o6QOqZMgDbQBzIEqO7WLGy1+KDlW5ABJMUoEy8wgPyLPxDb5Z8PCAvpUkSjTL/clXN/g
	niDnUhJaQY961b43dZ+AUJDDJm/FjlcmCNRFvyjUSW7dc8coIsoHSTT9lJF5TuUiCnD8
	jA/0dvmqEIajg5s/mCMPcSQqdTyJoSUN3Pj7wrZBaxFAaGvAdoce4xcF4JMbIfnGq7mh
	dgp6twezVmiEOTW11gvTZTbXHMxaY8M4BB6sgbFb6KzvPZ6QMXR1wTr2c4GDt/QtKvqR
	VUyg==
X-Gm-Message-State: AG10YOSfv6lRocQZgi1GjAuR0mPlgSz6F3ZZrdKXISds8DI5pL6gV3Eax8cyPza106ebEMYtFY8hpsrApKZ0TQ==
MIME-Version: 1.0
X-Received: by 10.107.9.224 with SMTP id 93mr17207677ioj.112.1453743198202;
	Mon, 25 Jan 2016 09:33:18 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 25 Jan 2016 09:33:17 -0800 (PST)
Received: by 10.107.16.74 with HTTP; Mon, 25 Jan 2016 09:33:17 -0800 (PST)
In-Reply-To: <CAJTo0LavmAFOxe2uL_L1OR4ZA0=_4JUz-qF5TE756ODkC3SyPQ@mail.gmail.com>
References: <1453497982-9859-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sq-mQQpBAa1YCcZFdQxEPOd=2DH-cm+oKKV2uD8_PPJ+A@mail.gmail.com>
	<CAJTo0LavmAFOxe2uL_L1OR4ZA0=_4JUz-qF5TE756ODkC3SyPQ@mail.gmail.com>
Date: Mon, 25 Jan 2016 09:33:17 -0800
Message-ID: <CAMKF1sqCJzUKJhDGiAFzOLN9-EgrHvYcMnP5UnvvTusi3ufMVA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bsd-headers: fix LICENSE syntax, && -> &
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
X-List-Received-Date: Mon, 25 Jan 2016 17:33:21 -0000
Content-Type: multipart/alternative; boundary=001a113ebd7cec736b052a2bf605

--001a113ebd7cec736b052a2bf605
Content-Type: text/plain; charset=UTF-8

On Jan 25, 2016 5:50 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>
> On 23 January 2016 at 04:48, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This is already fixed in my tree. see
>>
https://github.com/kraj/openembedded-core/commit/86cd0650126b0ed7434335cd986272af69dc3671
>
>
> That's lovely but you didn't send it to the list, so nobody else knew. ;)
>

Yes. It was under test. If you do musl fixes its good to peek at my tree

> Ross

--001a113ebd7cec736b052a2bf605
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On Jan 25, 2016 5:50 AM, &quot;Burton, Ross&quot; &lt;<a href="mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 23 January 2016 at 04:48, Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This is already fixed in my tree. see<br>
&gt;&gt; <a href="https://github.com/kraj/openembedded-core/commit/86cd0650126b0ed7434335cd986272af69dc3671">https://github.com/kraj/openembedded-core/commit/86cd0650126b0ed7434335cd986272af69dc3671</a><br>
&gt;<br>
&gt;<br>
&gt; That&#39;s lovely but you didn&#39;t send it to the list, so nobody else knew. ;)<br>
&gt;</p>
<p dir="ltr">Yes. It was under test. If you do musl fixes its good to peek at my tree</p>
<p dir="ltr">&gt; Ross</p>

--001a113ebd7cec736b052a2bf605--
