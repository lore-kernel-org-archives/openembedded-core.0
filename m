Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 20D4F7D3AC;
	Thu, 20 Jun 2019 20:18:41 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id i21so3909133ljj.3;
	Thu, 20 Jun 2019 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hWlQX3XchbWVQ85uoMBTEFSGtXq3HNn94T6eiwBgWRQ=;
	b=CiG/bWw8JOKe+TI2lfqCAQCTfPGztwc2pOGDOYsRb2O7J1BrpCE4zNhtCDDfI3v5SJ
	MzTVenvd4x+Qv6UaG7Ibye8phpBDLdMa6bxGz1eCVRupDBHRitHiOAhHckc+SCQv0lx8
	xIVJfNLZZHCBzbfg7NwdK5NYXNUq5Y29z8BvsUL0L8noiBUveMGqQDLUfD6a9I6KCsJQ
	KZZgDDGKhiYvZ+owFO/2CBUNscyIqSyyUYW4qJvhOeyPy7XF+iZVoOU/KvYEJL3ZLXSS
	B5zTCIQKp68+4gIQ56WRFEeCaFuO3CnqN9zL3uJmSVm4crHobZjymif7ECbmUxUPcyRz
	LFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hWlQX3XchbWVQ85uoMBTEFSGtXq3HNn94T6eiwBgWRQ=;
	b=WPpeBfm7EIifjtvmUSdF91Us2sbXY7jBiUA0pPwmc/DtzzN6hBYrxreg7Abnz9FsRl
	YQ5V2ypMhyXV01V7UNI4f46ARTE6a6ueYvSEGCOPVkSfVQFXqa0AZDLRlTJHQWJtaTLw
	FPZO/QZqv12qyzO1uVsOlhQBh8pQ8n8q7/6YAk0XGyXwXpvoD4JUquSwMotv5Uc1zzIk
	Khj/XuINuYCelm3lNW6kEapEaCHOumDdXZHrooFABhKsvuG9hAzgPqn7DTR3S4O/MYD7
	CiUkaxTouKduNINvzyoWR1/ccP4zyeo75+tIsZ3nHSw+PqJtToQ3z3azlrqzrTNmWwk9
	Ce/g==
X-Gm-Message-State: APjAAAViu+2FlHWarmdnyWx7epTF7KMmrT8oB8xRR6BH2i1Q6TbGCnXC
	bdknH0FbAc9639B06xu9YjK0Q1vSpt7zwXTbPpA=
X-Google-Smtp-Source: APXvYqwo9ZXNNBgf/Y+YRpyr/NeaMETE++2GNkqA6btGVfjfN1G+eXFzvwaqdlkcfPs1SR7TMK/DVto9U5U7DYd77Fk=
X-Received: by 2002:a2e:98f:: with SMTP id 137mr22857733ljj.232.1561061922506; 
	Thu, 20 Jun 2019 13:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <156085389271.26327.12531071352385707940@git.openembedded.org>
	<20190618103133.9022A2342C2@git.openembedded.org>
	<CA+chaQdFSThk4NPhTQt05V1pw8sd-uKZDCnePh9eBuNPL8EDJA@mail.gmail.com>
	<CADkTA4O3RJ+vmf9Yao_2Hsc=yZuaP9uFhxxT_5gPR2UK6TBD0g@mail.gmail.com>
In-Reply-To: <CADkTA4O3RJ+vmf9Yao_2Hsc=yZuaP9uFhxxT_5gPR2UK6TBD0g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Jun 2019 16:18:31 -0400
Message-ID: <CADkTA4Of-gaZLJGUnC+Oz+d+QvGt1-rm34qEs=7nAKHLjLqJOQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 09/30: linux-yocto/5.0: update to v5.0.19
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
X-List-Received-Date: Thu, 20 Jun 2019 20:18:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2019 at 4:17 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Thu, Jun 20, 2019 at 3:19 PM Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >
> > Hi,
> >
> >
> > One of these recent updates is causing following WARNING:
>
> It is this one:

or I should have said, I *should* be that change ... But either way,
I'm pulling together a new patch.

Bruce

>
> ------
> commit 70a30872bd93cc058b05d9cf2b4f9334658629ee
> Author: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
> Date:   Thu Jun 13 22:32:41 2019 -0500
>
>     linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES
>
>     util-linux ptest requires the scsi_debug module to perform eject/moun=
t
>     tests. This will conditionally add scsi_debug module when ptest is in
>     DISTRO_FEATURES.
>
>     This doesn't include linux-yocto-tiny because the resulting image wil=
l
>     be too big and do_image would complain about this.
>
>     [YOCTO #13301]
>
>     Signed-off-by: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -----
>
> Khem pointed it out the other day, and I have a WIP patch that should
> address it shortly.
>
> Bruce
>
> >
> > ---------- CONFIG_SCSI_DEBUG -----------------
>
--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

