Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id F192E60138
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 22:26:56 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so166775762pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NbreiIPGbE6OQHgE/rjDUocf5KoAqd+D5PocvZ/I47c=;
	b=KFZuRehSDeF+TBsJMv82tKdJZGE2VNUHjHmBVvjNwUsvEXZFjzA6PSh3qI7yRM49Az
	KK53KdxcPcL7ao+P/C4Rkm10tZvdQpKqb/F/WwJJtu3yAe+qC4lMclcff8RHlwib8rTc
	6MIvngISyhWxXgPkYgW4Og9Np20VQULsG/TEPuBYqfsjpyhhSy99mtF6Z9P2XVl0UEvy
	ip+C4LG6we4yXP4l1I4Iik17XvOn0RXaNqV9L0JbvMiBofp/YZIrtMlpD7QVC3nvEpmD
	RB5Usdh6kNQXhY75UoDhsh/xwJlA8ssVx0mJM7AOgVG6/vCgeyJZLrcM6s1IRzQTWPXE
	Oj2Q==
MIME-Version: 1.0
X-Received: by 10.66.233.132 with SMTP id tw4mr47823386pac.80.1431988017863;
	Mon, 18 May 2015 15:26:57 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Mon, 18 May 2015 15:26:57 -0700 (PDT)
In-Reply-To: <CABcZANk3s=5CAK+qQ2JySrzXsy2na0SBQv8E3N_m2Ei1bcOk+Q@mail.gmail.com>
References: <1431979698-29379-1-git-send-email-ldnunes@ossystems.com.br>
	<1431979698-29379-2-git-send-email-ldnunes@ossystems.com.br>
	<CABcZANk3s=5CAK+qQ2JySrzXsy2na0SBQv8E3N_m2Ei1bcOk+Q@mail.gmail.com>
Date: Mon, 18 May 2015 19:26:57 -0300
X-Google-Sender-Auth: ZW_juNYsrfbSGTMd1-nKbfJlYes
Message-ID: <CAP9ODKoHQiPV5nYJbDPi9afxfagoxZzwvLbhDvD68O06yP1m2g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cleanup-workdir: wait for bitbake instances to finish
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
X-List-Received-Date: Mon, 18 May 2015 22:26:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 18, 2015 at 7:23 PM, Christopher Larson <clarson@kergoth.com> wrote:
>
>
> On Mon, May 18, 2015 at 1:08 PM, Lucas Dutra Nunes <ldnunes@ossystems.com.br> wrote:
>>
>> bitbake uses a lock file on the build dir, "bitbake.lock", to prevent it
>> from running before an instance has exited. And sometimes the
>> cleanup-workdir script can call bibake too many times, too fast, before
>> the lock has been released.
>>
>> By simply waiting that the lock has been released solves this problem.
>>
>> Signed-off-by: Lucas Dutra Nunes <ldnunes@ossystems.com.br>
>
>
> The fact that the bitbake UI can exit before the lock has been released is a bug. Not being able to assume bitbake is done by the time the bitbake command exits is not ideal, no one should have to block directly o the lock like this.

Agreed so you would prefer this to be fixed there?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

