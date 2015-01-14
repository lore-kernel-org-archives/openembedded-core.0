Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8A84C71634
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 02:22:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E2Lxdh028858
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 13 Jan 2015 18:21:59 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 13 Jan 2015 18:21:59 -0800
Message-ID: <54B5D2C5.8000405@windriver.com>
Date: Wed, 14 Jan 2015 10:21:57 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1420642796.git.liezhi.yang@windriver.com>
	<a4b53d0ddc7976a58e0bc5c094dab61886f84e20.1420642796.git.liezhi.yang@windriver.com>
	<CAJTo0LaPD+YE0V37reL7brdoE8HiL=5oHz4mDL_nCr3EG5DrTg@mail.gmail.com>
In-Reply-To: <CAJTo0LaPD+YE0V37reL7brdoE8HiL=5oHz4mDL_nCr3EG5DrTg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] libtool: upgrade to 2.4.4
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
X-List-Received-Date: Wed, 14 Jan 2015 02:22:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/14/2015 01:44 AM, Burton, Ross wrote:
> On 7 January 2015 at 15:02, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     * The libtool config files are put in libtool/build-aux now, it was
>     libtool/config in the past.
>
>
> This may be the cause for a pile of errors on the autobuilder:
>
> ross@flashheart /data/poky-master/tmp/sysroots/intel-corei7-64/usr/bin/crossscripts
> $ grep tmp/work libtoolize
> .
> "/data/poky-master/tmp/work/corei7-64-poky-linux/libtool-cross/2.4.4-r0/libtool-2.4.4/build-aux/funclib.sh"
> .
> "/data/poky-master/tmp/work/corei7-64-poky-linux/libtool-cross/2.4.4-r0/libtool-2.4.4/build-aux/options-parser"
> .
> "/data/poky-master/tmp/work/corei7-64-poky-linux/libtool-cross/2.4.4-r0/libtool-2.4.4/build-aux/extract-trace"
>
> The libtoolize in the sysroot's /usr/bin/crossscripts refers to files in the
> libtool-cross work directory.  Hopefully this explains most of the failures this
> upgrade caused (between it and the kernel, my latest MUT run had 73 failures).

Hi Ross,

Sorry, I've fixed the error, I will send libtool's upgrade with other
upgrades in another thread (autogen-native, automake, gettext,
mklibs-native).

// Robert

>
> Ross

