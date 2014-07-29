Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 141DE708FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 02:05:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6T25ojO026499
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jul 2014 19:05:50 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 28 Jul 2014 19:05:50 -0700
Message-ID: <53D70191.4080800@windriver.com>
Date: Tue, 29 Jul 2014 10:06:09 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1406525420.git.Qi.Chen@windriver.com>
	<019adf4f704dc8b8c756406d64a8ef683a0567f7.1406525420.git.Qi.Chen@windriver.com>
	<CAJTo0LaHEZXS435nNO05mn89LwoYYfO1tahC72xHY=4rG-5uDg@mail.gmail.com>
In-Reply-To: <CAJTo0LaHEZXS435nNO05mn89LwoYYfO1tahC72xHY=4rG-5uDg@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: Chris Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] volatile-binds: add recipe
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
X-List-Received-Date: Tue, 29 Jul 2014 02:05:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2014 09:00 PM, Burton, Ross wrote:
> On 28 July 2014 06:34, Chen Qi <Qi.Chen@windriver.com> wrote:
>> +# This package is only for systemd based systems. So building it with 'systemd'
>> +# missing in DISTRO_FEATURES makes no sense.
>> +python () {
>> +    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
>> +        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
>> +}
> There's a class to help with this: distro_features_check.bbclass.
>
> Ross
>
>

Got it. I'll send out a V2.

Thanks!

//Chen Qi

