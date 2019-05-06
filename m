Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0E57D4C6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 09:51:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44yJ065btCz54;
	Mon,  6 May 2019 11:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557136264;
	bh=QsM+5mqEp5sdV0QrC9uThaQAoDGyTMV1foEsmAiPCvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXuWIItMG4mZ0fVwK4S4o9C1fycv3VQwhmbGRwhr1omlg9PR8phB/eHRs801KydiP
	cV5Fwo0EnVah+XQZQ7/HjJidh3rQaUgkYE4fOSU8uqhNPw/ZHsptW46z4V72kyAV97
	e+6rCXX582COrGcNftnr04mjIz+jGmjaL1/SzyqsyZnFsDiRO1jaIQO2b02/SOmJsE
	qLD5ytQruUp0w9Zjca/xod+TlnFUQU7LrVDINcNqcnvfJvibYxwzQJb6aZaflgJ/NB
	RAd9wpzYVTkyiqPd+D3SKv02POOFWIvCgSapyhmi76yQv28tvZxHbB2t+xDoAxyIB6
	qgnrIDrVaTdq1XodHFJsA3iJ6DdUX/xV5sL0r9jGOv8k/viSCd5DlRMNdQi8lGcJYe
	iubcapasn9d54FTyI5UXtPWxlI+wvnWpaFBobtMZruSQ8ZilC7wVoKbaMAZ6bi35Z8
	WeQ4gf4x9qFZZkojdszJrkbkC0HyZl6I3uThNAQYA9+NcIlkK5EPgWzX3Jak2p5IGu
	4JiM9LoBMJ4GQYFWhs8KbpMke9my5y6eSbLfbWIyTjRfJGLUG2uvaY6/XKbxRGu1PV
	SeESi/mYXe9Q2NVJoksI32x/0p8d32k6q6IoTO9tlL1ziXrM6ZuJ0uL0Fb7mrQ3Om/
	O6GchGL/xOOxheIwLY7wP2Mc=
Date: Mon, 6 May 2019 12:50:59 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <20190506095059.GA11818@localhost>
References: <5CC12A3E.4010702@windriver.com>
	<1556610320-114012-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LZnTfeC66-BWnhhXrb6w9eRsUH-hMostVgtKLY4mxwA3A@mail.gmail.com>
	<5CCE7E2D.6050008@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5CCE7E2D.6050008@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glib-2.0: fix ptest failures
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
X-List-Received-Date: Mon, 06 May 2019 09:51:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, May 05, 2019 at 02:09:49PM +0800, Yu, Mingli wrote:
> On 2019年04月30日 21:16, Burton, Ross wrote:
> > On Tue, 30 Apr 2019 at 08:45, <mingli.yu@windriver.com> wrote:
>...
> > > * Increase the timeout to 15 minutes as the default
> > >    timeout which is 5 minutes is not enough to fix below error:
> > >    | Executing: glib/actions.test
> > >    | Test timed out after 300 seconds
> > >    | cleaning up pid 13050
> > >    | FAIL: glib/actions.test (Child process killed by signal 9)
> > 
> > Looks like we're working around a test case that is going to fail
> > because it is timing out.  Let's investigate why it is taking so long
> > instead.
> 
> The sub-case named test_dbus_threaded[/actions/dbus/threaded] of
> glib/actions.test takes almost most of the time, the more details as below.
>...

On what hardware it this?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


