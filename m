Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZ26d-0004Ps-GH
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 16:39:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5LEZWbV020402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 07:35:32 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 21 Jun 2011 07:35:32 -0700
Message-ID: <4E00AC33.6080500@windriver.com>
Date: Tue, 21 Jun 2011 09:35:31 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1308658461.20015.24.camel@rex>
	<BANLkTimMLo4g7uWsrhAr=hun4wZ6AaDjQg@mail.gmail.com>
In-Reply-To: <BANLkTimMLo4g7uWsrhAr=hun4wZ6AaDjQg@mail.gmail.com>
Subject: Re: Multilib Development Update
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
X-List-Received-Date: Tue, 21 Jun 2011 14:39:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/21/11 8:02 AM, Frans Meulenbroeks wrote:
> As I already asked before: what is the benefit having this in embedded systems?
> 
> If I am doing an embedded system I know the target hardware, and there is no
> need to have e.g. both 32 and 64 bit libs.

64-bit database on a 32-bit system.

64-bit "userspace" device drivers on a 32-bit system.

Being able to run a binary application for compatibility.  This is fairly common
in some embedded areas where they need something like mips o32, but the rest of
the system is running n32 for performance.

etc...

This is something that most embedded systems won't use, but there are a large
class of devices, primarily Carrier Grade devices, that do require mixed-mode
systems.

--Mark

> Frans.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



