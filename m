Return-Path: <eran.m@variscite.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D4BE7747FD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 08:26:00 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id a137-v6so1896836wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 01:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=variscite.com; s=variscite;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Sqf8c55mWZ3h7xSY+QPYoRqmZs6OVZ4W6bIlIwALjmE=;
	b=ZXao1o8e1gVlUJkhjvVVwJxkzp+HEal/91u2qaAPOboK/pZaWtrtZYCjRvVZ96mjwR
	E1c1HofKHDxYP5F1YryGHWlcP8/DtlhVOawjEXcfKSIHIpquWFlPi4m9JmhZh76zTc4i
	a7zucdJQLpMfh2cdLafeoe7aL6PzqoMCNfBwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Sqf8c55mWZ3h7xSY+QPYoRqmZs6OVZ4W6bIlIwALjmE=;
	b=bw/TcSpO99bJoopRQwBepZrmeP1ZbVILYpVhSQCgykKT7Bp2stRYdcMf7homSXXDBJ
	WBAy5XKqjcEB0sq0iWtPatrNh/kgK/BJHZh4MCmw8MQZlmbaKBrcT5ACQP7VtL/PpoJr
	fcPO/wYDaPiSevaPaB16SBQTFKowYL34RwcvldL53y0m8BP6dGPa8jijXE6yDJinVnHR
	XsGDGduhTQfSQ4NbtJ2XddLviXhGq0dOSA79mIr+36D78bjrL2BzvSqPRCrTAgI7iJqY
	gH5ftPHi8XRDJOY662T5A2zzPmKER+OcoJJwCUyTTP/Png6rvrGsuzwVb55hf9D7kv+o
	dORQ==
X-Gm-Message-State: ALQs6tBe+ZyBxUn8SuwTPONBQLZsyIFFBycMGzRAJP8MYQYGUSaRsU/r
	efHko8fMAESFgo0b8eQBHf+ayXCgwyhzC0fMhIfpuRsO
X-Google-Smtp-Source: AB8JxZoEpJd9JOV3vK3lp9rX69nlNGQMA5hgA0o4/DKcOjvaS9xdr6TAR7ft/1OwpkyXiwHA2vtke7n4xocmu/ldUVA=
X-Received: by 2002:a50:a621:: with SMTP id
	d30-v6mr29821363edc.173.1525335961058; 
	Thu, 03 May 2018 01:26:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.175.130 with HTTP; Thu, 3 May 2018 01:25:20 -0700 (PDT)
In-Reply-To: <1525282409-4623-1-git-send-email-jaewon.lee@xilinx.com>
References: <1525282409-4623-1-git-send-email-jaewon.lee@xilinx.com>
From: Eran Matityahu <eran.m@variscite.com>
Date: Thu, 3 May 2018 11:25:20 +0300
Message-ID: <CAGpdJ+hcKMvyQLK4C=bnH=mP_mBjGRHcKGZN=9CX5W5TUq0HeA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-session-sato: Make the battery applet depend on machine features
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
X-List-Received-Date: Thu, 03 May 2018 08:26:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.
This is a duplicate of the original patch 142525 that I've submitted
on July 30, 2017, only it has tabs replaced with spaces so it doesn't
apply.
The original patch applies cleanly. Please use it instead this one.

Regards,
Eran

On Wed, May 2, 2018 at 8:33 PM, Jaewon Lee <jaewon.lee@xilinx.com> wrote:
> From: Eran Matityahu <eran.m@variscite.com>
>
> matchbox-panel enables the battery plugin only if the
> acpi/apm machine features are enabled,
> so enable the battery applet in the session script
> under the same conditions.
>
> This avoids the 'Failed to load applet "battery"' warning at runtime,
> in case these machine features are not defined.
>
> Signed-off-by: Eran Matityahu <eran.m@variscite.com>
> ---
>  meta/recipes-sato/matchbox-sato/matchbox-session-sato/session | 5 ++++-
>  meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb  | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/sessio=
n b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
> index f6313bd..3a70574 100644
> --- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
> +++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato/session
> @@ -20,7 +20,10 @@ matchbox-desktop &
>  # doesn't have the feature "foo".
>
>  START_APPLETS=3Dshowdesktop,windowselector
> -END_APPLETS=3Dclock,battery,$KEYBOARD_APPLET,systray,startup-notify,noti=
fy
> +END_APPLETS=3D$KEYBOARD_APPLET,systray,startup-notify,notify
> +END_APPLETS=3Dbattery,$END_APPLETS # feature-acpi
> +END_APPLETS=3Dbattery,$END_APPLETS # feature-apm
> +END_APPLETS=3Dclock,$END_APPLETS
>  END_APPLETS=3Dopenmoko-panel-gsm,$END_APPLETS # feature-phone
>
>  matchbox-panel --start-applets $START_APPLETS --end-applets $END_APPLETS=
 &
> diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb=
 b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
> index d146e83..8230e95 100644
> --- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
> +++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
> @@ -26,7 +26,7 @@ FILES_${PN} +=3D "${datadir}/themes/Sato/index.theme"
>
>  do_install() {
>         # This is the set of machine features that the script has markers=
 for
> -       FEATURES=3D"phone"
> +       FEATURES=3D"acpi apm phone"
>         SCRIPT=3D"${S}/sedder"
>         rm -f $SCRIPT
>         touch $SCRIPT
> --
> 2.7.4
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.

