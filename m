Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id A5FF677CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 11:53:56 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id u12so37983691qth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 04:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uG6TG382vHFIn3emijPNM5HEWbW+ASXXS3NVJgGE/DY=;
	b=yRhPRWLYKv7uz1Gp2ozJxlypwCxtSj3VdfqbP5XH2+//HJ2UwwdYDhVpXr4uVD2LiN
	c1mjZIYBZwsJIjCytQvoFpqJAf+F0JEpggXpdMWw4EWRYtFRQTG4utK+59imExdxZKOI
	1/DCkVv+vy9PVah/1Sw/sDc2aWttmvgG1qj8ZtSuGiAE/sDND5b385Z8kK3ENLDiS3Tk
	LQ700RNR1qjZHfTLd54cod7J4a8Hdiz8E8yJAdbMETTU+TRF6UafSKbljq06I2BSoECH
	rl6vD0Vx/0jQmNgpIak+Hs9/iKNxDGch0BUinx9yKkzLK3vof9LHCWok615doYgLxzB9
	O9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uG6TG382vHFIn3emijPNM5HEWbW+ASXXS3NVJgGE/DY=;
	b=mvxQZi2KMgY01jbb/Pv3s925ftraHSkDqq8KWGBDhrdgOQIwoMgAkEXmYJXcF89F/s
	oJhNdqfJ4Bjtb4pWzcXQL4VlP8cUuJ3Y+3uyufYmRVEwQO0pnJ/+SjrWa2GBHC2AxbHC
	nj1VxRdF33UUwjI6GqSGxtXOsFc+Kr1Zt2He4OYuxdqipoV6wx02Ha/UW4Loxb63+KQv
	b+tlQLw1WufGzvb7OqMGGN9HMIwM+jCntkFco3LFc/xCdDRaTrv66tpi4zJ133UNhAuI
	d5D6/TZ+hUu/UgKWmfbTwmAu8/ZBJ8Dij7sIKIFDvy4qiQsOOmuwNa/E3lFyCnuSXro8
	Fkrw==
X-Gm-Message-State: AKS2vOzmhDHPA3vG591mdtVZeiBuwFasfyX/HaK+ZIXnBbkaqLKFY4IM
	eYir6hdoxWeiHr6CKTpQvjSlUs1ct7cO
X-Received: by 10.55.42.30 with SMTP id q30mr21861283qkh.109.1496922837471;
	Thu, 08 Jun 2017 04:53:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 8 Jun 2017 04:53:36 -0700 (PDT)
In-Reply-To: <CANwerB08=Ae416bR-HQXcJ2-yJ=0ezfu51YSKexcDxzHSUfw-Q@mail.gmail.com>
References: <20170608110754.32445-1-net147@gmail.com>
	<CAJTo0LZcKVgrHp4M+7JizD+KM2S-qCxi=yKDnGBJ9AvziLikuQ@mail.gmail.com>
	<CANwerB08=Ae416bR-HQXcJ2-yJ=0ezfu51YSKexcDxzHSUfw-Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Jun 2017 12:53:36 +0100
Message-ID: <CAJTo0LYb1UqbK7=EdE+92S1oTfvZz5awr_O05WrgMbSyU4Atjw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][pyro][PATCH] image-vm: Avoid use of fold, tac and paste commands for DISK_SIGNATURE
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
X-List-Received-Date: Thu, 08 Jun 2017 11:53:57 -0000
Content-Type: multipart/alternative; boundary="001a11493f02fbfd4e0551718156"

--001a11493f02fbfd4e0551718156
Content-Type: text/plain; charset="UTF-8"

On 8 June 2017 at 12:21, Jonathan Liu <net147@gmail.com> wrote:

> For example:
> $ echo $(false)
>
> $ echo $?
> 0
>

I stand corrected.  Thanks, sh.

Ross

--001a11493f02fbfd4e0551718156
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 June 2017 at 12:21, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"mail=
to:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":3i" class=3D"a3s aXjCH m15=
c87719204ca330">For example:<br>
$ echo $(false)<br>
<br>
$ echo $?<br>
0<br></div></blockquote></div><br>I stand corrected.=C2=A0 Thanks, sh.</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a11493f02fbfd4e0551718156--
