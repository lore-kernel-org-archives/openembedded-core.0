Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9A1A6FF1D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:18:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5GFIQMB015549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jun 2014 08:18:33 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Jun 2014 08:18:29 -0700
Message-ID: <539F0AC4.9000505@windriver.com>
Date: Mon, 16 Jun 2014 23:18:28 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1402926503.git.liezhi.yang@windriver.com>
	<e79079ad10954af18bad63ad1ab8939ceda7fbac.1402926503.git.liezhi.yang@windriver.com>
	<CAJTo0LbMvPG1N1_vY5eb6MN+AYbgKbJdxbeDqQChbGZ460+jQQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbMvPG1N1_vY5eb6MN+AYbgKbJdxbeDqQChbGZ460+jQQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] guile: depends on texinfo-native
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
X-List-Received-Date: Mon, 16 Jun 2014 15:18:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/16/2014 11:14 PM, Burton, Ross wrote:
> On 16 June 2014 14:49, Robert Yang <liezhi.yang@windriver.com> wrote:
>> +DEPENDS = "libunistring bdwgc gmp libtool libffi texinfo-native"
>
> There's a texinfo class you can inherit, instead of adding the
> dependency directly.

Thanks, I didn't notice we have the texinfo.bbclass now, will test
whether it works or not and update again.

>
> Ross
>
>

