Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id C8B8B6B8D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 12:13:16 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id c41so294190yho.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=jxVNEEjylN3ZrdVnxWZxCMzRuSw6WIfsa8og2KWf65I=;
	b=YCPNgYM2PwBVMvzHcFlByJA3Gv2+3Bt+PevS0IjVvFAc54nE3vN5cxL/mYgl+Y3UTX
	1PmzxjfbdHP6fRpl0hO4JudZZ8frRooV2E+d6F9BpNMGl+dSjfMbTEF6UIWuK+01+aad
	N4IbRT+GqLO7AULivUdogA29sJ+TJP6zd7K8kOyyCgB46gkyWmrgwFtm+Nfitbrdmj5+
	NGocPLfbQbyCP8rXx705FjAd1EPMFF2ymoNXFStXiNIY6HpXXsty82CFuV7s+Vftvje9
	AJjjt/uIrVVh1usCRTUE4HYvagJ3rb9HQ8Wg67ti94HOuVIrLMIwyyOrX99kp7tWLuC3
	cAlA==
MIME-Version: 1.0
X-Received: by 10.236.96.201 with SMTP id r49mr97442197yhf.33.1395749596927;
	Tue, 25 Mar 2014 05:13:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 25 Mar 2014 05:13:16 -0700 (PDT)
In-Reply-To: <1395743793.24890.21.camel@ted>
References: <1395743793.24890.21.camel@ted>
Date: Tue, 25 Mar 2014 09:13:16 -0300
X-Google-Sender-Auth: 3rAg_P4cL-YnhbQ1690CfACkjvI
Message-ID: <CAP9ODKr4icx=rWteGJ_o9zA2Czkn8ZOjMOAqmT3LwxJY79VZKw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Add fixes for binutils issue 16428
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
X-List-Received-Date: Tue, 25 Mar 2014 12:13:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Mar 25, 2014 at 7:36 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> "ld:i386 crashes with -static -fPIE -pie"
> https://bugs.launchpad.net/ubuntu/+source/binutils/+bug/1266492
>
> This adds in two upstream binutils fixes to avoid the internal error
> triggered by the combination of -static with -pie on x86 builds. This
> triggers a backtrace which then triggers a bug in glibc where the process
> ends up hanging on some systems with broken libcs.
>
> We can't fix the libc but we can stop the internal error and hence
> avoid the hanging builds.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +     file://fix-pr16428a.patch \
> +     file://fix-pr16428b.patch \

Please add the Upstream-Status field in the two patch  files stating
this is a 'Backport'.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

