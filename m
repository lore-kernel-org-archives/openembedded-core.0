Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67BC87C19C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 01:38:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0G1bMEa016673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jan 2019 17:37:42 -0800
Received: from [128.224.163.218] (128.224.163.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 15 Jan 2019 17:37:14 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190115064546.121351-1-kai.kang@windriver.com>
	<CANNYZj8h07cnf9k8EiDCjd+zpEnm1urJ0FALHwE9F7fATEAafQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <b67225ef-25a9-1681-9e29-6f114eb12cdb@windriver.com>
Date: Wed, 16 Jan 2019 09:37:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj8h07cnf9k8EiDCjd+zpEnm1urJ0FALHwE9F7fATEAafQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps & librepo: fix buildpaths qa warnings
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
X-List-Received-Date: Wed, 16 Jan 2019 01:38:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/1/15 下午5:57, Alexander Kanavin wrote:
> On Tue, 15 Jan 2019 at 07:46, <kai.kang@windriver.com> wrote:
>> Add preprocess option '-fmacro-prefix-map' to TARGET_CPPFLAGS to fix
>> buildpaths qa warnings of libcomps and librepo.
> These warnings are not happening on the AB or on my local setup. Could
> they be happening due to something in your local config?

Hi Alex,

I just enabled buildpaths check in local.conf:

WARN_QA_append = " buildpaths"

Regards,
Kai


> Can you try
> with plain poky master please?
>
> Alex
>

-- 
Kai Kang


