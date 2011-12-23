Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RdzKh-0003fS-9J
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 08:14:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBN77E0k009466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Dec 2011 23:07:14 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 22 Dec 2011 23:07:14 -0800
Message-ID: <4EF428A4.9030405@windriver.com>
Date: Fri, 23 Dec 2011 15:07:16 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1324025415.git.xiaofeng.yan@windriver.com>
	<c028203a732e19a12804c479dfcdbf7f61b75767.1324025415.git.xiaofeng.yan@windriver.com>
	<4EF38180.2000408@linux.intel.com>
In-Reply-To: <4EF38180.2000408@linux.intel.com>
X-Originating-IP: [128.224.162.146]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pBN77E0k009466
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] x11-common: Change drive mode of Xfbdev when xserver using framebuffer
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
X-List-Received-Date: Fri, 23 Dec 2011 07:14:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B412=E6=9C=8823=E6=97=A5 03:14, Saul Wold wrote:
> On 12/16/2011 01:15 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> The previous mode of starting X is as follow:
>> $Xfbdev :0 -keybd keyboard -mouse tslib
>> This mode cause that some keys can't be mapped rightly. \
>> for example "Down" have the same function with "Enter".
>>
>> another drive mode "evdev" can work rightly in new version.
>> $Xfbdev :0 -keybd evdev,,device=3D/dev/input/event0 -mouse tslib
>>
>> So I select drive mode "evdev".
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> .../x11-common/x11-common/etc/X11/Xserver | 4 +++-
>> 1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git=20
>> a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver=20
>> b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
>> index 57923e6..d1e17fb 100644
>> --- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
>> +++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
>> @@ -28,11 +28,13 @@ module_id() {
>>
>> ARGS=3D" -br -pn"
>>
>> +KD_DRIVE_KEYBOARD=3D"-keybd keyboard"
>> +KD_DRIVE_EVDEV=3D"-keybd evdev,,device=3D/dev/input/keyboard0"
> Not sure it's such a good idea to hard code the /dev here.
I use "udev" to recognize keyboard device from "event*" automatically.




