Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TyZqY-0006lR-W3
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 04:20:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0P35I3I016644
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2013 19:05:18 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Thu, 24 Jan 2013 19:05:17 -0800
Message-ID: <5101F677.4040108@windriver.com>
Date: Fri, 25 Jan 2013 11:05:27 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<dc49f51db3966ad18b51e6c8c10ee792db58bbc0.1359014474.git.Qi.Chen@windriver.com>
	<CAJTo0LYpPTLBFczuC-QiPNm7W5u5nwQHf48SO5BKB5S+nHjHUA@mail.gmail.com>
In-Reply-To: <CAJTo0LYpPTLBFczuC-QiPNm7W5u5nwQHf48SO5BKB5S+nHjHUA@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/12] dbus: inherit volatiles to support read-only rootfs
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
X-List-Received-Date: Fri, 25 Jan 2013 03:20:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/24/2013 06:45 PM, Burton, Ross wrote:
> On 24 January 2013 08:16,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Inherit volatiles.bbclass to support read-only rootfs.
> Please explain why DBus needs volatiles.bbclass to support a readonly
> rootfs.  Presumably it's because the machine UUID is written to
> /var/lib, are there any other reasons?
>
> Ross
>
>
I added this patch because I encountered an error when starting the sato 
image.
That is, the machine UUID needs to be written to /var/lib.

I'm not familiar with dbus. Is it not necessary?

Thanks,
Chen Qi


