Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7366B214
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 11:19:03 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1V2JZW-0000U4-2P from Muhammad_Shakeel@mentor.com ;
	Thu, 25 Jul 2013 04:19:02 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 25 Jul 2013 04:19:01 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Thu, 25 Jul 2013 12:19:00 +0100
Message-ID: <51F109D5.3010702@mentor.com>
Date: Thu, 25 Jul 2013 16:19:49 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: ChenQi <Qi.Chen@windriver.com>
References: <1374573823-27458-1-git-send-email-muhammad_shakeel@mentor.com>
	<51F1071E.4040304@windriver.com>
In-Reply-To: <51F1071E.4040304@windriver.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 25 Jul 2013 11:19:01.0984 (UTC)
	FILETIME=[C3F82600:01CE8928]
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 25 Jul 2013 11:19:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2013 04:08 PM, ChenQi wrote:
> I just tried this patch out.
> It resulted in the following warning.
>
> WARNING: busybox: NOT adding alternative provide /etc/init.d/syslog: 
> /etc/init.d/syslog.busybox does not exist
>
> I know this warning is harmless. But it's still somewhat misleading. 
> So are we going to do something about it?
>
Yes, I am going to send a V2 and that will handle this warning.

Thanks

