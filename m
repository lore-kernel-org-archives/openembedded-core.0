Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 15EE065C7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:33:17 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id 29so4634517yhl.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3iSBWjqalaOExUwK4bFnV+C8/mkt+/x+DMcZ/N/DTiE=;
	b=ZLGxgjA+/8+vaZUWYJD2DmActKbbVvFAITaMYyRdk8WqQ3TzY+PB3GKE1cZbpPB1Qp
	mdPW+yZiRt/+bkWSggkBDmQkRbZSmzmNjQb3i6+ai5s8R/jvr6m8Nx8eOF0wa4xoM/d6
	/hllHWJ0GC3gu+tLFSC/PDiyIuBIKxgW0ScsQOAV//NRJfcujgzc83AqzjNB/uajc2Rn
	ji9WVK8DUplunEJH6ZKnG8KhW8NWiqeU+VADa8/Wo/yoUkXjbbkXtM30pGO57taWJSwq
	KRfRz7ibDfvtgRdF8Q8bmoDtTxypSbmuzADnM7OiOO/lHZ8aOwdr+pIKRRlU3DubNFGR
	kRIw==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr40068834yhk.6.1407180798704; Mon,
	04 Aug 2014 12:33:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:33:18 -0700 (PDT)
In-Reply-To: <148362e9fa8fc36a8e9e0767b5249b2f5a564118.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<148362e9fa8fc36a8e9e0767b5249b2f5a564118.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:33:18 -0300
X-Google-Sender-Auth: 5JgiI24wESz8Wwa7n2Fs8VL2_dA
Message-ID: <CAP9ODKpNgUfeN+_1RBe0M=iDe2=8ET0nh57_e_hhMu-sVY76xg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/20] busybox: tar: enable CONFIG_FEATURE_TAR_LONG_OPTIONS
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
X-List-Received-Date: Mon, 04 Aug 2014 19:33:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:40 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> This config flag is needed to support the --exclude option, which is
> needed for the commit 'udev-cache: Don't ignore errors from cache
> extract'.
>
> Enabling this option adds 352 bytes to the size of busybox on i386.
>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

You answered my question. Please invert the order of this patch to
come before 04/20 or it may cause runtime error if someone builds an
image on this on previous patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

