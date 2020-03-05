Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A123611B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:16:24 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id y204so2463085vsy.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 16:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Hdi37uNvaT477ePqFJgfahV707o5U9VlZpfe8Rr7u8w=;
	b=KkAVuTO4LbZPUdFZQ1jjNItv7NYMON7k1M7mq5ZbRUKDrIBtPO/uD+09oYXAE3lSde
	4LBaA6J0aLa2h8MoCqOmvLnkYjcvJYCW2uH97jhSZ75BvUjNQWAdks4cVuu6kAvhOTPL
	mzmiXg/pa6OQQhVg1SQQnGD6i+fDFOXQluK4aAR+igBPd1ED6x/ASJafALz1Ppmaa/oT
	2XqzOkHBBWuFsFYhx7PntH0Ou1DVX+vboOtDhY2dzrRTmyFMf+NsJLXyUgfIRQP8f8QY
	uc6QeAfKfFKslkhzp5t1LfLrp6PXf38Hqwp05dMRNs629EhqBAqq4G0VsKO/65OltIod
	7KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Hdi37uNvaT477ePqFJgfahV707o5U9VlZpfe8Rr7u8w=;
	b=n6GRQ+w0jeF28x+EOVfTrKpnfzOn5fQ+TLfqSvwEh0tTltVvUFxbSqzNde5hvDaG2m
	FXHI9qrGWZUojyTEwAfOMgO4MTOEQbPyeaNnehoS7hjnzmBCu5m9s3fVPeL+4ttxe1EZ
	rUK9v1jKG3y7mJ4o+A2SGC7h9ipM2F1ePK//T1uSPX/TQpXb7zvvqPiTKQtkuZzTqYsB
	vTksuV4fSajyiQ8T7oIxrr/A2lJDhUDCydtWk2zU2FHyJCzJg0ha57PVyjdXFxEqTjdN
	i/jIsX6bpRZzH1xK9tK0GbsqEYMXVJfe6gTnHWdeZk1Lkyg/MNZazgBPgvC/W1966k9e
	g+SA==
X-Gm-Message-State: ANhLgQ2rIiHP3fj01dD3tuJL2Gac2o67fIFLK8aCrTp56Dbsk/uSwgiL
	rykfYqA+ekSHPlIScrxmdxmPHTJLuajWtSMMync=
X-Google-Smtp-Source: ADFU+vtVy8DtkAEX01pRMId+dC965IAgijHA7zB3Jpkz9F/zazf0wKm/ZkHBwDMtpLJ/R089hTIKv+o499gnbJ/MKAE=
X-Received: by 2002:a67:f41a:: with SMTP id p26mr3452685vsn.222.1583367385218; 
	Wed, 04 Mar 2020 16:16:25 -0800 (PST)
MIME-Version: 1.0
References: <20200305000548.6357-1-jpuhlman@mvista.com>
In-Reply-To: <20200305000548.6357-1-jpuhlman@mvista.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 4 Mar 2020 16:16:14 -0800
Message-ID: <CAJ86T=W1axCCm0+tSSJR-AGz3xReJoGveg3GT01-fmzSrzs5vA@mail.gmail.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdbm-native: disable readline for the native package.
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
X-List-Received-Date: Thu, 05 Mar 2020 00:16:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 4, 2020 at 4:05 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> ---
>  meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> index 5326184181..52e35c8c2e 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> @@ -20,6 +20,8 @@ DEPENDS_class-native += "readline"
>  # Needed for dbm python module
>  EXTRA_OECONF = "-enable-libgdbm-compat"
>
> +EXTRA_OECONF_class-native = "--without-readline"

Assuming the target version is being built without readline support
(presumably that's true as the recipe doesn't indicate any dependency
on readline, but you should double check) then this configure option
should be passed in all cases, not just for native.

>  # Stop presence of dbm/nbdm on the host contaminating builds
>  CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

