Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RnG6U-0007jo-Qw
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:58:03 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0HKoO4S014381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 12:50:24 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 17 Jan 2012 12:50:23 -0800
Message-ID: <4F15DF0E.4090100@windriver.com>
Date: Tue, 17 Jan 2012 14:50:22 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <0AB83639-9F7B-450B-9F50-5D1951F2F5C2@dominion.thruhere.net>
In-Reply-To: <0AB83639-9F7B-450B-9F50-5D1951F2F5C2@dominion.thruhere.net>
Subject: Re: How to avoid spurious RPM dependencies?
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
X-List-Received-Date: Tue, 17 Jan 2012 20:58:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/17/12 2:14 PM, Koen Kooi wrote:
> Hi,
>
> I'm running into a problem with vim that seems to be caused by overeager rpmdeps:
>
> | error: Failed dependencies:
> |       /bin/csh is needed by vim-7.2.446-r10.3.armv7a
> |       /usr/local/bin/python is needed by python-imaging-1.1.7-r0.armv7a
>
> For vim I thing it's being caused by this:

The dependency scanner checks that a file is executable before scanning it.

> ./usr/share/vim/vim72/tools/vim132:1:#!/bin/csh
>
> What's the best way to stop rpm from wanting csh? Python-imaging is actually broken:

So in the csh case, if it's an example and not something people would normally 
be executing simply remove the execute bit -- otherwise it's bug and should be 
addressed in some way.  (My preference when I see csh scripts is to execute an 
rm -f)  ;)

> ./usr/bin/pilfile.py:1:#! /usr/local/bin/python
> ./usr/bin/pilprint.py:1:#! /usr/local/bin/python
> ./usr/bin/pilconvert.py:1:#! /usr/local/bin/python
>
> Is #!/usr/bin/env python still the preferred shebang?

Yes, that is the preferred way of referring to python.

--Mark

> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



