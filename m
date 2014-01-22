Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC9B6DBF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 15:47:05 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id n16so629340oag.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=zBTeLC6YkBAZ4jlgNB0ffVKB47QrWVmegSxNOXEMmOE=;
	b=OXb+kB1RBlP7Vbku98h/9cltJWoiMS71vUXljGpZUw8LqR/88ihZDQ9nfBVlFyNW68
	WgYSKIW3DCnPyLBLJk3YwfzOKrJ3IZ6YbCwuVq6XiylRiFtewpxEJKoqOYaT+dplrJUz
	8l2+M4Tka4npAiUCPRnQ+2EyqTDrp5zJevImb4gSc9qdzSlLlRtFBuGJuMos3Q96Y4G1
	8QCQeFW1adVl6NOqJ+m1R5Au2y5TN2jlZp7IvcLNG8DEAxM7hPOyACrgE8TNd6I7W17k
	HcECxjwq4NauUM94+LsqK64UWR1n27Z1HJYJV9gsgdQQJv2LIZKai5j1dUJ8xTZO01QI
	0LYw==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr1841317obc.62.1390405626360;
	Wed, 22 Jan 2014 07:47:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 07:47:06 -0800 (PST)
In-Reply-To: <1390403335-14487-1-git-send-email-david.nystrom@enea.com>
References: <1390403335-14487-1-git-send-email-david.nystrom@enea.com>
Date: Wed, 22 Jan 2014 13:47:06 -0200
X-Google-Sender-Auth: 0UajGhKsXpolbWzXBXk3wk-U2ik
Message-ID: <CAP9ODKr4WxcPVkxGMR+ZZ98b6mLbmUyr9Qs=BWe-S5HVJSn=hg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Wed, 22 Jan 2014 15:47:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 1:08 PM, David Nystr=F6m
<david.c.nystrom@gmail.com> wrote:
> Adding ability to use postinstalls intercepts in the nativesdk env, and
> making sure the correlate between repo + SDK.
>
> This to enable rootfs generation from a package repository using only a
> package repository and the toolchain tarball.
>
> See https://github.com/nysan/rootfs-sandbox for examples.
>
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>

Much better. Thanks.

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

Regarding the rootfs-sandbox, how are you intending to proper
integrate it with the toolchain?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

