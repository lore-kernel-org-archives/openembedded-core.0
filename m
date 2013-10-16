Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0855B6C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 06:24:20 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id vb8so230631obc.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 23:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=dPutpHDTZ7s2mXeZn+kXjjr0Q1HjZ1KE6KVUCb37JnQ=;
	b=ZbDvdPqd0CXagdsNSJ8zluTzNiPLKLfDrasLbst9UXGHK4JpoLzNI91A7TxMmz7DCf
	uEhoa9iUc7g6TPWXmC+XcvHxm9gW3l/V7CD5ueT/n/VwDaINwCQQX3tr+uZgX/L6rOr0
	I9nToNs6ztpfVHhwzjto7CTwI4LA1/rF9TsqDAoE8JKp6gCjow5bDszg65HJqiyiDVqV
	oNEmVStm8aJBVpyjvNWc1aIxHcrq7+KDMP6UPL5wQnEwl1WIMUBI158CCOBnmXzL6BVY
	SP8kxXfSvNhFV55gIHYCQr/QZF9SLrqeF1vadm8vRXy0ysiUcOx7Pixl7/VVdEQND0Y7
	blDw==
MIME-Version: 1.0
X-Received: by 10.182.88.129 with SMTP id bg1mr1990351obb.36.1381904662065;
	Tue, 15 Oct 2013 23:24:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 15 Oct 2013 23:24:21 -0700 (PDT)
In-Reply-To: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
References: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
Date: Wed, 16 Oct 2013 03:24:21 -0300
X-Google-Sender-Auth: WqpgXV5mPHVWFGJbtfpv6DM8wxI
Message-ID: <CAP9ODKpm_zpo+TyFDe0TSAXHs=MvFjouPjRNE0GcE9i6Lk_7Aw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: rongqing.li@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: repeat to tar archive file five time
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
X-List-Received-Date: Wed, 16 Oct 2013 06:24:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 16, 2013 at 2:53 AM,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> [YOCTO #5287]
>
> tar failed and reported that file changed as we read it, now
> we workaround it
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>

You must be kidding right?! loop 5 times?!? why not fix the root cause
of the change?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

