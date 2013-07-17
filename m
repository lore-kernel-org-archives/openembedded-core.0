Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id 005916B205
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 18:20:39 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id f4so3006277oah.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 11:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ugjOO7OL6tJOOOm+Kh7VpQsGqpKhNLQYCat+JC30kR0=;
	b=WpbIPGB6NwY6vDa20nBGIWUS7Mc7Tnbglr4HIWj04vKOXiKeODWiVmaIt4LeFRb179
	okccacSfYgrLM36ER07dClLQY01qzZq1zqpR0u9LgO79W3O4KxMzV9r4ZjXZ+B/vq0j7
	qxNX6VrjJeHTz4qtzA7fXD4yTC1GrDuc7cpbrztclx6u9msyg0qWFDFYAs1zKzspyzfF
	9zdbveaPn8MDuHw8U8UW/SqViIEefwGAQ4fRnWrwO/W4pwocxl1JHguSbRcaABd7gzeB
	/o5XLXol3ktH+mE6UQZLW4NRbKqsPKT3FyV2yiymVMFUbr2ZXHxpmVKUmM/YGNOA/XFN
	j38A==
MIME-Version: 1.0
X-Received: by 10.182.232.225 with SMTP id tr1mr3863893obc.69.1374085240105;
	Wed, 17 Jul 2013 11:20:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Wed, 17 Jul 2013 11:20:40 -0700 (PDT)
In-Reply-To: <cc86685b4cc9374f7d80fcfd092a740671b0f3e2.1374041180.git.Qi.Chen@windriver.com>
References: <cover.1374041180.git.Qi.Chen@windriver.com>
	<cc86685b4cc9374f7d80fcfd092a740671b0f3e2.1374041180.git.Qi.Chen@windriver.com>
Date: Wed, 17 Jul 2013 15:20:40 -0300
X-Google-Sender-Auth: uzcpgCNaybN7S0Jy8GUGrjyLt90
Message-ID: <CAP9ODKpty452wpeLU+Z5KmTbXhncygJjydoOMojAWTdshKWagw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V6 2/3] useradd.bbclass: code refactor
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
X-List-Received-Date: Wed, 17 Jul 2013 18:20:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 17, 2013 at 3:08 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The basic functions have moved to useradd_base.bbclass. So this class
> only needs to inherit useradd_base.bbclass and use the functions defined
> there. The reason is to avoid code duplication with extrausers.bbclass.
>
> [YOCTO #4074]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

I think this patch (2) should be squashed onto patch 1; so it easy git
bisect in case we're trying to figure out a regression.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

