Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RIOuZ-0007JR-7s
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 20:06:11 +0200
Received: by wyg19 with SMTP id 19so6686553wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 11:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=Pbwf9CYsUpjP0rWJGAXISWkl5O4LJGqu7dPl4K09Gak=;
	b=xm2D7Ycy+MLwxr+hLR6GN85atBAwQ+FCzF4lBmy4poi5NNhI1DbsV2bjYG0acXGM9k
	BHMHT+qSJUpwp+nTyXba0K8q/w9ABO1Yv0Bvuqm2PBYGW1EQaUFV9CryIxPewVoLY3ce
	xk8wDQiQ2icW7SBgLpAyt0CEHZfPmwuMtmPg8=
Received: by 10.216.9.146 with SMTP id 18mr3695958wet.54.1319479211202; Mon,
	24 Oct 2011 11:00:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Mon, 24 Oct 2011 10:59:50 -0700 (PDT)
In-Reply-To: <CACW_hTYqjsZzB2WRJ=EED4KGwqcGb2UVtKpKjZGNf-urO35G-w@mail.gmail.com>
References: <F930E711-421C-439B-AAA8-EEBA0371ED86@dominion.thruhere.net>
	<CACW_hTYqjsZzB2WRJ=EED4KGwqcGb2UVtKpKjZGNf-urO35G-w@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 24 Oct 2011 10:59:50 -0700
X-Google-Sender-Auth: ASvp90O4qwIgDzFwiZoAX8TWvoQ
Message-ID: <CABcZANkh422mOBj38brHMuqRuvZB82NzyW3in56pzu5EcavK-w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: serial-console: IMAGE_FEATURE, MACHINE_FEATURE or DISTRO_FEATURE?
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
X-List-Received-Date: Mon, 24 Oct 2011 18:06:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 24, 2011 at 1:27 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/10/24 Koen Kooi <koen@dominion.thruhere.net>
>>
>> Hi,
>>
>> Otavio is cleaning up systemd in meta-oe to work with his initramfs setup
>> and we stumbled onto a challenge that we'd like some more feedback on.
>>
>> The old sysvinit recipes always hardcode a serial getty into inittab,
>> systemd installs a getty@<port>.service file instead. Otavio doesn't need
>> (or want) a getty on serial in his setup, but I need (and want) it on all my
>> setups. So we agreed that it needs to be a feature :)
>>
>> I nitially suggested MACHINE_FEATURE, which Otavio implemented here:
>> http://patchwork.openembedded.org/patch/13713/
>>
>> , but I'm having second thoughs about it and am leaning toward an
>> IMAGE_FEATURE instead. Since this involves *_FEATURE and we want systemd to
>> move into oe-core eventually I'm moving the discussion from OE-devel to
>> OE-core. Not much discussion has been going on, so I hope we'll get some
>> more feedback here. I'll try to buttonhole some more OE developers at ELC
>> and report back as well.
>>
>
>
> Technically it is probably both.
> I've seen embedded systems without a console. That seems to indicate a
> machine feature.
> Then again even if you have a console you might not want to enable it (e.g.
> in order not to give the customer root access or even info wrt printk etc).
> That seems to indicate a machine feature.
> Probably the answer is inbetween: A machine feature HAS_CONSOLE or something
> like that and an image feature CONSOLE_ENABLED.

That sounds analogous to
MACHINE_FEATURES+DISTRO_FEATURES==COMBINED_FEATURES, but by image
rather than distro?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


