Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1046274FAF;
	Thu, 10 May 2018 14:34:17 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id y72-v6so3306157lfd.2;
	Thu, 10 May 2018 07:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N+xWefNE2its/7uM3ZIfmnpzFJQP/JxBS+jOCZJcryw=;
	b=VM29aR91/Y0ij8Wf0w4LXQDfV5J/rxHeKK1Mz+VHpT7cHz0n7ovXCCta6/6AUtPP2d
	uKj/kcjGZPRUGxxbtIvUfAFBbK7P9H2PasUjCRWF2A5tdSQiMc21p/tp+JOEu1O6s3l4
	jwdCIIhdXCcM4GSl/5ouXlBZWoCXosdkbuKsQ0XD4iF7oWyPMLzeZr8myyCTJDIkXz9r
	4Timy6jfvlsRTU+ikg008IvFT7ykpfT5iMacaOKlh35KfE7YdAe8wpoEa9A207ZklOWz
	fXVRP8Hv0eHl2ljmMq+OxgYUoVHSa0WccF3UDlOYsQLx9dnZdFsBQJbz1vm1PzjA1JTy
	M11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N+xWefNE2its/7uM3ZIfmnpzFJQP/JxBS+jOCZJcryw=;
	b=KLT6LL5H6/fqiH+4t/FAU/CfdUFe13YK5myEzca4QmeGhhdrUri13kpsbEp5iy/I6V
	KJPNo3gQHZGyI5Hel5RrVttW/h2gqzRaGYN3wKRqKTfi/fse6GIbxxrPRZxL4+uw5MW3
	BD8e8H+HkRE8s2XoqssfUdm2+yCl5aeNMHIxv9Me3q2CvdvME/n++LCwZ00RrDXotuzR
	1+Vyn7FMPdchzn8LXLVHS5/494+ohVXQ634mRE0mlbk3PQz0fn+hIUrP1HsOkPLj/Nqh
	docgwg/zg1K0c78snQ4fl4472ajstkKtUtw9KXSmJoQDB9W62Xb7tDBHr9ARkohhkoP3
	oX3w==
X-Gm-Message-State: ALKqPwcQwHiewTMJvN8XbpMtjUhFY5lgR/9lWRLtqjAFE/Ax7IhsqvmR
	9MW69Uw7jg5dIRIFxydEZQv15HDzdgCDV90FnGA=
X-Google-Smtp-Source: AB8JxZr75pkYHXE0NO/52OMSgdgqgppk++bp+4eGEzTUR0sU129uxqYV7kd+BVfYMSmcnGuid15S2ABCAyLGLDGBmgk=
X-Received: by 2002:a19:8e53:: with SMTP id
	q80-v6mr1231860lfd.140.1525962858289; 
	Thu, 10 May 2018 07:34:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:380e:0:0:0:0:0 with HTTP; Thu, 10 May 2018 07:34:17
	-0700 (PDT)
In-Reply-To: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 10 May 2018 08:34:17 -0600
Message-ID: <CACS+7ZR6F1PgKxQxxh=iJzTQNmrrMVOQ01EuhcnotSAhB=AiEA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Thu, 10 May 2018 14:34:18 -0000
Content-Type: text/plain; charset="UTF-8"

On 4 May 2018 at 18:26, Khem Raj <raj.khem@gmail.com> wrote:
> Hi All
>
> As you might have noticed that gcc 8.1 was released this week, I am
> calling out for some testing help on testing branch so we can weed out
> issues you might see in your setups. so if you have your
> builders idling over weekend, then you know what they can do this weekend :)
>

Thanks for this. The only two issues I noticed are that the
Wandboard's kernel doesn't compile with gcc 8.1, and gcc-sanitizers
now throws a packaging error on (at least) x86_64.
${libdir}/liblsan_preinit.o is a new file that should go into
liblsan-dev.

> Highlighted changes are
>
> https://gcc.gnu.org/gcc-8/changes.html
>
> and porting doc is
>
> https://gcc.gnu.org/gcc-8/porting_to.html
>
> The branch is here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>
> Its uptodate on top of current master oe-core
>
> May fourth be with you !!
>
> Cheers!
>
> -Khem
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

