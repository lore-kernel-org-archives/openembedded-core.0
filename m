Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 557566E615
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 15:57:31 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id n4-v6so3874285uad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rwdcWVc3AetOO8QszqoNfoL+n6D0XG57hEWehi6CCSY=;
	b=MNih1ToJYrw29WBqnzqwPNTmVLqBPLg8G8CQE6UBNmWoQ1vA39ER/PjPdyJ5BULmnQ
	XjizP1Md0q9Ubf0wnty4FQB3gilQdMHXfjo7BAnYxxND0kYdeO7vEZ1Op8KDG2mMi5dC
	tYfaeOOzPv15FN3U92zuRvEvrs4uGzdmUGA4z1vpSfReQQPYNSaHCCpNoykqHsMb5RUm
	G+/bHAcelk+d9TAJj7kQqEsTuydBGNg45lNBeBOYsW4E+8Tsl++UKkhVZxha52DoNBZe
	HDny61aqeaUxqGMCYmRgx0zDSG6npcrPp/eFqZ3VLvxm/m94+LIno+JDqLL94YNvOfvy
	6qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rwdcWVc3AetOO8QszqoNfoL+n6D0XG57hEWehi6CCSY=;
	b=AhgcsTSwdLhlGp6+MTAUyXIVwXyzyd3WmXHWb4iYJxN/iIrGeeSBFk+FpdBv3PURFX
	W82wTGHIye6Zhqjn5SDohwuYUgZXdQQvnlxZmsaY03StAwqo63L31UodE8XkEq9kLgkp
	ak6vMx7MMaBYdlHE4Zc/d2HGdIB3JiLq/9PwHRKbo9yAkIUh7FyMUhKN7T7snCEezIgw
	hXZqJ6N7fLgI/pLUOzfGUScSQh4sBKSOGHHTY3B4MrlG+X8NbG9s7AC6Zm0oHNcv6Prb
	+4j3ZM74JwOceg3iSd7wTCr8d02dyCQALT2LRg7LmTnzMdb4RNqSDDe1fhADQYpLwNYo
	b06g==
X-Gm-Message-State: APt69E16KJB02wguKbpq5HKogIPFWlw5YR3XVvmgPfG/qk7bpKkUkL6R
	p+t24iparhqOQ0yFpzJsZgTaHhDCnZg0JWlBdm8=
X-Google-Smtp-Source: AAOMgpfnBuA9co49jxRwxl4uSRHHSmfYQDerq04msDqgxOoJjGRgRxKBdDCS39M63qHRAFZht4TFIkvILxdWoSQrdO0=
X-Received: by 2002:ab0:784:: with SMTP id c4-v6mr6883911uaf.97.1530201452093; 
	Thu, 28 Jun 2018 08:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
	<4ef21051d1ee4c72a7fe24722ec2b31a@XBOX02.axis.com>
	<257c6bc25cc803109799796700bae278d3803d33.camel@linuxfoundation.org>
	<CABcZANkB3nH2VGMAGxtTYZu2XZfsfLc0Ch55GkpmY7peN+cdSw@mail.gmail.com>
In-Reply-To: <CABcZANkB3nH2VGMAGxtTYZu2XZfsfLc0Ch55GkpmY7peN+cdSw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 28 Jun 2018 16:57:20 +0100
Message-ID: <CAO5Uq5RCb_b=VmdWky+6Cen5509i23mR24G3xx-RMZFoeH6wbw@mail.gmail.com>
To: kergoth@gmail.com
Cc: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image: Set COREBASE as the git directory for timestamp
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
X-List-Received-Date: Thu, 28 Jun 2018 15:57:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 28, 2018 at 4:31 PM Christopher Larson <kergoth@gmail.com> wrote:
>
>
>
> On Thu, Jun 28, 2018 at 8:29 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Thu, 2018-06-28 at 15:18 +0000, Peter Kjellerstedt wrote:
>> > There is no guarantee that ${COREBASE} refers to a path that is
>> > under Git control. E.g., in our case it refers to a directory that is
>> > under repo control. "${COREBASE}/meta" is probably a better option.
>>
>> You could make that argument about /meta too.
>>
>> I'd suggest the code checks for ${COREBASE}/.git and if that doesn't

In a poky checkout from repo (which is what I'm also using),
${COREBASE}/meta/.git doesn't exist, but ${COREBASE}/.git does, but
that all works because it's climbing the directory tree to find the
.git directory.

>> exist, fall back to the timestamp of the
>> ${COREBASE}/meta/conf/bitbake.conf file.
>
>
> That's a good idea, but I'd suggest using bb.utils.which() to locate conf/bibake.conf rather than hardcoding that path.

How about (totally untested):

if git -C "${COREBASE}/meta" rev-parse --show-toplevel; then
  REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}/meta" log -1 --pretty=%ct`
else
  REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(bbpath,
"conf/bitbake.conf")}`
fi

?

--
Alex Kiernan

