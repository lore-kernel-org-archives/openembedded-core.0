Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
	[209.85.222.48])
	by mail.openembedded.org (Postfix) with ESMTP id 45DF078DD3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 01:37:30 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id o11-v6so6805729uak.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 18:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0erCoH5VnVupgCquxV9eqv276JkkHslf34YrAefFkW4=;
	b=J6fhDxCRbgG0wOWOY5/BWA9Mu1u3mLW6A8c3sAJzbeveKE2NmGyLqdY7o0FOBQBKE6
	1FsNPFSDtjQBrS2YQFqrHjqStm5tpFxtuBmFkii94tEMKG+p/+keMcozyUrkVh5P7lZT
	uqCibTkJVbzHjHx5YC9hC9J81B/t4wnnGYR+jMf9ntCMG8UqrtzTjEmjHrfJXD9RWiCc
	byzfU7bxLBOfi/czk6Fgr+BSNWfKnsypbGrgiCaeLgOMXecsqQlAIjfJ5sV9AfH1mMDV
	xqoeofhDL240r7XocUoJ5aqNDXGxX5rE7qZBEbtWVCJd5RJ8FHcZz7ldB/Ly34Xp+Ly6
	NC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0erCoH5VnVupgCquxV9eqv276JkkHslf34YrAefFkW4=;
	b=OWRUHoB0DEj3oRiR+DtCtUqGcble8b2bc8Acx8xHyHRrb1DnfR4qd3GT/U+WQRTPz/
	EOZsVSkv51GOaSzBxFjFHHe9R9nQeEU5MJQeqtksBwvjCC0ErR1HOuv9MGnbg4pRgUdT
	nhmbcBCVJnbyhMdjGQcTh1z/BYC5g6kHIIU7gpQgYsjxzUCiqbR96ZFDJ7bTrthjvJmJ
	/mEq3po/nIOTPploFS81mJT/1nBGjpvMgdgJkA4gO4nHR18y6aVXR1+4h3iIYjMnLE2Q
	84ImQwxI49fqdhjI/3HGSsjEA5aeBG8RM1yUt9G+BbpfSiwI7JekbWyPuz1AxVUgtHrQ
	JBbw==
X-Gm-Message-State: AOUpUlGupV+PuDmH4Ns17ZxzwJ3UQBDSxZM4jSiakmzmvRogyfSRIJJr
	mDXFyiiHdBKutZKRuBJzMYgQMWr8joOAMNHcW8J1vbIG
X-Google-Smtp-Source: AA+uWPzDkNsCJQW4+xxNnkanmQWuWigj4DubFa0pz2Mj+1fsGUpCHGWjPP3/UeKmN+M0BtnUoOUjpcCASZU1/lvQkS0=
X-Received: by 2002:ab0:5c0c:: with SMTP id
	q12-v6mr24509708uaf.134.1534556247970; 
	Fri, 17 Aug 2018 18:37:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Fri, 17 Aug 2018 18:37:27 -0700 (PDT)
In-Reply-To: <20180817225811.53b55f2d@jawa>
References: <20180817225811.53b55f2d@jawa>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 17 Aug 2018 18:37:27 -0700
Message-ID: <CAJ86T=W0-O_Puxr6rvR0SdCTptzEq7MXAFnArmtA=zvVrqcM4A@mail.gmail.com>
To: Lukasz Majewski <lukma@denx.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Question regarding docker and sumo
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
X-List-Received-Date: Sat, 18 Aug 2018 01:37:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 17, 2018 at 1:58 PM, Lukasz Majewski <lukma@denx.de> wrote:
> Dear All,
>
> I do port yocto/OE from 2.3 to 2.5.1
>
> For packagegroups-foo-common I do see following error
>
> cd <workdir>/packagegroup-foo-common/1.0-r0/sstate-build-package/
>
> as expected, there are needed directories: package packages-split
> pkgdata
>
> The problem is in sstate_create_package () at
> poky/meta/classes/sstate.bbclass
>
> To be precise in:
> tar: tar -czf temporary.tgz.XXXXXXX package packages-split pkgdata
>
> tar (child): gzip: Cannot exec: Invalid argument

It looks like tar tries to run gzip but the exec call returns "Invalid
argument". According to the execve manpage, that means:

  EINVAL The new process image file has the appropriate permission and
has a recognized executable binary format, but the system does not
support execution of a file with this format.

So, first find which gzip binary tar will use (ie check PATH) and then
try to figure out why that gzip binary can't be executed.

> tar (child): Error is not recoverable: exiting now
>
>
> Tar version tar (GNU tar) 1.28 (the same for both versions on host).
> Also 'env' command shows 'unlimited' size for pipes.
>
>
> ls -alh <install>/poky/build-lwn/tmp/hosttools and there is a link
> tar -> /bin/tar
>
> The sumo runs inside docker container (with recommended ubuntu). The
> only change is from pyro to sumo.
>
>
> To be even more strange - the sumo version of BSP builds correctly when
> run natively on Debian 9
>
>
> The problem seems to be with sumo and docker.
>
> | rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =
> 0 | write(4, "packages-split/packagegroup-lwn-"..., 10240) = -1 EPIPE
> (Broken pipe) | --- SIGPIPE {si_signo=SIGPIPE, si_code=SI_USER,
> si_pid=15063, si_uid=1000} --- | +++ killed by SIGPIPE
> +++
>
> Any idea on how to solve (or debug) this issue further? Apparently
> something is closing the pipe between tar and gzip...
>
> Thanks in advance for any hints :-)
>
>
> Best regards,
>
> Lukasz Majewski
>
> --
>
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

