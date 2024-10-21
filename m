Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD9ED0E6EA
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:31:57 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.43362.1729506715571636548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S46aDQNS;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539fe02c386so5265375e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729506713; x=1730111513; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jLp80gCQzL47jxYKpUIkyvYDCVt6QKJI9/oChc6yHBI=;
        b=S46aDQNS4/S9OTmXCDTx+FYmD1cUl1KPsV3GSW373VU5KV95zEZP1p9RcfoVpy8jAO
         W29MkFbclk5MBoic0Qv7WdkP0dncA9Xp1b1tu0eKLr+dbh5G3WD4gqSeyWM0dR86Upib
         KVVtQRozGLjcyQ4+iaccq04+mniKgz2jZcu0J3wnDfbuCDd0141ULvJU5XU0UUW4Fk68
         rNgO3/UMnvVMIEKYXIi7AKFNgHrIUltcBP+EI2LE1XhISQgw0cHCmgKZqyJi7YLqN9EZ
         CH19KoODotur3WdYVLTUvYFcl1SLavU8EDWvwDSu8fiTqUffGh+9apqX68wqIxU5CwjT
         5Fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506713; x=1730111513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLp80gCQzL47jxYKpUIkyvYDCVt6QKJI9/oChc6yHBI=;
        b=b4DHIff5Xg8CRa/TYAMgvepfqrpzAjWmAkIsxIAgeuvmkUy8ECiheJ8hFRydxU9iiH
         PDKaZ+n6DzCf92Ieme/TAgCVWRg1TQz1NOncvj4lQA5wsknsvk0K/6d4kKBbn7tl8Man
         zVYeI7NF25lNG8Y1YodxlvLkLvPggujK0Syjy44Ex6qdDKnii62I8NeyrjssDOu5GZx5
         3SzY+TzdBvVJ16+ISDezZTG8jtIsss+/xBsZJ/rs+CkRGS2sshNmWydYTwqTpqnH8Pwd
         ndNaaw3GPvYOhcCKew+44BT3eaZieaObHtxh51ItRYGmI5ifYhGmSvUy+8aVqgIMq4/d
         2KLw==
X-Gm-Message-State: AOJu0YzciQrU2dyMnKv+uvf1ii+jtZInRGSrcsogC6qb7+8/lnJU4w3b
	VP++TYmdoSHK3/SLj1cUZCgfQ2JaPhx5AiGyz4K/KnNyxko5kVq8vOqxXtCiNvU/eNtJZD3sDjR
	skwxz9rRCzT+Rt3DXZiRNW/ZqB0rgTA==
X-Google-Smtp-Source: AGHT+IFZG/Y751jkLEHErxvQQ9vpwDTQbV7XyPw8+rkn1NmVTOIPJRuHLEfegjj9Wxy85rbZ8qLk10kRmh3/PLqQkQA=
X-Received: by 2002:a05:6512:e91:b0:53a:c15:96a5 with SMTP id
 2adb3069b0e04-53a15b98db4mr3620736e87.27.1729506713370; Mon, 21 Oct 2024
 03:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241020113942.452797-1-dixitparmar19@gmail.com>
In-Reply-To: <20241020113942.452797-1-dixitparmar19@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:31:41 +0200
Message-ID: <CANNYZj8pb9i3m9W2iZSp3Ydrgi-J4mRSByxfgbjJZ3Rdrjfhdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] matchbox-panel-2: add sysfs support
To: dixitparmar19@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206107

Does this need support fo sysfs to land in the matchbox-panel
repository first? If so, then it needs to happen, and this should
include the matching SRCREV update.

Alex

On Sun, 20 Oct 2024 at 13:40, Dixit Parmar via lists.openembedded.org
<dixitparmar19=gmail.com@lists.openembedded.org> wrote:
>
> This configures matchbox-panel-2 to use sysfs based
> mechanism to retrieve power_supply information.
> Kept previous options(acpi, apm) as it is because the
> configure.ac allows only single configuration at a time.
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
> ---
>  meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
> index 3dec68b963..a0e7110534 100644
> --- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
> +++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
> @@ -30,6 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
>  EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
>  EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
>  EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "--with-battery=apm", "",d)}"
> +EXTRA_OECONF += "--with-battery=sysfs"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206091): https://lists.openembedded.org/g/openembedded-core/message/206091
> Mute This Topic: https://lists.openembedded.org/mt/109113250/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

