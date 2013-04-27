Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UWEoN-0005IA-Fi
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Apr 2013 01:45:48 +0200
Received: by mail-oa0-f47.google.com with SMTP id n9so4982671oag.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 16:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=5ZQXHrFjjtvGTZSpEcMkgPNqlUFD9IrS9CxN1FEXOLo=;
	b=z0L01YB2hYa7ln4DzovCof/eYpZL+JM1jNbrXS42MlfVL2p+UUFughZfYyJiV61k+y
	8owx+2MmKqaJBtMOBa6A8+vN7aPz+OqTKhYzCzELLChpYDqUMuluXlIaS76N+ffFw8Db
	pSmWrrexARguGXngSsxeX/GNEVnf8CC1o7nK3DX1tPU7Pdog9CTE17zcpfxu7KscsVsT
	3p8fvWAd6GgPar0DiZNJaBwCK5JF31DzKDweVYSRO3inDAhSYMxYm+YEKRzMpm0HcFc5
	VVt0KWRlo9LFg1hEGwz7i/dAikXLw33gtMSsRCOo4heFCvrM7X4e8DDa89JCtF3aVY1E
	XA+w==
MIME-Version: 1.0
X-Received: by 10.182.40.202 with SMTP id z10mr20562984obk.74.1367105279892;
	Sat, 27 Apr 2013 16:27:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Sat, 27 Apr 2013 16:27:59 -0700 (PDT)
In-Reply-To: <1367075749-6702-1-git-send-email-Martin.Jansa@gmail.com>
References: <1367075749-6702-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 27 Apr 2013 20:27:59 -0300
X-Google-Sender-Auth: 1RGQgs6KlYQiss57jtWhWDK5pSE
Message-ID: <CAP9ODKpcvnH8m75kACbaWGXPs=3d_nq5ncfMiuU91piuqrXg8g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory: change default BUILDHISTORY_DIR to TOPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 23:45:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Apr 27, 2013 at 12:15 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * like PERSISTENT_DIR I find BUILDHISTORY_DIR more persistent
>   then tmp-eglibc directory
> * WARN: people with existing checkouts in TMPDIR/buildhistory
>   need to move it to new location first (in order to save history)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I've been doing it locally all the time; thanks by sending this :-)

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


