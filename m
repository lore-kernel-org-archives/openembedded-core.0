Received: from mail-vb0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsFlH-0006vE-Pb
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 17:41:29 +0100
Received: by mail-vb0-f50.google.com with SMTP id ft2so7863194vbb.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 08:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bAGG2of97Dd8wm7G7A9foYsaUTH07ZTe/3Y5LApyoWQ=;
	b=gDKoE9UcvrnKN05/nNfjU8ozWfOP9ST2DzzPLfGHD45qh8uCOEKAIIJ8cGwYa9leSL
	nIwCfpepQBFGZL8RZBEyCuFNuQ/YMxmI9HzBH9FMa67Evd6ot3MRaAkNo8KRbt7WKi3i
	4fYywYH/jdcr5DfZws9M728b07u1EqaMs+raZmbcbf89ncSqWOmQeq2ieRrWTb8sc4DY
	nfd4OJouNUIHuF9nLZE5CF2JbG6+8qVSaXugSASXFTYoL/bVBwbUyP8N1zKN7Z9UBNtm
	hEd7AJ1mzlEK/eIKYKVNg5tSqATqWADbPmubqCxmIuyHBzfPE2+K0J8SZ0gl44449aNz
	2E6g==
MIME-Version: 1.0
Received: by 10.52.29.175 with SMTP id l15mr72751642vdh.2.1357575970006; Mon,
	07 Jan 2013 08:26:10 -0800 (PST)
Received: by 10.58.80.2 with HTTP; Mon, 7 Jan 2013 08:26:09 -0800 (PST)
In-Reply-To: <CAP9ODKr+sZwLb5A_H6s2-SJ7kPh9T2S4B9zDt1+0B6NwzMUwYQ@mail.gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357559941.25855.7.camel@ted>
	<CAF6bG8eMo0c=e8G2zd_Y4ST0hG-S2Zx4f4f7hhO8PPML7Ozs7Q@mail.gmail.com>
	<CAJTo0LYXWwLEwmz+oWT4Lo6PL1naJxP0NV5DKcEBbJvyLPh0cw@mail.gmail.com>
	<CAP9ODKq2UVEmG11WFNHNdvE5+-X5NW6azhaQsxxGPbC05+j8og@mail.gmail.com>
	<1357566365.25855.17.camel@ted>
	<CAP9ODKr+sZwLb5A_H6s2-SJ7kPh9T2S4B9zDt1+0B6NwzMUwYQ@mail.gmail.com>
Date: Mon, 7 Jan 2013 18:26:09 +0200
Message-ID: <CAF6bG8fLCB-DLNK=9QMNvhUoz7T6d7mw11Du7xRGwdccgcaZsA@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 04/15] file: replace obsolete automake macros with working ones
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 16:41:29 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 17:58, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Mon, Jan 7, 2013 at 11:46 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2013-01-07 at 10:18 -0200, Otavio Salvador wrote:
>>> On Mon, Jan 7, 2013 at 10:16 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> > On 7 January 2013 12:11, Marko Lindqvist <cazfi74@gmail.com> wrote:
>>> >> What's the correct status for fixes that are not really backports,
>>> >> but have happened independently in oe and upstream?
>>> >>  - If practically identical, still mark as "Backport"?
>>> >>  - If different solution, "Inappropriate [not needed]"?
>>> >
>>> > If you did it and then later discovered it's happened upstream
>>> > independently, it's essentially a backport.
>>
>> The best thing is to consider how we use the information. I'd happily
>> accept "Backport" in this case as meaning "the upstream latest version
>> has equivalent functionality". You can note the status after the word to
>> give specifics if needed.
>>
>>> Maybe it'd be better to not patch at all and update to the newer
>>> recipe version?
>>
>> I don't think that is a reasonable policy in all cases. I'm not going to
>> block automake on all upstreams making new releases for example.
>
> Sure but if there're a new release with the fix it is better to
> upgrade than backport the fix (with exceptions, of course).
>
> My point is: it is good to verify if there're a new release and use it
> if possible. Otherwise backport the fix.

 That's what I'm being doing. Even if new upstream release doesn't
have fix for the particular problem, I try to update to it first.
Rationale being that if update is going to happen at some point
anyway, it's less work to do it without need to update the bugfix to
apply to new version. That is: total work of "update + fix" vs "fix +
update + port the fix".


 - ML


