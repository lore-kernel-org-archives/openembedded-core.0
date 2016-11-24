Return-Path: <prvs=013698ca26=mike.looijmans@topicproducts.com>
X-Greylist: delayed 15816 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Nov 2016 12:15:34 UTC
Received: from mx5-04.smtp.antispamcloud.com (mx5-04.smtp.antispamcloud.com
	[95.211.112.140])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDC3719BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 12:15:34 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx5.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1c9op2-0004yt-V6; Thu, 24 Nov 2016 08:51:58 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 24 Nov 2016 08:51:55 +0100
To: <openembedded-core@lists.openembedded.org>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<e1b37a8090d9fe6d93d6f68301d5c89a45a93b37.1479871728.git.liezhi.yang@windriver.com>
	<1479899811.31880.37.camel@intel.com>
	<adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <a2ff8658-7499-6bc2-929f-1f5e42102706@topic.nl>
Date: Thu, 24 Nov 2016 08:51:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <adc8effe-1856-560a-a7fb-0d92138e1990@windriver.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw4+d5E37wd7o1HkJDyf5UJgKnuyzaS/cmRpVwk4+qL2rtor9O5jjWZI633McN2M/OTqT
	k/5cZTrYv6mkPcUqu2o3bwQrBYmDG/ZcIiCHK6ZlekiBDPeECXijDpY6gSFismUOh0CktS69fvOu
	y4BsuwNZ2zc30K2ieNM+B8faEuzdAggfXrCAVkB3EMf9EvKThSG7X+t1TW39Ja77LGPpOwAvCoh5
	qec1pMkfmnWKMoAW8DXbuMG2Et13CmaQP1Ye+xEf6RBYod7B6Wb6r6S7AhSYI/hZXecKH4YYLgZd
	KfkfW5NV/Z4OJNhaGfH7dxPNuzxHr6u/cB6RmKgwLdIIva5rzOR53mK2sN34HMy+JoRFEIsyUWmx
	6lsOyedOLGGFKZHz5UbN/Al3ZZIE/JObqRB22E6MO50XfD46wv4v/HrW8AUy9furwzjHps/+CPPD
	Q5nY6UdwTAUdOhwsK6fGLom340tPSiXNOl8A3durztC7aP/RwFnMQDUoUsUhofkCy4sZqsNNDlbD
	agg0L3t0nQYy+1rnANBVRukhwtJ4xu9GaIfVaCHpEB6cFH6WJxE4ZsmAxCy5QxlxK8uCfSsTlBEn
	xmLoUUfNb4WqqC+X7gpZUxXHUK2ch9TGCE0GBQseLgmiepQ+A06cITrHTvmuXuE=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Classification: not-spam/combined
X-Recommended-Action: accept
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Thu, 24 Nov 2016 12:15:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 24-11-16 03:01, Robert Yang wrote:
>
>
> On 11/23/2016 07:16 PM, Patrick Ohly wrote:
>> On Tue, 2016-11-22 at 23:49 -0800, Robert Yang wrote:
>>> [YOCTO #10710]
>>>
>>> Otherwise, we can't login as root when debug-tweaks is not in
>>> IMAGE_FEATURES, and there is no other users to login by default, so
>>> there is no way to login.
>>
>> Wait a second, are you really suggesting that OE-core should have a
>> default root password in its default configuration?
>>
>> That's very bad practice and I'm against doing it this way. Having a
>> default password is one of the common vulnerabilities in actual devices
>> on the market today. OE-core should make it hard to make that mistake,
>> not actively introduce it.
>>
>> So if you think that having a root password set (instead of empty), then
>> at least make it an opt-in behavior that explicitly has to be selected.
>> Make it an image feature so that images with and without default
>> password can be build in the same build configuration. Changing
>> base-passwd doesn't achieve that.
>>
>> Even then I'm still wondering what the benefit of a well-known password
>> compared to no password is. Both are equally insecure, so someone who
>> wants to allow logins might as well go with "empty password".
>
> The problem is that when debug-tweaks or empty-root-password is not in
> IMAGE_FEATURE, there is no way to login by default, which will surprise
> the user. How about:

We've used the following workaround for that in settop box images. Basicall=
y,=20
what you want is that login as root without password is possible, since tha=
t=20
can only be done from a local network connection or a serial port, which=20
implies that you have physical access to the device anyway. But you do NOT=
=20
want to be able to login using SSH with a blank password, because you'd=20
typically forward that port from a router. So remove "debug-tweaks" but don=
't=20
kill the logon:

# Some features in image.bbclass we do NOT want, so override them
# to be empty. We want to log in as root, but NOT via SSH. So we want
# to live without debug-tweaks...
zap_root_password () {
	true
}


> 1) Let user can set root passwd via a variable when building.
> 2) Warn the user at build time when the image is unable to login.

Setting a root password at build time is a very very very bad idea. It's on=
ly=20
okay if there's ever going to be only one instance of your product in the w=
orld.

It's much better to have a blank or missing password. At least that makes i=
t=20
possible to check whether the user has configured it already, like for SSH.=
 By=20
default, SSH won't let you in until you have a password or a keyfile, which=
=20
allows your device to be hooked up to the internet without a "gap" where yo=
u=20
could access it with a trivial password.


Having written that, a bit more thought on the initial access is good. I fo=
r=20
one would be glad to get rid of the aforementioned workaround.


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






