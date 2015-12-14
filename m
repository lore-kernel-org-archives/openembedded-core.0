Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 43D327317B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:37:31 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so86264057igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ntcxakOkExIWvVWo4BpiR7kxD8m3Bo2qfk7q/JnRHt0=;
	b=o7Dv2C3uT6tdOw5xTpP3V7nE7FFkK0CBsr5jQEOuZN6DWQFQEznaRJfFb21L/NoWcV
	L2W7/REyHJaxekqxWnrY+XI9R5/vjtJ4ic1w6F9qyqCNzm7UyVOEEmoXwBnX4QvYQqXV
	ZOHCSHHvOGeBmQhtZ+RXBRpc1Tj3Un+DZHdQDlNAioIXAZ03UDHVuVfZwcENjkRjnb1S
	yaZ0S9tqK+oWyQmnLefXk6H7Rp1oEJ10U7KQin60a/KzsKsSIQh0RF7nQggoF1wI0YtZ
	/h1TzT+876973byjH/V8s0QwLssUoDcZEdury9TBcfwOOZeRYlBTwCnz9p6p56OpC3Jq
	QyjQ==
X-Received: by 10.50.155.65 with SMTP id vu1mr19127251igb.11.1450107452646;
	Mon, 14 Dec 2015 07:37:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Mon, 14 Dec 2015 07:37:02 -0800 (PST)
In-Reply-To: <CAJTo0LaXYu8epz1WaQCbOB0JLrvChOS8o2LADQWcjwpx4vCxnA@mail.gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
	<2ae1ec09a656b0401bdc399ac0b8fb7d488c4106.1450073907.git.raj.khem@gmail.com>
	<CAJTo0LaXYu8epz1WaQCbOB0JLrvChOS8o2LADQWcjwpx4vCxnA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Dec 2015 07:37:02 -0800
Message-ID: <CAMKF1spi7+A7Z1=kqxptZQ9nBtKevMWfwnJxoywG86evdaeLeA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] uclibc: Switch to using uclibc-ng
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
X-List-Received-Date: Mon, 14 Dec 2015 15:37:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 14, 2015 at 4:20 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Was this for testing?  Presumably I can drop it?

yes drop it.

