Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1RoRzl-00049L-VA
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 04:52:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0L3iJfE005790
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 19:44:19 -0800 (PST)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 20 Jan 2012 19:44:19 -0800
Message-ID: <4F1A3402.6030501@windriver.com>
Date: Sat, 21 Jan 2012 11:41:54 +0800
From: Zumeng Chen <zumeng.chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.24) Gecko/20111108 Lightning/1.0b2 Thunderbird/3.1.16
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1327043851.git.zumeng.chen@windriver.com>	<1ec175b060ec79949989bbe4df546eff5a942e70.1327043851.git.zumeng.chen@windriver.com>
	<1327077129.4268.13.camel@ted>
In-Reply-To: <1327077129.4268.13.camel@ted>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q0L3iJfE005790
Subject: Re: [PATCH 1/1] rspro-conf: remove usbgadget from routerstationpro
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
X-List-Received-Date: Sat, 21 Jan 2012 03:52:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=E4=BA=8E 2012=E5=B9=B401=E6=9C=8821=E6=97=A5 00:32, Richard Purdie =E5=86=
=99=E9=81=93:
> On Fri, 2012-01-20 at 15:21 +0800, Zumeng Chen wrote:
>> Since the target doesn't have the related requirement
>> to use USB slave hardware supporting usb gadget, so
>> remove it from MACHINE_FEATURES.
>>
>> Signed-off-by: Zumeng.chen@windriver.com>
>> Acked-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>> ---
>>   meta-yocto/conf/machine/routerstationpro.conf |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> Merged to poky thanks. meta-yocto specific patches should really be on
> the yocto list.
Many thanks for reminder, Richard, I'll send to yocto list
next time :-)

Regards,
Zumeng
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



