Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>)
	id 1UXwAW-0003hw-5t; Thu, 02 May 2013 18:15:41 +0200
Received: by mail-vc0-f178.google.com with SMTP id kw10so618187vcb.23
	for <multiple recipients>; Thu, 02 May 2013 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=6Hk6gtTxhOq8ftSsFAEeAOD8VUVjfWe3/84R0d0H9pI=;
	b=a0kIdP1FV72XTW1VAdsgfc8AXr+bzAMsJsR49PafLm0GCaBsX9JHjX6k40+vaE0fDQ
	sa/RAaFNSqZiMElqn65XkvMULWi+GXBB/cfl2GzALL/cIONUMRPNgJs+SDM2Ts/ADyIB
	UBWWJgoAYSMpLQjO6hquDZxCNWcS1G8elJgVrJ03HkP2AH/CkAHhhZ3CBFYjRFAxGFv4
	x9zvCUQcRZh47D94p7lmOb3YLHXe32GrXKqDtwMZqnOhnj/srNKvP2DD1B7NcJZnnGFO
	sJKBQ6XuKjUZ3r0keF/ml5fOJ+ZzwQcBsd76sQzJazSxcufq03+b0WDhfOE/Al3/GiFh
	Dh/w==
X-Received: by 10.52.27.52 with SMTP id q20mr2092598vdg.16.1367510265841; Thu,
	02 May 2013 08:57:45 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.48.5 with HTTP; Thu, 2 May 2013 08:57:25 -0700 (PDT)
In-Reply-To: <20130502151833.GC3206@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 2 May 2013 16:57:25 +0100
X-Google-Sender-Auth: byaJf4DR2_O9OLT5O4-S47M9WM0
Message-ID: <CANyK_8d-AUKrqeFexg1HMT7KypQAZjmfgEF2ChXTwsggok9Ucw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Thu, 02 May 2013 16:15:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2 May 2013 16:18, Martin Jansa <martin.jansa@gmail.com> wrote:
>   meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_package

I did have a potential fix for this, I'll take another look and see
what I can do about sending a patch. The recipe also has dependencies
outside meta-oe (fluidsynth in meta-multimedia IIRC) but that's a
separate issue.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


