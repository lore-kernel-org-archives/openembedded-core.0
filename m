Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id B4028601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 03:02:33 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl10so871940igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 20:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RxyTu6GUvJWQG46AARSwb2LA97hw4awMFZfDiuH/Dgg=;
	b=D8woBUtf2udGwXFRCL8ANoKJbZj1tqxKQt+0djhV9m4mwWa8hbTqJudEFYmAs+2dH6
	n9hAqyMr8bGdGqBk7fHlxHBfrNXygqvzFeAQrIFtg0YTiYDnEQ0HrFzLFAwT5np24wVY
	KQ45MF6DHgEr+WeCJxYH6zTRMOXqPY4mARNx+m5lyBNK1xuM4C7UFjtyMBIPz7L9/w7q
	NAz0VthD1KH/BmyPCn5P/FiT7irV5dt9zGw1OxkcoYo9xacFff61dNe1HS2wJnEJX36z
	a7ht2jctiFXsU0dVBns0oDJ4FmWDQCPVCy+ONxfC/+S5ABU80BCdkO/QomiYGL770j1o
	4tiw==
X-Received: by 10.50.30.167 with SMTP id t7mr20149246igh.17.1399258954956;
	Sun, 04 May 2014 20:02:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Sun, 4 May 2014 20:02:04 -0700 (PDT)
In-Reply-To: <5366FCAB.3040907@ti.com>
References: <1399160215-16270-1-git-send-email-joelf@ti.com>
	<536613A5.3020003@gmail.com>
	<CAMKF1spb-jndL4NqiW_Qq3KChtdKKX+1Zahj5CSak6nwm7zLRw@mail.gmail.com>
	<5366F952.5000206@ti.com> <5366FCAB.3040907@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 May 2014 20:02:04 -0700
Message-ID: <CAMKF1sq43mfkbe_DN6rK563eOPjhQ7Ti_z-Y5apT-LFTTirFyA@mail.gmail.com>
To: Joel Fernandes <joelf@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] serial-getty service: Add linux as default TERM
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
X-List-Received-Date: Mon, 05 May 2014 03:02:34 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 4, 2014 at 7:51 PM, Joel Fernandes <joelf@ti.com> wrote:
> Khem,
> terminfo data (/usr/share/terminfo) seems to be coming from ncurses in
> my build. I think ncurses-terminfo-base. Not sure what the right
> dependency play we should be doing for this... set dependency to
> ncurses-terminfo-base?
>

adding ncurses to dependencies would do it. but that could be an overkill.

> by the way
> /lib/systemd/system/debug-shell.service
> which ships with systemd already sets Environment=TERM=linux

yes this seems ok probably.

