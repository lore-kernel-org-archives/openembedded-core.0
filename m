Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 848EA601A9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 02:32:19 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id c1so4159805igq.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 19:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=emzNs+W5kGOZ5IuRQxBCsZCBsiAqPXXN+Kx41vpc+iE=;
	b=pmseB6eRk92Gm57eHL/DXdqsC1oAy57nK1k6FuyauuR6oGJ0DuQ8A07yaqGtsVEfLf
	iuEx25ZUiPA+EoaOURZ6LahBCMKfI/KHe/rIOiBYZuJ78PV0OOaIhlAoaKpQvs4CWFng
	oWgdMdx+VwqvlOX7f7SY+enTpC/XMdcRTk3X2Hl2Lctnt8FEWp4HcOfEm5SbRIPPWUjT
	LRepzWVuJFc4xN7/3h7ulbRC+a9PAOmJnnsbx0d3bSeny1GkSgGaGIwo36Ul2IxSHXlh
	ibsG4/9ay2i0J3dWAa20MrFHFneChDoKfaZdlshAVkgmh6UTf6uoVJMZnFk38KUTrWf+
	950w==
X-Received: by 10.43.94.9 with SMTP id bw9mr28063114icc.19.1399257140761; Sun,
	04 May 2014 19:32:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Sun, 4 May 2014 19:31:50 -0700 (PDT)
In-Reply-To: <536613A5.3020003@gmail.com>
References: <1399160215-16270-1-git-send-email-joelf@ti.com>
	<536613A5.3020003@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 May 2014 19:31:50 -0700
Message-ID: <CAMKF1spb-jndL4NqiW_Qq3KChtdKKX+1Zahj5CSak6nwm7zLRw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
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
X-List-Received-Date: Mon, 05 May 2014 02:32:20 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 4, 2014 at 3:17 AM, Jonathan Liu <net147@gmail.com> wrote:
> I would prefer:
> Environment="TERM=xterm"
> ExecStart=-/sbin/agetty -8 --keep-baud %I @BAUDRATE@ $TERM

I wonder if that would add some dependency on right terminfo being
present on system ?

