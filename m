Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id BE1316FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 21:00:26 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id d63so70512778ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 13:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wvSfz2HJkdY7DJdAleVuR+Q/li1/I5dfV2LsA4X5EgM=;
	b=gx1oE1GXypdEAM6qoQxxVyT99nsgx2ivz3jmNZXIrJqQniGK8gp1fa1T9F9bBWPXZy
	6T/lYutBa/lGvZmJBzdRcBFABM3vbX4L50U9V0N5iwf4YGZbQhIEpRUpXmIok2sZ3ICo
	xvvXDBx5c2cjSe4qQmMt3oMNoOaUvXrdUpTEfqWpSgzLX69cTnZSZ18S6ocR0LLyAkQe
	QVYsEEKUb/ZkQ/+Xo6+12TkIz5Tx8bds71F2b1SElgfLLFLWITngXgN9Cmc2jaqzT+Un
	KpF+b2MUk4mKxNFVtDcNa9ydIueGfd0aDTZLlHLMvkq6q+VidtRYrow/MWolR9oYSjQa
	Pncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wvSfz2HJkdY7DJdAleVuR+Q/li1/I5dfV2LsA4X5EgM=;
	b=Znlr4aMoZe0eitT2ituRys1GFwMYQ1ft1M8SFnEy8FiiXnll6YcOvdBCqxud5qRpzj
	r5OyvYtu2pVlqzQDavVwwVI/IS/7y6f/lAilvnudfUSeClzxE3aK2n0lKUmUlVa6/m3i
	4pkc5fUQ1aSHR/xfmjL8YeLEZ9uqnTGctwg+90kfGZ8Plph8qXINzTe2gBqCpQQR7JkM
	lmXigBPO/zvimxb8ObypgxcrlDKb0AaPuzsh6P5n90sKp6B46Ce5Oi97iuSsLofnK4H4
	Knz30njf1nr9e3B3CYOUkcDxAIRVmYKkYT+Si9Q4bIIpKi3veBiKiIBafnGClv7spvr6
	9QmA==
X-Gm-Message-State: AG10YOQFPUUywKgIaLUc6blU1yk7ulxGiXhAnpMZ+UiCZI0F79bYk5t3Oi/pJUEMm7VqQOoKtTDB7o+NNUy8iw==
X-Received: by 10.107.165.14 with SMTP id o14mr5097918ioe.49.1454533227729;
	Wed, 03 Feb 2016 13:00:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Wed, 3 Feb 2016 12:59:58 -0800 (PST)
In-Reply-To: <1454533078.7421.57.camel@pbcl.net>
References: <56B0AE88.3090103@siemens.com> <1454446338.7421.45.camel@pbcl.net>
	<46DD8494-2C7E-44B8-8793-12228FD56738@gmail.com>
	<1454532510.7421.54.camel@pbcl.net>
	<CAMKF1sqevO99mD2V1xxZEa7--LX9vctuFebLc59fOej3xnjkhA@mail.gmail.com>
	<1454533078.7421.57.camel@pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Feb 2016 12:59:58 -0800
Message-ID: <CAMKF1srGn-maJcvPLQSV6Xz7RgU4N1Jipr+Oc9AH_B1xsj-UQw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Wed, 03 Feb 2016 21:00:27 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 3, 2016 at 12:57 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2016-02-03 at 12:51 -0800, Khem Raj wrote:
>> On Wed, Feb 3, 2016 at 12:48 PM, Phil Blundell <pb@pbcl.net> wrote:
>> > On Tue, 2016-02-02 at 22:17 -0800, Khem Raj wrote:
>> >> -pipe does speed up build time so its an optimization.
>> >
>> > How much does it really speed it up by?  I seem to recall the effect was
>> > fairly negligible, but maybe I am remembering that wrong.
>>
>> it does not create files for intermediate objects so if you have slow
>> media it can be significant
>> but if you have SSDs then it might be diminished.
>
> The files go in /tmp though, right?  Even if that isn't a tmpfs, which I
> think it is on almost all systems nowadays, they will almost certainly
> just sit in the buffer cache and never actually get written to the
> disk.

in systems of  this age it should be yet.

>
> p.
>
>

