Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0506CD0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 11:58:48 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id g12so1545063oah.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=UoowxHwilXsxZVk2+QZtJm7urjivhc4gx+gQlEZZUJk=;
	b=q5TXqcrSzb+dNTw/sJMIYtPkvV5VyPQa3qaMqOe9ONiR3Gy6XHok8scRbI1xtdCKf3
	GCFt21GiZrb3fGSlQBs36Vj+0F398wwV3JKt2uQ9l2LtldCwkACuyigH9auNoiHqWlBg
	5JGksVBo8Ru2zDRMRQi21KwB9qC+zDVeLVw6nCkDphdU9eM3VfqSeWn1TkAeHg7Fxniu
	EoQGzb9DoMCEeseJh9g7hQyLqWZ5s44dEXjcND2mwkkSTRw7qZUMa7n6E5u26foTEMdK
	JqPVpOcnyJryT1js8dOPUp1JTwWZe1Cx/fsI1PLMUH0vXdCPdZO3qWCaASLOkWmNiQIW
	46HA==
MIME-Version: 1.0
X-Received: by 10.182.16.201 with SMTP id i9mr13253075obd.21.1382011130436;
	Thu, 17 Oct 2013 04:58:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 17 Oct 2013 04:58:50 -0700 (PDT)
In-Reply-To: <525F450B.4030908@windriver.com>
References: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
	<CAP9ODKpm_zpo+TyFDe0TSAXHs=MvFjouPjRNE0GcE9i6Lk_7Aw@mail.gmail.com>
	<525E3378.3070604@windriver.com> <1381925550.29912.463.camel@ted>
	<525F450B.4030908@windriver.com>
Date: Thu, 17 Oct 2013 08:58:50 -0300
X-Google-Sender-Auth: 5lXs1OX0-feZFWoAIeyiIAg6SME
Message-ID: <CAP9ODKp0WBNHNn_SYXUnhiwJ8GDyhRC=rNQoVYp2PYuLqK_mDw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: repeat to tar archive file five time
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
X-List-Received-Date: Thu, 17 Oct 2013 11:58:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 16, 2013 at 11:01 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
> On 10/16/2013 08:12 PM, Richard Purdie wrote:
>>
>> On Wed, 2013-10-16 at 14:34 +0800, Rongqing Li wrote:
>>>
>>>
>>> On 10/16/2013 02:24 PM, Otavio Salvador wrote:
>>>>
>>>> On Wed, Oct 16, 2013 at 2:53 AM,  <rongqing.li@windriver.com> wrote:
>>>>>
>>>>> From: Roy Li <rongqing.li@windriver.com>
>>>>>
>>>>> [YOCTO #5287]
>>>>>
>>>>> tar failed and reported that file changed as we read it, now
>>>>> we workaround it
>>>>>
>>>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>>>
>>>>
>>>> You must be kidding right?! loop 5 times?!? why not fix the root cause
>>>> of the change?
>>>>
>>>
>>> Sorry, I do not know the root cause, and I see many people spent
>>> lots of efforts to investigate, but do not find the root cause,
>>> sometime we suspect it is the building servers kernel issue,
>>> if it is true, we can not fix the building servers, we only
>>> workaround the code.
>>
>>
>> This workaround is not going into master, its horrid. Do we know which
>> versions of the kernel on the server have the issue. I'd much rather
>> tell people to fix their broken filesystems for example and refuse to
>> run on them.
>>
>
> I saw it happened on CentOS 5.9 and RedHat 5.5, and We deployed lots
> of them, it is hard to replace them.
>
> The bug did not happen everytime, only intermittently, this workaround
> is ugly, but it is better than fixing the servers, or declaring them
> as unsupported server.

This workaround may make it hard to happen but it is not a fix and
nothing guarantee it is enough for all cases; so I think forcing tar
to rerun for all machine because of two broken distributions is not an
option. We need to find other way to fix this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

