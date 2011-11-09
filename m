Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ROGtJ-0004wL-F7
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 23:45:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA9McqAn007255
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 14:38:52 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 Nov 2011 14:38:51 -0800
Message-ID: <4EBB00FA.7000007@windriver.com>
Date: Wed, 9 Nov 2011 16:38:50 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: user and group default policies
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
X-List-Received-Date: Wed, 09 Nov 2011 22:45:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

With shadow-utils enabled, a default user and group add policy is installed in
/etc/default/adduser.  This policy specifies that group "1000" is used when
adding new users, unless you specify a group.

Well, we don't have a user 1000 by default, which results in the warning:

useradd: group '1000' does not exist
useradd: the GROUP= configuration in /etc/default/useradd will be ignored

So my question is -- how should we resolve this.  What I see are a couple of
possibilities:

1) We create a default user "group"..  We then adjust the /etc/default/useradd
to use that number... (if we don't user 1000 we'd have to change it.)

2) Remove that setting..  I believe this means that useradd will always add a
group for each user added.

3) -- we do something else..

Any comments?  I'd like to fix this -- but I'm not sure historically if OE has
had a policy on this, or if we need to create one.. If we create one, it needs
to be reasonable for the majority of the oe-core uses.

--Mark


