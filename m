Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A30660621
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Oct 2016 03:30:26 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id r132so4442818oig.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2016 20:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=zZA5+swakbkIn3l+xeDFFr/ISETSq9AlOMeuHImo7bE=;
	b=RYwbGO9ngNqFy9CqfQWTorRmujA3j9YDBYSDsnn2Fv0YyZnO95jHLlvuifp1+c7o+K
	CCyOb+A23v1zGVgQxLEHbCwDmSAZwYSsEPZ8XI7Axo0WKL0avvxDqcLYroMJ26F0W+zQ
	kU1o7vpoW+vsuqGJyjZAeiEADROBT7aHkaOit9zTDZLQWqiERinLoNyuLk1+k0xsCChM
	yF9hFCOU9XkDl0lJXw6Tzyg57O2eNQR7J2jYBpyWJkmN0Veq4JmJA396MTaFINou2Ekf
	JzuICiKornoerHZmwmMbcBb+uWGe8GcZEWduLIgRSgaqaTPyLToUCmIC+eEyuWS9uror
	S75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=zZA5+swakbkIn3l+xeDFFr/ISETSq9AlOMeuHImo7bE=;
	b=RUsaP3a4esHRDXp+fsof7d3JhX3ggQXc9PnsaxPwS1ElEg6Qqiy+e7COiy8exRHSZ3
	ik64y1tSa3iDtHNZ18T/271aymFAfrYbDaAebAqig7Vvsx8K7bkLso7rWbUhZT/pMBp6
	bHtrcYmhlqsd/+p3tw/kWFWE3Ugow3MBmAbpU+uK+8tg5EfXD67jL+QStaioi88R3aOy
	fA0nwGkV4kr4iFUprJoZir6ZMVkP4SEluDVW9cBpWaTjgzw4+9f4C/plez7OmMi+E2Cs
	0H+rYQH8AuIktoL3JyzEyAmVOHPNnB8yGZPsOQKePAvPc09oYGc1gJ2SnFfTZUbPG1HH
	2/sQ==
X-Gm-Message-State: AA6/9Rn6/QmX/OMKIR7Wj1lHeSlAGszYJ7yudNoaCok9LOJbJr6bIL89y4LEWCWqLo/NIyC6OGFlvXvYeLZr+w==
X-Received: by 10.157.7.46 with SMTP id 43mr12756911ote.176.1475897428181;
	Fri, 07 Oct 2016 20:30:28 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Fri, 7 Oct 2016 20:30:07 -0700 (PDT)
In-Reply-To: <1475821926-12276-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1475821926-12276-1-git-send-email-ed.bartosh@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 7 Oct 2016 20:30:07 -0700
X-Google-Sender-Auth: oM7siYSqwe-efg96XpjlZHk-81Y
Message-ID: <CABcZANne8cNsEgOcvLGrCLfJANbWHpaQhLMLZZ5iMX7FNVFXdQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] systemd-bootdisk.wks: update kernel command line
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
X-List-Received-Date: Sat, 08 Oct 2016 03:30:27 -0000
Content-Type: multipart/alternative; boundary=001a1139a686ee8a63053e52258f

--001a1139a686ee8a63053e52258f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 6, 2016 at 11:32 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> Used ttyS0 console.
> Removed usage of ttyPCH0 (FRI2 leftover)
> Decreased bootloader timeout to 5 seconds
> Removed 'vmalloc=3D256MB snd-hda-intel.enable_msi=3D0' as it's not
> needed for any of reference BSPs.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/lib/wic/canned-wks/systemd-bootdisk.wks | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> index d80189b..813f2ea 100644
> --- a/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> +++ b/scripts/lib/wic/canned-wks/systemd-bootdisk.wks
> @@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=3Dext4 --lab=
el
> platform --align 1024
>
>  part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
>
> -bootloader  --timeout=3D10  --append=3D"rootwait rootfstype=3Dext4
> console=3DttyPCH0,115200 console=3Dtty0 vmalloc=3D256MB
> snd-hda-intel.enable_msi=3D0"
> +bootloader  --timeout=3D10  --append=3D"rootwait rootfstype=3Dext4
> console=3DttyS0,115200 console=3Dtty0"
>

This says it reduces the bootloader timeout to 5 seconds, but doesn=E2=80=
=99t seem
to actually do so.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1139a686ee8a63053e52258f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Oct 6, 2016 at 11:32 PM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1yf" class=3D"a3s aXjCH m1579df08de42c7cc">Used ttyS0 console.<br>
Removed usage of ttyPCH0 (FRI2 leftover)<br>
Decreased bootloader timeout to 5 seconds<br>
Removed &#39;vmalloc=3D256MB snd-hda-intel.enable_msi=3D0&#39; as it&#39;s =
not<br>
needed for any of reference BSPs.<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/canned-wks/<wbr>systemd-bootdisk.wks | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/wic/canned-wks/<wbr>systemd-bootdisk.wks b/scripts=
/lib/wic/canned-wks/<wbr>systemd-bootdisk.wks<br>
index d80189b..813f2ea 100644<br>
--- a/scripts/lib/wic/canned-wks/<wbr>systemd-bootdisk.wks<br>
+++ b/scripts/lib/wic/canned-wks/<wbr>systemd-bootdisk.wks<br>
@@ -8,4 +8,4 @@ part / --source rootfs --ondisk sda --fstype=3Dext4 --label=
 platform --align 1024<br>
<br>
=C2=A0part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap<br>
<br>
-bootloader=C2=A0 --timeout=3D10=C2=A0 --append=3D&quot;rootwait rootfstype=
=3Dext4 console=3DttyPCH0,115200 console=3Dtty0 vmalloc=3D256MB snd-hda-int=
el.enable_msi=3D0&quot;<br>
+bootloader=C2=A0 --timeout=3D10=C2=A0 --append=3D&quot;rootwait rootfstype=
=3Dext4 console=3DttyS0,115200 console=3Dtty0&quot;</div></blockquote></div=
><br>This says it reduces the bootloader timeout to 5 seconds, but doesn=E2=
=80=99t seem to actually do so.<br>-- <br><div class=3D"gmail_signature" da=
ta-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth d=
ot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib=
<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1139a686ee8a63053e52258f--
