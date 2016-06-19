Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id A00EF60053
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 23:55:51 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id n127so16509792iof.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 16:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=BIa2PJ2Q6FswNLjSexw30OjdNiULKHd46b/2pAW/DE4=;
	b=BHChPSz+hR/o+RZlORwE1Bjk5k92Q8knGBOr6X8PuMGbyiM6UsEwGy3ijl3FszPSoW
	oXcpzmdDjYzIPNRED1QKwH9fj2vVywM73B2HG79W5jAcNiKAdW8vL5A3ZvmjrwcwuczE
	T7BJWGAy2Dgc3r9llCBDnvDvoBY1JdK639X/R8tJUoNSMquAGRmA1Ghgvg0FQFcZCi0M
	jnhqsDirPhS2iKGasNJnWaUBTdc2jzDFUoNv16nj9m5UCyciet7ktdSSBKfXU8hAe5yX
	grA/RkqrlkAjNxac5LF7UUlGgLER9lTQQ9Z72S3cwMZBv+1lwdFLSp7RU21+SkEWTqKj
	I4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=BIa2PJ2Q6FswNLjSexw30OjdNiULKHd46b/2pAW/DE4=;
	b=Z9FOBPbt7NceiPysiR+uJ8ToBJmvmAh/XK1WcZeIggjpRewOqidgKQvbYWJxs6Y1Va
	je5zqMZsgPx8ZidWn/pT1MUrS9uz2whIHr/OtHCVwTCY7AAAEG5F82AUCPljmBcpKJvy
	6Mv52zwWi7UCxzfKHMjAzxEqrMqId/mlDkk9fR9f+idb0an1IbTIXn4uMFcUt7Qua1ID
	UGKx2X+ySUUuyqUoRSS4PpTHLcj4g23wD00XUp9uT5P+X2frrfxEcObrLK0ompvjMcj0
	AXy0ilf5sU3FZk21v2NOI/cjpGGCgYSxDjaF/ozp02B1EME73Ww1fvNsiYq9LKmCRbyj
	NiGw==
X-Gm-Message-State: ALyK8tLXj9wLMhZHUGz/yT95yx2Yk4PURf5x6arLCiJK8xgbUMunjmTY7zuuQKkUSc7P0w+GdXW6kanpGFZhyQ==
X-Received: by 10.107.147.86 with SMTP id v83mr3933354iod.3.1466380552002;
	Sun, 19 Jun 2016 16:55:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Sun, 19 Jun 2016 16:55:32 -0700 (PDT)
In-Reply-To: <1466372305-8895-1-git-send-email-tdh@tkhanson.net>
References: <1466372305-8895-1-git-send-email-tdh@tkhanson.net>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 19 Jun 2016 16:55:32 -0700
X-Google-Sender-Auth: 3vyRK1AuvP2iqyK3VVOLty_h9zM
Message-ID: <CABcZANm9moNF6yFYuAmdZurk6hxdq43C+HP+N0EdkqmoXziGqg@mail.gmail.com>
To: "Troy D. Hanson" <tdh@tkhanson.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mkefidisk.sh; correct quoting
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
X-List-Received-Date: Sun, 19 Jun 2016 23:55:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c05665ce860970535aa5331

--94eb2c05665ce860970535aa5331
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 19, 2016 at 2:38 PM, Troy D. Hanson <tdh@tkhanson.net> wrote:

> mkefidisk.sh writes embedded control characters into startup.nsh.
> Causes bootup to fail, dropping user into EFI shell.  Encountered while
> following the the Yocto Quick Start example with the Minnowboard Max.
>
> [YOCTO #9665]
>
> Signed-off-by: Troy D. Hanson <tdh@tkhanson.net>
> ---
>  scripts/contrib/mkefidisk.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> index 333284f..a7b17d9 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -439,7 +439,7 @@ if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
>  fi
>
>  # Add startup.nsh script for automated boot
> -echo "fs0:\EFI\BOOT\bootx64.efi" > $BOOTFS_MNT/startup.nsh
> +echo 'fs0:\\EFI\\BOOT\\bootx64.efi' > $BOOTFS_MNT/startup.nsh
>
>
>  # Call cleanup to unmount devices and images and remove the TMPDIR
>

We shouldn't be relying on particular unportable behaviors of echo. This
should be replaced with printf for more reliable, predictable behavior.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c05665ce860970535aa5331
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Jun 19, 2016 at 2:38 PM, Troy D. Hanson <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:tdh@tkhanson.net" target=3D"_blank">tdh@tkhanson.net</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1l2" class=3D"a3=
s aXjCH m1556aa2dceef4864">mkefidisk.sh writes embedded control characters =
into startup.nsh.<br>
Causes bootup to fail, dropping user into EFI shell.=C2=A0 Encountered whil=
e<br>
following the the Yocto Quick Start example with the Minnowboard Max.<br>
<br>
[YOCTO #9665]<br>
<br>
Signed-off-by: Troy D. Hanson &lt;<a href=3D"mailto:tdh@tkhanson.net">tdh@t=
khanson.net</a>&gt;<br>
---<br>
=C2=A0scripts/contrib/mkefidisk.sh | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh<br=
>
index 333284f..a7b17d9 100755<br>
--- a/scripts/contrib/mkefidisk.sh<br>
+++ b/scripts/contrib/mkefidisk.sh<br>
@@ -439,7 +439,7 @@ if [ -d $ROOTFS_MNT/etc/udev/ ] ; then<br>
=C2=A0fi<br>
<br>
=C2=A0# Add startup.nsh script for automated boot<br>
-echo &quot;fs0:\EFI\BOOT\bootx64.efi&quot; &gt; $BOOTFS_MNT/startup.nsh<br=
>
+echo &#39;fs0:\\EFI\\BOOT\\bootx64.efi&#39; &gt; $BOOTFS_MNT/startup.nsh<b=
r>
<br>
<br>
=C2=A0# Call cleanup to unmount devices and images and remove the TMPDIR</d=
iv></blockquote></div><br>We shouldn&#39;t be relying on particular unporta=
ble behaviors of echo. This should be replaced with printf for more reliabl=
e, predictable behavior.<br>-- <br><div class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Sen=
ior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c05665ce860970535aa5331--
