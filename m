Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 536CC600A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 16:56:00 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd6so986263obb.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 09:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Sb0k4LeBulKclL+VFkCWmG0TTb3qL0Nk/lkgAlzBGEo=;
	b=nKsiRm/SYXjF3x9ax2eNCWFpSsDZev8tNi3xHwZNzQC3ZcLKM8OW6oM0IxzdEOSqqE
	oZot9VyvziLuC/Mpamq3NTDf9K7gusohfhakRmAmzj7libPZMl5IPD1GdFY+IKOzua/f
	czXX2UwSHj9PC6xzCb/AM5frfryrFF8ElI9TjU2lq33FXxEaTENh75CvhfvaCDAM6DKf
	vwcDFY3GlWxRrPk/5cc9b/TF4I87eq8ZfmYFoMfgZ+KnOMkHk1Ii1E+1LaOCoMAzP3IS
	sduAX2KfyKHH3/Y7Zw/gSyYf4HduYaFmFoTif3TwYS/NdiI80o+I5cUs4io7+xCFonNP
	OLpw==
X-Gm-Message-State: ALoCoQmAwrx4wsrwD6vKmQFUkOig1F4M1JaILG2NSy631F01AH9pVYbkPMT2fdfzB8EXDx8xsOzF
X-Received: by 10.60.95.99 with SMTP id dj3mr17877oeb.94.1376499360853; Wed,
	14 Aug 2013 09:56:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.172.4 with HTTP; Wed, 14 Aug 2013 09:55:40 -0700 (PDT)
In-Reply-To: <1376495198-23621-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1376495198-23621-1-git-send-email-paul.eggleton@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 14 Aug 2013 18:55:40 +0200
Message-ID: <CAP71Wjwv6oJh2wntvN2ocJai1eLX-O3OgXBYdyASZxsRVo_w3g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dylan][PATCH] classes/terminal: fix pseudo exiting when launching devshell
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
X-List-Received-Date: Wed, 14 Aug 2013 16:56:00 -0000
Content-Type: multipart/alternative; boundary=089e012282887003f004e3eb3b75

--089e012282887003f004e3eb3b75
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 14, 2013 at 5:46 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> In dylan, since the entire bitbake process is run under pseudo,
> LD_PRELOAD is set when we collect BB_ORIGENV and thus when we construct
> the devshell environment from the latter, LD_PRELOAD is included.
> However, for a fakeroot task we explicitly run the devshell under pseudo
> (e.g. "pseudo /bin/bash"), and if LD_PRELOAD is set to preload
> libpseudo.so when pseudo is run, it seems to exit immediately without
> error. Since LD_PRELOAD shouldn't be exported anyway, exclude this from
> the environment so it doesn't prevent running the shell.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>

thanks for fixing quickly. I have tested with gnome-terminal and screen,
and it works fine.

Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

--089e012282887003f004e3eb3b75
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Wed, Aug 14, 2013 at 5:46 PM, Paul Eggleton <span dir="ltr">&lt;<a href="mailto:paul.eggleton@linux.intel.com" target="_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":20z" style="overflow:hidden">In dylan, since the entire bitbake process is run under pseudo,<br>
LD_PRELOAD is set when we collect BB_ORIGENV and thus when we construct<br>
the devshell environment from the latter, LD_PRELOAD is included.<br>
However, for a fakeroot task we explicitly run the devshell under pseudo<br>
(e.g. &quot;pseudo /bin/bash&quot;), and if LD_PRELOAD is set to preload<br>
libpseudo.so when pseudo is run, it seems to exit immediately without<br>
error. Since LD_PRELOAD shouldn&#39;t be exported anyway, exclude this from<br>
the environment so it doesn&#39;t prevent running the shell.<br>
<br>
Signed-off-by: Paul Eggleton &lt;<a href="mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt;<br></div></blockquote></div><br>thanks for fixing quickly. I have tested with gnome-terminal and screen, and it works fine.</div>

<div class="gmail_extra"><br></div><div class="gmail_extra">Tested-by: Nicolas Dechesne &lt;<a href="mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro.org</a>&gt;</div><div class="gmail_extra"><br></div><div class="gmail_extra">

<br></div></div>

--089e012282887003f004e3eb3b75--
