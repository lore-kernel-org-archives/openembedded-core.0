Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF4B66D2FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 12:24:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rALCOKqR004532
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 04:24:21 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 21 Nov 2013 04:24:20 -0800
Message-ID: <528DFB88.5080404@windriver.com>
Date: Thu, 21 Nov 2013 20:24:40 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1385017169-22068-1-git-send-email-mark.hatle@windriver.com>
	<1385035973.23724.146.camel@phil-desktop.brightsign>
In-Reply-To: <1385035973.23724.146.camel@phil-desktop.brightsign>
X-Originating-IP: [128.224.162.213]
Subject: Re: [RFC PATCH] bind: add support for read-only rootfs
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
X-List-Received-Date: Thu, 21 Nov 2013 12:24:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2013 08:12 PM, Phil Blundell wrote:
> On Thu, 2013-11-21 at 00:59 -0600, Mark Hatle wrote:
>> +# When using a read-only rootfs additional setup may be required
>> +# uncomment the following line to make bind start in read-only rootfs
>> +#ALLOW_ROOTFS_READ_ONLY="yes"
> If the filesystem is read-only then it's going to be fairly difficult
> for the user to uncomment this line on the target.

Hi Phil,

I think the user can remount it read-write or just do it at rootfs time.

> Why would you ever want this variable to be set to anything other than
> "yes"?  If your filesystem is not in fact read-only then it isn't going
> to have any effect, and if your filesystem is read-only then bind won't
> work without it.

The purpose is to disable bind in a read-only file system by default.
But if user really wants it, they can set this value to 'yes'.

>> ++	[ `is_on_read_only_partition /etc/bind` = "yes" ] && bind_mount /var/volatile/bind/etc /etc/bind
>> ++	[ `is_on_read_only_partition /var/named` = "yes" ] && bind_mount /var/volatile/bind/named /var/named
> Is it really necessary to mount a tmpfs at /etc/bind?  Can't those files
> just be relocated somewhere else?

I'm afraid not. At least I don't know how.

Best Regards,
Chen Qi

> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


