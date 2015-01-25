Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 56ACA718E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 19:48:28 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id 29so2145532yhl.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Jan 2015 11:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Fvam227Jz6NzHcdz/ZLpJCM1O4jsyEcNcwJUHYgHKBo=;
	b=p9TacsZ7hcm3oY5cq/mgHVUE4MpAVKSdUD3EuwJ7EC5Z6Pbkjj8Z9Ng3MbnlTnSzw8
	dXjNaEFcDyyshPdiXbYZsAQzAaS06AN/wRHuWl6GXG9TNqrD+lnOrZIeb6b+sZhO1Oo/
	hpkrev4/nXtGyJiS+VzSZYv4BjfIXh48DX8qof+akZBtq1AD/5cyh3SHakN+TraFZkO5
	akFF3U3hJsIS0/2CTmsJMTq4MeDUVs3m9YgLsoAqxZlmxGE9ZAavmU74DGzwQrcKmgKz
	/JBWMAPqG1Ao2xv8hyWLSoNQFvcUDR5ptvkcDr2Zh1m9RTDAZUCMNK9GwwZJa7/IS4af
	U88A==
MIME-Version: 1.0
X-Received: by 10.236.44.70 with SMTP id m46mr7949663yhb.136.1422215309199;
	Sun, 25 Jan 2015 11:48:29 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Sun, 25 Jan 2015 11:48:29 -0800 (PST)
In-Reply-To: <1422200019-19095-1-git-send-email-max.krummenacher@toradex.com>
References: <1422200019-19095-1-git-send-email-max.krummenacher@toradex.com>
Date: Sun, 25 Jan 2015 17:48:29 -0200
X-Google-Sender-Auth: hwQalEJJ_kFrAM2B4q2jReqFRqI
Message-ID: <CAP9ODKrJaK++-fdbqx-6ynH9p4ETeh-Cqes8MthkjRM-ixc4aw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch 0/2] udev: fix ptest to not influence qemu
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
X-List-Received-Date: Sun, 25 Jan 2015 19:48:29 -0000
Content-Type: text/plain; charset=UTF-8

Hello Max,

On Sun, Jan 25, 2015 at 1:33 PM, Max Krummenacher <max.oss.09@gmail.com> wrote:
...
> On a OE setup configured to build ptest packages udev's ptest test files are
> staged to the sysroot.
> A run of qemu chockes on this test files and never returns.
...

This fixes a hard to debug issue in meta-java as it ended triggering a
QEMU which never ends and is eventually killed by Linux kernel by
consuming all available memory in the system.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

