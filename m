Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id AB49165D58
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 19:30:17 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id c41so4622106yho.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 12:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=nACt+S+DuC/5CP9QSu7RPdVFmOgGjOdXmVVwpk4sJEA=;
	b=kPsB3gdWy30crZixn6HWLsL8rFvRL/U2W+d6NLx+xkDTDq8Yv8s7cJ7JveifJLuEI8
	NihxIWX3IEuqv3+31ERp/hfRhBQHPc2apLMpPSV3ez1POxQ8zJDQ1yQkl9lxYzYcOPKT
	AJDIct55thL2+MtOqTzUBHbfTmUozcdhmQU5En/11kjCCeECtK4HnGOhfyXJHiUzqn9X
	XNPJWzbemoDcaXSVcWYE+ezKK5va7hK/DI/+Jkkecg+cksve7wpWCsxK6nfgW82is1Xu
	yamu3tYXJ2KX7PC6Eu3hWWdJdDirA0r75ps2FuSHhOB8vrU2gYAXA3xz+IXmdbk8iaOZ
	ATpg==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr40045898yhk.6.1407180618994; Mon,
	04 Aug 2014 12:30:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 4 Aug 2014 12:30:18 -0700 (PDT)
In-Reply-To: <fc01be5e8f383a4507faab858274548624ecfc8a.1407177403.git.ben.shelton@ni.com>
References: <cover.1407177403.git.ben.shelton@ni.com>
	<fc01be5e8f383a4507faab858274548624ecfc8a.1407177403.git.ben.shelton@ni.com>
Date: Mon, 4 Aug 2014 16:30:18 -0300
X-Google-Sender-Auth: 1nrgZpAZDebvnGr69Lc01dbsG94
Message-ID: <CAP9ODKomNXPe0PCPd=igbua=7VEU5y8Ti+Q5aJX7NE2SmaEPGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ben Shelton <ben.shelton@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/20] udev-cache: choose a more descriptive cache filename
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
X-List-Received-Date: Mon, 04 Aug 2014 19:30:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 4, 2014 at 3:40 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
>
> "/etc/dev.tar.gz" doesn't adequately imply that udev-cache
> maintains it. Instead, call it "/etc/udev-cache.tar.gz".
>
> Natinst-Rally-ID: TA44427
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Natinst-ReviewBoard-ID: 58620
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

