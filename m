Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 276E671984
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 20:41:27 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id m127so1534407wmm.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UM6QGS5TrAhKdMKPiv+epFS6LUuTyg+LpDMf/8Nf7zM=;
	b=OkVq8evPvX1K1UMCO9IMTp1TxyNenCAU0d0vRdsKycUDARbM1jgNbKKCY2HVSEl+bw
	JnyqqATUWYzfMH96IuW3zrMZE1AuRrZdXvKj2oxDoRrg65SHKgXiXmITr2uyVHVBQA3/
	4a+XraUizWQtNQyUmlt0TsenTBt3crBOCq0xmpbOat5Xk2Ov2SVc7SoQ1pfSK897wYMd
	64TkZ0FYekwfeWzbFxcyA3YAJcMMzNVuoPWw2cCvYPVwGQZppJz1v5acc3DHbEh3OpNP
	367Gf8ndyjOS0YqwEginpayF6m8yDwVZcpONP1SAb6JA1x2i/uvX7ydk2wV09F1RWTD2
	hb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UM6QGS5TrAhKdMKPiv+epFS6LUuTyg+LpDMf/8Nf7zM=;
	b=kN2kaQtfUJG3n6Khdn9NkkXDoYkh1MznF6uKE0Z5LEZTIST3Mp9VFfsXQA3wZIh6zw
	Rb4TLy8qAbPgfzj3++4/kEiDi3GkUq1wl7Kv+mIn1o24+vMai3c4wLNwcOAupIxsdfG4
	daKfe3b4troNdsvPWWvwbBSha+eQHWD2dRogZlQTED6lnVLA0XQxL0nbbDHlEFbsgBRD
	JuwgDw/UD0bUL4lpl/td7FwuE24ZNVA7ufDmJ+VRtf1dHw35oxSgmXyabIrochYTaJ6T
	RiguIaz2Y4kV0m/zc8+r9lO2uj2k0dLoty568BDmKYIoWOLOdvrARCSRZJNc6tM7xuOl
	IAlQ==
X-Gm-Message-State: AHPjjUirRVPBWstAm1l/ANR1zljnd5BK9DFrRAsLLDXlvjTtThowIFYJ
	Tzl+f96LFs30YOLhBHi3mpMR9Wl92W7Zy5ndJ7U=
X-Google-Smtp-Source: AOwi7QCTMmUFy3ldeZAIOk9EhdT/mcPV9w8n6hvejOV6Xch80d2QWNtYz9tET3W1wkqRZ4/308Zd11zfaVRfVkQLVQQ=
X-Received: by 10.28.91.75 with SMTP id p72mr5059077wmb.89.1506717688703; Fri,
	29 Sep 2017 13:41:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.97 with HTTP; Fri, 29 Sep 2017 13:41:28 -0700 (PDT)
In-Reply-To: <1506693995-11520-1-git-send-email-jef.driesen@niko.eu>
References: <1506691942-10820-1-git-send-email-jef.driesen@niko.eu>
	<1506693995-11520-1-git-send-email-jef.driesen@niko.eu>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 29 Sep 2017 13:41:28 -0700
Message-ID: <CAJ86T=VRJg1wPRyvCi6Njz+k=ZdyfGKggS_0U1ygshDcS5yjFA@mail.gmail.com>
To: Jef Driesen <jef.driesen@niko.eu>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] initscripts: Remove empty packages
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
X-List-Received-Date: Fri, 29 Sep 2017 20:41:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 29, 2017 at 7:06 AM, Jef Driesen <jef.driesen@niko.eu> wrote:
> Because the initscripts recipe contains only some shell scripts, the standard
> packages (e.g. ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc, etc) are all
> empty and can be removed.

Removing empty -dev packages can sometimes cause unexpected problems
for people who create SDKs. I don't know if that's the case here (I
guess not) but unless the empty packages are actually causing a
problem I'd be inclined to leave them alone.

> Signed-off-by: Jef Driesen <jef.driesen@niko.eu>
> ---
>  meta/recipes-core/initscripts/initscripts_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index fea4f22..b8b33b7 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -47,7 +47,7 @@ inherit update-alternatives
>  DEPENDS_append = " update-rc.d-native"
>  PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
>
> -PACKAGES =+ "${PN}-functions ${PN}-sushell"
> +PACKAGES = "${PN}-functions ${PN}-sushell ${PN}"
>  RDEPENDS_${PN} = "${PN}-functions \
>                    ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
>                  "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

