Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A019673EFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 02:27:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C2RElC018098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 May 2015 19:27:14 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 19:27:13 -0700
Message-ID: <55516500.6090503@windriver.com>
Date: Tue, 12 May 2015 10:27:12 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1431396786.git.liezhi.yang@windriver.com>	<37d60010ba7e3f90761dc8d7a83c66eda3382481.1431396786.git.liezhi.yang@windriver.com>
	<CAMKF1sp5zzO2Se9099oHQw8Sa1M=aVYxi3=pGPOX0AsLj_hfpQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp5zzO2Se9099oHQw8Sa1M=aVYxi3=pGPOX0AsLj_hfpQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] lttng-tools: separate B and S
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
X-List-Received-Date: Tue, 12 May 2015 02:27:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/2015 10:18 AM, Khem Raj wrote:
>
> On May 11, 2015 7:14 PM, "Robert Yang" <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>  >
>  > It works well with autotools now.
>  >
>  > Signed-off-by: Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>>
>  > ---
>  >  meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb <http://lttng-tools_2.6.0.bb>
> |    4 +++-
>  >  1 file changed, 3 insertions(+), 1 deletion(-)
>  >
>  > diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> <http://lttng-tools_2.6.0.bb> b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> <http://lttng-tools_2.6.0.bb>
>  > index 8cc4220..d1c6293 100644
>  > --- a/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> <http://lttng-tools_2.6.0.bb>
>  > +++ b/meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb
> <http://lttng-tools_2.6.0.bb>
>  > @@ -31,7 +31,9 @@ SRC_URI =
> "git://git.lttng.org/lttng-tools.git;branch=stable-2.6
> <http://git.lttng.org/lttng-tools.git;branch=stable-2.6> \
>  >
>  >  S = "${WORKDIR}/git"
>  >
>  > -inherit autotools-brokensep ptest pkgconfig useradd
>  > +inherit autotools ptest pkgconfig useradd
>  > +
>  > +PR = "r1"
>
> Why bump pr

We always need bump pr when change autotools-brokensep to autotools
to avoid the errors like:

configure: error: source directory already configured; run "make distclean" 
there first
Configure failed. The contents of all config.log files follows to aid debugging

// Robert

>  >
>  >  USERADD_PACKAGES = "${PN}"
>  >  GROUPADD_PARAM_${PN} = "tracing"
>  > --
>  > 1.7.9.5
>  >
>  > --
>  > _______________________________________________
>  > Openembedded-core mailing list
>  > Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>  > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

