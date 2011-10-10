Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1RDEHu-0002r1-Rc
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 13:44:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9ABdBDf012776
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Oct 2011 04:39:11 -0700 (PDT)
Received: from [172.25.32.35] (172.25.32.35) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 10 Oct 2011 04:39:11 -0700
Message-ID: <4E92D95E.3080400@windriver.com>
Date: Mon, 10 Oct 2011 06:39:10 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <1317840239-5290-1-git-send-email-jason.wessel@windriver.com>
	<4E927CD9.2040505@intel.com>
In-Reply-To: <4E927CD9.2040505@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Allow user mode NFS server to run without rpcbind / portmap
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
X-List-Received-Date: Mon, 10 Oct 2011 11:44:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2011 12:04 AM, Saul Wold wrote:
> On 10/05/2011 11:43 AM, Jason Wessel wrote:
>>>  From the 2.6.39 linux kernel and up it is possible to use
>> and nfsroot mount without the need to talk to an RPC info
>> server as long as the port numbers for mountd and nfsd
>> are known in advance.
>>
>> This patch updates the qemu startup scripts and the
>> user mode NFS server to have the ability to start
>> without the need to use rpcbind or portmap services.
>>
> Jason,
>
> I have not fully tested this yet, but if someone has rpcbind and/or
> portmap services are running, what affect will this patch have?
>

It works the same way it did before.  Mountd and nfsd will register with rpcbind / portmap.

All that was done is to use a fall back to not register if the registration service is either denied or unavailable.

Jason.


