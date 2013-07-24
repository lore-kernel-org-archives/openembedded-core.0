Return-Path: <paul.betafive@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3811D605F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 08:56:28 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id n10so323269oag.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 01:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=cHiPTfyPx58AZJdRcoagHT8PnObpQX+OGs9cDjewbIw=;
	b=ssiD5a7NXg61lD8598G8E6/0dMdpzAb6uF59k6OuWBxqiF/OhtE+xNy9xymFogSkXQ
	2v36RLMPZBk8FNEWSSRhvH4P2iCi82PfH+txU0KR0hmhmckVnbQ+cMpxesrDkCeOzTZG
	DdJjqIwaB4C9Fcx8AN385HSgYcBaXtvTLNCk/73Vub9rPqSe1ZLmRubsB4yJpA8J+yEA
	Jnn62+3rpHM3YjkppiIennLZWg7bAqjvxlzMGXJkRU/wNxQrV9KnQX3QgAiEv0DPqDBl
	vTjoMZy7KxV6RnQzTIg92rPGsd7qD4IB3kuXszeRVTwRpDt4VYvrxPKOJbhRYJGdeS+8
	sfNw==
X-Received: by 10.60.70.4 with SMTP id i4mr35114034oeu.11.1374656188157; Wed,
	24 Jul 2013 01:56:28 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.102.11 with HTTP; Wed, 24 Jul 2013 01:55:48 -0700 (PDT)
In-Reply-To: <CAOHjBZvycJUgtJc0sZdkENH51YHvSGj5P50uMALU95T3+W_RPA@mail.gmail.com>
References: <CAOHjBZuDPPjk9dySzOTtGjXzy5yisjdumag=22qV5U-aW2hj4A@mail.gmail.com>
	<1374652108.28370.6.camel@firebird.rb.intel.com>
	<CAOHjBZvycJUgtJc0sZdkENH51YHvSGj5P50uMALU95T3+W_RPA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 24 Jul 2013 09:55:48 +0100
X-Google-Sender-Auth: UqAd-qLHgLeT-XGFeK1QITJU5R4
Message-ID: <CANyK_8eXoSMdsQFGwzPmnxZrgN_bmFejxoLdLAXqmis=rQ7Cmw@mail.gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to solve the make 3.82 issue at sanity check time?
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
X-List-Received-Date: Wed, 24 Jul 2013 08:56:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 July 2013 09:47, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Many thanks for the quick reply Stefan,
>
> For completion, I'm working on FC16.
> Indeed (before sending the mail) I tried downloading the make rpm for FC17
> (rpmfind.net) and to use it
> (accordingly unpackaged under my personal directory, updating the PATH) with
> the same failure.
> Can this sound strange for you?
> As you know, which are the make versions Fedora has released for the
> FC17/18?
>
> I think at the moment the build of the buildtools-tarball will be the way
> I'll follow, temporary disabling the sanity check.
>
> Cheers,
> Giuseppe
>

As stated in a previous thread, there's a snapshot of the buildtools
at http://autobuilder.yoctoproject.org/pub/nightly/CURRENT/buildtools/
which might work for you. It should install a known good set of tools
including make. This could be a good test for it.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

