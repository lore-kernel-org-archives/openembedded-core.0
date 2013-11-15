Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 820406D12D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 13:29:03 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wp18so3858785obc.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 05:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Qm7iXGjDNZkDXLJx1Eo1hxD4NvwRsIT8NDvwJ7Ey2Dg=;
	b=ea/RBG2lwZ21CF8yGBNqMgSVpUs25Thd46OjROhFIuSCU8SKqwfMV3TXm1PjdXNjR3
	w0JSa/7jlF/mPN06tvEaaYWHfPjO9djT+M7DaBlAzkkMfM3TwMsV92waFRrQUqMXT2v7
	0ZQlFZ0vlU55sKnsiUUUEgFKgy3nDRda9yVK2CX6x9SHM0jiqal2RgHQnJqFKYG4xwjc
	Q4yl8kb49whf0wJzWd0cACcvCKC4un/ScZOoHTQ0z6foxG/MBufZxlXeOx7bU140qQqn
	Bm1vGK/H0RkgdGvOPCd3cScHvbYkNg7OUgKCiAjDbhRLXRRozWImG3NHicws+wZZf4A4
	EZuA==
MIME-Version: 1.0
X-Received: by 10.60.134.42 with SMTP id ph10mr1856286oeb.76.1384522144980;
	Fri, 15 Nov 2013 05:29:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 15 Nov 2013 05:29:04 -0800 (PST)
In-Reply-To: <1384480333-7671-1-git-send-email-sgw@linux.intel.com>
References: <1384480333-7671-1-git-send-email-sgw@linux.intel.com>
Date: Fri, 15 Nov 2013 11:29:04 -0200
X-Google-Sender-Auth: WdGd6_zcmbZ97viabjNmkKW6fLs
Message-ID: <CAP9ODKquaOQJRyfOU=1RXqa=G2=hPfVjh4ae=u+6kDt0-7s7PA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>, Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sysvinit: unmount the psplash lazyily
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
X-List-Received-Date: Fri, 15 Nov 2013 13:29:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 14, 2013 at 11:52 PM, Saul Wold <sgw@linux.intel.com> wrote:
> There is an race condition where psplash is not quite exited before the unmount occurs
> causing a umount: /mnt/.psplash: target is busy message to appear, it's ok to lazyily
> unmount and not get this message
>
> [YOCTO #5244]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Agreed.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Robert, please consider it to be included in dora. This is a simple
and nice bugfix.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

