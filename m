Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 93DD771210
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:58:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9E9w6cK003237
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Oct 2014 02:58:06 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 14 Oct 2014 02:58:06 -0700
Message-ID: <543CF3AB.9030301@windriver.com>
Date: Tue, 14 Oct 2014 17:58:03 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1413275947.git.Chong.Lu@windriver.com>
	<be59231ba5c4dfafcb4d8e9951e8d10414ed0c64.1413275947.git.Chong.Lu@windriver.com>
	<CAJTo0La_gxKvJ3TqiimF4C6tMNmCay7_=NSQSTqo8itTANCtPw@mail.gmail.com>
In-Reply-To: <CAJTo0La_gxKvJ3TqiimF4C6tMNmCay7_=NSQSTqo8itTANCtPw@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Tue, 14 Oct 2014 09:58:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/2014 05:52 PM, Burton, Ross wrote:
> On 14 October 2014 09:39, Chong Lu <Chong.Lu@windriver.com> wrote:
>> The gconfd-2 will be called in org.gnome.GConf.service file and the path of
>> gconfd-2 is ${libexecdir}, this will get following error when multilib exported
>> in the sdk:
>> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
>> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
>> gconf-3.2.6-r0.0.x86_64
>>
>> Changed ${libexecdir} to /usr/libexec to fix this issue.
> Haven't we been here before?  A better fix is to split the library and
> the daemon into separate packages, so in a multilib environment you
> have lib32gconf, lib64gconf, and gconfd (which can be 32- or 64-bit).
>
> Ross
>
>
Hi Ross,

Do you mean we should put /usr/lib64/gconf/gconfd-2 into lib64gconf and  
/usr/lib/gconf/gconfd-2 into lib32gconf?

Best Regards
Chong


