Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 078656ABCA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:30:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5KDU3JC024976
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jun 2013 06:30:03 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 20 Jun 2013 06:30:01 -0700
Message-ID: <51C303BF.2020404@windriver.com>
Date: Thu, 20 Jun 2013 21:29:35 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1371734594.git.kai.kang@windriver.com>
	<91dd40249c4291e863bb94f9a97245f80e58c0fe.1371734594.git.kai.kang@windriver.com>
	<CAJTo0LZPwsE-v+3rKfQ8q6wjh2fXvgmynqnXJobHhtbHqrRPxw@mail.gmail.com>
In-Reply-To: <CAJTo0LZPwsE-v+3rKfQ8q6wjh2fXvgmynqnXJobHhtbHqrRPxw@mail.gmail.com>
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] tcl: remove hardcoded library install path
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
X-List-Received-Date: Thu, 20 Jun 2013 13:30:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2013年06月20日 21:28, Burton, Ross wrote:
> On 20 June 2013 14:24, Kai Kang <kai.kang@windriver.com> wrote:
>> Fix unit test clock.test fails with boundary year 2099.
>>
>> Remove hardcoded library install path and then install library to
>> ${libdir}.
> Please split these into two patches, as the summary doesn't mention
> the patch at all.
OK, thanks.

>
> Ross
>
>


-- 
Regards,
Neil | Kai Kang


