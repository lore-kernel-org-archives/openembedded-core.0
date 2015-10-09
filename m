Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 392CB73CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 11:30:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t99BU9w0003044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Oct 2015 04:30:09 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 9 Oct 2015 04:30:09 -0700
Message-ID: <5617A53F.9070506@windriver.com>
Date: Fri, 9 Oct 2015 19:30:07 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
	<5c927d04a3d915e5949f36f5ec9da9f81d8459bd.1444310101.git.liezhi.yang@windriver.com>
	<CABcZAN=wK-941ihO18dr68bxCa6vnN2LJgSz=LMynfoOZopVzA@mail.gmail.com>
	<CABcZANm6GfP7sqVdcDo2x2v-Uq85Hns7WOG+s3K9j9N1NqG1EQ@mail.gmail.com>
	<CAJTo0Lbe64X4-vG4uBfypz9zDREU6vYiU0LWNk1aFe+CHYzZYg@mail.gmail.com>
	<56171848.4010805@windriver.com>
	<CAJTo0LbgZb=Q+sAd9W82U9Y5AQsR1xcyoRUQy=6HeS5b1LN4XA@mail.gmail.com>
In-Reply-To: <CAJTo0LbgZb=Q+sAd9W82U9Y5AQsR1xcyoRUQy=6HeS5b1LN4XA@mail.gmail.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 09 Oct 2015 11:30:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/09/2015 06:51 PM, Burton, Ross wrote:
>
> On 9 October 2015 at 02:28, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     I'm afraid that realpath is not generally existed on the build host ?
>
>
> It's part of coreutils on my Debian stable box.  I guess the real question is
> "does it exist on Centos 6?".  [looks].  Hmm, it's not present on that.

Ubuntu 14.03 desktop doesn't have it, either.

// Robert

>
> Ross

