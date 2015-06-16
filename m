Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7105A73BBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 13:36:14 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so13079263pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=/gL5mGvIfT+y7Qew1oPh+wWzhSIcgAv46ibGwIUbyZs=;
	b=SzUhvTE8GbN4cX3VT265YE22fbORJPWy31BVL0cWVn+pq61FEZ7QXDknUEAfcjxfxf
	k1gBtzqhiq7amrO4eqnxmQYgHjjo8prUER8AXGmfdVpogvNz9eYS1KfomUDXagqv9RpS
	eNhjml6Ms7JfoSpHzBdS9pI+AkpLTxcDAXjxwYjwLBSmrHiqNGidIg6HAmcGjH0xQIWR
	TAjFTQWsYTsYgCvkSshJq5/DlkDQBalngpj3UJPqOd3y8Tp2lkhvLKGFzAnGsz2AWfYk
	pa7E7wvpywOCgsqIBf8YuA2gZ4lmBGHBIrVYcrQisUw+GV4DmMRri5iJhgBiG9PHJsjG
	dexw==
MIME-Version: 1.0
X-Received: by 10.68.198.36 with SMTP id iz4mr606887pbc.167.1434461776177;
	Tue, 16 Jun 2015 06:36:16 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Tue, 16 Jun 2015 06:36:16 -0700 (PDT)
In-Reply-To: <558024F3.5030604@mlbassoc.com>
References: <557E9EFE.1030703@linux.intel.com>
	<CALbNGRS9UWjVQQh8POPc5zVYOeYa9VaeC7dEfzH3AMs4k9Mjzw@mail.gmail.com>
	<CAJTo0LbRVqw3h_3igs59=DTnaz6nf4w=A5ZpXepmh6xiKtVdPA@mail.gmail.com>
	<557EE4C2.501@linux.intel.com>
	<CALbNGRS-xR52wapA2viFa0oZJ6kotFdjhXpb6kyOtpRyn--5=A@mail.gmail.com>
	<55801903.4040905@linux.intel.com>
	<CALbNGRTJeh4eCD45cGUOx-DRZPHSeKTqndq1Jk+7V-ANQtAPNA@mail.gmail.com>
	<558024F3.5030604@mlbassoc.com>
Date: Tue, 16 Jun 2015 15:36:16 +0200
Message-ID: <CALbNGRTP0mHQB2opa0QMxj0CAQBqkVKS08_h89nTnhUESkaR_g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Webkit-gtk will be updated to latest upstream; midori browser to be replaced with Epiphany
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
X-List-Received-Date: Tue, 16 Jun 2015 13:36:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2015 at 3:30 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-06-16 07:27, Andreas M=C3=BCller wrote:
>>
>> On Tue, Jun 16, 2015 at 2:39 PM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>>>
>>> On 06/16/2015 09:50 AM, Andreas M=C3=BCller wrote:
>>>
>>>> How about doing same as others do e.g fedora [1-2]: Keep two version
>>>> of webkit-gtk based on same recent code:
>>>>
>>>> * gtk2/webkit1
>>>> * gtk3/webkit2
>>>
>>>
>>>
>>> Before showing how, you need to explain why. Fedora has to package
>>> webkit1
>>> because they have a lot of apps in the Gnome stack that still haven't
>>> been
>>> ported to webkit2. Oe-core on the other hand has only one such app:
>>> midori.
>>
>> Yes and midori is the only working browser in Yocto (I know): firefox
>> crashes since very long time for illegal ARM instruction and chromium
>> does not start at all.
>
>
> What platform are you using?  Are you building these from meta-browser?
>
> I routinely use both firefox and chromium on ARM (i.MX6) with no problems=
.
Hmm - I was wondering why nobody took care.

All my plattforms fail:
* i.MX6 base
* gumstix
* raspberry Pi2

I'll put this browser issue on my TODO currently I have no further
time to take care.

Andreas

