Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B4ADF7452A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 21:22:03 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id s18so29852307wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 14:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wyOyKlQYJGEa+OqwdWADJEW3Xj2JgL1sDya8m24XU+g=;
	b=Xa9/Cq3U/82vB6wV6/u/QhsFybIxj2ku5bjPi68Bygnc8KjCiV4dH1NcsfQzsgToLk
	QPQUzuffLrJ2KMwVwdR8Cx06MFdlMEJ3INTu32EEPrg4PttxJaavpRZSvR02OHyFdtaH
	B1CwDffMHVFGNW8klmHyUUKrdxKr7jC447qyDuzafizC9SrgMN2YJCfWrbjU1JeB8e7h
	fpbWNaBuB/ykAUJld1nbztjS7y2zDTg8GfDpsDA5pvPo/WHcRqx2A0uq8l7aQfdKYcf8
	UAIEW9uravnFHDFxg9p05wYpnzSdKDlIWalphNFpBfYKRkMjNr+pv0yi1LJXleq26Hky
	UwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wyOyKlQYJGEa+OqwdWADJEW3Xj2JgL1sDya8m24XU+g=;
	b=oKnNhCM+rHATPNzTcUXAVVJQI8MNSerb29rcU1KKo3lryGH3rTHZMkedGpIpwyrzw5
	V7r1pelom3NZzITLCf99yiJ3EG1EY/Hp+SMrzrg7eahkg4dvhkBPwRdpRFAylZiwLTMZ
	685Kjt9Yk7ccpXlUpq17rbqg9SMbZUbyxDX99jksv12E9q4SpIMd9BpzDjGZWupLEynz
	wQRHQCObj/R3T+E+SaOaJjG/pngoG9WknsceBsjtGwYq3TehiFu1C31Az6OuaYbxq/HV
	p/MgAvHEZArk8bAUKqrcSbYb4WU+oQIEMAybV8pJQTkkmHGYvjqm5R/ulYZwXx/zPNO+
	bRBw==
X-Gm-Message-State: ALQs6tDop/NV+wvE6qxVXXtCoCeOK2VDaBLzCa3aKZYPNxUOaBDx7T81
	cDxfFneVAK+IWtr3UReqbaxjNNR05bT9e5ZfNlY=
X-Google-Smtp-Source: AIpwx48FfNb5WUHWn3KVyFe+3dfqOD9DFp9yvDKdECXCr6uwt+FCNwpobz+CATuTtPzl74SAcgcXDkyMc1SxYKFfUnk=
X-Received: by 10.28.63.148 with SMTP id m142mr11834336wma.153.1523913724179; 
	Mon, 16 Apr 2018 14:22:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.99 with HTTP; Mon, 16 Apr 2018 14:22:03 -0700 (PDT)
In-Reply-To: <1523906765-12497-1-git-send-email-liu.ming50@gmail.com>
References: <1523906765-12497-1-git-send-email-liu.ming50@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 16 Apr 2018 14:22:03 -0700
Message-ID: <CAJ86T=UWu-WB-2jLUDzP2fiM+3tyo4ecyK5PHUcEmgEyCuk4Ug@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] externalsrc.bbclass: introduce INHIBIT_SRCTREE_FILE_CHECKSUMES
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
X-List-Received-Date: Mon, 16 Apr 2018 21:22:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 16, 2018 at 12:26 PM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <liu.ming50@gmail.com>
>
> It defaults to be '0', but it allows the developers to choose not add
> file-checksums to do_compile for the entire source tree, by setting to
> '1'.
>
> We need this because we have a huge project with 100G bytes source
> files, and we do not want them to be added to file-checksums variable
> flag.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/externalsrc.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index c9f5cf7..16c6862 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -26,6 +26,7 @@
>
>  SRCTREECOVEREDTASKS ?= "do_patch do_unpack do_fetch"
>  EXTERNALSRC_SYMLINKS ?= "oe-workdir:${WORKDIR} oe-logs:${T}"
> +INHIBIT_SRCTREE_FILE_CHECKSUMES ?= "0"

Plural of CHECKSUM is CHECKSUMS (ie no 'E').

>  python () {
>      externalsrc = d.getVar('EXTERNALSRC')
> @@ -212,7 +213,7 @@ def srctree_hash_files(d, srcdir=None):
>          with open(oe_hash_file, 'w') as fobj:
>              fobj.write(sha1)
>          ret = oe_hash_file + ':True'
> -    else:
> +    elif not d.getVar('INHIBIT_SRCTREE_FILE_CHECKSUMES'):
>          ret = s_dir + '/*:True'
>      return ret
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

