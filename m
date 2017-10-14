Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id C7A6877F85
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 20:53:03 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id l40so7404310uah.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pB0aitva6H4xUDmrhUNJCkPII7e49sXhfpl7RrilEVw=;
	b=BGzPN1aJnjikMq6rFy5tNOmDokUvUtlgpjh/wbtGYEiURdSFsiYFxvPr1JKZWIhoQt
	CHq+R3Z9qwz+3Ieyb//Dj/C3fIap80OBmCXCpNV9y+YRgwo8MbE0jGHlHeSHcPxKgzfo
	/TNItLbtoj87aupSm6KSco175sF78zsP2iYuB9Iw86HMEGugHmErerw0PdR9QB2pHRkz
	HxujqdG1RsqXVBL1TYazrXIBfx5VHmZdzaD8AIt7i0awzqwJbDcftd+MMPgnzoIHeIU7
	6VhIAxIJoLZ46MvvX/3FYeIOEYMdCGvcbBjRqIa8Ogc8WpQO/UzQ8ur+VKzzERf44Zk8
	C1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pB0aitva6H4xUDmrhUNJCkPII7e49sXhfpl7RrilEVw=;
	b=SQbiw9brlVr2EoLQPFAS8QQmSjup4rz+sLc4o37K8Dnv1TFFr36LcVImcgb2MdROUe
	O3Qs5QLYYILEbjtfpLoteZsOp8ZA3vooeTjVjMsh/d8h1aLaUdiX5E49+5RmH4si1cv0
	j61En5cWRwGkt2dIEwnHdlbm1RFVqnZt0iGNlWfZwMop18Y4317fUFreK2BzvuL8H3MX
	xHuJna0Feym1iszW+4LsqDvbOxoQGweIuB3YVBooGk4t8Cm3YgUAReSxY2QCZwRDRw70
	JVJa2sYlgNLwbuW1oq1w+M3CcTV9zp58oBgH2jKBYAQkdIkzBWY1OPJpnFqp9k9RCC7n
	L0gA==
X-Gm-Message-State: AMCzsaUgaxqkl+1kStBw1VbJWH1Whcap/xHS158ZRIrcclgFZz5nzVLu
	81azSdVj3NZW50u4qYIVh2ts2d0WWhy/vsiTQPE=
X-Google-Smtp-Source: AOwi7QDmKlk1rQRHwd1EH2Anpr5uIeH8rppW81SR3N33Rze44WuqIJpxQCalId2HRakNIyrQ686TVJoDELXThWFBkME=
X-Received: by 10.176.81.132 with SMTP id g4mr4206181uaa.60.1508014384554;
	Sat, 14 Oct 2017 13:53:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.82.197 with HTTP; Sat, 14 Oct 2017 13:53:03 -0700 (PDT)
In-Reply-To: <a74d181f182de5620684e5d4d1019a31e48b400d.1506759191.git.Qi.Chen@windriver.com>
References: <cover.1506759191.git.Qi.Chen@windriver.com>
	<a74d181f182de5620684e5d4d1019a31e48b400d.1506759191.git.Qi.Chen@windriver.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Sat, 14 Oct 2017 22:53:03 +0200
Message-ID: <CAC+thW1NdA_1zAVLf2jU+bQ+Mr58yBKFT_Gec4wXWiJRjfPFgw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Sat, 14 Oct 2017 20:53:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 30, 2017 at 10:15 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Add tools required by testimage to HOSTTOOLS only when testimage is
> inherited. These tools, as described in the comment, are only required
> by the testimage task. So this change should not have negtive effect.
> This would also solve build error on hosts which miss some tool such as scp.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f41680b..94c1f27 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -484,7 +484,7 @@ HOSTTOOLS += " \
>  "
>
>  # Tools needed to run testimage runtime image testing
> -HOSTTOOLS += "ip ping ps scp ssh stty"
> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
>
>  # Link to these if present
>  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

This one is breaking any recipe that fetches from git repo with
'protocol=ssh' in its SRC_URI... I verified that reverting this one
restores the usual fetcher behaviour. Should ssh be added to HOSTTOOLS
unconditionally or is there any other way to approach it?

