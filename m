Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id BE2DA6011B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 06:20:01 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v946K1lj000600
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 4 Oct 2017 08:20:01 +0200
Received: from [192.168.253.100] ([163.242.56.100])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id v946K0rF009831
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 4 Oct 2017 08:20:00 +0200
To: Andre McCurdy <armccurdy@gmail.com>
References: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
	<CAJ86T=Xh4HZO8e-u6r9gn0nCx+ZbzkjV+AJOP3-Cgt1fF3xr7w@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <bb590f7b-67d0-f106-785f-9f4ecf3127a0@siemens.com>
Date: Wed, 4 Oct 2017 08:20:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Xh4HZO8e-u6r9gn0nCx+ZbzkjV+AJOP3-Cgt1fF3xr7w@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] busybox updating
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
X-List-Received-Date: Wed, 04 Oct 2017 06:20:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I have compared no/suid links between these versions. So, I was trying
to enable the same applets like in older version and do not enable the
new one. Some applets could not be disabled (they are automatically
enabled) due to dependencies.

For this version of defconfig the new applets are:
chrt
cttyhack
init
lzcat
mdev
nproc
setsid
xzcat
partprobe

On 10/03/2017 08:12 PM, Andre McCurdy wrote:
> On Tue, Oct 3, 2017 at 8:38 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
>> Update busybox to version 1.27.2
>> Fix CVE-20177-5325
>>
>> Changes:
>> - busybox: 1.24.1 -> 1.27.2:
>>  - fixed link creation to shell
>>   - reported bug with suid shells [https://bugs.busybox.net/show_bug.cgi?id=10346]
>>  - removed and modified already merged patches
>>  - updated defconfig regarding to new version
> 
> Did you compare the list of applets enabled before and after the
> update? Any notable changes?
> 

