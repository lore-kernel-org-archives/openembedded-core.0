Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3B9D6D299
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 14:42:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rALEgfYN012980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Nov 2013 06:42:41 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 21 Nov 2013 06:42:41 -0800
Message-ID: <528E1BE1.2030003@windriver.com>
Date: Thu, 21 Nov 2013 08:42:41 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1385017169-22068-1-git-send-email-mark.hatle@windriver.com>
	<1385035973.23724.146.camel@phil-desktop.brightsign>
In-Reply-To: <1385035973.23724.146.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 21 Nov 2013 14:42:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/13, 6:12 AM, Phil Blundell wrote:
> On Thu, 2013-11-21 at 00:59 -0600, Mark Hatle wrote:
>> +# When using a read-only rootfs additional setup may be required
>> +# uncomment the following line to make bind start in read-only rootfs
>> +#ALLOW_ROOTFS_READ_ONLY="yes"
>
> If the filesystem is read-only then it's going to be fairly difficult
> for the user to uncomment this line on the target.

A post image process script would be capable of un-commenting that line (or 
simply replacing the file with a specific image specific configuration.)

> Why would you ever want this variable to be set to anything other than
> "yes"?  If your filesystem is not in fact read-only then it isn't going
> to have any effect, and if your filesystem is read-only then bind won't
> work without it.
>
>> ++	[ `is_on_read_only_partition /etc/bind` = "yes" ] && bind_mount /var/volatile/bind/etc /etc/bind
>> ++	[ `is_on_read_only_partition /var/named` = "yes" ] && bind_mount /var/volatile/bind/named /var/named
>
> Is it really necessary to mount a tmpfs at /etc/bind?  Can't those files
> just be relocated somewhere else?

My understanding is both locations need to be RW for bind to work properly.  In 
a normal READONLY filesystem configuration, neither is RW by default.

--Mark

> p.
>
>


