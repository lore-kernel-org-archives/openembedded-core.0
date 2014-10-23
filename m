Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C124B65C75
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 06:27:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9N6RZiV006925
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Oct 2014 23:27:36 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 22 Oct 2014 23:27:35 -0700
Message-ID: <54489FD6.4010804@windriver.com>
Date: Thu, 23 Oct 2014 14:27:34 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1413947830.git.wenzong.fan@windriver.com>
	<00f8984de62bbf66c7487bc854c4e5c10ce416fc.1413947830.git.wenzong.fan@windriver.com>
	<CAJTo0LbMFw8TiZkn=nchFCmbA9ZgZhW2+yaQnhg99=g4i3n2=w@mail.gmail.com>
In-Reply-To: <CAJTo0LbMFw8TiZkn=nchFCmbA9ZgZhW2+yaQnhg99=g4i3n2=w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] lsof: fix LSOF_CCV in version.h
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
X-List-Received-Date: Thu, 23 Oct 2014 06:27:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2014 04:03 AM, Burton, Ross wrote:
>
> On 22 October 2014 04:23, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     +-      @echo '#define  LSOF_CCV        "${CCV}"' >> version.h
>     ++      @LSOF_CCV=`${CC} -v 2>&1 | sed -n 's/.*version \(.*\)/\1/p'` &&\
>     ++      echo "#define   LSOF_CCV        \"${LSOF_CCV}\"" >> version.h
>
>
> It seems that a better (and importantly, upstreamable) fix would be to
> pass LSOF_CC correctly to ./Configure instead of overriding in
> do_compile(), and change the LSOF_CCV assignment to run LSOF_CC if _CCV
> isn't already set.

Ok, I'll redo the patch and send V2.

Thanks
Wenzong

>
> (My general approach here is spend a little more time getting a fix
> upstreamed so that we're not fixing our patch every few months)
>
> Ross
>

