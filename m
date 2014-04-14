Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8692665E7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 13:48:56 +0000 (UTC)
Received: by mail-yk0-f179.google.com with SMTP id 9so7422671ykp.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=RNaU7QK2TtehHWB5LvbgG2AHyXC6j+cbRR0GmHGxKwA=;
	b=lI8rSGr7Rkb/Fy4MPnWKC2sgJeIgXwv+lypMAo9uMIdPw2ftIS3hGu3vi48qfedFzR
	q2FI3dhFoFB58RqLCAvb1UK14Ao4bDylNJ1BrvGwTHgRtSgeBn5GkhLqoqItAU1mgo22
	Sc5Mpkj8wmDF0oKJmOPxhrZs8HsJK8g2UVGBUhMhJ2JbNr+Eutb/5bQswJg3A3YyvK1h
	3v2TdxVRSGTHxlwG8ZBEXh7XQuEE0mKa47DwK+Q6DA3+WYjz0P7P4lAbfeax8/Jzr0+S
	jwdNbQcyahsT+MhLToXuYPdBhgfkNHnkAJPNt6PWBTRWF6e1MBmZFPDz0oHk3ntwzPus
	tnhg==
MIME-Version: 1.0
X-Received: by 10.236.22.229 with SMTP id t65mr59261598yht.47.1397483337287;
	Mon, 14 Apr 2014 06:48:57 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 14 Apr 2014 06:48:57 -0700 (PDT)
In-Reply-To: <1397474305-5411-1-git-send-email-valentin.popa@intel.com>
References: <1397474305-5411-1-git-send-email-valentin.popa@intel.com>
Date: Mon, 14 Apr 2014 10:48:57 -0300
X-Google-Sender-Auth: IIHgUXYT6NHLdXjX6TtP4d9gdlE
Message-ID: <CAP9ODKrQtq54jVX4T0Eo1PM425HinNP45YCAsLVb9Q7NsgHCVA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Valentin Popa <valentin.popa@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH] mesa: double check for eglplatform.h
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
X-List-Received-Date: Mon, 14 Apr 2014 13:49:01 -0000
Content-Type: text/plain; charset=UTF-8

Hello Valentin,

On Mon, Apr 14, 2014 at 8:18 AM, Valentin Popa <valentin.popa@intel.com> wrote:
> Even if 'egl' is in PACKAGECONFIG, mesa egl support
> can be disabled explicitly (using a .bbappend, for example).
> This patch adds another check for the existence
> of eglplatform.h before 'sed' can alter it.

This is lacking the signed-off-by.

The patch seems fine but I cannot test it at this moment.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

