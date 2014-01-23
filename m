Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32F4B6D02F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 01:28:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0N1S115021854
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Jan 2014 17:28:01 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Wed, 22 Jan 2014 17:28:00 -0800
Message-ID: <52E0702C.4050402@windriver.com>
Date: Thu, 23 Jan 2014 09:28:12 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1389598673.git.Qi.Chen@windriver.com>
	<1d073230c282c6e62cd24b164bc42f383a55544a.1389598673.git.Qi.Chen@windriver.com>
	<CAJTo0Lb3ysqtjm-fN5vCqpOONEAUH-N+eeC3a=t+PqG8bOWe1g@mail.gmail.com>
	<52D497EA.20301@windriver.com>
	<CAJTo0Lbs0CswS8pQ0D-HudN-B8e6F0z8dBH694xxkrGocexBHA@mail.gmail.com>
In-Reply-To: <CAJTo0Lbs0CswS8pQ0D-HudN-B8e6F0z8dBH694xxkrGocexBHA@mail.gmail.com>
X-Originating-IP: [128.224.162.164]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd-compat-units: make run-postinsts.service work correctly on target
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
X-List-Received-Date: Thu, 23 Jan 2014 01:28:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2014 01:08 AM, Burton, Ross wrote:
> On 14 January 2014 01:50, ChenQi <Qi.Chen@windriver.com> wrote:
>> As you have started working on this problem, I think I'll just drop this
>> patch.
>>
>> After looking at your branch, I think there's only one thing to look out
>> for. When we're using ipk/dpkg as the package back-end, and
>> 'package-management' is in IMAGE_FEATURES, there would be no
>> /etc/*-postinsts.
> I started but didn't finish - as you've taken the systemd bugs could
> you finish this off?  Pretty sure I filed a bug to go with it.
>
> Ross
>
>

OK.

Best Regards,
Chen Qi

