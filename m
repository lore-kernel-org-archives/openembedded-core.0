Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SlqRM-0007eC-BU
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 01:54:00 +0200
Received: by eaal1 with SMTP id l1so2313915eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 16:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ohJbsJo3e0odjsXauFlt1VnrIgP+fceS4iZhxa7OCBg=;
	b=WkjoqQoPB5L7zFUYzHanaledtKJJcgmsL6iyrX8Ne4yK6Xatngyp62jLdfOj7nJTnl
	ju2iFayBaWDUa3AaHBwmQxVqHLxM3mxmKlTv8GJ3bfHZmbaej9azfx3ULf93JYY0dTOr
	np4IUC12/I+pecqOj02wwzNw03UAm2jzHwqFL90Di4XZ8ZPBJ+0VqFT1g4AHqK4Y245m
	Sbad/ob0ri3BUNtQ6TsTPzLrs+1P4OU2AZsoDoSmmxSsJuhE+GadimWCTEdNLchokisx
	nZPAu1p/yOPdKHyVE9iFxUNyWiHyKzQ/U27BLOyq5K4UmF8n0yOf+9BN5Qacexuh6Ygf
	6Iig==
Received: by 10.14.99.201 with SMTP id x49mr2333090eef.142.1341272579196; Mon,
	02 Jul 2012 16:42:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 2 Jul 2012 16:42:29 -0700 (PDT)
In-Reply-To: <441e9c9457b3f888162fe83793df551a6ee97697.1341259773.git.dvhart@linux.intel.com>
References: <441e9c9457b3f888162fe83793df551a6ee97697.1341259773.git.dvhart@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jul 2012 16:42:29 -0700
Message-ID: <CAMKF1srEBy_rLPp_DGr9zQ9WwRqma5JX6qRd6szBPQOf-AOv1A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: Re: [RFC PATCH] grub-efi: Do not use help2man
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jul 2012 23:54:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 2, 2012 at 1:09 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> Fixes [YOCTO #2527]
>
> Modify configure.ac and the generated configure script to avoid using
> help2man during the compilation process. For grub-efi we are only
> deploying the EFI payload and are not installing grub on the target
> root filesystem. Therefor, we do not need the man pages.
>

what if you do export HELP2MAN='true' in say do_configure ?


