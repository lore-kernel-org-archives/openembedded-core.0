Received: from mail-ob0-f170.google.com ([209.85.214.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2oY3-0005FT-FF
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:51:19 +0100
Received: by mail-ob0-f170.google.com with SMTP id wc20so591444obb.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 11:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=SRcS7GUyHUG1tEXvhe7x/eT4U/N0wy4/52sSD4AFUj0=;
	b=Y9Jgti359ZIPh4jwm4ZyDsdiLSOuP8gsg14eBc/lgnh1M2Kd5cJh08AJR/qxvNned1
	2icGHsRLeTao95y8wAc5pAtx0CqrcAteMq1qMZhOPy4laT/q8pwyy5DaPHAa+GQgaqMU
	a2YMQgyEv/aPEpzo+lBTV5JOllbOasuVv0kPQ4U25+VBmFcyXV3FT99h00FCSaNxY+qR
	zhl+x4inGnMhVEqrKZEywR0v7FxcvjaXOk6YOKHJUOHDcp+KBrnUCKxaHANNK889rsUO
	KGIibuqXoJtpv7oUIK8Br1SMfdG0wfjAxb2KLM5uUY5ATw17UJ9QThwfFXr7cIQn5vMq
	lD1A==
MIME-Version: 1.0
X-Received: by 10.60.13.65 with SMTP id f1mr4871892oec.87.1360092928810; Tue,
	05 Feb 2013 11:35:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 11:35:28 -0800 (PST)
In-Reply-To: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
References: <1360090154-26766-1-git-send-email-ftonello@cercacor.com>
Date: Tue, 5 Feb 2013 17:35:28 -0200
X-Google-Sender-Auth: NMDQ46yMYkADT6s3O-CLpDsHfG0
Message-ID: <CAP9ODKr=N93bjwodD_oEKdWVtpQo8DT1CLLCThArFMyNY2M9Bg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: eu@felipetonello.com
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: added recipe libconnman-qt
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
X-List-Received-Date: Tue, 05 Feb 2013 19:51:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 4:49 PM,  <eu@felipetonello.com> wrote:
> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>
> This recipe provides the Qt library and QML plugins for connman.
>
> Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>

For now I'd say this recipe should be in meta-oe; another thing,
please take a look in qconnman
(https://bitbucket.org/devonit/qconnman) as it has been used by us and
it had got a lot of fixes lately.

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


