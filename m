Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id EEBBC65D58
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 20:13:57 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 131so4480078ykp.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 13:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=IBRGE2geZJLIuBOaUZyzC+yr6Mvl6uNMNdgk+3Od6sw=;
	b=bG5cDm1ecpn68cPRE9SEYClEnTJy9I+0/P+LH99neSswAmh59NdrqQF60K0ka3AYDB
	zsC7KTUyrL9QqxwzFQKxNJqIEK70i8SzcpVhOGvQJpMjaeWnyoCJm23BUD8RFkd0jFN7
	kzIwwVg6fyCRrPLag/I8Pb24LEH8/0adkgMq5tHTPSxNBacVFayo1cDEHcTengYhK+Wq
	kt02kg84J06lZv8uuI59f9n5punQv0xz1B+HOuCQq9y1qRwesp8YGzpTU2wq2ijolTSE
	OtK+pZP0YLeHXjJ3OAB1/0FqRjMpIV9NuPXgU1fYkG5ZyzR9VVIH4vI38eJDrByL76hH
	aLdw==
MIME-Version: 1.0
X-Received: by 10.236.216.16 with SMTP id f16mr42036577yhp.90.1407183238666;
	Mon, 04 Aug 2014 13:13:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 13:13:58 -0700 (PDT)
In-Reply-To: <1407122473-16439-1-git-send-email-b50113@freescale.com>
References: <1407122473-16439-1-git-send-email-b50113@freescale.com>
Date: Mon, 4 Aug 2014 17:13:58 -0300
X-Google-Sender-Auth: A6zctV0KhkiR_HgnEfpYqO-tH0c
Message-ID: <CAP9ODKryswhzdY8LeEk+5eAiXPotcw1MSXOXmsCvZ_SGiznKcw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Wang Zidan <b50113@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] alsa-lib: fix hw_ptr exceed the boundary
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
X-List-Received-Date: Mon, 04 Aug 2014 20:14:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 12:21 AM, Wang Zidan <b50113@freescale.com> wrote:
> For long time test case, the hw_ptr will exceed the boundary, then cause
> the avail size wrong.
>
> Signed-off-by: Wang Zidan <b50113@freescale.com>



Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

