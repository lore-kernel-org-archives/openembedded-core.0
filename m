Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 74E1A6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 20:52:54 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id c190-v6so17939129oig.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 13:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TH4Kndt6Uy5tDkAMysMQ3Cuxvk2D2tXH66CeMXnWINw=;
	b=krWbh62BiQIrwHT3YDVf82vMF64FRQ8dONskiRrzYAGJUMjBDekVqFkBdVmL8Dt8ka
	4VIEBbtACThExPDwJNrluP50iHFuCkVnq781kr45RhCRcX1swsYWNAt+8YsK4oy2qvR+
	MCflrmiltQCvoThH++pW9KjMAeA/4cn1TCK1ZL73JQHFZSBSk06qjkiZWRKohkRJLh5I
	O/q9WNAnqdeIEv4ZT9Svo9xoO2scfrclmVIhruM5n6trmf65pWUZbmKb2AenfIRlYKkS
	MH8EqkajgHLhJQRSMHYpGCn/vT1it7kWSRhSdaNpzWYcQ10PLMcezpvHvcK9cJdjuHZ1
	Ha4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TH4Kndt6Uy5tDkAMysMQ3Cuxvk2D2tXH66CeMXnWINw=;
	b=kxBTyHJtmvyd7icOE/2JhYJ/jkmCvM63Ko37cbQxKHyW4LgbPsXJJ4gMI/toWdER5x
	3AT58wK6lRzpr9sT59gQdzWdZqBNmisHYeRpVuoEa+TANsmrTAkzLf1AHbRBwSTEH5wz
	e95dulV0mZZ5K8LLj0HQ8l8oXacnPWjqSvrb8Htxn2suG1egkoBuZqlUOVxtIIqAKP+o
	LM1ksQLj6F4t4shb2CBM2eux1ugd4e2YBYB2/b+IBp3/HtGIQMAu2OvRL5C3EamKrEOZ
	jPk9me0EwyAqsE4keZqHnrdLNYUFtASbpc+Hv7/FD6AozHSakWUCk9O5IQ/yaHafUuJ5
	NxPg==
X-Gm-Message-State: APzg51AvGY6CV6kUIOM7k3I05Zc2enuDx+pkS0GE/3DYqLied057RvrE
	bqN1tn1zQ47s6D7AfvNxBiJnntwBEUbLLHO3ar2uOw==
X-Google-Smtp-Source: ANB0VdYf/tw3wkabzIZJTTb6gkcPTVeX2Q16g9O8c9NaWgDQ+uQEPZ+fXS9ynZKT4llvMDpyZjdiDFRowye1pCvtOLk=
X-Received: by 2002:aca:506:: with SMTP id 6-v6mr4464035oif.23.1535662375410; 
	Thu, 30 Aug 2018 13:52:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7c0c:0:0:0:0:0 with HTTP; Thu, 30 Aug 2018 13:52:34
	-0700 (PDT)
In-Reply-To: <1535618064-18215-1-git-send-email-alex.kiernan@gmail.com>
References: <1535618064-18215-1-git-send-email-alex.kiernan@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Aug 2018 21:52:34 +0100
Message-ID: <CAJTo0LYyqaNRO39badfpH8F-H97-v0M_NpBrGhYamzaOn+MqEQ@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sudo: Add missing dep on virtual/crypt
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
X-List-Received-Date: Thu, 30 Aug 2018 20:52:54 -0000
Content-Type: text/plain; charset="UTF-8"

That suggests that the crypt dependency is only needed if pam is
disabled, is that the case?

Ross

On 30 August 2018 at 09:34, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> Ensure we have virtual/crypt even if building without PAM; fixes:
>
>   sudo: error in /etc/sudo.conf, line 0 while loading plugin "sudoers_policy"
>   sudo: unable to load /usr/libexec/sudo/sudoers.so: /usr/libexec/sudo/sudoers.so: undefined symbol: crypt
>   sudo: fatal error, unable to load plugins
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
>  meta/recipes-extended/sudo/sudo_1.8.23.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/sudo/sudo_1.8.23.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
> index ab9c8cb..18add22 100644
> --- a/meta/recipes-extended/sudo/sudo_1.8.23.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
> @@ -10,7 +10,7 @@ PAM_SRC_URI = "file://sudo.pam"
>  SRC_URI[md5sum] = "ea444d747feb1decfebdffd0b38b0739"
>  SRC_URI[sha256sum] = "d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679"
>
> -DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> +DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', 'virtual/crypt', d)}"
>  RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
>
>  EXTRA_OECONF += " \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

