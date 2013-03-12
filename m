Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UFY0J-0004mA-T1
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 23:49:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2CMWQ7F015319
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 15:32:26 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 12 Mar 2013 15:32:26 -0700
Message-ID: <513FACF7.5000907@windriver.com>
Date: Tue, 12 Mar 2013 17:32:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: update-alternatives and kernel modules
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
X-List-Received-Date: Tue, 12 Mar 2013 22:49:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I have someone who is trying to use update-alternatives with kernel modules.

They discovered that the rename code changes the name of the module to end in 
.ko.${BPN}.  While the package.bbclass code specifically looks for the file name 
to end in '.ko' in order to avoid stripping the modules... so of course the 
modules get stripped and no longer work properly.

So my question is, is it even reasonable to use update-alternatives with kernel 
modules?  If it is, we probably need to change the trigger in packages.bbclass 
to look for either .ko or .ko.${BPN} (or something similar).

Any comments/suggestions?
--Mark


