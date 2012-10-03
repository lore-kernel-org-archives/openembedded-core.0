Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TJSmn-0002f0-65
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 19:31:05 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2012 10:18:04 -0700
Received: by pbbro12 with SMTP id ro12so10250827pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 10:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=31ebCMfrtaIbbO7P9Nmxd0Qk7IjZy3BY6EJhQGndvTA=;
	b=K1EAnF51ocuGrQZnWN6230yiROxQMUH/N8omNk4QYYJ65GhntRQygO3BS34yBy6NUy
	b/9R2KNe3bhIW60r1gGvUxfQAWHqu1RpQLgTdrKHEyBTLTRr8Z4bGYNHEUXnoKy89FzW
	kXaKASI5c+GKdSQNlZdi5xuBABp0AguDl0vYq6Xpo44FWuc2Px+yweJMzss0GrC0MrPx
	MGHfLatZNVJnGj0WVr6y7XbR88nVjVrhlfFGPKKRnqUsSnEO1YUfciw3AZgJf/DZVGxr
	0ueNh0bT6EE1yoBsfDeyFyHEolIJ1ysytpPktHaObLuY4G122YVdja5YCurhXPv1T2cY
	fZWg==
Received: by 10.66.83.33 with SMTP id n1mr6496372pay.66.1349284683676;
	Wed, 03 Oct 2012 10:18:03 -0700 (PDT)
Received: from [10.1.10.30] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id it6sm2897408pbc.14.2012.10.03.10.18.00
	(version=SSLv3 cipher=OTHER); Wed, 03 Oct 2012 10:18:02 -0700 (PDT)
Message-ID: <506C7341.4010305@intel.com>
Date: Wed, 03 Oct 2012 10:17:53 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349213410-14141-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1349213410-14141-1-git-send-email-Chase.Maupin@ti.com>
X-Gm-Message-State: ALoCoQmWiz5ckN0tXrYIo3jiUchdtzHZrnN3oREkWFa5bHfzkFGbG7DC97UZiB0F+e26fnxiV0d+
Subject: Re: [for-denzil][PATCH] libtool: Add missing DEPENDS on libtool-cross
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 17:31:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2012 02:30 PM, Chase Maupin wrote:
> * When building with 24 bitbake threads on my system I observed
>    errors like the following:
>      | configure.ac:199: error: LT_LANG: unsupported language: "Go"
>      | <tmpdir>/work/armv7a-vfp-neon-oe-linux-gnueabi/libtool-2.4.2-r3.0/libtool-2.4.2/aclocal-copy/libtool.m4:768: LT_LANG is expanded from...
>      | configure.ac:199: the top level
>      | autom4te: m4 failed with exit status: 1
> * This could be found by doing a clean build.  If a build had
>    already been performed then often just cleaning the libtool
>    package and rebuilding it would resolve the issue.
> * Adding a DEPENDS on libtool-cross resolves this issue with a
>    clean build.
> * Bump the PR
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Thanks for this, I've merged it into my sgarman/denzil-next testing 
branches.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


