Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvmON-0002iP-P0
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 11:08:16 +0100
Received: from mail-vb0-f69.google.com ([209.85.212.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 17 Jan 2013 01:52:51 -0800
Received: by mail-vb0-f69.google.com with SMTP id ff20so3532021vbb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2013 01:52:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=WPhE9Fh/QsRI+siUXfqShATl61u3ZfLiZfbdRG64KE4=;
	b=SefPC6tR53eAaOLKY2OYkkgRgn733kp6618dOAtzxWoT4Zv8+hffGPAYXJCTnpNzIa
	CmJ3N9QNbtA9bVvX0zUNhenUg82/a0qeygaSVJz2hAng99HSfztMiG5hhNrCmunaR9xC
	9wL5CTfWX23xgdazWos03Z7vrWbr0ErzEtoN+tofJY9RSAIjcCfGo4rYWW2KKj/H9VLe
	uTRI3LEfBAT8TxN9QgJtXV505siOvDHYoQSmf+hRsvVrCEa4PKuw5EKk3LI9QZkpBBr4
	idOt1UPI5wfTK6UzVcnWoRBAL1O4FgAib0jAOXoHlOJGd+ph69qMIIbC5KKXV37xnqKV
	rcfg==
X-Received: by 10.220.151.83 with SMTP id b19mr4701597vcw.25.1358416370404;
	Thu, 17 Jan 2013 01:52:50 -0800 (PST)
X-Received: by 10.220.151.83 with SMTP id b19mr4701594vcw.25.1358416370322;
	Thu, 17 Jan 2013 01:52:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Thu, 17 Jan 2013 01:52:30 -0800 (PST)
In-Reply-To: <0392b32826d8e307a1e2d2af187979f453279001.1358406049.git.hongxu.jia@windriver.com>
References: <cover.1358406049.git.hongxu.jia@windriver.com>
	<0392b32826d8e307a1e2d2af187979f453279001.1358406049.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Jan 2013 09:52:30 +0000
Message-ID: <CAJTo0La=D3TTZBkEytV3WoYHYFZOX8Ubs3C_rGfhdMHjj6NDzg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQkkAmIXfD8RM/qNO0GEhAz7vizhnRpetTheMPIAd5vMTWlS/EhJ5eyG8h6KVpVfOqdwuTuWlUk2fVOeUCkXqwieblpqcCDDdmbHCmMuXdTBpvod/ZTydXJZqgA4ge3km86LHbryK+m1qAeSZRwE76G1gUdEEV9ae1te/JfUcxdR1wKP5coFhmJJjJ3f8Ay+6Qxvk1oM
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gtk-immodules-cache.bbclass:fix support postrm at image creation time
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
X-List-Received-Date: Thu, 17 Jan 2013 10:08:16 -0000
Content-Type: text/plain; charset=UTF-8

On 17 January 2013 07:07, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Let gtk_immodule_cache_postrm exit with ok at image creation time
>
> [YOCTO #3633]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/gtk-immodules-cache.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
> index 9ffb03b..6e1f5ef 100644
> --- a/meta/classes/gtk-immodules-cache.bbclass
> +++ b/meta/classes/gtk-immodules-cache.bbclass
> @@ -31,7 +31,7 @@ fi
>
>  gtk_immodule_cache_postrm() {
>  if [ "x$D" != "x" ]; then
> -    exit 1
> +    exit 0
>  fi
>  if [ ! -z `which gtk-query-immodules-2.0` ]; then
>      gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules

Surely you still want to run the postrm, and by exiting with 0 you're
not deferring it.  Can't this use the same logic as the postinst to
run on both build machine and target?

Ross


