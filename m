Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TwH2T-0000BD-9I
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 19:52:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2013 10:36:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,494,1355126400"; d="scan'208";a="192722630"
Received: from unknown (HELO [10.255.15.56]) ([10.255.15.56])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Jan 2013 10:35:51 -0800
Message-ID: <50F99607.3080902@linux.intel.com>
Date: Fri, 18 Jan 2013 10:35:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: kevin.strasser@linux.intel.com
References: <1358519642-31022-1-git-send-email-holger@moiji-mobile.com>
	<59506.10.252.133.156.1358533499.squirrel@linux.intel.com>
In-Reply-To: <59506.10.252.133.156.1358533499.squirrel@linux.intel.com>
Cc: Holger Hans Peter Freyther <holger@moiji-mobile.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] archiver.bbclass: Archive the native builds as well
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
X-List-Received-Date: Fri, 18 Jan 2013 18:52:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2013 10:24 AM, kevin.strasser@linux.intel.com wrote:
>> On my build no copy of gcc/opkg-utils was archived. For gcc it is
>> bad as libgcc will end up in the image and the sources should be
>> provided. Update the method and comment to not exclude the native
>> version of the build.
>
> Native packages shouldn't be included in the target image, and therefor do
>not need to have their sources archived for any compliance purposes.
>

Correct, but in this case the gcc package provides the libgcc libraries 
on the target, GCC is a special case since it's source in the 
work-shared directory. There is a libgcc in work/<arch>/libgcc, but it 
only contains the build, the sources are all in the work-shared/gcc dir.

Sau!

> -Kevin
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


