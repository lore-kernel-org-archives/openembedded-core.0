Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C27487BF65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 23:23:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z5so5124213wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 15:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=kXroc5w9EYhgsFxNwxbQIU1vMgtOa0mYaGmFxZwtLUI=;
	b=QFk9nUQ1PoNhu953nFEKOmRL1CtwKyhbKWF+/jW4BKGfYW1fJL1DcYgluKVHrgcVcC
	NnVxsbEcdx86z34cqSYT0F2ubPVkCrXkT5aNL1BaatEdFMq3c9fJk2Gwe13ily8ZrkwT
	aye4ntU/woouVXkLXdcn2J1joeTA+Xgz3Qg+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kXroc5w9EYhgsFxNwxbQIU1vMgtOa0mYaGmFxZwtLUI=;
	b=G1whVPg+wknjO/uFwlshU6J1XwmjygFHx880ERuFW46MwDsFRvjrqcQpZEUFMImcFI
	tOWlEbwOnXkJ3LimbDhw8/oLe2H/+Z4pb+LP5nHMgirJB6vMx5hqxKH9TeU5Og+0nDZP
	HvPisaqtqzMsqJx39dwNy5kOZAq9rWAp0RWOIZOtVxKsgjwI9XtixXB2HH+zgVm/5o61
	wfe0qXmVUtwQN9An00VYjJvRUm06dmLJV9+8Lu7He6/UlnvV8G2ykaB3Xs+o9HRWjjkF
	1FGEILJOAXPRBp+gu0XeR6WRXxtSERLpzcrQ4yDLzTV1JpI5MrhDgyqViHnqNMyQEhRG
	IR0A==
X-Gm-Message-State: AHQUAuaMTeyJxXPvicOX4GQEodf0oaIRN1o3LVQQ9vKHVNIW9EWx1tAO
	sgjlkcw8Y5ATucdjWQQqnQem/wa2FMk=
X-Google-Smtp-Source: AHgI3Ibo7KVFKD0p4VQTStMDaIrHEhBYI7alQG3GScl5zR+g+y1S/mW6lWPCKIxOK20TiNkxVsT0hA==
X-Received: by 2002:a05:6000:1144:: with SMTP id
	d4mr12470896wrx.136.1548977000318; 
	Thu, 31 Jan 2019 15:23:20 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s16sm5362656wrt.77.2019.01.31.15.23.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 31 Jan 2019 15:23:19 -0800 (PST)
Message-ID: <d0825461772140293eb59035fc62e43cdbb4460f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 31 Jan 2019 23:23:18 +0000
In-Reply-To: <a8f5b5c4bf1d9004c564500f7b6f1fd3da1715b1.camel@pbcl.net>
References: <a8f5b5c4bf1d9004c564500f7b6f1fd3da1715b1.camel@pbcl.net>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] go, go-common: Add missing quotes in shell variable assignment
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
X-List-Received-Date: Thu, 31 Jan 2019 23:23:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-01-31 at 12:43 +0000, Phil Blundell wrote:
> Otherwise we will lose if ${BUILD_CC} happens to contain a space.
> 
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-devtools/go/go-common.inc | 2 +-
>  meta/recipes-devtools/go/go_1.9.bb     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Its been a while since we saw you! :)

The patch came through in one of the weirdest formats I've seen,
couldn't get the mail client to give me a plain text version of it. It
says its plain text but the client wants to use HTML.

I forced something to apply since it was a simple patch but it wouldn't
work for a more complex one. Not sure why this is behaving so oddly as
I can usually get most emails to work...

Cheers,

Richard


