Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 70AC765E1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 13:57:12 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id q200so984969ykb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 06:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=YqC55nVyC2f8+r7fHN+4y8VidLAhUy3mVdy2cvmwFRA=;
	b=w7YOOuR9OeNeWVYbZ08s2ZcZtfm6UGWIL2h1SvVu0UwOTTqdt0UVBaCceFYGghoiUV
	I1ReOzjeZ5gWamw6HdEPtf1UU7HSALKlQeGLY0fV7eYk/24bXy1MICtPEy2AvMR4raQU
	S22Qm0xU0DdqXFsMJc9ZHzJlwKujQZb0k8LD/LkIjiUy2jCppl9fxputP1BFj7ji4OO5
	WSRXhSSLbFvCQjCZo02nheoxuQJxMQIQgGSMo+5oeB+A989fCCW/Ldtbag2Vd7bz6Nng
	ErDmR6hBvi7LsE+2AbYnnLQUSC2nV3W6vVA1rB1S6GIEdsa0XNemSS50xgOzUxRTZDmE
	hmRQ==
MIME-Version: 1.0
X-Received: by 10.236.134.74 with SMTP id r50mr16289599yhi.2.1402581433679;
	Thu, 12 Jun 2014 06:57:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Thu, 12 Jun 2014 06:57:13 -0700 (PDT)
In-Reply-To: <37280175766b34129a22d2602f057511e90263b1.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
	<37280175766b34129a22d2602f057511e90263b1.1402552609.git.sgw@linux.intel.com>
Date: Thu, 12 Jun 2014 10:57:13 -0300
X-Google-Sender-Auth: BPHglAr_LQwc2bABSUJwTRjv7l8
Message-ID: <CAP9ODKobCoJiCmLZ+-JwoZB8hBZdTSn0jX0bbmgFtosWXVJ2WQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC - WIP v2 01/10] conf-files: New recipe to create single recipe for config files
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
X-List-Received-Date: Thu, 12 Jun 2014 13:57:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 12, 2014 at 2:56 AM, Saul Wold <sgw@linux.intel.com> wrote:
> This recipe will create 1 package for config files, we could optionally add
> a bbclass file to ensure consistency with RRECOMMENDS_ = =conf
>
> This is a work in progress, the do_install might even beable to automagically
> generated.  We don't want to create a bbclass for these since it will cause
> the actual recipe/packaging to become machine specific, using this recipe will
> ioslate that.
>
> [YOCTO #4011]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

I think the configuration file, nowadays, already made those machine
specific in every BSP which has those overriden so I don't see why use
a single recipe to provide several configuration files.

I think it will be confusing and this recipe will fast grow.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

