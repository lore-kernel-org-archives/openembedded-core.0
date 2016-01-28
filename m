Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3A263731F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 06:46:25 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aOgLM-0004Iy-Tq; Thu, 28 Jan 2016 07:46:20 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 28 Jan 2016 07:46:09 +0100
To: Robert Yang <liezhi.yang@windriver.com>, Denys Dmytriyenko
	<denis@denix.org>, <openembedded-core@lists.openembedded.org>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<56A6F7B2.8080203@windriver.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <56A9B931.7090608@topic.nl>
Date: Thu, 28 Jan 2016 07:46:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <56A6F7B2.8080203@windriver.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarwx7W1n9OSJBAPEwDSA5mFtAxknIZzWiZliiKIbIVH+CjCReFegq0lWTwMXLj/5beX8yS
	tiKU+m6mq0U1yRvSCVaivTEE5q87sh6LtRLye9rACp7ss2kv3JkaVcJOPqi9q7aK/TuY41mSOt9z
	HDdjPzmco1TDpPh7u2MAenThYn0lr+1EH5/5/eK+3qQBVkFJ488pZ3jNiZSM4LsOPpuz+mH1A1Lp
	ScoZ4i2Ls29gTcOOGVt9w/VuqGlTyDLAGsC1wQ7Zy3NaGObINT0JVwZ+Z4JyxlYxXGewaTASCPee
	/VKF3Og/lDkMUGXobiJJ37afR/K9DsJsg0gNxLnClbL4jlhCkIi1tKRCJifpU+xlLrGtaYTCblT8
	/3W4ZeTRQNkgKGvM5HneYraw3fgczL4mhEXQod4MeUxktK4S3ajinGvC7VVsnw/69hJ6udSOUaW3
	iCf+32ZI/w9oW+hkYZbvMNkRB54Cl6Yd43LwqZ4P3V7k1h/94XRvOSV5s/FO8TBkb1ss+n2ffnQx
	t6aJ7klZab9nKqr10eypuXj215oyTAwNHtXoa5tDurXoVJC8eZtkBzJLnBedltE2wsB40xZ9Oyt1
	SGEBK8IP5w5YmIR4S4uD5mcqCy/CNC+HLr452qwdbGiH1Wgh6RAenBR+licROGZMnUtxwOXNWRJM
	b8tmTpGZxeFxkbH15FghbUBMjaU/Upy0+ZBvpbxOa1YnghnVA0KN8KXqIps7p1yaGlDBZG+H
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00241215552189)
X-Recommended-Action: accept
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] stress-ng: add 0.05.09
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jan 2016 06:46:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 26-01-16 05:36, Robert Yang wrote:
>
>
> On 01/26/2016 11:34 AM, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> A clean room re-implementation and extension of the original stress tool=
.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>   meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb | 15 ++++++++++++=
+++
>>   1 file changed, 15 insertions(+)
>>   create mode 100644 meta/recipes-extended/stress-ng/stress-ng_0.05.09.b=
b
>>
>> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
>> b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
>> new file mode 100644
>> index 0000000..2e92c53
>> --- /dev/null
>> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
>> @@ -0,0 +1,15 @@
>> +SUMMARY =3D "A tool to load and stress a computer system"
>> +HOMEPAGE =3D "http://kernel.ubuntu.com/~cking/stress-ng/"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a=
4263"
>> +
>> +SRC_URI =3D "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.=
gz"
>> +
>> +SRC_URI[md5sum] =3D "fe65047991f654ffaac3c59ea9537763"
>> +SRC_URI[sha256sum] =3D
>> "d785b5f2df042d42c43ddfd5bbafa19151ed96f0c483d7f44c737f492b52ddd6"
>> +
>> +CFLAGS +=3D "-Wall -Wextra -DVERSION=3D'"$(VERSION)"' -O2"
>
> Why hardcode -O2, please ? It impacts the DEBUG_BUILD.

And while your at it, why force-feed "-Wall -Wextra" to the compiler? It wi=
ll=20
just make the compilation take longer and generate a bigger log file that n=
o=20
one will ever read, but it won't make a difference in the output.

>
> // Robert
>
>> +
>> +do_install() {
>> +    oe_runmake DESTDIR=3D${D} install
>> +}
>>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail

Visit us at: Embedded World 2016 Germany, Hall 1, stand number 220.
Click here to schedule an appointment with us at Embedded World, free ticke=
t included

http://topicembeddedproducts.com/schedule-an-appointment/



