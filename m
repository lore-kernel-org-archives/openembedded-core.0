Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 81262722C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 17:37:13 +0000 (UTC)
Received: by mail-yk0-f180.google.com with SMTP id 9so11783244ykp.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 09:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=cxlxpd0FhURl7YagMK3w1zrfuU7M3YIxoQvKBzIpLoQ=;
	b=r6zBf9OmObruI5uEH6PFvFcCNcj3t4OMMwEJWshIOs+ogdF3NGB1Yqd/qVprvVmAYl
	D7NZIxi9GFQsSjlr9SCch1Bw0IDbmYa4Tzr4ztLIltxX7CY+XUTzkuJS9+X7KvOuzQQF
	WyTIzXZFRLv6Zbf3HbVEWmXECpcvF9VIjfM0uWDzNUvxgybJtKjq7A6gvGWVEYqMKsUj
	U6uGjldSVLDe28LSLszMGVfaGPkROG9g/VAzUHBNWvFRAOS3E/8U1nLTuwtffNKR3QaX
	SxYl96nYfJ66WlHm+0Ocw9OYkMEZJQG3HXOIxJtHLC8ZAW7ylA/BPFS5PPqgHfIsrkyj
	W0ww==
MIME-Version: 1.0
X-Received: by 10.170.174.197 with SMTP id q188mr15057382ykd.110.1421516234500;
	Sat, 17 Jan 2015 09:37:14 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Sat, 17 Jan 2015 09:37:14 -0800 (PST)
In-Reply-To: <CAK18fxF0+4OvqPFq36yyaH7LFbi9P0sNHxr1xNdqd=sJdjzyQg@mail.gmail.com>
References: <1421415523-29824-1-git-send-email-andrei.gherzan@windriver.com>
	<CAK18fxF0+4OvqPFq36yyaH7LFbi9P0sNHxr1xNdqd=sJdjzyQg@mail.gmail.com>
Date: Sat, 17 Jan 2015 15:37:14 -0200
X-Google-Sender-Auth: Q1qcpNReqSqamdHdtC3OPwHYa2A
Message-ID: <CAP9ODKrF7Ny8LnnAhGc9ZYZEY3p+PQ201vDZwCTq7dqzwGfVqw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andrei Gherzan <andrei@gherzan.ro>, Armin Kuster <akuster808@gmail.com>
Cc: holger@windriver.com,
	openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: Don't create /var/tmp, log directories
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
X-List-Received-Date: Sat, 17 Jan 2015 17:37:18 -0000
Content-Type: text/plain; charset=UTF-8

Adding Armin in Cc.

On Fri, Jan 16, 2015 at 11:43 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> Hi guys,
>
> On Fri, Jan 16, 2015 at 2:38 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>>
>> /var/tmp and /var/log are symlinks created by base-files and point to
>> their
>> respective directories in /var/volatile.
>> With this patch we avoid systemd-tmpfiles runtime errors like:
>> systemd-tmpfiles[108]: chmod(/var/tmp) failed: No such file or directory
>>
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>
>
> Could you please cherry-pick this into the dizzy branch too? Thanks.
>
> ag
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

