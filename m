Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 66A376E934
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 00:23:10 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id 79so35492981ykr.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2014 16:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=0WW4yJR0nBsXXL9ndiUOfSVnUFASNr6trYd5diVBIC8=;
	b=tHZjzV4DlYHH69yQMuQKaEtPJaNyf+sWdEknZXAkvLmayh0FvzaOfrT3/W+sgLrj3y
	KcIMuqJtdaPMpu26XnEh5MVKgw9+0iQ0DTzUafW+7CqMBgGrklvGFrRRovFAjOVsmYRr
	DJIepaSnEwPEp9h9WbFORmhWtOAJnKVnNDvD87yVdF7qT7lXwAHWjwXMuykaoV/0lRG8
	hpftwBjPdEyJepAAlBMZ+JtxTEb3sJF8ZuGgrbFN4972GeGIXAI6SYVkpRCR28nSkLQ4
	AFvLKWMrwHURF62cjUhxcCaLcy2JK8hpWqF1TewIXk86v9TbDqUPmWRLbeNC5316FaxX
	/K5Q==
MIME-Version: 1.0
X-Received: by 10.236.190.100 with SMTP id d64mr1414703yhn.76.1391386990820;
	Sun, 02 Feb 2014 16:23:10 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.62.84 with HTTP; Sun, 2 Feb 2014 16:23:10 -0800 (PST)
In-Reply-To: <1391208456-23049-2-git-send-email-trevor.woerner@linaro.org>
References: <1391208456-23049-1-git-send-email-trevor.woerner@linaro.org>
	<1391208456-23049-2-git-send-email-trevor.woerner@linaro.org>
Date: Sun, 2 Feb 2014 22:23:10 -0200
X-Google-Sender-Auth: KWHzZjeBE0U9LAd_qtt1Ln-e8bo
Message-ID: <CAP9ODKrULmq0BdYtPYqug34dReOfqtntFky_W2m4EKjLvVgb4g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: patches@linaro.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] scripts: add get_maintainer script
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
X-List-Received-Date: Mon, 03 Feb 2014 00:23:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Trevor,

On Fri, Jan 31, 2014 at 8:47 PM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> Add the Linux kernel's "get_maintainer.pl" script so it is available for use
> with OE/Yocto layers. This script departs from the Linux kernel's version in a
> couple of minor ways:
>
>         - here there is no "penguin_chief", just an "oe_chief"
>         - it is very hard to determine if the user is located at the top of a
>           valid OE/Yocto layer or not (i.e. some layers have 'conf/local.conf'
>           files, but sometimes (e.g. openembedded-core the top-level
>           directory is a placeholder and the "real" layers are below)
>           therefore don't try to make this determination; the only
>           requirement is that there be a ".git" directory
>         - not all layers (yet!) contain a "MAINTAINERS" file, therefore be
>           able to work without one
>         - add all the patch tags specified in
>           http://www.linuxfoundation.org/content/54-patch-formatting
>         - remove Linux kernel-specific wording/references
>
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>

I like to idea and I second this pull request, the only thing I would
like to see added is the possibility of grabing the maintainers for
boards from the machine .conf file. This is the way we're using at
meta-fsl-arm and meta-fsl-arm-extra. What do you think?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

