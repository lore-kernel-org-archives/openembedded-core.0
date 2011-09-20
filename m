Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R65lY-0007wP-Pi
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 21:14:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8KJ8gg6026587
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 12:08:42 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 20 Sep 2011 12:08:41 -0700
Message-ID: <4E78E4B9.1060608@windriver.com>
Date: Tue, 20 Sep 2011 14:08:41 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <E7A9054A5ACABE48B0E540E46E862B0F011EC4@NAEMMAIL01.na.leapfrog.com>
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F011EC4@NAEMMAIL01.na.leapfrog.com>
Subject: Re: Correct way of having the PN package depend on the other packages?
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
X-List-Received-Date: Tue, 20 Sep 2011 19:14:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/20/11 2:03 PM, Daniel Lazzari wrote:
> I noticed a problem with the alsa-utils package where the alsa-utils package does not depend on all of the little extra packages it's supposed to pull in. I'm not sure what the best way to fix this is though. Can anyone give me a little guidance or point me at a recipe that does this correctly already?

If you are using the RPM backend, I'm currently working on something that may
resolve this issue for you.  Hopefully ready today.

Otherwise, switch to ipk or deb and see if you get the same behavior.

--Mark

> Thanks,
> 
> Dan Lazzari Jr.
> Firmware Engineer
> dlazzari@leapfrog.com
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



