Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA1F7719B
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 21:32:36 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id o189so113830484ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 14:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2Albka6BkB4wjYbKaMqHiY1wNhYGzoHiLKilRQc55r8=;
	b=CCNKSFkZVVnlUYW889IHwKwFy7/BhIFNgeWzhZu3lM3/XV0QVjWQPkm6Y9uwr/MU0y
	b/wYc7pGysPpXNPl6PEquFX7GOc/2fEO3I4b9/W+wxh/0zj5yz6O5J/jDNugcriBVooJ
	OC/OYnapsNFOU6FxTHqsGtPS87l8Vjvb0y1RkfUFj47U2gPNOzt1D/5GUWvxKmhlz1Uz
	mVAhdbEfmE6BqA4oBtnxinTFW6EGaZvgiFPgsP4ivuwD6ACyJDt6kLMpLIfTOCyNihmM
	Xp2f+pyWi9sSuk66+hVz+FIu+YETg2LQkl+IPgeBPKS0WH1G/5Tb2Et1NZId9sfNxzb9
	y4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2Albka6BkB4wjYbKaMqHiY1wNhYGzoHiLKilRQc55r8=;
	b=Hcift+z+Ht34htsT6zTL/s+SF3gjxOJNoYKAtgfnFP8S02wx3fPxjkJ+EoOGpSGCWQ
	HGZumwdQFXq4QEDGijC27ntUi7F0qEJAcZaqAY0NNAq+nNpSSmrTPFmH/4Aa7reHtk+b
	bLEbhJNRcPb94ry4Sxc7Jm6Y8fQdlmW0xCAPMiKDmAxZv5jqWtdaGDigm8unHoXQ0+DQ
	FoqVstJ79+535cETlWkANrD42JtUQ2ODwjKTrF6ZxfTM/OBNs0BxuK6ewLSfmK+86SUt
	ccWg/3ploIkWVpGiUv+EcEbaMpGy1pyHpqbt8bOU7o9Y4E4dLWjFCn6YMebrpyyZNFcZ
	gGdQ==
X-Gm-Message-State: ALyK8tIyHdJAhal6Ji2GSxgqyvD1mVza8erf/eLYeB8B1NnBJ1GpIvSlfv+P8IiNkNcisCPtRwBvARJtYiEXq2Rw
X-Received: by 10.107.135.148 with SMTP id r20mr4487763ioi.133.1465162356868; 
	Sun, 05 Jun 2016 14:32:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Sun, 5 Jun 2016 14:32:17 -0700 (PDT)
In-Reply-To: <fa0f3722d5696d723dc8982386bfee6bcc43735f.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
	<fa0f3722d5696d723dc8982386bfee6bcc43735f.1464945141.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 5 Jun 2016 22:32:17 +0100
Message-ID: <CAJTo0LZgbjtitACY2yOumLw8y+R3MFPQaJ4AgJ24ktqEmkp75g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/25] systemtap: update to 3.0
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
X-List-Received-Date: Sun, 05 Jun 2016 21:32:36 -0000
Content-Type: multipart/alternative; boundary=001a113f8f7ad1d8a005348eb132

--001a113f8f7ad1d8a005348eb132
Content-Type: text/plain; charset=UTF-8

On 3 June 2016 at 10:15, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Remove docproc-build-fix.patch, as the build problem it's fixing
> now happens only if building html docs is explicitly enabled
> (which we do not do).
>

This has some non-deterministic build dependencies:

packages/corei7-64-poky-linux/systemtap/systemtap: RDEPENDS: removed
"ncurses-libtinfo (['>= 6.0+20160213']) ncurses-libncurses (['>=
6.0+20160213']) readline (['>= 6.3']) json-c (['>= 0.12'])"

(buildhistory-diff after doing a bitbake systemtap; wipe-sysroot ; bitbake
systemtap -C unpack)

Ross

--001a113f8f7ad1d8a005348eb132
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2016 at 10:15, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kana=
vin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-col=
or:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":2=
1n" class=3D"">Remove docproc-build-fix.patch, as the build problem it&#39;=
s fixing<br>
now happens only if building html docs is explicitly enabled<br>
(which we do not do).<br></div></blockquote></div><br>This has some non-det=
erministic build dependencies:</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra"><div class=3D"gmail_extra">packages/corei7-64-poky=
-linux/systemtap/systemtap: RDEPENDS: removed &quot;ncurses-libtinfo ([&#39=
;&gt;=3D 6.0+20160213&#39;]) ncurses-libncurses ([&#39;&gt;=3D 6.0+20160213=
&#39;]) readline ([&#39;&gt;=3D 6.3&#39;]) json-c ([&#39;&gt;=3D 0.12&#39;]=
)&quot;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">(buildhistory-diff after doing a bitbake systemtap; wipe-sysroot ; bi=
tbake systemtap -C unpack)</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div></div>

--001a113f8f7ad1d8a005348eb132--
