Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UIIjp-00018s-Eu
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 14:07:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2KCob6t021424
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 05:50:37 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 20 Mar 2013 05:50:37 -0700
Message-ID: <5149B097.40106@windriver.com>
Date: Wed, 20 Mar 2013 07:50:31 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1586733.G7AaCq5rbs@helios> <51499277.8000400@linaro.org>
In-Reply-To: <51499277.8000400@linaro.org>
Subject: Re: [RFC] Switching from glibc RPC to TI RPC
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
X-List-Received-Date: Wed, 20 Mar 2013 13:07:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/13 5:41 AM, Marcin Juszkiewicz wrote:
> W dniu 20.03.2013 11:27, Paul Eggleton pisze:
>> On Wednesday 20 March 2013 10:37:17 Marcin Juszkiewicz wrote:
>>> rpcbind needed removal of yellow pages support (whatever it is).
>>
>> Isn't that NIS? Will that affect the ypbind-mt / yp-tools recipes recently
>> added back into meta-networking?
>
> Good point. YP-tools are not buildable with my changeset due to lack of
> YP support in libtirpc.
>

There is definitely a class of user (networking devices) where nis/yp are still 
being used.  I would love to see NIS support be a distro feature or similar 
configure time element.

-after- the upcoming release, I think we should pursue these patches, assuming 
we can get the NIS support enabled in some way.

BTW my only other question was the busybox side.  I'm a bit confused by the 
comment.  I thought the mount_nfs was still required because it enabled the 
proper binding argument for the mount syscall.  While I don't believe we need to 
still support the older kernel(s), we definitely need NFS mounts to work in busybox.

--Mark


