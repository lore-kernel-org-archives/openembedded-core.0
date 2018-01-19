Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFA9878557;
	Fri, 19 Jan 2018 14:06:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f71so3633975wmf.0;
	Fri, 19 Jan 2018 06:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fg011DmVDJOOnQ0/BnvitZsYIgyNhwoJ2LCIRvr7OmE=;
	b=Ntb+cTcWHy3d2ybWOb1V1K9rbzZV11Cp66KyaJDoS7tmwuK0vKV7QVOXxcyRwn0VEr
	WwhSLhmtxKHqYzNaouEZBPXNoRztOSSVu9SmUZ/L29CXBfJ2LF328jnr3CC9PM+gYd1Q
	+M/dtVTj1q0ToX9fI4SR7JF6dEJs+bP1YLDLiiDzZCQoAxqQq78xBIBnIz4SLIXelKmJ
	IlKLjhVvkoEnpgJqerbdcfe0QUtrbKP3cMqPNJhPVtF597lntM2QjEsPMpOLz32MR8/F
	ed5zdsMGGw2PDwc+C3pHgAcd7cZ11qX/bHV3XA3WrUSV3mkpJ4srTS7QXy6rsaVDT7ST
	eYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fg011DmVDJOOnQ0/BnvitZsYIgyNhwoJ2LCIRvr7OmE=;
	b=c5wzFBkF98bpeC4irUzKGOfw2NIAvGytuJYzccR03kTxAanlGPG3v7ab9t9kqGTf5t
	tzXRBCVEDQEmSIlshM2jMnjvCd439lnXStgskaN+1sJWv2Mx5Db8k0hoOeI+dF6rQU3p
	j/R17nMrqNtwBPs3Xr2oGwukZBXLLtPTK0rLYRs4nV8/nmioj0vYfdPl4CqFsrhenywg
	dJmh1+idr6ENPzoa/bjW4NrQJfnbANdltDaWv8qeHo1Ggs78KtXMQ5B0rruEuhr+rDEd
	0CMJVSotBuQFp5CsO63VGewtxmKAEWtHRlajtCh19QTu3TYvvrj/RrQE858BliDJt2tf
	IyHQ==
X-Gm-Message-State: AKwxytfkig0jmjvgNWhpbLjUA8EkP9BdfJxQI7bWFDtZ5T/fUwmGbZ6B
	MB/COprFTZP9cNxVk5zLwabBa3knYsuUnKTleXo=
X-Google-Smtp-Source: ACJfBosj5XenT6B0UXyyRfju5X/M/ITnfwxbUCPfB44tqg6ysgrqQ6IcKbxXIcO9PIhYij8urvkGoJoNfxM64ZVyr0w=
X-Received: by 10.28.191.19 with SMTP id p19mr4140839wmf.142.1516370776522;
	Fri, 19 Jan 2018 06:06:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 19 Jan 2018 06:06:15 -0800 (PST)
In-Reply-To: <CAJTo0LYJrDXkSG3zhEowg2UbFyYvoAPKKDUKoGd8qQ_yfBwCCA@mail.gmail.com>
References: <151627986059.9023.14010623458474127186@git.openembedded.org>
	<20180118125101.2F92F235ED3@git.openembedded.org>
	<CA+chaQeG05c0KXRoFMrb_=rh3C+MMJuMFWvQjtuyedFXg-PdMQ@mail.gmail.com>
	<CAJTo0LYJrDXkSG3zhEowg2UbFyYvoAPKKDUKoGd8qQ_yfBwCCA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 19 Jan 2018 15:06:15 +0100
Message-ID: <CA+chaQczyj5GwNbcPrWsUAeyGv6Lo3MCaanRNpc5dj0BD96+nA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-commits@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 08/08: json-glib: update to 1.4.2
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
X-List-Received-Date: Fri, 19 Jan 2018 14:06:16 -0000
Content-Type: multipart/alternative; boundary="001a114e27827b87a7056321959c"

--001a114e27827b87a7056321959c
Content-Type: text/plain; charset="UTF-8"

qemuarm, qemux86, raspberrypi3 and few more arm MACHINEs.

On Fri, Jan 19, 2018 at 3:02 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 19 January 2018 at 13:58, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> It fails here since this upgrade, maybe the 0001-Do-not-disable-gobjec
>> t-introspection-when-cross-comp.patch is still useful and wasn't
>> completely merged upstream?
>>
>
> The patch was to let G-I work when cross-compiling, so it's unrelated.
>
>
>> FAILED: json-glib/Json-1.0.typelib
>> json-glib/1.4.2-r0/recipe-sysroot/usr/bin/g-ir-compiler-wrapper
>> json-glib/Json-1.0.gir --output json-glib/Json-1.0.typelib
>> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use
>> --includedir
>> error parsing file json-glib/Json-1.0.gir: Failed to parse included gir
>> GObject-2.0
>> If the above error message is about missing .so libraries, then setting
>> up GIR_EXTRA_LIBS_PATH in the recipe should help.
>> (typically like this: GIR_EXTRA_LIBS_PATH="${B}/something/.libs" )
>> ninja: build stopped: subcommand failed.
>> WARNING: exit code 1 from a shell command.
>>
>
> What MACHINE?
>
> Ross
>

--001a114e27827b87a7056321959c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">qemuarm, qemux86, raspberrypi3 and few more arm MACHINEs.<=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jan =
19, 2018 at 3:02 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D"=
">On 19 January 2018 at 13:58, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br></span><div class=3D"gmail_extra"><div class=3D"g=
mail_quote"><span class=3D""><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><div>It fails here since this upgrade, maybe the=C2=A0<span style=3D"font=
-size:12.8px">0001-Do-not-disable-</span><span style=3D"font-size:12.8px">g=
objec<wbr>t-introspection-when-</span><span style=3D"font-size:12.8px">cros=
s-com<wbr>p.patch is still useful and wasn&#39;t completely merged upstream=
?</span></div></div></blockquote><div><br></div></span><div>The patch was t=
o let G-I work when cross-compiling, so it&#39;s unrelated.</div><span clas=
s=3D""><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><di=
v>FAILED: json-glib/Json-1.0.typelib=C2=A0</div><div>json-glib/1.4.2-r0/rec=
ipe-sysr<wbr>oot/usr/bin/g-ir-compiler-wrap<wbr>per json-glib/Json-1.0.gir =
--output json-glib/Json-1.0.typelib</div><div>Could not find GIR file &#39;=
GObject-2.0.gir&#39;; check XDG_DATA_DIRS or use --includedir</div><div>err=
or parsing file json-glib/Json-1.0.gir: Failed to parse included gir GObjec=
t-2.0</div><div>If the above error message is about missing .so libraries, =
then setting up GIR_EXTRA_LIBS_PATH in the recipe should help.</div><div>(t=
ypically like this: GIR_EXTRA_LIBS_PATH=3D&quot;${B}/some<wbr>thing/.libs&q=
uot; )</div><div>ninja: build stopped: subcommand failed.</div><div>WARNING=
: exit code 1 from a shell command.</div></div></blockquote><div><br></div>=
</span><div>What MACHINE?</div><span class=3D"HOEnZb"><font color=3D"#88888=
8"><div><br></div><div>Ross</div></font></span></div></div></div>
</blockquote></div><br></div>

--001a114e27827b87a7056321959c--
