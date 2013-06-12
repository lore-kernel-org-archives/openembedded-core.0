Return-Path: <sakoman@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA546A9FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 13:09:32 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id o6so1330786oag.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XjXbbOP+eUhJg90A70yZ4/9BdBnrrDUwPJaZwTLzEmI=;
	b=sQq8XKWar4x819r57QDLmjMjbVSajMTiY2QC+PITakCEoqjhLU5xjS6AVyxZEEfsue
	4Ebnu0RtCNYNQJVezWOoayL6/bnHjz3isXwHiKFnZGSxKIKgZAxVJ0cZjRyFW/Xx3EV+
	bdY7mSClcLnrXFDMEtxXwgY2GabOGRqOoZm+QIgf5KA2uMMzhYHg5KEk/xKntGZ0fmFO
	XN2jygdv0EdbAzXglPNXOFtUWAzuVMkmPxkl52ZpKEZT8YT9d6YVhOchaYLhzrlWv1Mq
	v7a+juJyu97QjdkI2eJSYMXkDi2IjlKclYlH0J3yYXWfr7UuW0aRaxpHQ4HSuw/1gLvm
	Y2fg==
MIME-Version: 1.0
X-Received: by 10.182.61.19 with SMTP id l19mr9952015obr.55.1371042573121;
	Wed, 12 Jun 2013 06:09:33 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Wed, 12 Jun 2013 06:09:33 -0700 (PDT)
In-Reply-To: <51FB023E-F4EC-42A6-8230-D40DDD2542AE@dominion.thruhere.net>
References: <CAGDS+nkMujRn-M+Oja==L+kMynx0-P0WxZWeVaSsAHJGGWPUUA@mail.gmail.com>
	<51FB023E-F4EC-42A6-8230-D40DDD2542AE@dominion.thruhere.net>
Date: Wed, 12 Jun 2013 06:09:33 -0700
Message-ID: <CAGDS+nnsT3TVesy=k6a0mqTtz1EFG68XGVQcGRqc-o_vbN4sjA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Possible to fetch from private github repo?
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
X-List-Received-Date: Wed, 12 Jun 2013 13:09:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 12, 2013 at 6:07 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 12 jun. 2013, om 15:04 heeft Steve Sakoman <sakoman@gmail.com> het volgende geschreven:
>
>> I have a client that keeps their app source code in a private github repository.
>>
>> I haven't managed to find a way to convince the git fetcher to grab
>> the source code.
>>
>> Has anyone else managed to write a recipe that uses a github private repository?
>
> Yes: https://github.com/CircuitCo/meta-circuitco/blob/master/recipes-tester/beagleboneblack/bbbtester_git.bb
>
> You need to have your ssh keys in order before trying that, though.

Thanks Koen.

I tried that form, so clearly I must not have my ssh keys in order!

Thanks for confirmation that it can be made to work.

Steve

