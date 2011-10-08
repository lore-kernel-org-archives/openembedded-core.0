Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RCYaX-0002Cj-EL
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 17:13:33 +0200
Received: from [192.168.2.9] (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 0EA9FA63F8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Oct 2011 17:06:48 +0200 (CEST)
Message-ID: <4E906707.3000005@eukrea.com>
Date: Sat, 08 Oct 2011 17:06:47 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <D3F85958-4E8C-4D2C-B8BD-C7AF341FAF47@dominion.thruhere.net>
	<1318061333.8533.58.camel@ted>
	<5F487E45-9539-4DE6-AF5F-5664351F86C9@dominion.thruhere.net>
In-Reply-To: <5F487E45-9539-4DE6-AF5F-5664351F86C9@dominion.thruhere.net>
Subject: Re: Bitbake dependency failure with git fetcher
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
X-List-Received-Date: Sat, 08 Oct 2011 15:13:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 08/10/2011 12:27, Koen Kooi a =E9crit :
>
> Op 8 okt. 2011, om 10:08 heeft Richard Purdie het volgende geschreven:
>
>> On Sat, 2011-10-08 at 01:29 +0200, Koen Kooi wrote:
>>> Everytime openssl and a git recipe get changed at the same time, I en=
d
>>> up with:
>>>
>>> | /angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/us=
r/bin/git.real: error while loading shared libraries: libcrypto.so.1.0.0:=
 cannot open shared object file: No such file or directory
>>>
>>> Why is bitbake not resolving the git-native ->  openssl-native dep
>>> before invoking the git fetcher?
>>
>> I suspect you're using rm_work?
>
> Yes I do

same thing here, and same issue when updating git.

Eric


