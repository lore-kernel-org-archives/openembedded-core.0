Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZUos-0007df-Hk
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 00:23:15 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 May 2012 15:12:55 -0700
Received: by qaeb19 with SMTP id b19so1602303qae.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 15:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=fvoIhzJIywWXLdx9xssR+8uZugY9rJ/bh4mwTZaQNNU=;
	b=hIWnqBY9fwJWg854MtrdkAv6K5Bo5qscMBPoSKokCSEucb7yiUQpGk496jFX8gls2Y
	Yhma9r8jZG2gqXNyjDd9tWp7QAQu7rRndGC4352qasdYefhgeRwX5HkaFOY3caUV8vPT
	ij2beCZgloFZIdWHCkeL5mXnJeBQWcnsgr3LBElODBzdw06g42PZ9zL1+D3/s/WbDGcl
	rXdmDRNaao/DNAvX4L+IOgLdtbfrm2IVxun57Q3PkhM/+j/ckwnYpDHn5KBsgj1j761w
	lv24GvreD1x9ydBIPgiYA/0hthqt2q/5xd3OPU/ZI8/9SFgPoDTQ0QdK81IrShzMYhIB
	M6cg==
Received: by 10.224.44.136 with SMTP id a8mr13679777qaf.34.1338329574663; Tue,
	29 May 2012 15:12:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.162.12 with HTTP; Tue, 29 May 2012 15:12:34 -0700 (PDT)
In-Reply-To: <002D9B74-3B1E-42A8-A355-BC33847EB54F@dominion.thruhere.net>
References: <cover.1338323483.git.ross.burton@intel.com>
	<41C46607-08A4-46F1-8572-3320B7FD2615@dominion.thruhere.net>
	<CAJTo0LaFHe1jGQLoNkS6MkHwsM58iLJiRXpSSEKo-UqNQwjJCA@mail.gmail.com>
	<002D9B74-3B1E-42A8-A355-BC33847EB54F@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 May 2012 23:12:34 +0100
Message-ID: <CAJTo0LazLoue3YJndWA3Jd+QyS2HBiQqWUm+o8kaZcvWQK7w7w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkGPOz/XpT7yZyKu01/yeoKcV06wTqdMFxKfYlE1K1e29I5GSyQkWUqy0f2SK5iz+1AxIUW
Subject: Re: [PATCH 0/4] Upgrade connman to 1.0
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
X-List-Received-Date: Tue, 29 May 2012 22:23:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 May 2012 22:20, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Out of the box, root can access the service. =C2=A0There is another patc=
h
>> to add "xuser" for systems which run a raw X session as that user. =C2=
=A0If
>> you're logging in with gdm to an arbitrary user, then the at_console
>> test should work, right?
>
> No, our PAM magic is still not strong enough :( And worse, serial console=
 doesn't work with at_console either.

Damn shame - totally bust access control is quite depressing.  I'll
revert that chunk and throw a large comment around it - can't have
something some suspicious without any documentation.

Hopefully without sounding like an ex-MeeGo fanboy, uxlaunch is
actually pretty useful for this.  It sets up a proper PAM login,
brings up X, and handles XDG autostart.  Might be worth looking at for
single-user environments.

Ross


