Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1Tze1R-0005Xb-9z
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 03:00:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0S1irf2028251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jan 2013 17:44:53 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Sun, 27 Jan 2013 17:44:52 -0800
Message-ID: <5105D827.9050108@windriver.com>
Date: Mon, 28 Jan 2013 09:45:11 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<680bfa5f6dd8d3a3e77a18240caab373f03b8006.1359014474.git.Qi.Chen@windriver.com>
	<CAJTo0LbOHCMpEFwCX7i5X1xqEe9FkkssvQUk6beDTLYZwc3gWA@mail.gmail.com>
In-Reply-To: <CAJTo0LbOHCMpEFwCX7i5X1xqEe9FkkssvQUk6beDTLYZwc3gWA@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/12] initscripts: inherit volatiles to support read-only rootfs
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
X-List-Received-Date: Mon, 28 Jan 2013 02:00:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2013 09:11 PM, Burton, Ross wrote:
> On 24 January 2013 08:16,  <Qi.Chen@windriver.com> wrote:
>> +VOLATILE_DIR = "/var/volatile/lib/urandom"
>> +VOLATILE_LINK = "/var/lib/urandom"
> A better solution would be to not attempt to save and restore a seed
> value that is intended to persist across reboots when it's on a tmpfs.
>   Putting the urandom seed into tmpfs is just a waste of time.
>
> Ross
>
>
I agree.

I'll just remove this patch.

Thanks,
Chen Qi


