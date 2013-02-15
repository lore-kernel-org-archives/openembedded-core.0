Received: from mail-ob0-f178.google.com ([209.85.214.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U6QZT-0001xP-9T
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 20:03:57 +0100
Received: by mail-ob0-f178.google.com with SMTP id wd20so3948090obb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 10:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=+3iViNgPQ5UoeoNPPFIwBs2UAI+x76ZcbsOAOewgmYE=;
	b=AEjH9u1MrVd58zT6YZQ9z2VAiZ5fih5EOpJt3vuDO6t2fs5i7fSWow6RPil5eAu9kZ
	SzHOgI/DmhxCkYgB/pMfyvZSgodwl3JCDubxcvNE12WmGgHMw3q92y61DVnzoR/bMnca
	YjQ8HA2cpiP79hVpQW/fv/gwsR0hvRWtSt4DrZYhsDg1+NBuW/jKYJKs3Cw1gUco9m32
	D/NjxvSw4Ey7eo6tsKAkq4MW/bDJItTiqKMUQAg9YRxAyghDxOtBzTdTnke3+QF/JqDT
	v9TW2uPTzbTn7NTXuQc1hL76+Ub3AOE9lyu56AIC6JMG2k9X55xaPY8r2mNW4hf+oPZs
	Zbxw==
MIME-Version: 1.0
X-Received: by 10.182.88.103 with SMTP id bf7mr2572072obb.7.1360954057606;
	Fri, 15 Feb 2013 10:47:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Fri, 15 Feb 2013 10:47:37 -0800 (PST)
In-Reply-To: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Fri, 15 Feb 2013 16:47:37 -0200
X-Google-Sender-Auth: 9rvrmshRST-s_BN_PT2QXI0FliE
Message-ID: <CAP9ODKocKGhHrnqEsrgaiRPkw5qs5P_X0TxBJR0NnLy1cFdjJw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2013 19:04:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 15, 2013 at 4:19 PM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Hello,
>
> it would be nice when the decision to make the init manager a distribution
> feature will be reverted to the old oe-meta mechanism.
>
> Being a distribution feature means, that packages are created in such a
> way that it is impossible to split off unwanted and heavy weighted
> functionality at image creation time.
>
> E.g. on most of my systems, I create two kinds of images: a full
> featured, systemd based one and a very minimal rescue system with
> busybox and some filesystem utilities.  With recent systemd packaging
> change, the rescue image size grow up from 5.9 MiB to 27 MiB because
> systemd dependencies are hardcoded in mandatory packages.
>
> Formerly, systemd dependencies could be avoided by adding the -systemd
> packages to BAD_RECOMMENDATIONS (e.g. due to busybox-syslog ->
> busybox-syslog-systemd rrecommend).
>
> I am aware that initscripts were always part of the main package.  But
> sysvinit was very lightweighted and the extra space either negligible or
> easy to recover by removing some files in IMAGE_PREPROCESS_COMMAND.
>
> Hence my recommendation: make the init manager an image feature again
> and create -systemd and -sysv packages with the corresponding scripts.
> OpenEmbedded is still for embedded devices where size matters.
>
>
> Of course, systemd can be still a distribution feature to enable things
> like socket activation as part of PACKAGE_CONFIG.  But dependencies on
> init system packages should be RRECOMMENDS which can be overridden
> easily at image creation time.

I fully support this! I also want this flexibility back (in fact I see
no reason why it has been dropped).

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


