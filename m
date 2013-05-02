Received: from mail-wi0-f173.google.com ([209.85.212.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>)
	id 1UXwgj-0006hd-LH; Thu, 02 May 2013 18:48:58 +0200
Received: by mail-wi0-f173.google.com with SMTP id ey16so784036wid.12
	for <multiple recipients>; Thu, 02 May 2013 09:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=9OSPUbUEA8uC7iySAzr2X6pXfdheMXM8s+M4k4jYuJk=;
	b=sZmsHxyf2mRgvEcpz83qYE4gKSnsAW4JGb2+GhGdQttYztadrYABoMiYhZqDdMxBzm
	MX3kQn1Q0xgKSaJ8oIdxlRrLm5Oc38wHJy/Y1U1oYtfBKZTGF4I8rDk7DzIqnAnlx/ob
	bWNel5kSnTTPiiUnyEDuqX87ekKvu1g5B/psCnwL1bLtZgGy7F/f+UxkGypbp0Kk9Vmr
	UnQANKtKIwAeGgcPt8XWWCn3stBsFB03LZkBMd+9CwOWfJQwrpevfDiG3vv9B5K9+KhD
	FEmwivMHJCmNaBE3H1CXWTRFwXZGfEbonLa9CDZTPfZXpSFneSl74DtM54zM5znvMvTX
	/AEg==
MIME-Version: 1.0
X-Received: by 10.180.92.193 with SMTP id co1mr8756065wib.20.1367512259336;
	Thu, 02 May 2013 09:30:59 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Thu, 2 May 2013 09:30:59 -0700 (PDT)
In-Reply-To: <CANyK_8d-AUKrqeFexg1HMT7KypQAZjmfgEF2ChXTwsggok9Ucw@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<CANyK_8d-AUKrqeFexg1HMT7KypQAZjmfgEF2ChXTwsggok9Ucw@mail.gmail.com>
Date: Thu, 2 May 2013 12:30:59 -0400
Message-ID: <CAHUNapSbKx1baQ++toBir_uw6uWhFun7yA9GwRpNYoTm=7L4BA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 02 May 2013 16:49:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 2, 2013 at 11:57 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> The recipe also has dependencies
> outside meta-oe (fluidsynth in meta-multimedia IIRC) but that's a
> separate issue.

I've noticed that too. Shouldn't dependencies be contained within the
same layer? Is it normal from these dependencies to be spread out over
various layers?


