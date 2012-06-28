Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sk4VT-0006qN-Tg
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 04:30:56 +0200
Received: by yenl13 with SMTP id l13so1451897yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 19:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=zd4328jeggs3NbawrB2AjzUBJ4UjTKpUSazCk4tnLYc=;
	b=unIdnAKGf5iMJw/dbehJnD4BKBsaKVmEUu3fbmpEorc5tnO1f0GOt1eNtgDrNrMNxB
	82eXtPJKkDj5iRrk6OUsrkO3MPxwm19GXGGfg6yN9ylRuEhbr5nvzWKIhAMlQTuOO938
	aF+vMkffGOtW0k/VFWeNfDQear4o7R8aAk4jvwAsUfjU1ey7Zd17ChJsOmxly4rpZiEP
	LjB4PXAvwMR5MVrQ6P/A14UEwN7UH7m+fwohxrQvQuexBZyizS5oExUB0TBoRNcI1kT+
	1UBSGe2zRQY5/o+SEh2SYAmOz5sWZz0NVVW6xPHOHWgKYe75dD2LSdjwexyiDtIWp7xM
	XxNA==
Received: by 10.50.106.228 with SMTP id gx4mr33473igb.7.1340850001076; Wed, 27
	Jun 2012 19:20:01 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.50.104.133 with HTTP; Wed, 27 Jun 2012 19:19:40 -0700 (PDT)
In-Reply-To: <CAF1ZMEfe-dGrL7JHSWHXPTJw3h2zev7b7VQxF5Acx=eQjKiC1g@mail.gmail.com>
References: <dennis.yxun@gmail.com>
	<1340834004-3614-1-git-send-email-dennis.yxun@gmail.com>
	<4FEB85CC.3030606@linux.intel.com>
	<CAF1ZMEfe-dGrL7JHSWHXPTJw3h2zev7b7VQxF5Acx=eQjKiC1g@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 27 Jun 2012 19:19:40 -0700
X-Google-Sender-Auth: wl3q-xaEhiMD2BCiO1g5AR-1nnE
Message-ID: <CABcZANnRMcuCWELOK-BMc4qL+SrAaTC9usjHpXKU0jY3tFtGXQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openjade-native: Use Getopt::Std in place of getopts.pl.
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
X-List-Received-Date: Thu, 28 Jun 2012 02:30:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 27, 2012 at 4:27 PM, Dennis.Yxun <dennis.yxun@gmail.com> wrote:
> ok, thanks for pointing out
> will cook another patch and resend as r2


I got bit by this one on Arch as well. Thanks for putting together the fix.
-- 
Christopher Larson


