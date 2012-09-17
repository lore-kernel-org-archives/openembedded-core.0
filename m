Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TDfdy-0006z2-Aj
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 20:02:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Sep 2012 10:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,437,1344236400"; d="scan'208";a="145992836"
Received: from unknown (HELO [10.255.13.193]) ([10.255.13.193])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Sep 2012 10:49:19 -0700
Message-ID: <5057629E.3030400@linux.intel.com>
Date: Mon, 17 Sep 2012 10:49:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1347898621-24929-1-git-send-email-sgw@linux.intel.com>
	<50575042.3090405@mlbassoc.com> <505753AC.1090809@windriver.com>
	<CAJTo0LajpPGxzjXsXw19GJqERFbVihU_fd1js5PpV5Usm2cTug@mail.gmail.com>
In-Reply-To: <CAJTo0LajpPGxzjXsXw19GJqERFbVihU_fd1js5PpV5Usm2cTug@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xserver-xorg: Modify RREPLACES for RCONFLICTS
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
X-List-Received-Date: Mon, 17 Sep 2012 18:02:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2012 10:42 AM, Burton, Ross wrote:
> On 17 September 2012 17:45, Mark Hatle <mark.hatle@windriver.com> wrote:
>> This is deb/opkg style syntax..
>>
>> <package> (<comparison> <version>)
>>
>> So it means ${PN}-module-exa will conflict with any version of ${PN} older
>> then the current version.
>
> Does this actually work?  I was talking to Constantin earlier who was
> attempting a similar migration path for the netbase package split and
> he was having trouble making it do what we'd expect.
>
I used this for the M4 build and it seems to work and installed the xserver.

Sau!

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


