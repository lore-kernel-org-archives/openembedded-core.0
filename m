Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6SmT-0003fH-2a
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:48:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8LJh9ih026118
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 12:43:09 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 21 Sep 2011 12:43:08 -0700
Message-ID: <4E7A3E4C.6080206@windriver.com>
Date: Wed, 21 Sep 2011 14:43:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <4E7A3D3A.1030007@balister.org>
In-Reply-To: <4E7A3D3A.1030007@balister.org>
Subject: Re: Fetch failure for source at kernel.org
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
X-List-Received-Date: Wed, 21 Sep 2011 19:48:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/21/11 2:38 PM, Philip Balister wrote:
> I'm finally trying to get started with oe-core. I'm using a setup 
> created with the setup-script created by Koen. Everything looks ok until 
> it tried to build cpufrequtils. The recipe tries to fetch the source 
> from a git repo at kernel.org. Obviously, the fetch fails.
> 
> What is odd, in the "good old days" I would expect this config to fall 
> back and use the Angstrom source mirror, but apparently this is not the 
> case with oe-core.
> 
> Is this a bug or a feature? If this is a bug, is there a plan to fix it? 
> If it is a feature, how are we supposed to do builds if servers go away? 
> What do we do about GPL compliance?

This is a feature, as people did not want oe-core tied to a given mirror.

Myself, I use:

PREMIRRORS ?= "\
bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
git://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
hg://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
osc://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
p4://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
svk://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
svn://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n"

MIRRORS =+ "\
ftp://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
http://.*/.*     http://autobuilder.yoctoproject.org/sources/ \n \
https://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n"

PREMIRRORS are tried before the upstream source, MIRRORS are tried only after a
failure.  (Please correct me someone if I have that wrong.)

--Mark

> Thanks,
> 
> Philip
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



