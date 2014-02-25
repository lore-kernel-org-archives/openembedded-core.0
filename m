Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 59F0C6F0A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 18:42:11 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id at1so722142iec.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 10:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HsHhGp32vJ3RHtLcPqSTIVweBN7Ey0ga5DuNwWnoCHw=;
	b=wt700brOi1SDJVhUpP2/3KRq9diZs8DuxTENoE8yIpLKkLja82a7dVC17j2w6QQEVP
	rvO7oGaEPKoEeIvotmy60F40QcZnAVCivf4zUjcj/558f2YzQsnHiqZsSLWBDwJw2USb
	8HyP4Q1V56FaME0akOvvn0TsGu2jwoLaDL/8zHNtUl4EATiKc5I7HcKopMi6TDVt2Ukl
	v/1Kt+0cNeZvH51rg/GgZqANs+Prnb8E8KCFroChqmrsDc4rs1od7U+bMCQ397JjYi26
	m/bTaAnrbPVODYiFQi2sLfyiBZMuzlEpdr7W52hKgfYITWHk9SEYQpRRHjomDnL7P4uY
	EnaA==
X-Received: by 10.43.153.68 with SMTP id kz4mr1298272icc.29.1393353732478;
	Tue, 25 Feb 2014 10:42:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 25 Feb 2014 10:41:42 -0800 (PST)
In-Reply-To: <1393353047-23946-1-git-send-email-sgw@linux.intel.com>
References: <1393353047-23946-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2014 10:41:42 -0800
Message-ID: <CAMKF1sr5KffKQmU3sw4sgm-MQB+MWLGp=ZP7nEsgETtB-AazbQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Use readlink instead of realpath
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
X-List-Received-Date: Tue, 25 Feb 2014 18:42:14 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 25, 2014 at 10:30 AM, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  scripts/runqemu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 57c5de4..573def1 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -464,7 +464,7 @@ if [ -z "$ROOTFS" -a "x$FSTYPE" != "xvmdk" ]; then
>  fi
>  # ROOTFS is now set for all cases, now expand it to be an absolute path, it should exist at this point
>
> -ROOTFS=`realpath $ROOTFS`
> +ROOTFS=`readlink -f $ROOTFS`

this is much better

