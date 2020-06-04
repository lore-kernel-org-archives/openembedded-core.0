Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.3421.1591229100760423053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 17:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yi.zhao@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05404CSg020383
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 3 Jun 2020 17:04:32 -0700
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 3 Jun
 2020 17:04:22 -0700
Subject: Re: [OE-core] [PATCH] vte: add missing runtime dependency for vte-prompt
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20200603034306.19886-1-yi.zhao@windriver.com>
 <CALbNGRT8SCw8Fwb_gjGgrYgpqf3pkiFkzAo8T9SMZ2LSfFU5-w@mail.gmail.com>
From: "Yi Zhao" <yi.zhao@windriver.com>
Message-ID: <4647aa4d-9eff-745f-bdb4-0a2119a6e4b1@windriver.com>
Date: Thu, 4 Jun 2020 08:04:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRT8SCw8Fwb_gjGgrYgpqf3pkiFkzAo8T9SMZ2LSfFU5-w@mail.gmail.com>
X-Originating-IP: [128.224.162.174]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 05404CSg020383
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 6/4/20 4:19 AM, Andreas M=C3=BCller wrote:
> On Wed, Jun 3, 2020 at 5:43 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>> The /etc/profile.d/vte.sh in vte-prompt package requires
>> vte-urlencode-cwd command which is from vte package.
> Think this is addressed by [1] already
>
> [1] https://lists.openembedded.org/g/openembedded-core/message/139110


Thanks. I didn't notice this before I sent the patch.


//Yi

>
> Andreas
