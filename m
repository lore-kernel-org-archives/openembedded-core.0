Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A693260E07
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 02:13:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s272DEOc015173
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Mar 2014 18:13:14 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 6 Mar 2014 18:13:13 -0800
Message-ID: <53192B35.3060807@windriver.com>
Date: Fri, 7 Mar 2014 10:13:09 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1394093112.git.Chong.Lu@windriver.com>
	<9477177f82743adfab34256b7bc002a37dd61787.1394093112.git.Chong.Lu@windriver.com>
	<CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ_OjXVhoNv6wk085=5vY=i64_8T6s=Tef5h7qgFC5Sfw@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Fri, 07 Mar 2014 02:13:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/06/2014 06:04 PM, Burton, Ross wrote:
> On 6 March 2014 08:06, Chong Lu <Chong.Lu@windriver.com> wrote:
>> +PACKAGES += "dbus-ptest"
>> +ALLOW_EMPTY_${PN}-ptest = "1"
>> +RDEPENDS_${PN}-ptest = "${@base_contains('IMAGE_FEATURES', 'ptest-pkgs', 'dbus-test-ptest', 'dbus-test', d)}"
> Nice idea, but wouldn't a more correct solution be to have dbus-ptest
> added to PACKAGES conditionally (instead of always generating
> dbus-ptest and conditionally adding the dependency)?
>
> Ross
>
>
Hi Ross,

Do you mean using PACKAGES += "${@base_contains('IMAGE_FEATURES', 
'ptest-pkgs', 'dbus-ptest-ptest', 'dbus-ptest', d)}" or something else?


Best Regards
Chong

