Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA6C6EE45
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 04:54:04 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id ur14so5790475igb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 21:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IgM+BRkKyu6KYmFds5WQ+PXdgeliTXCgFULtLN3TbAo=;
	b=Gu1wt2mUBOU8Lo3DbSMjqAwdGc6d2YS/KrJa0vPf8ZFCsnpMfzWv5Sexp90PY4hl8B
	BrpgNLRoLOqNJc3rqB7DxMN1W4c15OJkHbquoSfY0aq7QaGmtxbkf4Edw/+BQnmUXJIF
	o1W6tOK/8ba2IrFDu1QnVhzRqcde93Slr2cSEBtP2R3PKr9jwOOQAVEqMaQ0q/l1pm+b
	KZ0N5zjlLchyP+9eppMKwtBFn2yejqCSFM7txZIVlvd04E2SI/j/yH9yOPpFUG1nqgju
	SiM99ieSGLkmN8VAUMGSrAG7YR1T3RJbTsN32Lb3ebZ8h0sYMopnvT4giVzsqrnjiaOC
	+dFg==
X-Received: by 10.42.53.10 with SMTP id l10mr46541120icg.33.1396414445691;
	Tue, 01 Apr 2014 21:54:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 1 Apr 2014 21:53:35 -0700 (PDT)
In-Reply-To: <1396344719.14790.94.camel@ted>
References: <1396343775-18753-1-git-send-email-mac@mcrowe.com>
	<1396344719.14790.94.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2014 21:53:35 -0700
Message-ID: <CAMKF1soRVjG-TPjSmwn8fqP4Gt6g1_3a2ntUw3Vm94=V8VVvdg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake-native: Depend on ncurses-native too
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
X-List-Received-Date: Wed, 02 Apr 2014 04:54:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 1, 2014 at 2:31 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> What does an ncurses enabled cmake give us that is desirable?
>

bells and whistles -  curses GUI frontend :) which I would assume we
don't use as much
if someone does please speak up

