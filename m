Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QcDTS-00080Y-Hx
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 11:23:50 +0200
Received: by fxh10 with SMTP id 10so2258448fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 02:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=t8b/DxG09mfeBtzcnORk/3q7GcH7TiVKufTrCkyJGd4=;
	b=k9UY/AXvtjbx9D0OzeLaMt/cSbiLHIXX/qxczf64jiPcwlrXGAMnYvKgno9iQksXj6
	UPe/2lQDV6A1pEFjT+82VJVfhWSTycBowRAUpOQcIwJNiD7HjCU3HLQe2QBgpX8Vl8j5
	9kSLZ5x3H3vR5E0O0/+4p2rDsuBwQP0l4n/78=
MIME-Version: 1.0
Received: by 10.223.14.11 with SMTP id e11mr2699620faa.131.1309425607386; Thu,
	30 Jun 2011 02:20:07 -0700 (PDT)
Sender: anders.darander@gmail.com
Received: by 10.223.111.130 with HTTP; Thu, 30 Jun 2011 02:20:07 -0700 (PDT)
In-Reply-To: <1309420844.20015.426.camel@rex>
References: <cover.1309370038.git.anders@chargestorm.se>
	<BANLkTi=9ngg0yFnggOKLuccsdA7jTwTaZw@mail.gmail.com>
	<1309420844.20015.426.camel@rex>
Date: Thu, 30 Jun 2011 11:20:07 +0200
X-Google-Sender-Auth: 9GeXT196RwEyeALD6VawnEbItb0
Message-ID: <BANLkTin8S181tRTER1G_bboP=Gq2_Qp_fg@mail.gmail.com>
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC v3 PATCH 0/9] Linux 3.0 build support
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
X-List-Received-Date: Thu, 30 Jun 2011 09:23:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 30, 2011 at 10:00, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-06-29 at 20:02 +0200, Anders Darander wrote:
>> On Wed, Jun 29, 2011 at 19:54, Anders Darander <anders@chargestorm.se> wrote:
>> >
>> > v3: - task-base.bb: fix a problem that *pcmia26 couldn't be found.

>> Unless I find some more problems, or get such reports, I plan to send
>> a pull request towards the end of this week.
>
> It looks good to me apart from some ordering and PR bump type issues.
>
> Where you change the depmod dependency for example, we really need to
> rebuild module-init-tools at the same time so the binary changes name at
> the right point in the series. Patch 4 and patch 2 therefore probably
> need to be together with a PR bump.

You're right, of course there should have been a PR bump there. I'll fix it and
squash patch 4 into patch 2 before I'll send a pull request.

>  I also wondered what the patch to
> module-init-tools you're removing does (and why you just disabled rather
> than deleted it).

I left it in there of laziness, in case someone had objected to the disabling
of the patch. As I'm not really sure of the purpose of that patch, I'll delete
the patch before I send the pull request. Then we'll probably find out
if someone
had any need for that patch...

> Looks good though! I'm trying to resist merging some of the standalone
> bits straight away :)

Thanks!
If you get too eager to cherrypick a few bits, it's no problem.
Otherwise you can
count on getting a pull request tomorrow.

Cheers,
Anders


