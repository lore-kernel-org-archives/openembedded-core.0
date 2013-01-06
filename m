Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Trvlw-0007Lw-0y
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 20:20:40 +0100
Received: by mail-ob0-f180.google.com with SMTP id wd20so16767994obb.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 11:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=9BMKLt9njfIMb30SIVrbMVqxftUTYpgxvdAPW6WttfU=;
	b=qDVl9nLOY0GDMYXz7kD3tf9nQccXWdiSc6FVW/dmbf+b7iJZJLAHBO8zcAYAmavhwx
	zhNU9/grEK61Ug0t/fKaf7qfEdhi/z5GtfZP5JdLWBZ30MivXG5juIhXdH5sFM7HjIAO
	WiJli5Se4yFi+H+L6gDl2Wsbu+Omr/6htK3G0yaCxVSsG+ptMxL9MR5Zd2v4mow1QQfW
	l9s+Yu5PNkiQs2zOMDrqnnEG0B5B7vuWvalX71myZkN59h9nX574VDpoFr0Ap4JRZ5u6
	+GPeSsehiXmsJwnUL7BPua1R2ICeLLTSsdct9EwZCDBs/6n1RE50QN6FKoNua4UQ9/9S
	+0VA==
MIME-Version: 1.0
Received: by 10.182.54.103 with SMTP id i7mr41941762obp.62.1357499131271; Sun,
	06 Jan 2013 11:05:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Sun, 6 Jan 2013 11:05:31 -0800 (PST)
In-Reply-To: <c8df96d897ecdf4fe04088aff1eba2fbfb0c004a.1357465230.git.Qi.Chen@windriver.com>
References: <cover.1357465230.git.Qi.Chen@windriver.com>
	<c8df96d897ecdf4fe04088aff1eba2fbfb0c004a.1357465230.git.Qi.Chen@windriver.com>
Date: Sun, 6 Jan 2013 17:05:31 -0200
X-Google-Sender-Auth: mmHbUDU7lETiXTykJrv6TT5kFkU
Message-ID: <CAP9ODKpQUQmBOnWHRBEcF6k3aK=-bqM0=9m+bi8DxXC7gsHzSw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V6 6/6] core-image-sato: support read-only rootfs
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
X-List-Received-Date: Sun, 06 Jan 2013 19:20:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jan 6, 2013 at 7:44 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Support read-only rootfs by providing a specific conf file for volatile storage.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

I prefer this solution than the previous one however why you don't use
a sato-volatile-conf package to provide this?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


