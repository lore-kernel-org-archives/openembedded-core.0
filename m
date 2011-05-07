Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcgO-0007mF-RD
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 10:16:12 +0200
Received: by ewy5 with SMTP id 5so1168518ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 01:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=mKrExUMJbx8Z7egPu4zuIH2fi/hoVaMeDP0U8DzDOSo=;
	b=t99xwSfgzGm+IUglBQwZXWIW5WLf0+SjaHiodkPXKIh4N1ywd4AjmDfFO7QaJZdxpI
	dIWpTPxnpz4sE3o6dHHmrKGDJ1cVlKJhUEMWDA4QxaZeZtOi7jKX0zR8kRras1wp3cw4
	GlYzWIMRvYDjbt3PlID9C6P3iQQDQJzvi1Pjg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=wHLdPb0Fgu1Xfu798+6pmmnsKpbpkt+yKOBzlsJmEK7vocIoiesdEBTwZl1gaknc2g
	cm+jOgcbd3AxpbsqxAcKX0Ro0zLVrjl81xNHqMwvZODsf7eHafCuIbEZfxFEbEVsJBoI
	e+LuEfFopxJodTJEJNiU4X0yD0n02AxQ1dE6o=
Received: by 10.14.8.210 with SMTP id 58mr2309931eer.112.1304756011275; Sat,
	07 May 2011 01:13:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Sat, 7 May 2011 01:13:01 -0700 (PDT)
In-Reply-To: <1304755709.30391.187.camel@rex>
References: <1304755709.30391.187.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 May 2011 01:13:01 -0700
Message-ID: <BANLkTi=x2xuJaGGNSq4eT5Cp2wVW0NnhBA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Unable to push to the repository?
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
X-List-Received-Date: Sat, 07 May 2011 08:16:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 7, 2011 at 1:08 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Hi,
>
> It seems something on the server was broken and I'm unable to push to the=
 repository:
>
> $ git push origin master:master
> Counting objects: 9, done.
> Delta compression using up to 2 threads.
> Compressing objects: 100% (5/5), done.
> Writing objects: 100% (5/5), 490 bytes, done.
> Total 5 (delta 4), reused 0 (delta 0)
> remote: sed: can't read ./description: No such file or directory
> remote: *** Project description file hasn't been set
> remote: error: hook declined to update refs/heads/master
> To ssh://git@git.openembedded.org/openembedded-core
> =C2=A0! [remote rejected] master -> master (hook declined)
> error: failed to push some refs to 'ssh://git@git.openembedded.org/openem=
bedded-core'
>
> Any ideas what's wrong?

hmmm I added ml hooks but they are same as classic oe so it should
have worked but let me see.

>
> Cheers,
>
> Richard
>
>


