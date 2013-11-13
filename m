Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 997CB6D99C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 02:24:51 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id h16so4104494oag.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 18:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=GKIq/KT9BZW6tpmGcTSOVF7kVSugFpfckzhw0BcPvYY=;
	b=svdwMUQzbq4D4P10Decd+nDFqepgQsCa7Z3gv+HHTNWo/VBgtZMxnfyB1wT4y+XMhy
	bvFwyB2s0ExB4WHqRF/0gPaKPRwRFjJguVfU/i8BZyZfH0K/xW7dL1jCrrgMYyx1i7YG
	htI2n1shSkODFh241rQJNDx5UX/7hGGjFclm8OEojmX/0kM+s3d5oKUVvVtlO+QCXXpS
	4T0xwVgbpU0yZLj9lcpcFDaDxYnv8aQuHjKLR+mNMuAgF1m9RaqpP8V+oRIMP5jfGKgi
	E12Dl3nYRw4EAlmopbfPri79/hoJ+bUhL3dud9fOlAt9/USRsnpPFT1cUy5iC5uI7LIA
	TQig==
MIME-Version: 1.0
X-Received: by 10.182.142.37 with SMTP id rt5mr9808551obb.76.1384309493166;
	Tue, 12 Nov 2013 18:24:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 12 Nov 2013 18:24:53 -0800 (PST)
In-Reply-To: <c9dd76ae9feb0069409763f3f65ae4ff2ef10634.1384305535.git.mark.hatle@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
	<c9dd76ae9feb0069409763f3f65ae4ff2ef10634.1384305535.git.mark.hatle@windriver.com>
Date: Wed, 13 Nov 2013 00:24:53 -0200
X-Google-Sender-Auth: ti76y8ojVkfD_HVrpVm1P4ZU4mU
Message-ID: <CAP9ODKpK=eqk_UCR+RQB0N4u+qv8iGTit5S2iHCeu2LJgjhrUQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] gcc: Use alternatives for the *-symlinks packages.
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
X-List-Received-Date: Wed, 13 Nov 2013 02:24:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 12, 2013 at 11:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> The various gcc related symlinks should be provided as alternatives instead
> of hard coded symlinks.  This will permit multiple toolchains on a system.
>
> Multiple toolchains could come from multilib configurations or alternative
> open source or commerical sources.
>
> Note, gccbug was skipped since it doesn't seem to be generated anymore.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Wouldn't be better to squash patches 1 and 2 so it makes a real 'logic
change'? You add code to remove in patch 2, I think the end patch
would be easier to review, no?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

