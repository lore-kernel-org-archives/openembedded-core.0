Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2547D279
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 21:49:12 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id x61so16037626edc.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=M77lJH+uAv57mrSUQBACt8LLhs2eBe96YpeQT2DABio=;
	b=a1XZhrvkooHz+kKH5Q0sEQoijNu0FUsaOnD7xJBlx1krIEMsEqo3KW01+CPe1pD4hE
	1qFEkhaZzzg7kaohDmHRFvn2qmVzlM48K8KZv1IfxYGKozoVksCuyXvF0/Dz3F31VBTi
	BSK5Fjrz115JnF17ufhl0PzBOkyJAaBODYepBqUN6ilXFh11NJZjh50lxaHDFQ7NEV0O
	QwZeP1wnWzdBndk7YSpTQuKcs3mxCKhbzt3w8kCaflzM2a4Neb9jazUtuJ5r3XfGHDV1
	T6Hcg+/l0Z+rat4ksfE3TKrE++cy948Q/GIWeEGJUnDAQoP7C3VIVolrjsFnKoWqmY9J
	fwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=M77lJH+uAv57mrSUQBACt8LLhs2eBe96YpeQT2DABio=;
	b=roXDGAI78JCI5p2kznEapln+4jdXhdGeVnjoH8kxZtaYul/uZdhe3NMISykM3CPv3s
	DXlSvSnsv8So9jDmf/9h7efuXWZFlXEqRilj1JEMZVwAMGtICZH63IG7lKJBPHKlOeIl
	LnRTCVxgrXUuBwQQZlQQYhUPd8MIHNj/mHzwHLjBDphYDO0G6xoRq6qaDjvC9DLOghXW
	EL0ataB100hGErCqeW0EYfBsvG+pUzVKqsGHQTB1JZnIZsqcifXtFtnbomOW67XtjHuL
	fmYAp/szT+bT4FEimGuKUmsiTVJFVbDRbZes2Xo3C9hI086BviGUga1puFkjUaac5CwK
	j5CA==
X-Gm-Message-State: APjAAAWltPsJcjJ8NQ+BmhaJGZHYxp9lbJW3gUtbCUkE8wst16RbGkAT
	dGxDb+Ls3MmSlR+uSop81rc=
X-Google-Smtp-Source: APXvYqyGLiplvVJtnwsKZBrMHQ1zpYY8uBR0wtPpmdjImxF+ZzXHyJKrtiKrKfsCpejbYGHM2C7nNQ==
X-Received: by 2002:a17:906:6051:: with SMTP id
	p17mr41369253ejj.243.1555364953199; 
	Mon, 15 Apr 2019 14:49:13 -0700 (PDT)
Received: from localhost.localdomain (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	h11sm8926205eds.44.2019.04.15.14.49.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Apr 2019 14:49:12 -0700 (PDT)
Message-ID: <e00ca43559ee1f9a8c18d275a6c8370bf5d9bc00.camel@gmail.com>
From: adrian.freihofer@gmail.com
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 23:49:10 +0200
In-Reply-To: <411ab935-ee8f-a6d3-e8f3-d6814eb7b1d4@windriver.com>
References: <20190414132414.18547-1-adrian.freihofer@gmail.com>
	<411ab935-ee8f-a6d3-e8f3-d6814eb7b1d4@windriver.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/3] systemd: remove 2 obsolete useradds
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
X-List-Received-Date: Mon, 15 Apr 2019 21:49:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-15 at 09:40 +0800, ChenQi wrote:
> On 04/14/2019 09:24 PM, Adrian Freihofer wrote:
> > - Users systemd-journal-remote and systemd-journal-upload are not
> > used by
> 
> I guess you mean 'systemd-journal-gateway'?
You are right. I will send a V2 if I can convince you of this change
after all. 
> Anyway, I have some concern about this change.
> 
> Adding these users is not supposed to cause any runtime problem, as
> if 
> the user has already exists, DynamicUser mechanism just does not try
> to 
> create one.
> I also can recall the systemd-timesync once had DynamicUser=yes, but 
> then removed such setting.
> So if there is no compelling reason (security?) why we should use 
> DynamicUser, let's leave these two users there.
> 
> Best Regards,
> Chen Qi
I agree with you, it works as it is. That's a strong argument.

However, traditional Unix user IDs are not ideal for embedded systems.
Especially with an image based firmware update and daemons writing to
persistent storage, traditional Unix user IDs are problematic.
With useradd-staticids enabled this problem can be addressed. But we
have to maintain static user IDs manually.
With this patch applied systemd would just generate the user IDs in any
case (static or dynamic users) without manual interaction.
Here we have the chance to get rid of two user IDs, which seems to me
to be an advantage anyway.

Another, weaker argument: Static user IDs are a rare ressource.

Are you still against this change or should I send V2 with fixed commit
comment of this third patch?

Best Regards,
Adrian
> 
> >    systemd anymore. Systemd creates dynamic users for services
> > without
> >    persistent data.
> > - Fix start of journal-remote
> > 
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> > ---
> >   meta/recipes-core/systemd/systemd_241.bb | 6 +-----
> >   1 file changed, 1 insertion(+), 5 deletions(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_241.bb
> > b/meta/recipes-core/systemd/systemd_241.bb
> > index 3a58f44a3b..8e493d5b55 100644
> > --- a/meta/recipes-core/systemd/systemd_241.bb
> > +++ b/meta/recipes-core/systemd/systemd_241.bb
> > @@ -334,9 +334,7 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKA
> > GECONFIG', 'binfmt', '${PN}-binfm
> >   SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
> >   
> >   USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
> > -                    ${@bb.utils.contains('PACKAGECONFIG',
> > 'microhttpd', '${PN}-journal-gateway', '', d)} \
> >                       ${@bb.utils.contains('PACKAGECONFIG',
> > 'microhttpd', '${PN}-journal-remote', '', d)} \
> > -                    ${@bb.utils.contains('PACKAGECONFIG',
> > 'journal-upload', '${PN}-journal-upload', '', d)} \
> >   "
> >   GROUPADD_PARAM_${PN} = "-r systemd-journal"
> >   USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
> > 'coredump', '--system -d / -M --shell /bin/nologin systemd-
> > coredump;', '', d)}"
> > @@ -345,9 +343,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('P
> > ACKAGECONFIG', 'polkit', '--syste
> >   USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
> > 'resolved', '--system -d / -M --shell /bin/nologin systemd-
> > resolve;', '', d)}"
> >   USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
> > 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-
> > timesync;', '', d)}"
> >   USERADD_PARAM_${PN}-extra-utils = "--system -d / -M --shell
> > /bin/nologin systemd-bus-proxy"
> > -USERADD_PARAM_${PN}-journal-gateway = "--system -d / -M --shell
> > /bin/nologin systemd-journal-gateway"
> >   USERADD_PARAM_${PN}-journal-remote = "--system -d / -M --shell
> > /bin/nologin systemd-journal-remote"
> > -USERADD_PARAM_${PN}-journal-upload = "--system -d / -M --shell
> > /bin/nologin systemd-journal-upload"
> >   
> >   FILES_${PN}-analyze = "${bindir}/systemd-analyze"
> >   
> > @@ -401,7 +397,7 @@ FILES_${PN}-journal-remote =
> > "${rootlibexecdir}/systemd/systemd-journal-remote \
> >                                 ${systemd_system_unitdir}/systemd-
> > journal-remote.service \
> >                                 ${systemd_system_unitdir}/systemd-
> > journal-remote.socket \
> >                                "
> > -SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
> > +SYSTEMD_SERVICE_${PN}-journal-remote = "systemd-journal-
> > remote.socket"
> >   
> >   
> >   FILES_${PN}-container = "${sysconfdir}/dbus-
> > 1/system.d/org.freedesktop.import1.conf \
> 
> 


