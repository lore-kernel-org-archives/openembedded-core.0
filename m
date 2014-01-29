Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4FDD06E87E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:39:53 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id um1so1717333pbc.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 04:39:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=1DJbjXCW9lZ90qQ5tjUbD2awJjPIj3Z60mkh0ck227o=;
	b=BL4HhfLWUFogr5ElNPnQC9+XMembWTTZU/BSpBJu3kPwlBUM4DUwGP1fytlcpQyxMg
	dCFqTVsISfOiJl7Y6B0knKmzvzmWWxlklfcxJh1uq7lxaccj9ZeLGusJnfzjkUQ5H2/r
	OI6BCm64w+pyZFcx9ykD/8QG0hNBHaOCZItXjLR/LySnOWQM3cMtW0EnYEt5iMpBOckW
	0AmcLr022j4pxDfU5jEuXBMNaFtrtXaiQr8A7ceTr8IwWf2JZU252vfwa93JA6KzNG2s
	3BHKmv2wCSdG68BijdyaJcLVnB8cpNq/KwlKZiAtnJG/8cDlai7TEfM9DU9YsiwaAqVx
	vfDA==
X-Gm-Message-State: ALoCoQl0TFbjVnyHO7QAB43RBB2I7cEstj+7YmIvmegCag0ZTPmi8keVwkNU9XfVK0CBYq2mwALM
MIME-Version: 1.0
X-Received: by 10.69.31.97 with SMTP id kl1mr7801301pbd.62.1390999194201; Wed,
	29 Jan 2014 04:39:54 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.21.228 with HTTP; Wed, 29 Jan 2014 04:39:54 -0800 (PST)
In-Reply-To: <1390999042.19023.160.camel@phil-desktop.brightsign>
References: <CAOMwXhOUo7tUOdAno5-ebFxEqO9LW_C4bz1KghFfEg6_TUe40g@mail.gmail.com>
	<1390999042.19023.160.camel@phil-desktop.brightsign>
Date: Wed, 29 Jan 2014 12:39:54 +0000
X-Google-Sender-Auth: ENclq24wItCBhiSlvvx2K4hD05U
Message-ID: <CAOMwXhP4y9MrxWDQzw8D9ukvoXSL1EBD0on3byix4cKu3-RdEQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Phil Blundell <pb@pbcl.net>
Cc: daniel.elstner@kdab.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ROOT_HOME: /home/root
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
X-List-Received-Date: Wed, 29 Jan 2014 12:39:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 29, 2014 at 12:37 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Wed, 2014-01-29 at 12:32 +0000, Laszlo Papp wrote:
>> Is there any obstacle why this cannot be /root as per default Unix
>> philosophy [1]?
>
> No.  This is distro policy and you (or your DISTRO) can set it to
> anything you like.

The email is not about distributions, but the default value in Yocto
(the distribution generator itself) ...

