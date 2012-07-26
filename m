Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SuVXK-0004wH-78
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 23:23:58 +0200
Received: from mail-yx0-f180.google.com ([209.85.213.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 14:12:25 -0700
Received: by yenq6 with SMTP id q6so2233383yen.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=lWV0Rzo21jOnlk9bU2YTFm3HY9FX564yCa1nPE1hpv4=;
	b=JRaBNlGUUDhTdzcBpXT/7EYB8m5bU+hEIx7lbFcUONSGBkbTMU1xGh0k9toPzYiaAA
	tl3YUtaZNbmpkDz+4Y0AjMaTlLeYN2W4B0hZ4GtToVOavbCeo/UDcKDU+AIgK5EeU8Gr
	rdxeaNNzh58RpYDwWc1mPZFb9P26TuX9oFHw35kXrpPmxkXGYo6ehKlKipR7x4RDOJql
	auiDzwTlKujzLfpqLM2iAwozoqNjYKY9am+z/33Kne3ScvwG8FzT5SNGFk8gJFr+TF5F
	x46aTl32Rg9vBVPv6alS1bQjaOC7p6pPGqtvA++AoJxL3lAiYS8Uhm8z8789/W85HXoB
	/3xQ==
Received: by 10.43.92.71 with SMTP id bp7mr81233icc.52.1343337143843; Thu, 26
	Jul 2012 14:12:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Thu, 26 Jul 2012 14:12:01 -0700 (PDT)
In-Reply-To: <lyipdavezy.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<lyipdavezy.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jul 2012 22:12:01 +0100
Message-ID: <CAJTo0LZKHiL75khHuircKy7Xv0aVW29DJjGaCSxXh+K1p6F1oQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn6yCI57y1TIfDX98BSe3tJVeRSLVYewVlF+wpYFRouq2aSuguUhFvNEQllA+XCzgyBWgJH
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 21:23:58 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2012 14:17, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> Radu Moisan <radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
>
>> Followed suggestions from Bugz 2261:
>>
>> 1) remove the --with-x/--without-x configure arguments.
>
> why? They are valid ./configure options and common when evaluating the
> x11 distro-feature.  Selecting them explicitly makes the build more
> predictable and detects configuration errors earlier.
>
> Sense of '--without-x' was disabling of x11 dependency, but not turning
> off the x11-autolaunch feature.

That's my fault, and I can't remember my reasoning.  Probably best to
bring it back so the recipe is explicit.

Radu, bring back this fragment, but correct the options

EXTRA_OECONF_X = "${@base_contains('DISTRO_FEATURES', 'x11',
'--enable-x11-autolaunch', '--disable-x11-autolaunch', d)}"

Ross


