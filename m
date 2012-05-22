Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SWypy-0005cz-B7
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 01:49:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4MNdlGq021056
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 May 2012 16:39:47 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 22 May 2012 16:39:46 -0700
Message-ID: <4FBC23C1.2030703@windriver.com>
Date: Tue, 22 May 2012 18:39:45 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1337709995-13798-1-git-send-email-jason.wessel@windriver.com>
	<4FBBDF18.9030500@linux.intel.com>
In-Reply-To: <4FBBDF18.9030500@linux.intel.com>
X-Enigmail-Version: 1.4.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-devtools/qemu/qemu.inc: Add jpeg as a dependency
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
X-List-Received-Date: Tue, 22 May 2012 23:49:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/22/2012 01:46 PM, Saul Wold wrote:
> On 05/22/2012 11:06 AM, Jason Wessel wrote:
>> If you use a shared state cache and build a large file system,
>> followed by a small one, the qemu will be built with jpeg support.
>>
> Is jpeg optional for qemu?  Do you know why it's included in the first 
> place?  Can it be disabled via a --disable in the configure stage?
> 


Yes to both.  

Looks like you have already patched it a different way.  I guess
if someone needs the libjpeg they'll bbappend away.

Thanks,
Jason.


