Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id DBFDC6D2CE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 18:44:16 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wo20so4035773obc.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 11:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zNuxM0uhNzGe12GqH+forBdQxWMrysNrUT0RXKTfCZ8=;
	b=0GmBs87YufrNl5PM93BgvCKktyz8GuvlpTDkYeltcIyze5pHXdGs/4MmAazgfyhKbM
	vzFxn96BFocABeOmdDzlScjyhqW5Xp98SnC187d19eNxyUROjJBRfvEvjRpqCsCaZXqI
	OkbUzaxkHC8/SZJL1mCje6WpEhW84mA1TwSk2IGvSk6t6M82ywg3mpaBP2CBp9wiPqWt
	TtYbKC/n0q05DTnOIzky0cWs22zPKB2hS20JkJe1LZl8Z9pwz0k0L6i9leMlA+FbvDmA
	DfhlV2Jq4vdPaJsHHoZGBaOhzIzw8/Zq+dynbp2GY7K5KKo9lchFd/uEy21WpmNifv2l
	YDDQ==
MIME-Version: 1.0
X-Received: by 10.182.214.98 with SMTP id nz2mr16066061obc.37.1382985858606;
	Mon, 28 Oct 2013 11:44:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 28 Oct 2013 11:44:18 -0700 (PDT)
In-Reply-To: <CAGrhNMy1DAOCsocJ12F_qpUtbbMPt=u6_dJeRG7R__PpoaQFTA@mail.gmail.com>
References: <1382984521-22179-1-git-send-email-eu@felipetonello.com>
	<CAP9ODKq0_L_1bqOuDE70vNXCbQ=8Bcs9bvAtC2BafGStyz4Mnw@mail.gmail.com>
	<CAGrhNMy1DAOCsocJ12F_qpUtbbMPt=u6_dJeRG7R__PpoaQFTA@mail.gmail.com>
Date: Mon, 28 Oct 2013 16:44:18 -0200
X-Google-Sender-Auth: 9lYb9lVTV5dp0K6B4nC7uiShNEE
Message-ID: <CAP9ODKrMMOAzT1MqwSUAsKmzVA876QPhZhbiShDk2VRv1OvXEg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Felipe Tonello <eu@felipetonello.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] psplash: Show psplash before X in reboot/shutdown process
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
X-List-Received-Date: Mon, 28 Oct 2013 18:44:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 28, 2013 at 4:40 PM, Felipe Tonello <eu@felipetonello.com> wrote:
> Ok. But wouldn't be necessary in this case?
>
> Also, this patch is inappropriate without a patch for X. So I would
> suggest to ignore this patch for now.

The PRServ ought to do the right thing here, so the PR bump is not
necessary and just complicates backporting and like.

So as this is not a complete solution I am NACKing it.

Please resend it in a series with all need patches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

