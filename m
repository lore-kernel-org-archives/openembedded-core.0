Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id B4CBC719D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 11:47:31 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id f55so31510824qta.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 04:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i4ZDjarrSb2APShtEf8+wBxIQ5nC+bvigpDZT3iYpA8=;
	b=fSA14oC0iITAcr2Yx9B4LDf9TMW8j91jcPramf1mnpHD9M4/0jqRdJN1dyVrNt3ZiL
	SrUjf2Kyq587UDlMKqjQwrxCsI+9KfxYpzQKulDNBTPButLaRObvEpY5q7AivwpOtF7Y
	XM05unFm7kIaJauS+fuGzelQDrYj2Skr0NS4z2djMM0TobW8+3MXjXk4478jfjDZnYq1
	7gWcmauM7D9PKiObASV/x5BA4hbXPbC8iKxjCWQQLIM+i0ls3AYa7BDGrdgmWqiMwB7v
	5twBg8RZDwVJnkgt5S2uQVFV1EMl2Oed+3DwYAYEJ00DG+i+FbCb95b5AGCrvohxxzCI
	hlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i4ZDjarrSb2APShtEf8+wBxIQ5nC+bvigpDZT3iYpA8=;
	b=EA9P8OD0HCY506qKYP4k75dqIeSzKMgDM0D87hJu+poJQOOJUN+ujvFGXdYvJvGlSK
	5Y+CHPuY4CAHTRBxWVWDHuuLAqiz7MI080my//Wb2h+RFNifTvx1DLznMiLCDEDNqbhd
	u7tTYspwzNXyHnqy45eLAFidfwVSieeqNcfTUk6uoiB2H2BSJmQ2Dd/+RipLy6HcapzP
	4QU6Cif7Ijf2vwl5pS4pWcyl+qXKV+EMMQ90wf7HVkxBTlr9qr8WUC973RTz4zovkBYT
	y+8mGgckwzC171eQzRUn46O9NWGz+8J8Hqv1O/B2BM/WEqapdkkxvVpgVRqWaImFeoXF
	9Gxg==
X-Gm-Message-State: AODbwcC8KmwycGsv48DbRie8ob/rAjKtzur+x6clpMxm0Z8dBSfSRi7d
	pALRWsrHFC2tieFPGNQcFDDeRjJU25gt
X-Received: by 10.237.55.106 with SMTP id i97mr3280675qtb.68.1495108052556;
	Thu, 18 May 2017 04:47:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 18 May 2017 04:47:12 -0700 (PDT)
In-Reply-To: <d65b6c616f45f14b2c49ce8a2f860ad45def3df2.1494851172.git.bruce.ashfield@windriver.com>
References: <cover.1494851172.git.bruce.ashfield@windriver.com>
	<d65b6c616f45f14b2c49ce8a2f860ad45def3df2.1494851172.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 May 2017 12:47:12 +0100
Message-ID: <CAJTo0LZKMitURrfEBJCOf5qjy8WqFooEcVsQKQ==1W5MECKyvw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] linux-yocto/4.1: fix gcc7 compilation
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
X-List-Received-Date: Thu, 18 May 2017 11:47:32 -0000
Content-Type: multipart/alternative; boundary="001a11472ba05fb2ea054fcaf863"

--001a11472ba05fb2ea054fcaf863
Content-Type: text/plain; charset="UTF-8"

On 15 May 2017 at 13:51, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:
> Porting the mainline commit, to fix gcc7 builds:
>
>   474c90156c [give up on gcc ilog2() constant optimizations]

Sorry but:

ERROR: linux-yocto-4.1.38+gitAUTOINC+a867edab41_3b0fd24797-r0
do_kernel_version_sanity_check: Package Version
(4.1.38+gitAUTOINC+a867edab41_3b0fd24797) does not match of kernel being
built (4.1.39). Please update the PV variable to match the kernel source or
set KERNEL_VERSION_SANITY_SKIP="1" in your recipe.

Ross

--001a11472ba05fb2ea054fcaf863
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 15 May 2017 at 13:51, Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&gt; =
wrote:<br>&gt; Porting the mainline commit, to fix gcc7 builds:<br>&gt;<br>=
&gt; =C2=A0 474c90156c [give up on gcc ilog2() constant optimizations]<br><=
br>Sorry but:<div><br>ERROR: linux-yocto-4.1.38+gitAUTOINC+a867edab41_3b0fd=
24797-r0 do_kernel_version_sanity_check: Package Version (4.1.38+gitAUTOINC=
+a867edab41_3b0fd24797) does not match of kernel being built (4.1.39). Plea=
se update the PV variable to match the kernel source or set KERNEL_VERSION_=
SANITY_SKIP=3D&quot;1&quot; in your recipe.<div><br></div><div>Ross</div></=
div></div>

--001a11472ba05fb2ea054fcaf863--
