Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 651BE708A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 18:37:23 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id at20so7126455iec.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 11:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=0TWd85HW4AHv/9qV7krq8j7F7lqTkYr3GUOmgj9w8ZA=;
	b=YwaSRyaF5zEH4xmAbinuQWeG5zGXdwQDdJsdmZ/wA7SxjUIUQQUw6Y0x5VCMK1r0UD
	xW+yq2bMSNrgjAuMfk3/vMzO7wzrxxQOQiR0qppUdpMdRVdSih3srG1jwdDDEeDiYgZw
	fclImFCUCdzHae/tpAIduWnIIbZYflncFqBgvkDQFS3znrOloiBoBhXR5zo7CwKMV/TX
	Ie49Kf1dj64PkjjyLeMlj98CK9GES0H2P/J9HFDmAZ0IdiTP4z1BwagJlaCAhcDA0Pzd
	r5zk2f+dKc0r085XHrkEtr8/Spf2+dCXMO9Pyd8mFCDq/fkmSAgqHpl4mmcVZYnusgkh
	dPyQ==
X-Received: by 10.42.82.6 with SMTP id b6mr42143033icl.51.1406572644945; Mon,
	28 Jul 2014 11:37:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Mon, 28 Jul 2014 11:36:53 -0700 (PDT)
In-Reply-To: <1406571990-4821-1-git-send-email-ben.shelton@ni.com>
References: <1406571990-4821-1-git-send-email-ben.shelton@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2014 11:36:53 -0700
Message-ID: <CAMKF1sqU1bL_BJSEzoa04fqc+qqr0BA1EdswQ8YYgLyqtefxpQ@mail.gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-standalone-sdk-target: include static libs
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
X-List-Received-Date: Mon, 28 Jul 2014 18:37:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 28, 2014 at 11:26 AM, Ben Shelton <ben.shelton@ni.com> wrote:
> meta-toolchain ought to include static libs.  This fixes an issue we saw
> where a compile against libsupc++.a failed due to the missing library.

I don't think this is a good idea. There are license implications of
static linking. You have to specific about it. However this case is
different since libsupc++ is special library and also have runtime
exceptions. You should move this library to libstdc++-dev package
instead.

