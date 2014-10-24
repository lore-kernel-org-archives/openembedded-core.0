Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 58A5465C9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 02:26:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9O2QIFx004835
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Oct 2014 19:26:18 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 23 Oct 2014 19:26:17 -0700
Message-ID: <5449B8C7.3050304@windriver.com>
Date: Fri, 24 Oct 2014 10:26:15 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1413960370.git.Chong.Lu@windriver.com>
	<0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
	<CAJTo0LZKKpiceby03E=fD6yqpxY4RTBXYKiCfqLgRj6CU4deiw@mail.gmail.com>
In-Reply-To: <CAJTo0LZKKpiceby03E=fD6yqpxY4RTBXYKiCfqLgRj6CU4deiw@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Fri, 24 Oct 2014 02:26:33 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/22/2014 06:07 PM, Burton, Ross wrote:
> On 22 October 2014 08:09, Chong Lu <Chong.Lu@windriver.com> wrote:
>> The gconfd-2 will be called in org.gnome.GConf.service file and the path of
>> gconfd-2 is ${libexecdir}, this will get following error when multilib exported
>> in the sdk:
>> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
>> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
>> gconf-3.2.6-r0.0.x86_64
> I'm clearly not understanding how our multilib implementation works,
> but you don't need many copies of the main gconf package, just one in
> the preferred configuration. What is causing multiple copies of gconf
> to be installed?
>
> Ross
>
Hi Ross,

I configured following in local.conf:

MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
IMAGE_INSTALL = "gconf lib32-gconf"

So multiple copies of gconf to be installed.

Best Regards
Chong



