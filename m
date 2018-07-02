Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 05AE478816
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 15:06:43 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id r18-v6so10234059ual.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 08:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nUE1HmDghZdU2kZkglYHXNrN3q/oclyVfVI7idM9zlw=;
	b=W4tL6QP7pdlQChZUEDOLO/OTYvY69EOJ8t3vcbXPScD52ZYae9qKiO+j//buzA0iTy
	yDfnnf4Pbk93cvCAn/g5t0iF9MvLAYenR8V8nGivhI8amnbQ33MhI5jTEZ0IbkoN4Z/N
	2vUa5vR9zpffc1r696gcvkoFH3PWcFv37hmsIA9K68VUwNkwX6SG4WLLvAySHIbW7WRr
	FeLGj3aLSNnn3sfIuz0T1JdNmVNrzQ19RxCM3QzCP5+UaTA8oSLw/Bea8jqzSt3FHPTy
	VWFolztRvg1IHI0+Y1OgU9EjAigAGnmQrnYdOF5lCvtIg4HUCtLCBFvcIYMvxBJ0o8Gg
	KXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nUE1HmDghZdU2kZkglYHXNrN3q/oclyVfVI7idM9zlw=;
	b=igEld9KYVq8CW397tsW5JG7oUons2byhOFry04SS/8FrstU9vERQ3rV8v4vNXthFPl
	MAgixzoRA3U+sp/FHemZE6ERq3D8n8x8pIVcjpLWUzbUbBdjnyY2bch7bqxmBnAsCJH1
	/IIUAGOk1RBkGaN37+SoS4PdVjfVWSkSqzuHyR0iq7SR+rh40scg79nN7YfqeQZFd+AK
	r5xohp/9fzbw+xULkMnFX/8SNIaMBjvEu32iTv6V+/TPG/RvXIDBoc4z8bPp3GtdooP/
	tcKrNX/H2hzSSalBNd8j8CeGyYb5+g9Zebyw/SPo7Lg5XWGiQp+DmyOKGPlcruHfpMK+
	Q1Gg==
X-Gm-Message-State: APt69E3K9us2whpaexMq5FCiOFCxMH9RDhCQg6UKzdOdh79yG4AQ3G7+
	LngHxhLMvMgDfL0HJbZ8fADFBiSRAXn6x9su9dY=
X-Google-Smtp-Source: AAOMgpcW0103RPWhpYkXfLxHZCQw66MFE0USA4KJeROBjKvskvnRvEOLmOZiyKJaOVypFSvQy1uuld2kA/IBCSkbfRI=
X-Received: by 2002:ab0:474a:: with SMTP id
	i10-v6mr16013198uac.11.1530544004909; 
	Mon, 02 Jul 2018 08:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <1530441211-30826-1-git-send-email-alex.kiernan@gmail.com>
	<6b743d05-aa53-bb1c-f96b-f604a77d2911@topic.nl>
In-Reply-To: <6b743d05-aa53-bb1c-f96b-f604a77d2911@topic.nl>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 2 Jul 2018 16:06:33 +0100
Message-ID: <CAO5Uq5QqToYKu21=eKb7esa-Otxp3epBsn6ExB33Zm0GhUSEiA@mail.gmail.com>
To: mike.looijmans@topic.nl
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: Add dependency on ssh for sftp
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
X-List-Received-Date: Mon, 02 Jul 2018 15:06:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 2, 2018 at 3:55 PM Mike Looijmans <mike.looijmans@topic.nl> wrote:
>
> The sftp-server runs fine using dropbear as SSH backend, I'd expect the same
> to be true for the client. Isn't that the case, and will the sftp client only
> work with openssh's ssh?
>

Interesting question... I hadn't realised dropbear didn't have an sftp
client, but it's clearly a supported combination:

https://github.com/mkj/dropbear/blob/1656db9e58e7e8188e4ca27ae4892b14949c56a5/dbclient.1#L159

I'll amend the patch so it depends on ssh not ${PN}-ssh since both
dropbear and openssh provide that.

> On 01-07-18 12:33, Alex Kiernan wrote:
> > Add missing dependency on the ssh binary for the sftp client to avoid
> > failure at runtime if it's not been installed through another dependency
> > chain.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >   meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> > index b3da5f6..d147f43 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> > @@ -146,6 +146,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
> >
> >   RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> >   RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> > +RDEPENDS_${PN}-sftp += "${PN}-ssh"
> >   RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
> >
> >   RPROVIDES_${PN}-ssh = "ssh"
> >
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Alex Kiernan

