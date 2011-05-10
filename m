Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QJnbb-00064F-Lh
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:08:07 +0200
Received: by gwb11 with SMTP id 11so2340293gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=RspvxwC/QZjMNI/ZkR0p2+NfO6gZuugIAj8mWaj0p+Y=;
	b=XDlCSNvVAlaFG9bsBg7p7Y7rWA7ukVAeA3D+Kz5+OpER1SnPU3hp93aH09I3UU51X/
	VfOTEFgyro7ersGeKCLoJK87sanrcJEbdHuCxUQfAY7AshKinzsCnt8T5T72M33qdXD2
	BF0V/OiX9sd88/xRqNd3B0mDkeTncbti7Q4Tw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DNlJyCFnsp0qs+rlgwwKUfObLywMrlYxDwPjjA5+9jLr398IDETmGmkwAWCz8sW4KM
	gpMxiJ64YAjdx15yp5MB3pu4mzIA3wKSySFYNrv0Ca/56XZd8fVb5YK1qwd/l44yMS3F
	ixNxvcZ5VA8wQj9k6ZLhPi6CQlHnovZoonx3Y=
MIME-Version: 1.0
Received: by 10.90.149.3 with SMTP id w3mr6820668agd.20.1305036318181; Tue, 10
	May 2011 07:05:18 -0700 (PDT)
Received: by 10.90.32.18 with HTTP; Tue, 10 May 2011 07:05:18 -0700 (PDT)
In-Reply-To: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
Date: Tue, 10 May 2011 16:05:18 +0200
Message-ID: <BANLkTim0hVFjUd+8j5jTR5dv7TwSMk=4qA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Tue, 10 May 2011 14:08:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/10 Richard Purdie <richard.purdie@linuxfoundation.org>

> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> As discussed, we want to make OE-Core usable with no distro set. This patch
> series
> makes some big steps towards that goal. I'd be interested in feedback on
> whether it
> does the right things and would be usable by others.
>
> The key is the inclusion of a distro/defaultsetup.conf file by bitbake.conf
> and
> in turn this pulls in a variety of other common include files which can
> likely be
> shared. Any point of this cycle can be overridden by another layer so its
> totally
> customisable. I'd encourage users to use the pieces they can where possible
> so we
> all share best practises but obviously people have choice.
>
> I did dump a load of "default" variables into default-distrovars.inc, I'm
> not
> calling that file finished, I just had to draw the line somewhere and start
> a
> discussion about this :)
>
> Also, I'm aware there are still a few poky-* files in
> meta/conf/distro/include.
> Some of these can just be deleted, others renamed tcmode-* and I'll take
> care
> of that. I'll also delete the poky.conf file since it no longer contains
> anything
> required to make OE-Core build as far as I know (wider testing needed).
>
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>  Branch: rpurdie/distro
>  Browse:
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/distro
>

THere is something wrong with git.
If I browse to the 2nd url I get:
Bad object id: rpurdie/distro
going to git and navigating to the branch gives the same result.

 Anyway, although I am not able to review the changes on git, a thumbs up
for the initiative.

Frans

