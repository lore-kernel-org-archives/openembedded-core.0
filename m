Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3945760F4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 01:28:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t991SgdB027078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Oct 2015 18:28:42 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Oct 2015 18:28:41 -0700
Message-ID: <56171848.4010805@windriver.com>
Date: Fri, 9 Oct 2015 09:28:40 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Christopher Larson
	<clarson@kergoth.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
	<5c927d04a3d915e5949f36f5ec9da9f81d8459bd.1444310101.git.liezhi.yang@windriver.com>
	<CABcZAN=wK-941ihO18dr68bxCa6vnN2LJgSz=LMynfoOZopVzA@mail.gmail.com>
	<CABcZANm6GfP7sqVdcDo2x2v-Uq85Hns7WOG+s3K9j9N1NqG1EQ@mail.gmail.com>
	<CAJTo0Lbe64X4-vG4uBfypz9zDREU6vYiU0LWNk1aFe+CHYzZYg@mail.gmail.com>
In-Reply-To: <CAJTo0Lbe64X4-vG4uBfypz9zDREU6vYiU0LWNk1aFe+CHYzZYg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Fri, 09 Oct 2015 01:28:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Chris and Ross,

On 10/09/2015 05:06 AM, Burton, Ross wrote:
>
> On 8 October 2015 at 22:00, Christopher Larson <clarson@kergoth.com
> <mailto:clarson@kergoth.com>> wrote:
>
>             +       # Use relative path for S to avoid buildpaths in files
>             +       relative_s=`python -c "import os; print
>             os.path.relpath('${S}', '.')"`
>             +       cfgscript="$relative_s/configure"
>
>
>         Why not just use inline python here, rather than calling out to an
>         external python process at task execution time?
>
>
>     Oh, nevermind, of course oe_runconf can be run from any number of paths :)

Yes, "inline python" is executed at parsing time, but we need it be
a building time path.

>
>
> Why not use realpath?
>
> ross@flashheart ~/Yocto/poky/meta/recipes-devtools/qemu (mut)
> $ realpath --relative-to=. ~/Yocto/poky/meta/recipes-support/mpfr/
> ../../recipes-support/mpfr

I'm afraid that realpath is not generally existed on the build host ?

// Robert

>
> Ross

