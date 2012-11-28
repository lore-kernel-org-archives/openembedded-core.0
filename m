Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TdXZ9-00074i-6k
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 03:39:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAS2PiLP006087
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Nov 2012 18:25:44 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 27 Nov 2012 18:25:42 -0800
Message-ID: <50B5763B.1040107@windriver.com>
Date: Wed, 28 Nov 2012 10:26:03 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1354021038-26183-1-git-send-email-muhammad_shakeel@mentor.com>
	<CAP9ODKqLkqZ=AtU9SNVfXRFxs04LnsQEe-9iE0nsU34Yru2pnw@mail.gmail.com>
In-Reply-To: <CAP9ODKqLkqZ=AtU9SNVfXRFxs04LnsQEe-9iE0nsU34Yru2pnw@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev 182: Create a symlink of /lib/udev/udevd in /sbin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 02:39:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/2012 10:15 PM, Otavio Salvador wrote:
> On Tue, Nov 27, 2012 at 10:57 AM, Shakeel, Muhammad
> <muhammad_shakeel@mentor.com>  wrote:
>> From: Muhammad Shakeel<muhammad_shakeel@mentor.com>
>>
>>  From udev 174 changelog:
>> "The udev daemon moved to /lib/udev/udevd. Non-systemd init systems
>> and non-dracut initramfs image generators need to change the init
>> scripts. Alternatively the udev build needs to move udevd back to
>> /sbin or create a symlink in /sbin, which is not done by default."
>>
>> Also for 64 bit architectures there exists /lib64/udev instead of
>> /lib/udev and current init script fails to start udev.
>>
>> Signed-off-by: Muhammad Shakeel<muhammad_shakeel@mentor.com>
> As far as I know, all code in master now handles it properly (the
> missing bits I sent a patch today) so why to include this symlink?
>
I'm not sure about this.

Two things:

1) Have we ever tested udev on a target where its ${base_libdir} is 
'/lib64'?
Apparently, if udevd is intalled under '/lib64', its init script cannot 
start udev correctly.

2) Bug#2804 is related to to udev and ${base_libdir}.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=2804
(Some packages hardcode their udev rules directory to be 
'/lib/udev/rules.d/'. So can udev find them if the ${base_libdir} is 
'/lib64'? )





