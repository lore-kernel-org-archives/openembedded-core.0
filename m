Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id A21B673CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 05:29:26 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Zk3lV-0005ss-Qh; Thu, 08 Oct 2015 07:29:23 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 8 Oct 2015 07:28:24 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <56151883.7000304@topic.nl>
	<75FC5F07-596F-403F-9A25-8BF14FEFBB91@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <5615FF2B.9010402@topic.nl>
Date: Thu, 8 Oct 2015 07:29:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <75FC5F07-596F-403F-9A25-8BF14FEFBB91@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw5xo+yL19ZkIV8F4VBe+tCaqeJUWd0HiubIWOWFjsT3ak+txVq9WXWLUrgamZUeXCmat
	okZZVs3TN0KH5K3UejDvozzwD8UyBt/RL5OGGgyK2SPzK9AbJFPYQGGd2JpvmO+1Yzl35GRFcD8h
	oD1TmJ6ZoVmaXZnrTrhJ8lEjFhZiC4c8L6/14wAV0CyTz//zHBjIEOwIZVBaMhjX7AD+DdM5wTmk
	M9HafFToNFFIa00W17NirEYyqwqMBGrw8ELiqDuwsGtKF8angRTR9uiqGE4i8faU88dU1ZeeRDuK
	WyX/fqb5R4VemuUI6bcEARsm0BwMP+yyyP4XBYTIJakFd0npWSHlBuOe5h511+i8G+61G4rtHofn
	ty3ny7Nxhi/tb8qScuaSWO4wwuxYneZpZbN78uzR9TwUCtitEwkG6Yg2Of354IcncBxB7uicIGwJ
	k4n5y/vcIKE4+MoDT8NV3zf4Qt+dfKmseIPQYs4rYupbFfzn+kZExmIwI1LKDAAyDxYCtn1x/Hwk
	RS8hBFOcoFwK0tfwnjZ/12XlZy3jQSi7kVWClPVvbW5lVyQanRxw5kJFJkw3zL/7VY/UTwytun8Y
	qmh5CVzGULxaKWcg17PgO8mO8LzY9r/U6AUoLJVGfG4rXdbz0LrLaEt0nN2jX/pzQmflAWbkvf70
	miItP3n6
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] Adding machine-specific default packages to an image
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
X-List-Received-Date: Thu, 08 Oct 2015 05:29:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 08-10-15 03:46, Khem Raj wrote:
>
>> On Oct 7, 2015, at 6:05 AM, Mike Looijmans <mike.looijmans@topic.nl> wro=
te:
>>
>> Since our boards needs 'some' bitstream in the FPGA to become somewhat u=
seful, in the machine.conf I say:
>>
>> MACHINE_FPGA_BITSTREAM ?=3D "fpga-image-miami-florida-gen-reference"
>> MACHINE_EXTRA_RRECOMMENDS =3D "${MACHINE_FPGA_BITSTREAM} ..."
>>
>> This puts that into the packagegroup-base-machine RDEPENDS and hence it =
gets installed on the board if you don't specify anything else.
>>
>> However, I want to be able to pick alternative FPGA bitstream providers =
in the image recipe. Without having to define a new machine for each and ev=
ery project=E2=80=A6
>
> would IMAGE_FEATURES help ? IMAGE_FEATURE =3D blue and blue may be car fo=
r one machine and truck for another.

There are virtually unlimited sets of bitstreams. In general, each project=
=20
will define its own if it has special tasks for the FPGA, or it'll just jus=
t=20
the default. They are not directly related to the machine - the FPGA is onl=
y a=20
part of it and doesn't run Linux or so.

I did look into that before posting this, but IMAGE_FEATURES must be set fr=
om=20
a fixed list. There is no such list, each layer could add extra FPGA bitstr=
eam=20
recipes.

The trouble here is that the "image" decides which it is going to be. And t=
hat=20
"image" is often not mine to write, so I can't get away with writing my own=
=20
image class or recipe.


>> Currently, I do this by forcing packagegroup-base-machine and packagegro=
up-base-distro out of the IMAGE_INSTALL list (for some obscure reason, buil=
ding packagegroup-base-distro also results in building the reference bitstr=
eam) and then add MACHINE_EXTRA_RRECOMMENDS directly to the IMAGE_INSTALL l=
ist, so I can set MACHINE_FPGA_BITSTREAM to whichever I'd like to have in t=
his image.
>>
>> I was lookign for a way to have the machine configuration inject its pac=
kages into the IMAGE_INSTALL (or similar) list, so it can easily be overrid=
den in an image recipe.
>>
>> Bluntly putting IMAGE_INSTALL+=3D"${MACHINE_FPGA_BITSTREAM}" into the ma=
chine.conf might work, but doesn't "feel" quite right. But there's apparent=
ly no other way to do this.
>>
>> An alternative would be to introduce an IMAGE_INSTALL_MACHINE variable t=
hat gets added to the PACKAGE_INSTALL variable in image.bbclass. That would=
 allow machines to inject their desirables into the image instead. It's a s=
imple patch, I've pasted it below:
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 86a98bb..90c1c05 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -64,7 +64,8 @@ def check_image_features(d):
>>
>> IMAGE_INSTALL ?=3D ""
>> IMAGE_INSTALL[type] =3D "list"
>> -export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTAL=
L} ${FEATURE_INSTALL}"
>> +IMAGE_INSTALL_MACHINE ?=3D ""
>> +export PACKAGE_INSTALL ?=3D "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTAL=
L} ${FEATURE_INSTALL} ${IMAGE_IN
>> PACKAGE_INSTALL_ATTEMPTONLY ?=3D "${FEATURE_INSTALL_OPTIONAL}"
>>
>> # Images are generally built explicitly, do not need to be part of world=
.
>>
>>
>> Kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>> TOPIC Embedded Products
>> Eindhovenseweg 32-C, NL-5683 KH Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: +31 (0) 499 33 69 79
>> Telefax: +31 (0) 499 33 69 70
>> E-mail: mike.looijmans@topicproducts.com
>> Website: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>>
>>
>>
>>
>>
>> --
>>=20

Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail





_______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


