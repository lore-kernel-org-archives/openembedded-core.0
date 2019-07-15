Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EA1627997D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 01:17:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6F1H8OS020902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Jul 2019 18:17:08 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 14 Jul 2019 18:17:08 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
References: <c71ee3805fdb4335ba78791a42ad4257@xbox06.axis.com>
	<CAJTo0LaHEHmxDcQ+s4QHLNzDqyO7mDV9hp4HhSZmVgrsS5xWtA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2701d357-646d-ec8a-4c0b-6120ed448934@windriver.com>
Date: Mon, 15 Jul 2019 09:29:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaHEHmxDcQ+s4QHLNzDqyO7mDV9hp4HhSZmVgrsS5xWtA@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: sysstat no longer builds (was: [PATCH 0/1] sysstat: use service file from source codes)
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
X-List-Received-Date: Mon, 15 Jul 2019 01:17:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2019 07:56 PM, Burton, Ross wrote:
> On Fri, 12 Jul 2019 at 12:21, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>
>>    ERROR: sysstat-12.1.3-r0 do_package: SYSTEMD_SERVICE_sysstat value sysstat.service does not exist
>>    ERROR: sysstat-12.1.3-r0 do_package:
>>    ERROR: sysstat-12.1.3-r0 do_package: Function failed: systemd_populate_packages
>>
>> This is due to that the upstream package only installs the sysstat.service
>> file if cron support is enabled, which it isn't by default.
>>
>> There was another patch by Haiqing Bai sent on July 2 that seemed to handle
>> this properly.
> So the basic problem is that we don't do enough testing with systemd
> enabled on the AB.
>
> Thanks, I'll queue up a revert and pick of the other patch.
>
> Ross
>
I thought I did the test but I actually did not due to PACKAGECONFIG 
setting in local.conf. Sorry about this.
Thanks to Ross for quickly resolving this regression.

Best Regards,
Chen Qi

