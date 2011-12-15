Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RbDVj-0008LL-3z
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 16:46:19 +0100
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 673C44B043E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 16:39:17 +0100 (CET)
Message-ID: <4EEA14A3.8070400@eukrea.com>
Date: Thu, 15 Dec 2011 16:39:15 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: meta-toolchain problem
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
X-List-Received-Date: Thu, 15 Dec 2011 15:46:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

while building for 3 different arm platform (armv5, armv6 & armv7), using 
oe-core + meta-oe + meta-angstrom I notice a problem when building 
meta-toolchain-qte or meta-toolchain :
in the armv7a-toolchain, I find 
./usr/local/angstrom-eglibc-x86_64-armv5te/sysroot/x86_64-angstromsdk-linux/usr/bin/ 
which contains native tools, while 
./usr/local/angstrom-eglibc-x86_64-armv7a/sysroots/x86_64-angstromsdk-linux/usr/bin/ 
is empty.
and I notice the same thing in armv6 meta-toolchain-qte.

It seems all the native packages installed in the 3 sdk are using path of the 
1st built sdk (armv5 in the present case) which seems wrong.

Do you have an idea of where to start looking for the reason of this problem ?

Thanks,
Eric




