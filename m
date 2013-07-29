Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 45CEA601AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 09:08:56 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id x13so2178366vbb.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 02:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=oLyQLzS2r+3iCo0ePvLiDXXWx2zRplQ/CiP0gC+uqZU=;
	b=KwmavyRjnYC9jsH9Rxxt7zpxVBcUGVOBGZs4b4HqMVu3OleTpvuE+9PjgKeRJzx/kg
	XiH8hyaCWUFMO499r9ttU6W39SJWG5OGZZ/Ovt92lRwVwlPioKRmTV46ygqhKFlzZQY1
	5AJGXAUympy5bY9bonet3piIr3j/KykdkEOZhXrQPJqoX8LyOkCJjJv+9zOhNCoFFzJ9
	0adeFt3TdtQ/VkkyNySmQmIrUeYA8U3YKqZp6ryzANr71yEHKmC2MIltefQjnzDahtuC
	IJm3Enos97c40OhfGrbijnhfTpSWfjhGaiufRVYKZRPfG1N94v8MYDWqf+FqWH0oDhMd
	cwwA==
X-Received: by 10.58.233.8 with SMTP id ts8mr25105081vec.44.1375088936652;
	Mon, 29 Jul 2013 02:08:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 29 Jul 2013 02:08:36 -0700 (PDT)
In-Reply-To: <cover.1374992484.git.sgw@linux.intel.com>
References: <cover.1374992484.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jul 2013 10:08:36 +0100
Message-ID: <CAJTo0Lb+LauJxMWSzjhPwQ=1K5L71_Q97sf6RMdCZPe0mc0K4A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkyR/E1/00D4XKc2QfjYSkaL0GsQx75ujPBLs2tG/i+6OfmgI4xPxRD7oL5uTfMV5fYITIj
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (Part 2) 00/15] Tobe Reviewed and ACK'ed
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
X-List-Received-Date: Mon, 29 Jul 2013 09:08:56 -0000
Content-Type: text/plain; charset=UTF-8

On 28 July 2013 07:30, Saul Wold <sgw@linux.intel.com> wrote:
> This is part 2 of the C-Pull, part one was reviewed and ACK'ed on Friday,
> these where some changes that have come in since, there are some additional
> changes that I still need to review (Read-Only Rootfs specificly).

The contents of the branch sgw/stage2 doesn't match this log...
(specifically the branch at least has two conflicting bluez5 obex
changes and the texinfo update, which isn't in this log).

So, note that I'm acking the contents of this thread and not sgw/stage2.

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

