Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RkHsO-00050z-Ha
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 17:15:12 +0100
Received: by dadz13 with SMTP id z13so203081dad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BQIO78U+Vy52+d65V4O189bzTM0et6ucoT0x8EnM9Pc=;
	b=LKregPgp9BLuz9RbPcry3MSnnMVmbz9QJVrYNjgCLUdI1PITb8nF8TcQ8cPhX49gyr
	+e78jFlFuD06yeBcB14/83C3WxzvFuVb/iUdUopTkohqgl/Pp341J/hja0tMYfr8bGR3
	JUFL9+9jbaw7WIwdiQfoKApG3EomAw4d4VhBY=
MIME-Version: 1.0
Received: by 10.68.130.201 with SMTP id og9mr24838098pbb.61.1326125263905;
	Mon, 09 Jan 2012 08:07:43 -0800 (PST)
Received: by 10.143.30.20 with HTTP; Mon, 9 Jan 2012 08:07:43 -0800 (PST)
In-Reply-To: <1325860423.20759.122.camel@ted>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
	<CADkTA4PYbE4gw8Rmwn8Xg6Ns9zajCLKQWJHLWo7qxX8rNbvPsQ@mail.gmail.com>
	<1325860423.20759.122.camel@ted>
Date: Mon, 9 Jan 2012 11:07:43 -0500
Message-ID: <CADkTA4MztYpxfBOGghSqbi7_p+4rT1LMspLD_hxoW_xyp=E_jg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] qemuppc: replace emulation of qemuppc
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
X-List-Received-Date: Mon, 09 Jan 2012 16:15:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 6, 2012 at 9:33 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-01-06 at 09:29 -0500, Bruce Ashfield wrote:
>> On Thu, Jan 5, 2012 at 3:37 AM, Liming Wang <liming.wang@windriver.com> wrote:
>> > Hi Richard,
>> >
>> > These patches are aimed to replace emulation of qemuppc from prep to mac99.
>> > With this new emulation, qemuppc now supports framebuffer and the network
>> > works well.
>> >
>> > The kernel config also needs modification and I will let Bruce to review the
>> > patches.
>>
>> I have the patches in my inbox now, I'm reviewing and merging them shortly.
>> I'll pull these changes in to do some boot and runtime testing as well.
>>
>> Richard/Saul: if it works better for coordination purposes, I can do the kernel
>> part, take this into my tree as well and then send a single coordinated pull
>> request when everything is known to work together.
>
> Yes please.
>
> The userspace bits look reasonable to me but they need to be in step
> with the kernel changes. I'm looking forward to working framebuffer
> support :)

In case anyone is wondering, I merged and started testing this on Friday. I'm
working with Liming to hunt down a mouse grab/cusor and keyboard issue that I'm
seeing. But other than that, everything worked nicely. If I can't
resolve the two
minor items quickly, I'll send the queue anyway and more eyes can be put on
the problem.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


