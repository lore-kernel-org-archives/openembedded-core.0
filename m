Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1F5C6CCF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 08:34:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0K8YtFl008753
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jan 2014 00:34:55 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 20 Jan 2014 00:34:55 -0800
Message-ID: <52DCDFB6.2070801@windriver.com>
Date: Mon, 20 Jan 2014 16:35:02 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1390184362.git.Qi.Chen@windriver.com>
	<a023434c6cc916907f190acd62af34ea5a6eaca0.1390184362.git.Qi.Chen@windriver.com>
	<143aeafa800.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <143aeafa800.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
X-Originating-IP: [128.224.162.164]
Subject: Re: [PATCH V3 1/5] systemd: add 'less' to its RRECOMMENDS
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
X-List-Received-Date: Mon, 20 Jan 2014 08:34:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/20/2014 04:06 PM, Bernhard Reutner-Fischer wrote:
> On 20 January 2014 03:23:02 Chen Qi <Qi.Chen@windriver.com> wrote:
>
>> The less command provided by busybox cannot interpret the control
>> character, resulting in obscure output of the journalctl command
>> in a systemd based image.
>
> Can you send me the input containing this control character, please?
>
> Perhaps we can do something sensible about it..
> TIA,

For more details, please refer to 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5723.
You can also add you comments there.

Best Regards,
Chen Qi

>>
>> Add the 'less' package to systemd's RRECOMMENDS so that the output
>> of 'journalctl' looks clear to users.
>>
>> [YOCTO #5723]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  meta/recipes-core/systemd/systemd_208.bb |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_208.bb 
>> b/meta/recipes-core/systemd/systemd_208.bb
>> index 6590235..3c44dec 100644
>> --- a/meta/recipes-core/systemd/systemd_208.bb
>> +++ b/meta/recipes-core/systemd/systemd_208.bb
>> @@ -219,10 +219,12 @@ FILES_${PN}-dev += 
>> "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
>>
>>  RDEPENDS_${PN} += "kmod dbus util-linux-mount"
>>
>> +# Recommend the less package to correctly display the contents of 
>> 'journalctl'
>>  RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
>>                        util-linux-agetty \
>>                        util-linux-fsck e2fsprogs-e2fsck \
>>                        kernel-module-autofs4 kernel-module-unix 
>> kernel-module-ipv6 \
>> +                      less \
>>  "
>>
>>  PACKAGES =+ "udev-dbg udev udev-utils udev-hwdb"
>> -- 
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> Sent with AquaMail for Android
> http://www.aqua-mail.com
>
>
>
>


