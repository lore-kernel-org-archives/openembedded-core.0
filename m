Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 694F970018
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 03:02:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4G32YjI022524
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 May 2016 20:02:34 -0700 (PDT)
Received: from [128.224.163.178] (128.224.163.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 15 May 2016 20:02:33 -0700
To: Kyle Russell <bkylerussell@gmail.com>, <rongqing.li@windriver.com>
References: <1435902151-4217-1-git-send-email-rongqing.li@windriver.com>
	<CAFrQVPPFygTrvh12uxDqUmcc+Brz=chU3geE6KfyLr+-C4QLYQ@mail.gmail.com>
From: Yuanjie Huang <yuanjie.huang@windriver.com>
Message-ID: <6f7ebb4b-d925-388e-40d2-2bbf71428fdd@windriver.com>
Date: Mon, 16 May 2016 11:02:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CAFrQVPPFygTrvh12uxDqUmcc+Brz=chU3geE6KfyLr+-C4QLYQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mklibs-native: two fixes
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
X-List-Received-Date: Mon, 16 May 2016 03:02:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kyle,

The fix_cross_compile.patch is related when we pass the sysroot or 
libdir to mklibs, in such case it is wrong to call dpkg-architecture as 
info on build machine instead of target will be returned.

Thanks,
Yuanjie

On 05/12/2016 04:00 AM, Kyle Russell wrote:
> ++    if sysroot != "" or libdir != "":
> ++        return paths
> +     devnull = open('/dev/null', 'w')
> +     dpkg_architecture = subprocess.Popen(
> +         ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],


