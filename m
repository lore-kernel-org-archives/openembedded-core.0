Return-Path: <ross.burton@intel.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id CC0856086B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 13:41:22 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id p11so1696680pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 06:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=SDffPP83uZfCbIuUrLwwRJrycBWnO3S/aUyHyCsW7wI=;
	b=mRFBzbYieTKX5/HPMCsPnvyqZAtE9LWeJVQU07mCCKhdQixFwAe5W36uuUMFDHv/py
	liiVKNdNaSXdh5tHksgR0aWJ1upywz7qvCokYUzNXk9692HFPMJhs9LAKJ1Q01f095Jm
	Y11I6lCR9MCZSqRxGeXzMk1xg+3j2OZ7IQuQ8t4nUFkeuxkBB6PBoFQEjw2cKxyV480H
	MF3wCS9ZWtpOuxuhKOvoFNOIlEaLJajS6BMgTlPAoBBMcZvUfYoiw3qsKBuXlQfHFSbb
	noXFBSvvIUL2zZ1GA2Odmu9LTEWr/NjmSbEJrsJohJJUM7MbGhbZq+fKesMW4YGwoLes
	CTIg==
X-Received: by 10.68.254.225 with SMTP id al1mr8035223pbd.69.1369230083911;
	Wed, 22 May 2013 06:41:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.100.104 with HTTP; Wed, 22 May 2013 06:41:03 -0700 (PDT)
In-Reply-To: <1369227075.6695.89.camel@phil-desktop.brightsign>
References: <1369220223-28298-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1369220302.6695.72.camel@phil-desktop.brightsign>
	<CAJTo0LYC2Xa=31R=eCACZDFJkWT8NBSmHVkQnL+x7jausCkDbw@mail.gmail.com>
	<1369227075.6695.89.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 May 2013 14:41:03 +0100
Message-ID: <CAJTo0Laer3rQPAA3mBt9qr6K3QVazfOvafAWHEMQosVT0SXrOA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmMbRQbeAPU3RweslQnY7bmhxClOv5zYmp1YMFZNVy/HNRnVkmjltLVMpd+4a5zOmI7RHbq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] guile: added runtime dependency on glibc-gconv-iso8859-1
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
X-List-Received-Date: Wed, 22 May 2013 13:41:22 -0000
Content-Type: text/plain; charset=UTF-8

On 22 May 2013 13:51, Phil Blundell <pb@pbcl.net> wrote:
> I had thought we had virtual-gconv-ENCODING providers but apparently
> that's not the case.  So I think the answer at the moment is probably
> no.  I guess we should add something like that.

Agreed.  Filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=4530.

Ross

