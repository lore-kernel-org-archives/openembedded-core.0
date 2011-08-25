Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QwOpv-0002S3-HV
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 03:34:27 +0200
Received: by vxj14 with SMTP id 14so1335794vxj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 18:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=szWcT+ymmoX3giiuhu7+V5vVfWBdnT1XMDYqP2FzqYw=;
	b=ZKuAQ7NwHykaA5Cpa7OqiUd3kFqspy7NsBXeQ1nnCjAkchRhVzVVuLh3NzhuPiIpsb
	EAYVZbHaxP7WBClbVh+piGtebtm7rsQxTD6+bY6a/FJU2wry6A3PvpIZQ+qjmUHX4EfS
	y/hqu9Ery2mktFcMzUK+dRXJ8tz7F85WiCVYI=
Received: by 10.52.184.10 with SMTP id eq10mr1715440vdc.96.1314235780234; Wed,
	24 Aug 2011 18:29:40 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.108.229 with HTTP; Wed, 24 Aug 2011 18:29:20 -0700 (PDT)
In-Reply-To: <1314235497.5939.166.camel@rex>
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
	<201108221401.15860.paul.eggleton@linux.intel.com>
	<CABcZANnHKrkmjODWStf3CyBEMBZRpkcVTZZ5dmVo-bkUn9Ybdw@mail.gmail.com>
	<201108250116.08019.paul.eggleton@linux.intel.com>
	<CABcZANnGQBOwNVNRsgkH6akPrk9Sa_BoCsFtFBwTak9oRKfuPQ@mail.gmail.com>
	<1314235497.5939.166.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Aug 2011 18:29:20 -0700
X-Google-Sender-Auth: vdbSfM2KN8c-m6alKGks9WIs5L4
Message-ID: <CABcZANn+zhbeBqkY8h8f4q_xpThXsLv-wLVBXLG4X_q-6jcFBA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Aug 2011 01:34:27 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 24, 2011 at 6:24 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-08-24 at 17:20 -0700, Chris Larson wrote:
>> On Wed, Aug 24, 2011 at 5:16 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > On Thursday 25 August 2011 00:16:40 Chris Larson wrote:
>> >> I strongly disagree with this. The fact is, we almost never go back
>> >> and "clean these up later", so crap accrues.
>> >
>> > We're talking about the difference between:
>> >
>> > if a = "":
>> >
>> > and
>> >
>> > if a:
>> >
>> > This is not crap, it's a triviality (for the case where the functional
>> > difference is not important anyway). If you care then by all means submit a
>> > patch to change it.
>>
>> Yes, this example is trivial, but its just one of many instances of
>> this sort of code going in. I'd rather get the code clean to begin
>> with, rather than letting crap pile up and never do anything about it.
>> But I realize I care more about code quality than most of the people
>> in this project.
>
> I'm not sure that is true, I think many people care about the code
> quality of OE. Quality means different things to different people. We
> also all have different priorities. It would be nice in many ways if our
> biggest worry was these sorts of issues but it isn't.

Biggest worry or not, I think choosing to push off things which are
trivial to improve now is a flawed approach in general, and is likely
to degrade quality over time. It's a question of philosophy and
approach. Choosing to do it as well as we can the first time versus
postponing it to a future time which may well never arrive. At this
point I can't say with any degree of confidence, personally, that our
overall quality is rising rather than lowering.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


