Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 708587895F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 17:44:35 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id v16-v6so6529128vkd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 10:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lywH/JTXzt2jRAIR6B87ieyK5tklnOYMgCHI1xdpA8s=;
	b=dh/lymyA2jxZht1nOB+dhp55+81yAmH3OAM2kxcGm1T8DnkcEYq492Qj7KAO7/FTPu
	pzhM8iHLnD/RFjb7RBm3c/BjwQXgcDTlkTI396mfAeyPg+10AElbpE1/mUJSJfoGEhD8
	bcHa74YcbyOK1L1YCI9XebUypJrBGYN/TAmRcf80dUUQ+ketxJMHhFyWy3B7+1sCvyt9
	bfLSrEJBqTjdy1/QSlMx6j3+cAqgnQtw99c746A9zvjopgGNq0uH3NxWjizC0vVpOi3S
	JmCpMG6ZRZzLWwJlGZSrza184LhzSBHPRGpF3vfNseHoCXJ1O9pzgxu/nQM5TdOh7uis
	EOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lywH/JTXzt2jRAIR6B87ieyK5tklnOYMgCHI1xdpA8s=;
	b=jo6vj5XrrYNFix6g7C+Z7PKRsJNxAfOmuOOxJBFCeposRb1aPK9CNqzxmZ6ImhBkJB
	9o6ZMHTn3hwRswGoz2IhVmb3bs5xGfCAIcr0zJ2ypGw40oFKfTSL223E0yB9GDxEO/iP
	zAJ9EhybJQ6IR38DrVu6MMNAXoGrqGF6IZAuw1Ao9zPElAWKxQCbnFiE+JsBNwUO8Lz8
	2wjmJ1yNWvrKsptTTLN/mMUOdMsW8iL2fqPP5RM+Kd6DlQULy865LagUL01pvqNVn0Zi
	XEdqqmUAuqQfIXlJI3XdWuTxr4nwLjFUY98f9rym9GCGsl23eAYKSAGFV6HXjmRuZ5wQ
	fwlQ==
X-Gm-Message-State: APt69E30bfUjiXimo85FD3o2xFdFdMOnpLIbJvReymccIJA7HSmQNcx0
	v+dZBTBkAfpAPMDuZD3vrulS/91reOBJpCmjDa7xz50v
X-Google-Smtp-Source: AAOMgpdHZPGXoxZ2Jl2WxBoUmoCCgpofztbzxB8XmtlsNuvHpcMrBrNeRO7RUZD/gRFqFZsJ511UXGZzswoogp41kbs=
X-Received: by 2002:a1f:9ecd:: with SMTP id
	h196-v6mr769249vke.157.1530553476258; 
	Mon, 02 Jul 2018 10:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <1530441211-30826-1-git-send-email-alex.kiernan@gmail.com>
	<6b743d05-aa53-bb1c-f96b-f604a77d2911@topic.nl>
	<CAO5Uq5QqToYKu21=eKb7esa-Otxp3epBsn6ExB33Zm0GhUSEiA@mail.gmail.com>
In-Reply-To: <CAO5Uq5QqToYKu21=eKb7esa-Otxp3epBsn6ExB33Zm0GhUSEiA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 2 Jul 2018 18:44:25 +0100
Message-ID: <CAO5Uq5Qt9BV4gtROQrDW7+1Szs8226dPc7JnvrUszB0ZyA1LYg@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Jul 2018 17:44:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 2, 2018 at 4:06 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Mon, Jul 2, 2018 at 3:55 PM Mike Looijmans <mike.looijmans@topic.nl> wrote:
> >
> > The sftp-server runs fine using dropbear as SSH backend, I'd expect the same
> > to be true for the client. Isn't that the case, and will the sftp client only
> > work with openssh's ssh?
> >
>
> Interesting question... I hadn't realised dropbear didn't have an sftp
> client, but it's clearly a supported combination:
>
> https://github.com/mkj/dropbear/blob/1656db9e58e7e8188e4ca27ae4892b14949c56a5/dbclient.1#L159
>
> I'll amend the patch so it depends on ssh not ${PN}-ssh since both
> dropbear and openssh provide that.
>

Hmm... only that gets you this warning:

NOTE: Multiple providers are available for runtime ssh (dropbear, openssh)
Consider defining a PREFERRED_RPROVIDER entry to match ssh

If you've not set it, which feels like a pretty poor upgrade
experience; I'm not sure how best to deal with that.

> > On 01-07-18 12:33, Alex Kiernan wrote:
> > > Add missing dependency on the ssh binary for the sftp client to avoid
> > > failure at runtime if it's not been installed through another dependency
> > > chain.
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >
> > >   meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> > > index b3da5f6..d147f43 100644
> > > --- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> > > +++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> > > @@ -146,6 +146,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
> > >
> > >   RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> > >   RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> > > +RDEPENDS_${PN}-sftp += "${PN}-ssh"
> > >   RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
> > >
> > >   RPROVIDES_${PN}-ssh = "ssh"
> > >
> >
> >
> >
> > Kind regards,
> >
> > Mike Looijmans
> > System Expert
> >
> > TOPIC Products
> > Materiaalweg 4, NL-5681 RJ Best
> > Postbus 440, NL-5680 AK Best
> > Telefoon: +31 (0) 499 33 69 79
> > E-mail: mike.looijmans@topicproducts.com
> > Website: www.topicproducts.com
> >
> > Please consider the environment before printing this e-mail
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Alex Kiernan



-- 
Alex Kiernan

