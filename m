Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id A8DB26EA2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 14:33:24 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 10so6167476ykt.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=W5+/0/M809QqpFCz+qCmska6euDjbeiUhE/jOIfnPt4=;
	b=HY7Ywz17A6uDwoa+xjaF2IKU+Gw+yasaN+JwN1eDzIcttdY90VFYqqAvUw4nrPQj32
	a7zbBEqq8IhUndZWHrTU1VyIe7AEpOJctfePxT71LTRXowfbQV4igII03drcpJriy92l
	uWaWBep8EDh6CKvvbVxaTOqcLADyMmbGijndGK/3gCNBuDjQrr8yAV4JsvSzV/UTkr6s
	Rs/RimdMNATRtSIFRDdBRjqK/B6WEZjwqXgMsW2rkeX8NgThl2f3r61jq29Yx29wYTBk
	n+bL5shQQREqA5rEL4AlVIBG1BZWJ1QZBJ7gAa4Q5tYNHFIqUYTejagcZMIHQdfFv5hA
	xHAQ==
MIME-Version: 1.0
X-Received: by 10.236.110.77 with SMTP id t53mr36252257yhg.78.1396276405128;
	Mon, 31 Mar 2014 07:33:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 31 Mar 2014 07:33:25 -0700 (PDT)
In-Reply-To: <1396275649-32352-2-git-send-email-kai.kang@windriver.com>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
	<1396275649-32352-2-git-send-email-kai.kang@windriver.com>
Date: Mon, 31 Mar 2014 11:33:25 -0300
X-Google-Sender-Auth: PjdIrA0LtZ3rjuFYRr10Lz3ynao
Message-ID: <CAP9ODKrDjcJLEyBJ8pFA3CDEh=mjnLzr+-pT3iXo9pcKdEAMRw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Kai Kang <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Mon, 31 Mar 2014 14:33:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 31, 2014 at 11:20 AM, Kai Kang <kai.kang@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> When native package is built, use the uname to return the kernel version.
>
> When target is built, read kernel version from ${STAGING_KERNEL_DIR}/kernel-abiversion
> to avoid to use the hardcode kernel version.
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>

This makes it depends on virtual/kernel and it vary from one machine to another.

Am I missing anything here?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

