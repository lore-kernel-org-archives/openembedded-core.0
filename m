Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id A2A2960780
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 08:19:33 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so10511262vbe.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 01:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=3LLTg2TkYdxo2caRPomYVb6yWJJk9pVdYwBGktLPi6k=;
	b=oRPQfR8nx2GTZNvwOdMLdhA/qmDPQqlm7G2uwSIJf7zGOT9a73JkxE26ozcWYC88o0
	upPvTGQwNhlmy2OrpgiS9erOb5rgTmKj4bWPSsg2dU5jamyqOBpgy4ZwxUbPWvrSpVy1
	eVjM9H6Z0kYKD1gW5iH32DxZhCBnS0jbl19bj4QbbNmVXbqWf9p2f+FAjHTE2VuDkpN0
	sKzJm5wXZB7LOkuIwQ9WraJAvK0zF7xs1FrzON+4FoU1Mb6zp31AeeOc1+Jpu8NRpRf3
	fFJon4nUGbQcyUG4IljrkDk7nSip8AhBpmAP9LfZuJ3GZVy5rZYUeFe7ypnMEEELSUSR
	iHUw==
X-Received: by 10.52.164.227 with SMTP id yt3mr1061868vdb.107.1372234773951;
	Wed, 26 Jun 2013 01:19:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 26 Jun 2013 01:19:12 -0700 (PDT)
In-Reply-To: <a1060761efe1f7eb6f02d12848c2b89c685f07e1.1372212772.git.hongxu.jia@windriver.com>
References: <cover.1372212772.git.hongxu.jia@windriver.com>
	<a1060761efe1f7eb6f02d12848c2b89c685f07e1.1372212772.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Jun 2013 09:19:12 +0100
Message-ID: <CAJTo0LYDup8t0rdggAQwiJ_FDb9chwYEzabvOO32hev+PLP6NQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQmHop1ZrZ8V2BwNl8FCYOI3j6oEV7ysRYWIK1CEHWMszeg36o5rG1VouseE+A2tYxo1df7a
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libx11: move xcms enabling to PACKAGECONFIG for LSB Library Check
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
X-List-Received-Date: Wed, 26 Jun 2013 08:19:34 -0000
Content-Type: text/plain; charset=UTF-8

On 26 June 2013 03:30, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +# LSB 4.1 Library Check requires enable Xcms, set enable as default.
>  PACKAGECONFIG ??= ""
> -PACKAGECONFIG[xcms] = "--enable-xcms,--disable-xcms"
> +PACKAGECONFIG[xcms] = "--enable-xcms"

Whether to enable Xcms by default is something we're debating right
now, and this is an interesting data point.

However, this is entirely the wrong way of doing what you want to
achieve.  I suggest you read the documentation on PACKAGECONFIG, but
the patch should have been:

- PACKAGECONFIG ??= ""
+ PACKAGECONFIG ??= "xcms"

NACKing for now as I plan to do a little more investigation on this
today - it's conceivable we'll enable xcms in LSB builds specifically.

Ross

