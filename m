Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 835D760959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 12:29:16 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id fq12so1300504lab.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7qcywzRLn05gHc5AaamhnmJ/yvatW3rdDL6ANXaIMRQ=;
	b=Vlq7wrj+RkKK5ypY+JUYMZEDfcQ2fYebjpJOqKl8XAeK3IQWgAbnNn2f5vLcR1pe9r
	Wuy5JYNc6PA3VmJHh19Bdf682q7XRvy8qRvBS5T7B13S1YQZmWpgyxR0bAPOmfsxD3CG
	/k8jgp00wZyBZQL88ILJEV/0A4z2tDTrA7lfk33FVzdJU3JRpyfIM7DtofVaw16nFLn5
	P3i/P9vLCwSE0DFabEuQRIpJBhCVSD1ObZQXnTS64Zx6/TKa8lXzXjCKfoVbPqUJ+AOp
	vmwQ7kRzYlO82ZVjwKCQbW80vwzrZiojPPH0L2En06AF0GW7koJcUjDkzS4msOgIy3XH
	yEgQ==
MIME-Version: 1.0
X-Received: by 10.112.156.164 with SMTP id wf4mr5680237lbb.76.1370003355666;
	Fri, 31 May 2013 05:29:15 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Fri, 31 May 2013 05:29:15 -0700 (PDT)
In-Reply-To: <1369984072.14887.338.camel@ted>
References: <cover.1369970703.git.bruce.ashfield@windriver.com>
	<51A83FDB.4010309@linux.intel.com> <1369984072.14887.338.camel@ted>
Date: Fri, 31 May 2013 08:29:15 -0400
Message-ID: <CADkTA4MeTx8MYHdQGgK3QAmUNR8Bhr-AWkNVy3TeE0-WC_DN5w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 31 May 2013 12:29:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 31, 2013 at 3:07 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-05-31 at 15:14 +0900, Saul Wold wrote:
>> On 05/31/2013 12:28 PM, Bruce Ashfield wrote:
>> > Richard/Saul,
>> >
>> > While I continue to battle with gcc 4.8, I've got a collection of other fixes
>> > that don't need to wait. Here's part of those pending changes.
>> >
>> >   - Remove the yocto 3.2 kernel, early in the Yocto 1.5 cycle as promised
>>
>> Did I miss a request to remove the .bbappend from meta-yocto-bsp?  There
>> seems to be a 3.2 bbappend still.
>
> In the interests of getting roughly caught up with patches, I've added a
> patch to delete this as well...

Argh. yes. That's sitting on my oe-core branch and I managed to not send
it out.

Thanks for fixing it up.

Bruce

>
> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

