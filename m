Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0D016BBD2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 11:17:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r83BHDJ7010479
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Sep 2013 04:17:13 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 3 Sep 2013 04:17:13 -0700
Message-ID: <5225C515.9010804@windriver.com>
Date: Tue, 3 Sep 2013 19:16:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1378194734.git.liezhi.yang@windriver.com>
	<f6faba2e39ab7055392521e8324ca08f2afa4c03.1378194734.git.liezhi.yang@windriver.com>
	<CAJTo0LYOgNNfeAHWaCYU-QvE+pEKfOmxU0U13iLu5FLKXfewnw@mail.gmail.com>
In-Reply-To: <CAJTo0LYOgNNfeAHWaCYU-QvE+pEKfOmxU0U13iLu5FLKXfewnw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glib-2.0: fix a host contamination issue
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
X-List-Received-Date: Tue, 03 Sep 2013 11:17:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/03/2013 05:51 PM, Burton, Ross wrote:
> On 3 September 2013 08:52, Robert Yang <liezhi.yang@windriver.com> wrote:
>> +    sed -i -e 's/^\(ABS_GLIB_RUNTIME_LIBDIR=.*readlink\) -f/\1 -m/' ${S}/configure.ac
>
> Please do this as a patch instead of a sed.

It seems that sed command is preferred ? For example, we don't have to port the
patch once we upgrade glib-2.0.

// Robert

>
> Ross
>
>

