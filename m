Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sob86-0000KQ-R2
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 16:09:30 +0200
Received: by lbol5 with SMTP id l5so290751lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=JsKoq77azCFYsoBK5ehc822ge1+4ohUlC3q+Gl4pzDY=;
	b=P8e53RQmQgqEDzrJ/wXhFLg0BIbHyTKkgJGY/pznRH4wi2flz8jsfl+yTMETGXhxz5
	05JPrh/gHq5Y51G7qObM7mCmaBopewpi/2yO9XP0h8sW1fudQdCUMH+epz38LuH8QGke
	82znZmkR9A/N/x13af3nbVWgq7ULyhSTN3LvnAkbJ8K7Z9OcXkeeaeHZHru/IZnlPBuO
	wcYzlSdHu0mxW6hVv3aYmaIP7HTKbbrwxWxUMHE/tqaBZoD5AFj+TY0vUuh0Qv6bekmT
	Lak5V5IjW33KqVpH2j/OLt9NYTqpgsqjmbq6jw6Tye+dsKdFAX23d1re1kl6cu7h9PrO
	VW7A==
Received: by 10.112.100.234 with SMTP id fb10mr20363421lbb.12.1341928700090;
	Tue, 10 Jul 2012 06:58:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Tue, 10 Jul 2012 06:57:59 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207100454370.26177@oneiric>
References: <alpine.DEB.2.02.1207100454370.26177@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 Jul 2012 06:57:59 -0700
X-Google-Sender-Auth: LtbHhX4AP0g0r5g7Eamie35Kc9A
Message-ID: <CABcZANkzWeZ1+yqqcLf330Ko-rMuk8C7w7FF+aH_omo1Xw2+NA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: does anything actually use BBVERSIONS?
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
X-List-Received-Date: Tue, 10 Jul 2012 14:09:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 10, 2012 at 1:58 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   perusing bitbake user manual, came across section 2.1.20 which
> mentions BBVERSIONS, but i don't see any current usage of it.  is it
> still actively used anywhere?  the only places i see it are in the
> documentation.

I don't know of any uses of it. The original intent was to allow a
single recipe to emit multiple versions of a recipe, like
BBCLASSEXTEND, thereby consolidating the metadata for an upstream
project in a single place rather than it being scattered across .inc
files, but I don't think anyone has needed to use it or tried to use
it for anything. I still think there's value, but less so now that we
try to keep the number of supported versions of a thing to a minimum.
-- 
Christopher Larson


