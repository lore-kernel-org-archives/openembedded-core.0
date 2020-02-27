Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id E73E8618A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 23:46:50 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id x18so861550vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 15:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pcKiDrJrrloCWvVZuk+YWCUxqTX5F0SJA9Yx5dH6k78=;
	b=qesHcEZQ6/JibKKVqPqY6oFtJsUso3Y/0FU5fO5pP4/0ohhNpYjbgpArlSxGn/mtFs
	ZMjhgqSe7ISjAMpxS+2pxucoDhFB45nUiqEDEl81ejCo0tkZbFyHoAQbONl3pk8VIeCV
	CvOi7OdWgvmao6RplAYdZrNKR0BjhJkYjtLThLK+zTzI3XldFW++QU65S8TlYIKnfn5l
	L+5Z1BhXOzWbGcOSTVcq1R5TfzVZiyTfI+zUpK45uANnjdIUBxQIFw+/SJfI/8WjzeoC
	bDpnxsZuoQCVskINa5QPiuksMhYurTjXvFV9/KhLYtPHwcV9xnsxP74GdBz3N0OpV51W
	Jotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pcKiDrJrrloCWvVZuk+YWCUxqTX5F0SJA9Yx5dH6k78=;
	b=BxbuHLbIGnMQQWZDdNdjVmEwComvnZw9WfKKDnw78+mIDT8IEYg2gVGDnQmeZS2oVw
	+p+c7y4ZNgyIwGC5ujHw8+hlmjjMN24dEarDMfe7bcDSUaIg6YeVhjPbom+KuPi24mc0
	jR6dUgOWxYuurJtON25wFdT6dyA+pj3H0fIEUQmdU19rwzXeu0Rn+DzW4DA1L16Osv2u
	9bhTCkRgHd8DOkAUabd9VXupr2A8QCvqTiqJWmucEf7UilOU7m7NjCk6DuiBHMDzLD1H
	2pQydzCqJ2866NGnLryrJPfoPq7DxP4n4PBt+ExdbuEmt9eNxGdew5mAkh4FBsK0a7HJ
	Zbgg==
X-Gm-Message-State: ANhLgQ20+NJr04Tnf9i/Icnx97rCC3t9P0JilAuGHmhqP0UGH3t+003m
	okXL/QQ545dPEV+bGoJ8mCID0L8Xlo+0mG+zEnk=
X-Google-Smtp-Source: ADFU+vvUqFqRYJ0jNiYYcWLb/NF9nXJBNtCnMRCAogufam0A2WEeQ1P5FcTGv8EHpu14w43aSKbRMo0hTdIMPDyf20A=
X-Received: by 2002:a67:e3c3:: with SMTP id k3mr1089929vsm.137.1582847211697; 
	Thu, 27 Feb 2020 15:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20200227080558.3819138-1-raj.khem@gmail.com>
	<20200227080558.3819138-3-raj.khem@gmail.com>
In-Reply-To: <20200227080558.3819138-3-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 27 Feb 2020 15:46:38 -0800
Message-ID: <CAJ86T=Ubo7SCy7an3X_edpHrYLaMaJZJ4qEGgb-27YNRb2vPsQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] systemd: Do not force removing resolved from PACKAGECONFIG
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
X-List-Received-Date: Thu, 27 Feb 2020 23:46:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 27, 2020 at 12:06 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This needs __UAPI_DEF_ETHHDR to be set to 0 which now
> taken care by CFLAGS
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_244.3.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
> index 5d863410b8..e7d2997963 100644
> --- a/meta/recipes-core/systemd/systemd_244.3.bb
> +++ b/meta/recipes-core/systemd/systemd_244.3.bb
> @@ -98,12 +98,13 @@ PACKAGECONFIG_remove_libc-musl = " \
>      nss \
>      nss-mymachines \
>      nss-resolve \
> -    resolved \
>      smack \
>      sysusers \
>      utmp \
>  "
>
> +CFLAGS_append_libc-musl = "-D__UAPI_DEF_ETHHDR=0 "

Should have a leading space (and no trailing space).

>  # Use the upstream systemd serial-getty@.service and rely on
>  # systemd-getty-generator instead of using the OE-core specific
>  # systemd-serialgetty.bb - not enabled by default.
> --
> 2.25.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

