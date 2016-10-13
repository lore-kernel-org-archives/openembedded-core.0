Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 11E946B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 03:19:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9D3JbFR019499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Oct 2016 20:19:38 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 20:19:37 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1476253865.git.liezhi.yang@windriver.com>
	<239ab1764ad811a12d8da6eb66ced3fff9987891.1476253865.git.liezhi.yang@windriver.com>
	<CAJTo0LYA0ZPi23Avt1=tyMq4_bDSZui-gdQwWcq1gbJN3B2U4Q@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <ff63db29-b4fd-332a-889c-68dacddb6dcc@windriver.com>
Date: Thu, 13 Oct 2016 11:19:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYA0ZPi23Avt1=tyMq4_bDSZui-gdQwWcq1gbJN3B2U4Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] xcb-proto: create .pyc files for python2
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
X-List-Received-Date: Thu, 13 Oct 2016 03:19:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/12/2016 07:36 PM, Burton, Ross wrote:
>
> On 12 October 2016 at 07:31, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +    cd  ${D}${libdir}/xcb-proto/xcbgen
>     +    python -m py_compile *.py
>
>
> The cd is redundant as you can pass absolute paths to py_compile.

Thanks, updated in the repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/4fixes
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/4fixes

Robert Yang (4):
   xcb-proto: create .pyc files for python2
   xcb-proto: fix for python3
   libxcb: use python3 to build it
   source-highlight: use with-boost-libdir

// Robert

>
> Ross

