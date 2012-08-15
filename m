Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1T1eLT-00007I-Mm
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 16:13:15 +0200
Received: by yenm1 with SMTP id m1so1955727yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=NatvpnDvOMpqBdrNbEq/XJKrLwZgpVT1wJ4uRKdUHus=;
	b=xSoiaoY85Ci2k6y+2ZusjMzbhb39e398kHS9EPubMkn7svmkkGZrVi1Npztyj8cqS0
	87Lo2ULJdiW+PK+nNd8sSGltzUAvyUEBjEkG1dscXMmV8SO5aNTOH5V6ODG/vPUXHHaO
	81MykNHVPEzajbxExpU5rwcSyDFDdgAsbT49SH3sGAtLXn+x07KOmcviNIWVyishLgGp
	p24JbgQNk9nf50r8upd3qepTYnNDbq++VR2E3zFLuCWLiD/GE8QKHwrKf70+XzxtFlzO
	Zoaei4iy9vzBJ7BjmwKQ+S2XEEDOHjnZEXJsFEvU+K14yuar4UbM1ErBDx32RjCcg8lf
	Mnkg==
MIME-Version: 1.0
Received: by 10.66.75.74 with SMTP id a10mr32399851paw.46.1345039278798; Wed,
	15 Aug 2012 07:01:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Wed, 15 Aug 2012 07:01:18 -0700 (PDT)
In-Reply-To: <1345000125-3865-1-git-send-email-b19537@freescale.com>
References: <1345000125-3865-1-git-send-email-b19537@freescale.com>
Date: Wed, 15 Aug 2012 11:01:18 -0300
X-Google-Sender-Auth: OEVB4c3PbAdGwu7-P0CPpBjfViU
Message-ID: <CAP9ODKqQtpxv9xLMGObBy6bpEYLgwmZj9HcURSZ+ms9_vUndyg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: udev: update rcS to auto-detect hostname
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2012 14:13:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 15, 2012 at 12:08 AM,  <b19537@freescale.com> wrote:
> +#       Update the hostname according to actual board type
> +#
> +echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" "[a-z]"` > /etc/hostname
> +
> +#
>  #      Trap CTRL-C &c only in this shell so we can interrupt subprocesses.

This seems to fit well to a BSP init script; seems to be very machine
specific so it doesn't seem to be supported by other arch and
machines.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


