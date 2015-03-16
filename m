Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id E38AD7399A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 18:13:50 +0000 (UTC)
Received: by yhch68 with SMTP id h68so20316336yhc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=1fXFKnG4XRJ6HWeWy+O/jUaMm8jjl7UrXF07sy5FY5k=;
	b=ocDIDMm6EwUF6CJeLGL/6uOLldTmjCKHkGYrMI3y+ggFX6p0Knh9srVIWG3uF5F3Xu
	SBcmLhPE/pL1CruRjZs5MTJA6fQa74AQty4TcDLzAYXESM9t6W/bEwJ3Hva8fBQmCfTd
	fpzB562DTVDa3mSKQCaVrpGRqnhx/ViOmit4jhYZY6vkC4zjPcFplhOoey22ph7+0ks1
	fjwnWWcR1aJrTtMR/7OF+emxaD6x46vm2nxoD0g42qJPo6pEOBts7BgyiBAsXwf34GH+
	agxatrtaFYcQ6/GzzVDUno+lupD+PtHR0Jyg7QktubQ1SQS+TJ7m9x9q5zxbUBsOkaN9
	USiA==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr64062930yhq.90.1426529631589; 
	Mon, 16 Mar 2015 11:13:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.82 with HTTP; Mon, 16 Mar 2015 11:13:51 -0700 (PDT)
In-Reply-To: <1426527964-3711-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1426527964-3711-1-git-send-email-ed.bartosh@linux.intel.com>
Date: Mon, 16 Mar 2015 15:13:51 -0300
X-Google-Sender-Auth: c2vYCVwF-7HjZJ7i7m4uZ7Yn5lA
Message-ID: <CAP9ODKoQkxjtCzsJ1di+a5W7r3Oy3X5N3-8=wMcnJV7hEyYJZA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [bitbake][PATCH] bitbake: bin/bitbake: Create bitbake_main API
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
X-List-Received-Date: Mon, 16 Mar 2015 18:13:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 16, 2015 at 2:46 PM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Moved most of functionality of bin/bitbake to lib/bb/main.py
> to be able to call bitbake from python code.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

The right mailing list for this is the bitbake devel one, however the
change also needs some adjustments as the command line options should
be handled on the command line app instead of the module

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

