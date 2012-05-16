Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUmD5-0002wE-Bo
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 23:56:43 +0200
Received: by wgbdr1 with SMTP id dr1so1051996wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 14:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2JlGmV9Jj7iPDMVinfJynOcRwfG0qOPaYWNBuWP63l4=;
	b=pKf295s2ax4bly9lljTCECZqWHIaL6R5h6CjXtjJQrHT9OUmuQ9T0eABdY9swwr0gQ
	Ue2Gs0mPdDEIs3NOTX4AzVDdPy1ErggglD0fSuyFWIEGTV2p52P+J8Wqr7em6UX7gnVN
	+8J+ojJmqSYFFMMy0VV8xV0yNbrKZwJMBAlYIwptxflcXwZDTJw70R6mbEhTmCTQ/oFQ
	eDZ0z9d92uJhoKjePyHkCPKqOZs+3kNJ8FJ9BxlrNnB/mIESXWg8g2bMqADpN4+J79GK
	59+JqX57r6RyYcvwxJYT1sWQ6hVHON8A1f66WtFQhTVPa3wrTT8ufNpUfXgw3Xjh6k01
	S7fA==
Received: by 10.216.150.225 with SMTP id z75mr3071623wej.77.1337204801761;
	Wed, 16 May 2012 14:46:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.63.175 with HTTP; Wed, 16 May 2012 14:46:11 -0700 (PDT)
In-Reply-To: <CAP9ODKq51+a9UbXP9wdgRnP4_LtX+wPt=ujCL7iZptBQNhq92A@mail.gmail.com>
References: <1337197900-23107-1-git-send-email-daiane.angolini@freescale.com>
	<A0753188-2AE3-44F8-A33B-07C97112D8A4@dominion.thruhere.net>
	<CAP9ODKoavGcE6mtQsbn---sE3_Z7ow9oFSAxKGxwRGmBHe5D5w@mail.gmail.com>
	<CAMKF1so4jRESbLbG867ehEBRgJjh=nJcoLPsFjNtvC+tnCg=Og@mail.gmail.com>
	<CAP9ODKq51+a9UbXP9wdgRnP4_LtX+wPt=ujCL7iZptBQNhq92A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 May 2012 14:46:11 -0700
Message-ID: <CAMKF1sq+aa+kEJ62g2CE_FQKLd-8_wVTks4CB5tQn43-4y8ZZw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <daiane.angolini@freescale.com>
Subject: Re: [PATCH] evtest: Add evtest 1.30 support
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
X-List-Received-Date: Wed, 16 May 2012 21:56:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 16, 2012 at 2:42 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Ok; well said but how do you qualify it?
>
> evtest is very nice to have around when debugging stuff and suit very
> well for a bring-up image for BSPs and like, It seems like a good
> addition for me and that's why I have said to Daiane to send it to
> oe-core. It is a debug and test utility and as it is generic and non
> architecture or board dependant, oe-core seemed the right place for
> it.

that kind of explanations will make its case to get into OE-Core however I share
Koen's sentiments too where we should try to keep OE-Core thin. So if we discuss
the inclusion case thoroughly we will be able to make good decisions
on what should
go in into OE-Core.
I would be interested to know what others who use this utility think


