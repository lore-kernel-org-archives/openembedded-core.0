Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TggNQ-0007wg-Fz
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 19:40:55 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Dec 2012 10:26:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,230,1355126400"; d="scan'208";a="258287141"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.117])
	by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2012 10:26:22 -0800
Message-ID: <50C0E34E.8010108@linux.intel.com>
Date: Thu, 06 Dec 2012 10:26:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1354740033-18500-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1354740033-18500-1-git-send-email-cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libpng-1.5.13
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
X-List-Received-Date: Thu, 06 Dec 2012 18:40:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2012 12:40 PM, Marko Lindqvist wrote:
>
> First preparatory patch makes it easier to add multiple major versions of
> libpng. You may choose to commit this one only.
>
> Second patch adds 1.5.13 recipe. This produces library named libpng15, while
> old 1.2.50 recipe produces libpng12. Some older programs (and their recipes)
> may fail to find newer library. So far I'm aware of one such case in
> meta-openembedded; libsdl-image-1.2.10 needs update. I've already submitted
> patch for that one.
>
Overall, it's great to see the recipes updated, but we don't typically 
keep the older versions of recipes around.  So if you want to preserve 
the older version, it should be moved meta-oe.  The only case we keep 
older recipes is for License changes from GPLv2 -> GPLv3 where it makes 
sense.

So, the request would be a v2 that also removes the 1.2.50 recipe.

Thanks
	Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


