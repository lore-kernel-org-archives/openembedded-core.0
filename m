Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id AD579605F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 06:56:51 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1V1t0G-00047K-0E from Muhammad_Shakeel@mentor.com ;
	Tue, 23 Jul 2013 23:56:52 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 23 Jul 2013 23:56:51 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Wed, 24 Jul 2013 07:56:49 +0100
Message-ID: <51EF7AE2.5080908@mentor.com>
Date: Wed, 24 Jul 2013 11:57:38 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1374234806-31680-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAJTo0LYwTk-eP9CCY_TR27Xq_tHUPZ4wVVw9DPObJP04dOSGwA@mail.gmail.com>
In-Reply-To: <CAJTo0LYwTk-eP9CCY_TR27Xq_tHUPZ4wVVw9DPObJP04dOSGwA@mail.gmail.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 24 Jul 2013 06:56:51.0469 (UTC)
	FILETIME=[F9704BD0:01CE883A]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: Remove systemd_unitdir if systemd is not in distro features
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
X-List-Received-Date: Wed, 24 Jul 2013 06:56:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2013 06:59 PM, Burton, Ross wrote:
> On 19 July 2013 12:53, Shakeel, Muhammad <muhammad_shakeel@mentor.com> wrote:
>> If systemd is not supported DISTRO_FEATURE than there is no need to
>> package related service files.
> When this is merged can you follow this up with a series to remove all
> of the conditional installations in oe-core?
>
> Cheers,
> Ross
Yes, I intend to follow this up with removal of conditional check for 
service file installation.

Thanks,
Shakeel

