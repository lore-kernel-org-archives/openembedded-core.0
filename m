Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4Df1-0007qA-Qu
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:20:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2012 08:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,808,1336374000"; d="scan'208";a="212413992"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2012 08:52:08 -0700
Message-ID: <50350028.6060506@linux.intel.com>
Date: Wed, 22 Aug 2012 08:52:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
	<CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
In-Reply-To: <CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: One X Server To Rule Them All
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
X-List-Received-Date: Wed, 22 Aug 2012 16:20:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2012 08:15 AM, Burton, Ross wrote:
> On 17 August 2012 13:12, Burton, Ross <ross.burton@intel.com> wrote:
>> 1) Investigate differences between xorg/xorg-lite/kdrive, producing a
>> feature matrix and binary size comparison
>
> Some rough numbers: a core-image-sato rootfs for RouterStation Pro
> using kdrive is 25959477 bytes.  Change kdrive to Xorg (Xfbdev and a
> few important modules) and it grows to 26342094 bytes, approximately
> 380kb growth.
>
> It appears that we're also shipping libexa in the core server package,
> when I think that can be split into a separate package as fbdev isn't
> using it.  That will give us another 90kb back.
>
> I'm happy with this size increase as a trade-off for using an X server
> that is actually maintained.
>
+1

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


