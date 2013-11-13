Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id CD7246D571
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 01:33:29 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id h16so4038925oag.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 17:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=pGoRUkGdAvR3kOAoMGcX3SO3eIMRUqMBvI5tOTtbaC0=;
	b=X1CnSQzgfuQmhDsYeReZqAhBkjuDjQBOww1B28bmbvGUStlHoJjDz7ydLCZT8frqq7
	WdA3BizWpPJ15VP6llJL9BwGULU1wjJ5to+VVl2S0ux8cJ218oW/luPoL0YoGfV3GGZW
	WUKP3QQiXm8sAfb0nIjBjNRzf15hegOtEk8/6/93UWWm9XN6YWXtEiA0en1sktTysdaV
	Zlc3ZQ+w02XMNefN0w+XyGp0u07M6PU1V8CMlJXlSGI1g0EUljG2a3qQptd7MRiowjHR
	JMCQWdnyD0+lGrxVG2jDsaLvBC65ocqEqOHrett3SDYcfzR+6/K5tngks1CMDLH5K/l6
	rpfw==
MIME-Version: 1.0
X-Received: by 10.60.51.196 with SMTP id m4mr33492537oeo.1.1384306410891; Tue,
	12 Nov 2013 17:33:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 12 Nov 2013 17:33:30 -0800 (PST)
In-Reply-To: <cover.1384305535.git.mark.hatle@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
Date: Tue, 12 Nov 2013 23:33:30 -0200
X-Google-Sender-Auth: hd61FQWA5s_2stLath_8BtNKhv0
Message-ID: <CAP9ODKqR+nGjF0DbkddY26gOxKU1=-ps9rYSNzW4EjZNkZg9eA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Misc changes relating to toolchain and image gen
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
X-List-Received-Date: Wed, 13 Nov 2013 01:33:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 12, 2013 at 11:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> A few misc fixes relating to toolchain and image generation.
>
> The first two in the set simply updated gcc to remove the -symlinks package
> in favor of update-alternatives.
>
> The next fixes an issue w/ the previous binutils patch and upgrades.
>
> Next 2 update packagegroups to make revise and use the
> packagegroup-core-buildessentials.
>
> The final patch fixes an issue w/ the image generatation.  If the
> IMAGE_INSTALL contains a dependency instead of a package name, the system
> was not able to translate it into a package.  This now works properly.
>
> Note, there is a case where an unresolvable set could be determined (rare,
> but it is possible), in this case the user would need to add whatever is
> required to fix it to the IMAGE_INSTALL.  (This could happen when 2 or more
> conflicting packages all have the same provide, but none of them are in
> the IMAGE_INSTALL line.  The system will attempt to determine which to
> use, by checking if any of them are already in the IMAGE_INSTALL -- otherwise
> it chooses the first entry.  If something else implied by a packagegroup
> chooses a different version, a conflict would be generated.)

Which package backends has been tested  with those changes?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

