Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 819246A5AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 14:28:57 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id db10so4577652veb.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 07:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=hDAgBlF7XKz1hMmBWediqszzln6zcjyfwOq+I60fFK8=;
	b=AqwygD4DxLDlP3EOD1LcuEG9KhpIzCgxDIstXB7qAeTgZdoi++PreIwl8HcE/cMdJ4
	DQXFM5BMATQGaYi9zulwBekS5yTMlsXHU46hJ4mhBWehn7q4vh5d3+RRmUwsS6q3Lfd1
	TyFnzxkDgEeAAAyXSeulgAQgZK4KnvqtOYcO0a3MiOt9wPPjNarf/WfzULkTIAA6U9Ax
	OJrjM881d295a7SqFQVJ1TqMmbn/JIY/3F1ooClmPGcF2vy6Bh5WB9pQ22RxClWZWcu6
	PP7StvPg9gpRGLStCH7QaPGzFUdtjzUnqNfstKJgi6TZUVLSlgy03RE16rBrv8vOz/oV
	sH3g==
X-Received: by 10.220.42.147 with SMTP id s19mr16471579vce.46.1373380136810;
	Tue, 09 Jul 2013 07:28:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 9 Jul 2013 07:28:36 -0700 (PDT)
In-Reply-To: <4fe4ce970df0fa607fb3325b88b247be1ebbb93a.1372483117.git.hongxu.jia@windriver.com>
References: <cover.1372483117.git.hongxu.jia@windriver.com>
	<4fe4ce970df0fa607fb3325b88b247be1ebbb93a.1372483117.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2013 15:28:36 +0100
Message-ID: <CAJTo0LaKmUY3=Am0=eUVAkrmB0pD0_=iFPxhwu1APQSYHEzsjg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQmXRZWmyj6JJ/M+uycts+CZ05WEU2QdtXpLUu1aY0tMaeBdVOf6sM6HDhinpZqi6Ut9HpED
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] qt-mobility: fix build in the absence of xvideo
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
X-List-Received-Date: Tue, 09 Jul 2013 14:28:58 -0000
Content-Type: text/plain; charset=UTF-8

On 2 July 2013 03:16, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> QMake pro files don't explicitly define QT_NO_XVIDEO if the
> configuration lacks xvideo, but plugins code relies on this define.

You just described a clear and obvious bug in the build system...

> +Upstream-Status: Inappropriate [configuration]

...so why is this inappropriate to send upstream?

Ross

