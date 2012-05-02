Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SPalq-0008FN-V3
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:43:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q42EXIB0004635
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 May 2012 07:33:18 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 2 May 2012 07:33:18 -0700
Message-ID: <4FA145AD.4070606@windriver.com>
Date: Wed, 2 May 2012 09:33:17 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
In-Reply-To: <DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
X-Enigmail-Version: 1.4.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Wed, 02 May 2012 14:43:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/02/2012 09:29 AM, Koen Kooi wrote:
> Op 2 mei 2012, om 16:23 heeft Jason Wessel het volgende geschreven:
>
>> The user mode NFS server does not get built by default when you are
>> using a purely command line driven development environment without SDK
>> tools.  In order to accommodate simple test configurations and have
>> all the tools built for the minimal validation with qemu-native,
>> simply add the dependency to unfs-server-native.
> So all images I build for e.g. qemux86 now have an nfs-server? Can we please move settings like that to the specific images?
>

This is part of the simulation environment.  Not all of the run qemu functionality works correctly without this.

Jason.


