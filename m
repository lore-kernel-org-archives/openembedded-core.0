Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B54C6B3FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 05:48:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6U5m419020001
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Jul 2013 22:48:04 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 29 Jul 2013 22:48:03 -0700
Message-ID: <51F75398.901@windriver.com>
Date: Tue, 30 Jul 2013 13:48:08 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1375065009.git.Qi.Chen@windriver.com>
	<c73f95c035bb32208d7da8be11a50b15f4611174.1375065009.git.Qi.Chen@windriver.com>
	<1375111593.13247.41.camel@phil-desktop.brightsign>
In-Reply-To: <1375111593.13247.41.camel@phil-desktop.brightsign>
X-Originating-IP: [128.224.162.233]
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 08/10] irda-utils: make /etc/sysconfig writable in read-only rootfs
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
X-List-Received-Date: Tue, 30 Jul 2013 05:48:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2013 11:26 PM, Phil Blundell wrote:
> On Mon, 2013-07-29 at 10:33 +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> This diretory needs to be writable, the following error will appear
>> at system start-up.
>>
>>     /etc/rc5.d/S20irattach: /etc/sysconfig/irda: Read-only file system
> The whole chunk of code in that script that's trying to write
> to /etc/sysconfig seems bogus.  I think the right fix is just to delete
> it rather than trying to provide a a volatile implementation
> of /etc/sysconfig (which seems like a contradiction in terms).
>
> p.
>
>

After a second look at the script, I think you're right.
Thank your for pointing it out :)
I'll fix this in my V3 patchset.

Best Regards,
Chen Qi

>


