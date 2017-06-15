Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id B8E76782E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 12:56:48 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id u12so19257531qth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 05:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wTWTDbLEqYFDvFyfpLsaHirX+H4qO6RHKB53oVJHQTA=;
	b=hihKXWNJ8Ogn4tWoOljVhBRKDXpnMhcfJnYcD6psnJ7GC48Ql7Rq166J/jlI4n84F8
	v5vCwUYjOGfg7TU6EEVjeppTt2bXydFK+VuFHb/jTjMExqonXcv670qYmtJ84kZUw5Sq
	eo2oxpVFTksOHdwgVOhK1Vzqr3GzebCN3aPvsCHjglHVJRRJ27q8qhph7eZmd1QbUaIc
	5x//jBgEPdDzvP5ge+lgIIRgyA1s4Am3peuuthZdT/BqlQE3Asz0qFfFyljOUgGVNiIb
	4y7VqDfWOXcJMtscN6AMjP7dngQq1Or1lEc9KT75bruh90+aOYxAuKlKHS/vhswoitjP
	uSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wTWTDbLEqYFDvFyfpLsaHirX+H4qO6RHKB53oVJHQTA=;
	b=NE4N3oQinomno3CWbgbgAOM5nAiJyGNlaOL6hJO2mBEGes42Wy2NBYYi7G6+TjmbtV
	mCw/jhZw804Gsy+Wi/FK3uawYor2Ux7wdWzY4S+z8cCY3aApLhzpR4YC5fYgq+GeFHfQ
	0Et5+0C31sVBeQzGvZMjQDMw22MJuKgzYVkGbE2VUFkz99FXcqvWhiQDt5o9nQpYVBir
	KfFgR9WhBa2l6A5Yotsy37JiXgi3W9zhr8YlHoWKZFFUCbaUfvE1YHR+4nAgS4rhIuXV
	+NcWetAZzCQbOLDxvHBOp8mpFBPk0ZNRNljSmmVi/ZMhHv08mVvYvl07Fj9JXJznU+lL
	oiXw==
X-Gm-Message-State: AKS2vOyB1nNofhkHWWesyxyI00xDFY9guuqDU9qSZ44lVos+5sGG9x/h
	U2czn4ypWreyOrL20E3FwZiC10o0Vh7l
X-Received: by 10.237.40.97 with SMTP id r88mr6656878qtd.27.1497531409543;
	Thu, 15 Jun 2017 05:56:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 05:56:29 -0700 (PDT)
In-Reply-To: <1497383427-31099-1-git-send-email-jslater@windriver.com>
References: <1497383427-31099-1-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 13:56:29 +0100
Message-ID: <CAJTo0LZdP+z1dVcDUMB0Ea1HcMRN7YigcPO_H0qx1WHV85e5JA@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [v3][PATCH 1/3] ghostscript: move to version 9.21
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
X-List-Received-Date: Thu, 15 Jun 2017 12:56:49 -0000
Content-Type: multipart/alternative; boundary="94eb2c068b34b4c7c20551ff33ca"

--94eb2c068b34b4c7c20551ff33ca
Content-Type: text/plain; charset="UTF-8"

On 13 June 2017 at 20:50, Joe Slater <jslater@windriver.com> wrote:

> Eliminate CVE patches that are now in source.  Add CVE-2017-7975
> patch.
>

ERROR: ghostscript-9.21-r0 do_patch: Command Error: 'quilt --quiltrc
/data/poky-tmp/master/work/corei7-64-poky-linux/ghostscript/9.21-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2016-7978.patch
patching file base/gsdevice.c
Hunk #1 FAILED at 614.
1 out of 1 hunk FAILED -- rejects in file base/gsdevice.c
Patch CVE-2016-7978.patch can be reverse-applied

If that is already applied then there's likely more too.

Ross

--94eb2c068b34b4c7c20551ff33ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 June 2017 at 20:50, Joe Slater <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jslater@windriver.com" target=3D"_blank">jslater@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb=
(204,204,204);padding-left:1ex"><div class=3D"gmail-">Eliminate CVE patches=
 that are now in source.=C2=A0 Add CVE-2017-7975<br>
patch.<br></div></blockquote></div><br><div class=3D"gmail_extra">ERROR: gh=
ostscript-9.21-r0 do_patch: Command Error: &#39;quilt --quiltrc /data/poky-=
tmp/master/work/corei7-64-poky-linux/ghostscript/9.21-r0/recipe-sysroot-nat=
ive/etc/quiltrc push&#39; exited with 0 =C2=A0Output:</div><div class=3D"gm=
ail_extra">Applying patch CVE-2016-7978.patch</div><div class=3D"gmail_extr=
a">patching file base/gsdevice.c</div><div class=3D"gmail_extra">Hunk #1 FA=
ILED at 614.</div><div class=3D"gmail_extra">1 out of 1 hunk FAILED -- reje=
cts in file base/gsdevice.c</div><div class=3D"gmail_extra">Patch CVE-2016-=
7978.patch can be reverse-applied</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">If that is already applied then there&#39;s lik=
ely more too.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div></div>

--94eb2c068b34b4c7c20551ff33ca--
