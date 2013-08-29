Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 782FC6BC98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 14:03:03 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id xb4so493490pbc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=EyzYYXInOtMLnH0Xcg3V2xDK6D+D0c5e8Ke/lSLyaQE=;
	b=RPsFZf/yKutxAzPW3pCwh5w8eQoVHk0RacWJUuD995i/8Ex+yolNzKgq+qjNaYbJz9
	ANy1u1veBO7HiAqgDBSm/2sk6j6Z5iprDNMjspQbnew6q2oy0mWnqvKdz3EsZx5OiHEe
	d5UhAMvjQ0EurceVxpRBYB2PnSlYwCUtbk1Nuz/eWR7tos326i93Y8aasMtzlZSEosPa
	nflZ0h818rzr+EXgvtWrB+kK2Ne6oBZySJUiGA1S6fw7npPfdxXkgJrlDB0sqb26xbFI
	qgUweHqsanivBs2TZqvAA6bYYXWE6AjOU9p8a8aMJfYhHA17zXVJkBG0DT0wx6WXvCse
	VUJQ==
X-Received: by 10.66.189.98 with SMTP id gh2mr4690443pac.60.1377784984286;
	Thu, 29 Aug 2013 07:03:04 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	dg3sm38203892pbc.24.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 07:03:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <521F4020.1080800@windriver.com>
Date: Thu, 29 Aug 2013 18:02:55 +0400
Message-Id: <9B9DE34A-D9BE-44CB-871D-E9C57510DE38@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
	<521BA7CB.7070206@windriver.com>
	<2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
	<521D0622.6090802@windriver.com>
	<2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
	<521E7D2E.6060404@windriver.com>
	<E66BA9BD-07D4-4A90-BFB9-0908608FBD07@gmail.com>
	<521F4020.1080800@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 14:03:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

On Aug 29, 2013, at 4:35 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> With that, it's always been a manual setup for me in the past. The =
typical
> workflow is to test them via the usermode NFS boot. Have you given
> that a go ?

Does yocto have some wrapper script/command to setup nfs boot =
automatically
without too much manual configuration? The runqemu and runqemu-internal
scripts seems to indicate that, but haven't tried this before.

Let me know if it exists! If not, if you could point me to a link that =
describes how
to set NFS boot, and use it to load a beagleboard image it would be =
great!

> Once I'm over the 3.10 introduction curve, I'm happy to dust off my
> old A9 support and get the right qemu support for a full system boot.

That sounds good. We should aim for adding support for both A8 and A9,
since that represent the current bulk of last-gen and current-gen =
platforms
out there.

Best regards,

Elvis Dowson



