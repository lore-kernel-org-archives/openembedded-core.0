Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6F9605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 09:32:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5P9WlcF020541
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jun 2015 02:32:47 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Jun 2015 02:32:47 -0700
Message-ID: <558BCABE.609@windriver.com>
Date: Thu, 25 Jun 2015 17:32:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1435135356.git.liezhi.yang@windriver.com>
	<bf978a7894f51c909ede7f64c28b6da5495d981a.1435135356.git.liezhi.yang@windriver.com>
	<CAJTo0LZBzMKzzswgtsk0o3uohK+03a4kPB0niwhvyYqxpQBhYg@mail.gmail.com>
	<558B6646.2050809@windriver.com>
	<CAJTo0LbE33NkdmiA_+=NmHAS3hRJY6tdsoGHSQKo2ARAsCgpqA@mail.gmail.com>
In-Reply-To: <CAJTo0LbE33NkdmiA_+=NmHAS3hRJY6tdsoGHSQKo2ARAsCgpqA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] file: 5.22 -> 5.23
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
X-List-Received-Date: Thu, 25 Jun 2015 09:32:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 06/25/2015 05:06 PM, Burton, Ross wrote:
>
> On 25 June 2015 at 03:24, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     It works now, I think that it should be a transient failure. And I think that
>     it is still the best source location since it is suggested by the homepage.
>
>
> $ wget ftp://ftp.astron.com/pub/file/file-5.23.tar.gz
> --2015-06-25 09:58:02-- ftp://ftp.astron.com/pub/file/file-5.23.tar.gz
>             => ‘file-5.23.tar.gz’
> Resolving ftp.astron.com <http://ftp.astron.com> (ftp.astron.com
> <http://ftp.astron.com>)... 38.117.134.18
> Connecting to ftp.astron.com <http://ftp.astron.com> (ftp.astron.com
> <http://ftp.astron.com>)|38.117.134.18|:21... connected.
> Logging in as anonymous ...
> Login incorrect.
>
> Still doesn't work for me.  Anyway, 5.23 is moderately broken (long options
> don't work) so we probably want to wait for 5.24 or take the patch from upstream.

Thanks, let's wait for 5.24.

Btw, it doesn't work for me now, either, now.

// Robert

>
> Ross

