Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7BfH-0006Hw-Pn
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 21:11:50 +0200
Received: by iwn10 with SMTP id 10so725263iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 12:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=R9u4VC6hI5zhzoUUAxn3mWhMtCZ7zlFX6JYa51QlRF8=;
	b=PCmKZonk3YaGgZwN9BhvL163LL699Bk+cEGuEi9UQRq7oRSJPYAZX7nR1OV2L4tHfH
	QJnq78/BPIbLfNtkOYGxM+NrpeZzXo7ZE0WBVgR4pLZ+FEiXZLs9/9dl9LTxP3r5Rc6O
	j8W4jtuMDioZ+Q2AK6fgbEA4N+1mdQJxYhClA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=UGLBItGCNb55Zyy2xv1HfYBT9GDyrDqVLRgamMgE+RYXP/TVxqjW31HS0g5a//QI+I
	0uT4BdSqNeFvb6xIT/Ft0VucFcuukr5Ye74J/fsudL7bsm6V/KUJsOpJOagmF+T0U+XR
	xZA4TYo1/aoFhPsj8j3BrMzYlVFa4gV4Q3NJ0=
Received: by 10.42.154.131 with SMTP id q3mr14897icw.465.1302030580134; Tue,
	05 Apr 2011 12:09:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.179.199 with HTTP; Tue, 5 Apr 2011 12:09:20 -0700 (PDT)
In-Reply-To: <cover.1302030219.git.chris_larson@mentor.com>
References: <cover.1302030219.git.chris_larson@mentor.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 5 Apr 2011 12:09:20 -0700
Message-ID: <BANLkTikWLN1mUiF3D6i9q0YhP3pn-29JYQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/3] Rework the devshell
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
X-List-Received-Date: Tue, 05 Apr 2011 19:11:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2011 at 12:08 PM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> - Adds a utility metaclass for maintaining class registries
> - Shifts the handling of spawning a terminal into a new 'terminal' python
> =C2=A0module
> - Automatically selects an appropriate terminal based on what you have
> =C2=A0available on your machine
> - Still allows manual selection, but in a more convenient way, and falls =
back
> =C2=A0to auto if you select an invalid or unavailable (not installed) ter=
minal
> - Improves how we spawn screen:
>
> =C2=A0- Shows a warning when spawning it, so do_devshell doesn't appear t=
o hang
> =C2=A0- Spawns a named screen session 'devshell', to avoid confusion when=
 the user
> =C2=A0 =C2=A0already has other screen sessions running
>
> Pull URL: https://github.com/kergoth/oe-core
> =C2=A0Branch: devshell
> =C2=A0Browse: https://github.com/kergoth/oe-core/commits/devshell

Note: this depends on the variable typing from the previous pull
request, forgot to add that to the cover letter.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


