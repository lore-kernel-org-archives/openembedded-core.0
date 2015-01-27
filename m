Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD0B7147D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 17:20:54 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id j7so12379535qaq.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 09:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Wb5UHyc12Iz/TvyrXicNxPUe5QgVhakSXkP2EGDT8Nk=;
	b=oud7AbWKH+jVgr6bhe7BqUSBoJk/e+SGRZapZWH6cBZqd+zFQoYD5WodSIsF8r2C/C
	60JRlaF08RgHEOAd3tWG5hnnbyzRm7bHgS8KSZ4PECO77ujwyHBV/ikK8F7Wf6S8PlrI
	OVRYc1R2CvnDrl6fE5EImMJaZ9ul0bZo1RdY1fd0ljTQkEuFstqbtU3+vVRXgDuFt5uI
	XY6m3vvX5nSXMY7YMqbVl4Hrb0VB5TLbeS5UbJfpNOQnmgRPZPyVS/6KQA9olsS9wHZG
	yJ6unRWxnEh5Dg4NC8sNOaKJ55w5BcFDyxqDJFTFa1i1FJSQhiGXfGSBKVLJVsrzm730
	muYw==
MIME-Version: 1.0
X-Received: by 10.224.46.200 with SMTP id k8mr3885206qaf.89.1422379253765;
	Tue, 27 Jan 2015 09:20:53 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Tue, 27 Jan 2015 09:20:53 -0800 (PST)
In-Reply-To: <1422372551.19798.53.camel@linuxfoundation.org>
References: <1422372551.19798.53.camel@linuxfoundation.org>
Date: Tue, 27 Jan 2015 11:20:53 -0600
Message-ID: <CACS+7ZSWL2FTcVWwT0Yf4ydRogyxqOGmn+cMBUBgYPiuKRoJPg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Add missing depends on virtual/kernel for depmod data
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
X-List-Received-Date: Tue, 27 Jan 2015 17:21:02 -0000
Content-Type: text/plain; charset=UTF-8

On 27 January 2015 at 09:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We need the depmod data so that the kernel depmod command works successfully
> at rootfs time. The fact this was working inconsistently is now highlighted
> after the command was made to error out. A simple test case is:
>
> bitbake virtual/kernel image
> bitbake vrituak/kernel -c clean
> bitbake image -c rootfs -f
>
> We fix it by adding the missing dependency.

On a similar note, I have a patch that makes kernel depmod optional
when generating images. I used it to create an image that can be used
as a container without also including kernel depmod info. I shall post
it.

