Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SV5vQ-0006Hx-2C
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 20:59:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4HIni18007433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 11:49:44 -0700 (PDT)
Received: from msp-dhcp29.wrs.com (172.25.34.29) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 17 May 2012 11:49:44 -0700
Message-ID: <4FB54847.5020102@windriver.com>
Date: Thu, 17 May 2012 13:49:43 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1337278931.git.mark.hatle@windriver.com>
	<6152dc105c0eecec81a65b329a3a5a0820eeed26.1337278931.git.mark.hatle@windriver.com>
	<CAMKF1sofgso3eS-AuwFMHh+DBhqgThi6PVDvepeyyaqQW_r7JA@mail.gmail.com>
In-Reply-To: <CAMKF1sofgso3eS-AuwFMHh+DBhqgThi6PVDvepeyyaqQW_r7JA@mail.gmail.com>
Subject: Re: [PATCH 1/4] rpm: Upgrade RPM to 5.4.8 (db to 5.3.15)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 18:59:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/12 1:27 PM, Khem Raj wrote:
> On Thu, May 17, 2012 at 11:25 AM, Mark Hatle<mark.hatle@windriver.com>  wrote:
>> RPM 5.4.8 requires db 5.3.x, so both are upgraded together.
>
> is it also fine to upgrade this on existing devices ? or do databases have to be
> updated too ?

I did limited testing with this, and it was fine to upgrade on an existing 
device.  (I only checked on an IA32 qemux86-64 system.)

One thing I did forget to note in this message.  If you are NOT using 
OEBasicHash, then libzypp/zypper needs to be manually rerun.  The underlying 
interface for a few thing has changed and a recompile is necessary -- OE-core 
doesn't realize it needs to rebuild.  (OEBasicHash fixes that because it sees we 
require RPM, and RPM changed, so we need to rebuild.)

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



