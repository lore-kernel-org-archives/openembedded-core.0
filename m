Received: from mail-ie0-f177.google.com ([209.85.223.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UeSN3-0007sI-So
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 17:51:35 +0200
Received: by mail-ie0-f177.google.com with SMTP id 9so13342682iec.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 08:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=l+7/LAi5XMu2HJxX+YssLxY5WVGj8VIPvwP3b4Z2rCs=;
	b=OSHWom0h8PXnIllJtJpM4e3ZfKdLRyVmgCcbEeLli4cAo62SkMnLHpTt5MGqAf918F
	Ne/aQ0giMNXGcj1Zo3+013dPdSVdxlY+9S8Ip+7AvaiYbEqpjUsQae1T0ADoJ8LMBLAY
	29LSj2SkUyItESzN4bRYoKT2h4WCjCXRERUZ/RUKHKT4KefpFjbI0CbL0RYSOVZpWwgY
	jiLGCQd+KXGJF8kNKYLQAvG5HvvGsu7QtubmEbnII2Wq5iP1Gigkzf984rTMjwN/xbpL
	0yrR0+VCt6MJLCfQ16Xa9qoq5/6nGWL9X15S552ceAYiTvpTyfUxmTQVghRjTgvOfopY
	PvuQ==
X-Received: by 10.50.87.10 with SMTP id t10mr5611201igz.108.1369063993153;
	Mon, 20 May 2013 08:33:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.109.133 with HTTP; Mon, 20 May 2013 08:32:43 -0700 (PDT)
In-Reply-To: <1369018801-23696-1-git-send-email-net147@gmail.com>
References: <1369018801-23696-1-git-send-email-net147@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2013 08:32:43 -0700
Message-ID: <CAMKF1soCeFEhBfdGJBiBwRGv+r+XiqD_MUJqz9eKjiYjh53rYw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] systemd: update to 204
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
X-List-Received-Date: Mon, 20 May 2013 15:51:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 19, 2013 at 8:00 PM, Jonathan Liu <net147@gmail.com> wrote:
> Tested startup/shutdown and serial getty under QEMU x86.


Thats not enough. It should be tested on all qemus before it gets pulled.


