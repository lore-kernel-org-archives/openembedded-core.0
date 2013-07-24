Return-Path: <Muhammad_Shakeel@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DD1FC6B333
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 13:21:25 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1V1z0P-0003mg-0S from Muhammad_Shakeel@mentor.com ;
	Wed, 24 Jul 2013 06:21:25 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 24 Jul 2013 06:21:24 -0700
Received: from [137.202.157.119] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Wed, 24 Jul 2013 14:21:22 +0100
Message-ID: <51EFD503.9070404@mentor.com>
Date: Wed, 24 Jul 2013 18:22:11 +0500
From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1374573823-27458-1-git-send-email-muhammad_shakeel@mentor.com>
	<ly4nblpn8m.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <ly4nblpn8m.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 24 Jul 2013 13:21:24.0678 (UTC)
	FILETIME=[B2249660:01CE8870]
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
X-List-Received-Date: Wed, 24 Jul 2013 13:21:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2013 03:46 PM, Enrico Scholz wrote:
> "Shakeel, Muhammad"
> <muhammad_shakeel-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> writes:
>
>> If systemd is supported DISTRO_FEATURE and sysvinit is not and also if
>> systemd_unitdir contains a service file(s) then no need to keep init.d scripts
>> for sysvinit compatibility.
>> ...
>> +            for filename in os.listdir(systemd_unitdir):
>> +                if filename.endswith(".service"):
> why only .service?  Other systemd files (.socket, .mount, .path, ...)
> can also replace initscripts.
>
Other systemd unit files are normally accompanied with a .service file 
(this is just I observed and not mandatory).

If we come across any package which is not providing .service file but 
only some other type of systemd unit file for initscripts replacement 
then we can always add check for that type.
According to systemd documentation there can be 10 types of systemd unit 
files and checking for all here can be a little overhead.

Thanks

