Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 450D76C1AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 01:39:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA91dLub029092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Nov 2018 17:39:21 -0800 (PST)
Received: from [128.224.162.215] (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 8 Nov 2018 17:39:20 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
	<1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
	<CAJTo0La+u72y4JiB9dGKGw==FR_8Uwu31pO19eJ78bVfnHj08Q@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5BE4E504.4010809@windriver.com>
Date: Fri, 9 Nov 2018 09:38:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La+u72y4JiB9dGKGw==FR_8Uwu31pO19eJ78bVfnHj08Q@mail.gmail.com>
X-Originating-IP: [128.224.162.215]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] python3: add tk support
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
X-List-Received-Date: Fri, 09 Nov 2018 01:39:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2018年11月08日 21:49, Burton, Ross wrote:
> On Thu, 8 Nov 2018 at 06:09, <mingli.yu@windriver.com> wrote:
>> +            if "tkinter" in pypackage and "tk" in pkgconfig:
>> +                d.appendVar('FILES_' + pypackage, ' ' + "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter*.so")
>> +            if "tkinter" in pypackage and "tk" in pkgconfig:
>> +                d.appendVar('RDEPENDS_' + pypackage, ' ' + 'tk')
>
> Why is this here and not in the manifest?


It's because we can optionally enable or disable tk via PACKAGECONFIG, 
if add it to manifest then we need to always enable tk which is also the 
implement in v1.

Thanks,
Grace

>
> Ross
>

