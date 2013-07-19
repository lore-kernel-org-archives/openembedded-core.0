Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3777B6B262
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 01:59:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6J1x4aS026220
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Jul 2013 18:59:04 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 18 Jul 2013 18:59:04 -0700
Message-ID: <51E89D72.3050101@windriver.com>
Date: Fri, 19 Jul 2013 09:59:14 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1374116641.git.Qi.Chen@windriver.com>
	<7a265612fe08a636afc61a659ac5fadd22b0a7bd.1374116641.git.Qi.Chen@windriver.com>
	<CAJTo0LZDaf+dFDYk0gt-nf0dO1K5YG6nn7RnHbibDpo51_v8kA@mail.gmail.com>
In-Reply-To: <CAJTo0LZDaf+dFDYk0gt-nf0dO1K5YG6nn7RnHbibDpo51_v8kA@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox-syslog: respect /etc/syslog-startup.conf in systemd
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
X-List-Received-Date: Fri, 19 Jul 2013 01:59:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2013 01:07 AM, Burton, Ross wrote:
> On 18 July 2013 08:05,  <Qi.Chen@windriver.com> wrote:
>> 1. The configuration file, /etc/syslog-startup.conf, is ignored.
>>     This is really confusing, as we are used to the behaviour of
>>     changing the configuration in /etc/syslog-startup.conf for the
>>     syslog service. This is actually a weekly test case.
>> 2. The /etc/init.d/syslog is installed, but it has no real usage in
>>     systemd based systems.
>>
>> This patch solves the above two problems by changing the busybox-syslog.
>> service file to let the /etc/init.d/syslog script start syslog service.
>> The /etc/init.d/syslog file is actually a wrapper in this situation.
> (2) can be solved by not installing it (and there's work on-going to
> make the init classes delete scripts that are installed as
> appropriate).
Great. Thanks.

>    I don't like this solution for (1) to be honest - I'd
> prefer to see the logic in a central wrapper that the service (and
> probably the init script) could invoke.

Yes, that makes more sense. I'll rework on this patch.
Thanks for you review.

Best Regards,
Chen Qi
>
> Ross
>
>


