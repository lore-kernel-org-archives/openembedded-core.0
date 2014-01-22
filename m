Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8186E786
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:53:17 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id i4so536896oah.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=yeJ37shl0LAU4sHzrxyRDO9Q8N6Q7hW19Vu2dfPhzbk=;
	b=0S30pZkiSe7EUhSobVzUXznrUMJogvfzJdeUPbbuOorLDlzjGxa8admP1p0DJ4kg4f
	0fehuX5EIlt2Np266qsG+cHmU1Nn1GYoqmgzYUJqkyHyxqk6VjMs57ztq6X5Z+N/2bsB
	5ZgCrdXLpfm1mDCDvqFlouL0LMriAzhqJVGDpzj14xNzUI6WsDGl54Gf2s+vH8WJ9rX9
	13uXH4+JqzC2RH5u9tE4GHFxcGcPuJSyCXRt7KpzYwfGH5W6tVQgyzalRC+g9gK8Ir/1
	lnJxRo2argH/qwzewfw3wmHEtl3OHsk9YYbhhudpXuTG/QY4wfkuCw+AABe50yYFlX/e
	n9cw==
MIME-Version: 1.0
X-Received: by 10.60.98.40 with SMTP id ef8mr1591434oeb.13.1390402398406; Wed,
	22 Jan 2014 06:53:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:53:18 -0800 (PST)
In-Reply-To: <1390395885-5078-1-git-send-email-david.nystrom@enea.com>
References: <1390395885-5078-1-git-send-email-david.nystrom@enea.com>
Date: Wed, 22 Jan 2014 12:53:18 -0200
X-Google-Sender-Auth: -RZrqgXayhzct62HkkZlizqFmSA
Message-ID: <CAP9ODKrKYdn-cTfX=yiz5GKhLBBrVk4Dk8vsiCjibXKpZhrw2w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Wed, 22 Jan 2014 14:53:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 11:04 AM, David Nystr=F6m
<david.c.nystrom@gmail.com> wrote:
> Adding ability to use postinstalls intercepts in the nativesdk env, and
> making sure the correlate between repo + SDK.
>
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>

Can you extend the commit log a little bit to explain the reasoning behind =
this?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

