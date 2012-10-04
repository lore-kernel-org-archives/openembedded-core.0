Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TJqWQ-0001JH-GA
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 20:51:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q94IciKh001456
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Oct 2012 11:38:44 -0700 (PDT)
Received: from msp-dhcp7.wrs.com (172.25.34.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 4 Oct 2012 11:38:44 -0700
Message-ID: <506DD7B3.3010909@windriver.com>
Date: Thu, 4 Oct 2012 13:38:43 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <506DCF4A.5020101@windriver.com>
	<CAHUNapRUMPFYdV8YPjAz2Fw2NgvsXjXJ5gjUo358aRtA3mjdhg@mail.gmail.com>
In-Reply-To: <CAHUNapRUMPFYdV8YPjAz2Fw2NgvsXjXJ5gjUo358aRtA3mjdhg@mail.gmail.com>
Subject: Re: RFC: Secondary Toolchain
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
X-List-Received-Date: Thu, 04 Oct 2012 18:51:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/12 1:15 PM, Trevor Woerner wrote:
> I'm curious to know if anyone (I certainly wouldn't be able to!) can
> take a guess whether this would "play nicely" with external
> toolchains?
>
> In other words, if some recipe is already PROVIDES'ing
> virtual/${TARGET_PREFIX}gcc etc would the correct toolchain be used
> for the special packages needing the secondary toolchain?

My expectations is that any existing dependency set will be managed and 
maintained by the existing primary toolchain, unless a given recipe has a 
specific dependency on a secondary toolchain item.

I.e. the example above will -always- be the primary toolchain from a dependency 
resolution standpoint..

If the recipe adds "virtual/icc", then something, such as icc, needs to exist to 
provide that.

Does this seem like a reasonable behavior and expectation?  (The thing to 
remember is this secondary toolchain is just that.. an alternative to the 
primary for specific users and NOT general purpose....)

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



