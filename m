Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TJQGb-0006uj-Rj
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 16:49:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q93Eaf8D020879
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Oct 2012 07:36:41 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 3 Oct 2012 07:36:40 -0700
Message-ID: <506C4D7A.2010300@windriver.com>
Date: Wed, 3 Oct 2012 09:36:42 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1349257892-32178-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: Re: Merging AArch64 support
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
X-List-Received-Date: Wed, 03 Oct 2012 14:49:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/12 4:51 AM, Marcin Juszkiewicz wrote:
> Hello guys
>
> Now, when AArch64 is buildable from public sources it came a time to
> work on merging all changes I had to do to get it working with current
> OE-Core.
>
> All changes are available in:
>
> git://git.openembedded.org/openembedded-core-contrib hrw/aarch64-support
>
> Those are first versions of patches so if anything has to be changed
> feel free to tell. Probably descriptions needs to be updated etc but I
> would like to see some kind of review as it was long time since last
> time I did OE merging stuff.

I was recently told that the glibc components were not yet available, but the 
other toolchain items are.  Has the glibc stuff (and other toolchain items) been 
submitted to oe-core yet?  I didn't see them in any of your commits.

--Mark

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



