Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 37EDE60169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Feb 2015 21:49:18 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id c9so3646857qcz.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Feb 2015 13:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=25AKrPJHuAErwXLwcHr+69HqTC66a/ut+4zBKiMqIUk=;
	b=SRSubuwwNqVR6+P5RbuPxam1kEgWQZ+/mP+jxzUoQjhM+GH2dllapAg+2gru/OwhKT
	RlUF+KXoi3SCmblTVkhx6F5Jgk2EJ1R3PbF2HTqNwV7I6plE7HK06boxsx8tnutKgip0
	MdERdqBNDQg5Y6c5tW7dRySr8NIqiT2GKGGCXeJBUNk7XCLyRd38ZcaTrdlKsXovqCWl
	jPgTpnLBoQQOzbYQwbbPYfBRTlMKq2QLVTub7VBT4qrGLXR2RqgRddUTiuOp8HRtIh2s
	z/Kn9PAbzf8M4LIjMChLWSlge/ZesZ4jXzmS6VG9E5Bvuucq2QCyYSqjCfWte7yAXdI1
	YJfQ==
MIME-Version: 1.0
X-Received: by 10.229.1.72 with SMTP id 8mr1083633qce.25.1423086559675; Wed,
	04 Feb 2015 13:49:19 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Wed, 4 Feb 2015 13:49:19 -0800 (PST)
In-Reply-To: <CAJTo0LaVxK8+SY7=o-wsNQZazWZcatdbYbD1a=TTqCd4p9=esQ@mail.gmail.com>
References: <1423066153-24933-1-git-send-email-danismostlikely@gmail.com>
	<CAJTo0LaVxK8+SY7=o-wsNQZazWZcatdbYbD1a=TTqCd4p9=esQ@mail.gmail.com>
Date: Wed, 4 Feb 2015 15:49:19 -0600
Message-ID: <CACS+7ZQ0O1JOEPGWeQNfStWNJu1sDm+wSOxjSqKdqqCiAdYY4Q@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] terminal.py: add tmux new window option
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
X-List-Received-Date: Wed, 04 Feb 2015 21:49:22 -0000
Content-Type: text/plain; charset=UTF-8

On 4 February 2015 at 15:42, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 4 February 2015 at 16:09, Dan McGregor <danismostlikely@gmail.com> wrote:
>>
>> Add a new terminal type that makes a new window in the running tmux
>> session instead of splitting the window. 80x25 is not enough to run
>> menuconfig inside a split window, so add the option to create a new
>> window instead.
>
>
> Is there an argument for just using a new window always, splitting seems a
> bit weird to me.  My terminals are the size I like them to be, and having
> have a terminal just for devshell seems lame.
>
> (occasional tmux user but never beyond simply leaving jobs running)
>

With this change setting OE_TERMINAL = "tmux-new-window" in your
configuration will always launch a new terminal. I just left splitting
as the default because it's the current behaviour; I've been using
only new windows for over a year personally.

I don't really see a reason for keeping the splitting behaviour, but I
imagine that others might not like it magically changing on them.

> Ross

