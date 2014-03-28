Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6EC6E8AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 00:49:34 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id hl1so223549igb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 17:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DtssL3urpECSqwT3WWOiSmuzoYMm6DE9TIdtNdqraMQ=;
	b=XAtCpWxUZYmSFwr/AcnN62e/JNPYjFYOw1Jh1uRjJFBwD7dBVLFpz+gH4QFOdqbTvZ
	hPCcX2RsB/2NHM+w1R6dm4Z87XU6xF4a1/cvipBC7+KHR45JE86Xn3orxbTyt5zpOF4q
	89V6QzndbkCshcgpxrjb2OJq7tz18YZ555ZJow9HMR3EvYppuhjunG0XAtKFQNHlSXaW
	/WHAf1Fs3gxKMUsH2nTfhNltWYzCSgnFBcOVx0kRoC89gxfwZHz9yIZsSot52oqZ1Hp7
	0ogl73cv3EqetkT0WN7eVaWiMNSbLerPWnbGYACetXLwOxjfohkzcZCh2i1QHeqbdNUr
	xElw==
X-Received: by 10.50.143.76 with SMTP id sc12mr19718035igb.2.1395967775057;
	Thu, 27 Mar 2014 17:49:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Thu, 27 Mar 2014 17:49:04 -0700 (PDT)
In-Reply-To: <8acc674de6bd8eda29c0ff56773030698490aafa.1395906476.git.liezhi.yang@windriver.com>
References: <cover.1395906475.git.liezhi.yang@windriver.com>
	<8acc674de6bd8eda29c0ff56773030698490aafa.1395906476.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Mar 2014 17:49:04 -0700
Message-ID: <CAMKF1sqdUwN_E4__SCGpwSmxqEKjfYY4Gk+gaySGbn4=82xAZg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gummiboot: use objcopy from the env
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
X-List-Received-Date: Fri, 28 Mar 2014 00:49:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 27, 2014 at 1:11 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> ++OBJCOPY ?= objcopy

if it is a automake file you could also try

OBJCOPY = @OBJCOPY@

instead of above weak assignment.

