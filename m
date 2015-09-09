Return-Path: <eu@felipetonello.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 958A760053
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 16:48:31 +0000 (UTC)
Received: by laeb10 with SMTP id b10so11154988lae.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 09:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=kjU7/UHQUm/KBDpHskMbxnwxWHPXGQnNRg3KoDnTtdU=;
	b=UbXL5VtGwczdbzdZ7lrFsUObD0VzwdnbRfIgJ3whY2ZpTQYyUp1aVrdM/IYHqdFLLu
	2b9VuFs8s8R7sPqbKygRt9NA0P99zlccjia22504CbmgITQbaDweSPIFUBccYWEgYTnF
	VwiMQrPmkW2yVxvsb3x4mOBMYsLTOPE2KxoeJVlEB56EWjrSjesrKgykkOOz/yOapk9i
	r8hTPwx1wfVtLmHWFiEqueKvE8ToKLciiqnb2RTFjyYrTv4wAxxHtfmjlQevHZeCbL8a
	lDQD8AKK2VQ1QV9EvMtwZohYpX4kWudV3Nn0EW+EbxeKV/COD+1KDGnjgXdBlN/Iw/tq
	tUNw==
X-Gm-Message-State: ALoCoQktqfPC+1b6Cb2i51NiUzhUufaRbviuf5Q5RsToLROEfmHillMyymjjf30REGd5sgdMW1X2
MIME-Version: 1.0
X-Received: by 10.152.204.39 with SMTP id kv7mr18232164lac.31.1441817309894;
	Wed, 09 Sep 2015 09:48:29 -0700 (PDT)
Received: by 10.25.60.193 with HTTP; Wed, 9 Sep 2015 09:48:29 -0700 (PDT)
In-Reply-To: <1441383478.24871.190.camel@linuxfoundation.org>
References: <CAGrhNMy9tDeSecYg3avrzem+tZt0Sh3mmOrG6J2JqBhaj-C53g@mail.gmail.com>
	<CAJTo0LZwA3rQBt1Ga8q4vamV6qVBHDCJFMAQjd+aLXTj8k9+EA@mail.gmail.com>
	<1441383478.24871.190.camel@linuxfoundation.org>
Date: Wed, 9 Sep 2015 17:48:29 +0100
Message-ID: <CAGrhNMxLz7F7K6e10w=aSgVbtK_bxR5dkiTQmaHDmam=eW__TA@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Remove oprofileui-server
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
X-List-Received-Date: Wed, 09 Sep 2015 16:48:34 -0000
Content-Type: text/plain; charset=UTF-8

Hi Richard,

On Fri, Sep 4, 2015 at 5:17 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2015-09-04 at 16:59 +0100, Burton, Ross wrote:
>> On 4 September 2015 at 10:05, Felipe Tonello <eu@felipetonello.com>
>> wrote:
>>         oprofileui-server is obsolete since it uses legacy OProfile's
>>         'opcontrol'  commands to record a session, instead of operf.
>>         It
>>         doesn't work on fido builds.
>> >
>>         Anyone familiar with the code base can tell if it is too much
>>         work to
>>         update it to use operf?
>>
>> Yes, its known that it's broken (bug 7054).
>>
>> It hopefully isn't too much work to update it,
>
> It just needs someone with some glib knowledge to look at it, its
> straight forward enough. I did get part way through it before realising
> my glib knowledge is lacking (conversion of some sync code to become
> async) and I haven't had the time :(.

I will try to find the time to take a look in the next few weeks.

Felipe

