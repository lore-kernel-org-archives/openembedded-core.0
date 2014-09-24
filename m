Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1436760167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 08:58:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8O8wBIu018509
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 01:58:12 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 01:58:11 -0700
Message-ID: <5422879B.3020901@windriver.com>
Date: Wed, 24 Sep 2014 16:58:03 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1411473883.git.hongxu.jia@windriver.com>	
	<e33476eb2f61c8a8be679e15114ef90321239dde.1411473883.git.hongxu.jia@windriver.com>
	<1411504641.4189.2.camel@ted>
In-Reply-To: <1411504641.4189.2.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] texinfo: fix info not work
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
X-List-Received-Date: Wed, 24 Sep 2014 08:58:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2014 04:37 AM, Richard Purdie wrote:
> I think there are a few issues here. Firstly, this postinst can run at
> build time which means there is a dependency on texinfo-native. I guess
> if this fails, it will just run on target so its probably "harmless" but
> not deterministic. Secondly, anything installing an info directory
> really needs to update the dir files with its own postinst. For optimal
> handling at rootfs time, that will need trigger/intercept support.

Hi Richard,

Yes, you are right, I will refer Ubuntu to add a script to 
postinst_intercept
to do that, run it after all packages have been installed at build time.

And about trigger, but I have no idea about how to implement it. It seems
we support pkg_postinst/pkg_preinst but don't support pkg_triggers,
Refer triggers in install-info_5.2.0.dfsg.1-4_amd64.deb, we got:
...
interest-noawait /usr/share/info
...

V2 incoming

//Hongxu

> So this probably can merge as it improves things however we need some
> enhacement bugs opening related to this, we may want to force the
> postinst to run on target for now so things are deterministic too.
>
> Cheers,
>
> Richard
>
>


