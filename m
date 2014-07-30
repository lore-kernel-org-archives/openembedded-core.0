Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id E463F65CC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 17:33:10 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so7748730igq.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=w1ZZ5E0Cieey7q2vMVuA7CcEncWDIPegy+H5/vrKwp8=;
	b=Y6qIDGbUtWkKRhcxCHqR+8ctB16thsccKgT91/5fWXU3GUnvXdsRIEFiEDsBLlCgaO
	YHXr+ET/27psGjjV+R4Ala9G89HJ4bw7JtSi5kUqXPYGpZ4xLLKWdlr9SXeYyY1+VXxX
	di0aZptMnlIq7ZR6eTYU8/nSp3pm0hp0Ya4NqqNwzX8TZ3IC5mvU/t9LWz/uVc6V55jr
	r7Eck51ocAynAamEAwinV0YZ9kGrHi7vePdNvWTEzOLn3Z7aCjVl6JkCYXbSXgyhr+w2
	OwMy7BD3rzCxhX9QWz09/rFfLXNGzN5Gq/BZx/NYX8WkMxMknPFbH8n7K5i/QWcAXUiT
	O8QA==
X-Received: by 10.50.176.202 with SMTP id ck10mr57028546igc.2.1406741591850;
	Wed, 30 Jul 2014 10:33:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 30 Jul 2014 10:32:41 -0700 (PDT)
In-Reply-To: <53D91F3C.3050107@mlbassoc.com>
References: <53D91F3C.3050107@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jul 2014 10:32:41 -0700
Message-ID: <CAMKF1srm+0up4YsN2u6UQrmO948NHqk1YZAwhx_kaX22e-h=zQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: freetype-config broken?
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
X-List-Received-Date: Wed, 30 Jul 2014 17:33:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 30, 2014 at 9:37 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> The behaviour of 'freetype-config' (from freetype-native) has
> changed since this commit:
>   commit 3476a49b10093c58b2f89e3d9a8527224f1bd7f6
>   Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>   Date:   Thu May 22 10:59:33 2014 +0100
>     binconfig-disabled: Add class and use
>
> This is breaking my build of mplayer which uses freetype-config
> to determine how to use the freetype library (in ./configure)
>
> The comment in the commit indicates that this is an improvement
> and the path forward, but I don't see how to change the recipes
> (and scripts, etc) that rely on this functionality to work in
> this new mode.
>
> Any suggestions?
>
add AM_INIT_AUTOMAKE([foreign]) to the configure.in or configure.ac

> Thanks
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

