Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD0B705FC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 14:28:45 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 200so2189993ykr.36
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Lm2jfCgsU76wg/NJwmm+7yP0XTz0qBkKJjuVaFHoNsU=;
	b=Vtke9aelRhLnd9Q33fNMQEZJ2Y9V69nKVuIFaw8QnwMLThqtxxILnxWjVhNmm+mOaC
	Kyn6QX7tFBdn/0k6xY73QO937bFYsbt22ZaSjryW9u0xg5J/GAllwCZNUwOti2ZCyIZy
	tL7plAa4secxVXXKZ4jhd5JXIRv9y28I96/tp/yABhiPihjAashDBS+Z6c+ZjkFBOnsh
	k3CTASTdYRX5Yh8yQCyWJzwAPOzxEeoNi9pXWVwyDthu9jf+PINdHKGyk3VYdHMTJVGp
	zoKA9fXVM1Mm7DvqI34v3BoW26pK+j0pbtAeB8zuOONzKhLZrAQGKcGIul9oJwSQCn+2
	sebA==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr24090050yhk.6.1409408926495; Sat,
	30 Aug 2014 07:28:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Sat, 30 Aug 2014 07:28:46 -0700 (PDT)
In-Reply-To: <5401A47F.7060702@windriver.com>
References: <1409268800-17566-1-git-send-email-otavio@ossystems.com.br>
	<5401A47F.7060702@windriver.com>
Date: Sat, 30 Aug 2014 11:28:46 -0300
X-Google-Sender-Auth: eaxam34dKbG6ujoNAYZyu2aCDfg
Message-ID: <CAP9ODKrRZYYTMr=Oopbv9qXDgUs90zrHn8xoR36nqwBmq_eEjA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libpam: Fix runtime providers
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
X-List-Received-Date: Sat, 30 Aug 2014 14:28:49 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 30, 2014 at 7:16 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> I've sent a patch to fix the warning like:
>
> WARNING: QA Issue: lib32-pam-plugin-access rdepends on
> lib32-lib32-libpam-suffix, but it isn't a build dependency? [build-deps]
> WARNING: QA Issue: lib32-pam-plugin-cracklib rdepends on
> lib32-lib32-libpam-suffix, but it isn't a build dependency? [build-deps]
>
> WARNING: QA Issue: nativesdk-pam-plugin-access rdepends on
> nativesdk-nativesdk-libpam-suffix, but it isn't a build dependency?
> [build-deps]
> WARNING: QA Issue: nativesdk-pam-plugin-cracklib rdepends on
> nativesdk-nativesdk-libpam-suffix, but it isn't a build dependency?
> [build-deps]

Great; it applies fine on top of my previous patch.

Tested-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

