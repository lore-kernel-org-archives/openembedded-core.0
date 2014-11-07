Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8506017E;
	Fri,  7 Nov 2014 11:47:28 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id q200so2197053ykb.5
	for <multiple recipients>; Fri, 07 Nov 2014 03:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=8hsDPybhAFiPe1p9jKI1OMKtsJOnjpTP/dv0gxLwYNQ=;
	b=k8k1f2FMN9/58qH7F/8WPUSoqliYVuSBOloPRVYo4+AIMetaTEKLG9Pp1VxlydB1qh
	FpWl3NJj1AIysicq5/Jcl08wdGbNcwyZzbRKQ4kdm8yQW3mzSqxqdDKXJxY9ImxmMB96
	Z1Sf8Xw27qQiBFCaQdR6B8VCsX4iscJx9gD8bUI5szQd/mqWY1RG2QE4GJHZyHa10Fc+
	XHCXkCZnsHdrB7PCM6tU/hHLO96CJMapRIKSHkZuaJ52GK5Cw2k+KKv3X2uvK66mverT
	Kd7RlHGfEFT+cgzDdzQjVJE5LckjJuH06qZTO0tsx7ui1LK6rDoHT2blNev8iUL5OQzg
	nhbw==
MIME-Version: 1.0
X-Received: by 10.170.59.195 with SMTP id b186mr2702313ykb.30.1415360848881;
	Fri, 07 Nov 2014 03:47:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Fri, 7 Nov 2014 03:47:28 -0800 (PST)
In-Reply-To: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
Date: Fri, 7 Nov 2014 09:47:28 -0200
X-Google-Sender-Auth: zw9Dd8OcW-hINhmpKB4QKtdS4jk
Message-ID: <CAP9ODKrDn-FjOh1nT9j5krPBYvK5G4xpEVBfumxHybW2tP5UMQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Moving llvm to oe-core?
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
X-List-Received-Date: Fri, 07 Nov 2014 11:47:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 6, 2014 at 3:42 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi,
>
> So I think it's fair to say that neither GCC nor LLVM are going away anytime
> soon, both having their respective niches.  Because of this I'm wondering if
> we should be adding LLVM to oe-core (taking the meta-oe recipes).  GCC will
> still be the cross-compiler used but LLVM will be available out of the box,
> for example the Gallium LLVM-based Mesa drivers can be enabled without
> requiring meta-oe.
>
> Anyone have thoughts/comments/objections?

I agree; I think it is a valuable addition and worth having it as it
is indeed becoming more and more commonly used.

Besides, having it enabled in our autobuilders will also greatly
improve code quality as LLVM is sometimes more picky than GCC. In
Debian the exercise of rebuilding the whole archive using LLVM has
been very useful and has identified several code issues which has been
(or are in the process of being) fixed. Also to add on that, I think
the sooner it is done the better so we can solve issues early on the
release cycle.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

