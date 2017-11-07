Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7295E6FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 22:34:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z3so7063759wme.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 14:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=izhyGZ2RqdxzOivzgUqoVedxy3XzfB+AL4sDT+0x5IY=;
	b=HBlxASBB3cyjnyikiPsVrtUt9j5xgtG52x9N+SPNnCoM4CDW6tB+AiQLcIBj5lkaFu
	EnaGlofS2Klmk3RxtCkEYYhfTPpUlGBTbwQjwbiefmvTIcCIBb9L3Q3YNpf06qAq/iwv
	2Xdc/vmzaoM7iQOijyzr/SD4F5iQOW6NnIBP8TdtUUH27oQj8uRFqlCjuHZ9aHF0wQGB
	zTgQxVEPZ86w53gTwuYVvanNMsrjuJDcirL8N2uBhGV7n5dzxaR4uo5cboMJyNn9Cc//
	+7iwD0F+J8N6Hs31sKsj5aQMDewiUqgYM8mdBFewrlhIfnuBluOECq7mG7SbG3ill8Ht
	oElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=izhyGZ2RqdxzOivzgUqoVedxy3XzfB+AL4sDT+0x5IY=;
	b=TyLUhFJF2YK0s9GcLCQd9nTu0IRoTx1RoHspVlEEKBTOCnAXeDfk86by5zjeOOePTx
	gBtg2XHOTgsLXyLV+4iG3NXtnLZaMppxYapRNkEs5aHvdymGs/FX4vxc24LhFlyzm081
	PPkfWdMK8e2mbPpmkjVVUCdGWpEpwg0GJPYhBlm5vl5xNE8MOscJArpr69wLNmIg/w/I
	s6qH6oUGp4+67o1H0VorOql5lJZ+Z8zLtYng826S2SyZwM4CS20GeJwyhLl2BMdvJS25
	XRWIUnmjVzpzeT/REFOqW81bLHkui2p3QCHOmKhQI7xVajxQq3xKBYJszKRSbjSC0J/X
	6LJg==
X-Gm-Message-State: AJaThX6MX/6G1dXDbwDcJ8QVjGoG3G4wAQ9GhwIGLctNNwO6wGZMky5m
	cqowkSdKVNtq1PkL7w1xDgVfwHRCsWTs0ZXFCJ0=
X-Google-Smtp-Source: AGs4zMZnv8lK89M4oUk3kfOC1mrtFZ9m8cdFNBCqReFEXbeEwbyzBClg5uYxyv96CYNKzabSHfXoYnxUJZFrYJekGQY=
X-Received: by 10.28.11.138 with SMTP id 132mr484616wml.89.1510094095976; Tue,
	07 Nov 2017 14:34:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Tue, 7 Nov 2017 14:34:55 -0800 (PST)
In-Reply-To: <1508907304-24381-1-git-send-email-armccurdy@gmail.com>
References: <1508907304-24381-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 7 Nov 2017 14:34:55 -0800
Message-ID: <CAJ86T=VuL102kZ9eYaaeV8ANKFV2Vdn3Ww7YLjX88cQ3EumaVA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_ipk.bbclass: handle only whitespace in PACKAGE_EXCLUDE
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
X-List-Received-Date: Tue, 07 Nov 2017 22:34:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 9:55 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> If PACKAGE_EXCLUDE is constructed using _append then it's possible
> that the final value will contain only a space. Currently that
> results in build failures due to an invalid opkg command line.

PIng.

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/classes/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 8439cda..6c1fdaa 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -12,7 +12,7 @@ OPKGBUILDCMD ??= "opkg-build"
>
>  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> -OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE') or "").split())][(d.getVar("PACKAGE_EXCLUDE") or "") != ""]}"
> +OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE') or "").split())][(d.getVar("PACKAGE_EXCLUDE") or "").strip() != ""]}"
>
>  OPKGLIBDIR = "${localstatedir}/lib"
>
> --
> 1.9.1
>

