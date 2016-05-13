Return-Path: <jefro.net@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id EE37960745;
	Fri, 13 May 2016 17:51:24 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id ww9so20275075lbc.2;
	Fri, 13 May 2016 10:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=cacnCSHAfr8uq5oVmjmtrABoG7ReADQJnsmB/JXm2Bc=;
	b=T+fo/vkcvcMfC1aTWmyyeI6tdcPwPW9Lk1tHpx1TRsUTTPWlrzia+NBhuQ47G/qJbU
	kLd2kNBLDNe7jqSssdcscakOu6leZGiZr6HuJxiFDZOdknCBjQbn/ffsLPPcp3+otQYe
	bKTCAG9knR3yhG7mn5ZEv1f/BhMyLc84v1+Pe6LhzbIr+YTgSGvfOdPVL26Q2QxguHb2
	5/NHNUQr5eHWQNxbAGfj2VebRoxUApwu8rEpRLenXVBfbaX1uwFZ9wdvG4sJoNZcJp3T
	nyzQlXqG7rsNYYXJtkfjjRVL4NkQ4HD2HaWNP4v360I7zbjuLSb8jHsRTvTDiZS6ON0j
	qNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=cacnCSHAfr8uq5oVmjmtrABoG7ReADQJnsmB/JXm2Bc=;
	b=H08rC+vmIlqbrxy5/pp40qt9PMDdOxrMOCG3I3rTp2SC4DeWDAPnjwn6k2w3U+t0Sc
	XxX/LE1w6XSBqsXMuElqFPHxqqhfxic/ai0Q6YqUweFyoki4ZGmjwav/r+d8IvS+PtoK
	6zUpbHwdM60Sb28ycuIYmLZKx5y2qHGmwU6jLCEJ0FD0KRl5cD0dxKbPFz0L71XRO/73
	C/S2XQibLJk6JkpPAItZvbuW1ut/B9vyq3ZSi7G6KoFVichY5nVkH3iHsCwH9CmLUMvc
	rkjW6qKS855aTR01bU399DhjZLv1E2RbwVSB9cVPsT3N5MEyFOSekpp0cxEQPoxkFI3N
	DUWA==
X-Gm-Message-State: AOPr4FXe2MkDGybKA6fjlN0nUHtk8yhgq24UrTC6lqWgDRrXgM4k2ukm6W6CY23meUqbanymAG2FtQN11LSqqA==
X-Received: by 10.112.12.65 with SMTP id w1mr7110579lbb.76.1463161883997; Fri,
	13 May 2016 10:51:23 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.112.139.200 with HTTP; Fri, 13 May 2016 10:51:04 -0700 (PDT)
In-Reply-To: <20160513172401.GC30983@linux-fl6i>
References: <CA+YB3rZCfCiLQEg5Br78ZQ=6QJQiXnh_pGTr0-XFQZFkwniYLA@mail.gmail.com>
	<20160513135707.GA30983@linux-fl6i> <20160513172401.GC30983@linux-fl6i>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 13 May 2016 10:51:04 -0700
X-Google-Sender-Auth: JhtrdDEcbLK2O317rJwwvmyjO5I
Message-ID: <CA+YB3ra6KH+7OYhUjHq8OKRHt-HQ+sRyq8Mp_q4+OEi5NuGiWw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Please help edit OEDAM minutes
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
X-List-Received-Date: Fri, 13 May 2016 17:51:27 -0000
Content-Type: text/plain; charset=UTF-8

Fantastic, thanks Trevor!

On Fri, May 13, 2016 at 10:24 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Fri 2016-05-13 @ 09:57:07 AM, Trevor Woerner wrote:
>> On Thu 2016-05-12 @ 04:32:01 PM, Jeff Osier-Mixon wrote:
>> > I admit defeat. I have been "trying to get to" the OEDAM minutes for a
>> > month and I am clearly not getting to it, so I am now getting out of
>> > the way. We are crowdsourcing these minutes, because collaborative
>> > effort is what we do best.
>> >
>> > My raw notes from the meeting are here. If you were present, please
>> > help edit, fill in gaps, etc.
>> >
>> > https://docs.google.com/document/d/1rPvy-QQkP0Z4a0PGOBkljfzGGzFVWREDz18vZzWyL9s/edit?usp=sharing
>>
>> Ok, I'll take a stab at some formatting and stuff.
>
> I've reformatted the notes (hope you like/prefer it?). Also, any place where
> comments were recorded and attributed to me I tried to expand them to full
> sentences and add the things I remember saying :-)
>
> If everyone took 30 minutes to check/expand on anything attributed to them
> that'd be great.
>
> Best regards,
>         Trevor



-- 
Jeff Osier-Mixon - Open Source Community Engineer, Intel Corporation

