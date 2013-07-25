Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 257996AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 10:09:35 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1V2IUI-0002Mj-E5 from Muhammad_Shakeel@mentor.com ;
	Thu, 25 Jul 2013 03:09:34 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 25 Jul 2013 03:09:33 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Thu, 25 Jul 2013 11:09:31 +0100
Message-ID: <51F0F98C.8080401@mentor.com>
Date: Thu, 25 Jul 2013 15:10:20 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1374573823-27458-1-git-send-email-muhammad_shakeel@mentor.com>
	<ly4nblpn8m.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51EFD503.9070404@mentor.com> <2332743.8PXxt6HHNa@helios>
	<CAJTo0LYi3+yOEVFPgfN8Q4NCg+8bwsViTXK386x4vk-TijB3nA@mail.gmail.com>
In-Reply-To: <CAJTo0LYi3+yOEVFPgfN8Q4NCg+8bwsViTXK386x4vk-TijB3nA@mail.gmail.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 25 Jul 2013 10:09:33.0898 (UTC)
	FILETIME=[0F98B2A0:01CE891F]
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [PATCH] systemd: Remove init.d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Thu, 25 Jul 2013 10:09:35 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2013 02:56 PM, Burton, Ross wrote:
> On 24 July 2013 14:55, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> Would it work to simply check for any files instaled into systemd_unitdir?
> Agreed - the list of file types has grown over time so we'd been
> constantly chasing systemd, and it's not like anything else is dropped
> into this directory.
>
> Ross
Ok, I will send a V2 with updated check.

Thanks

