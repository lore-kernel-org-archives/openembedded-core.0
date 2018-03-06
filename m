Return-Path: <prvs=06030b7175=mike.looijmans@topicproducts.com>
X-Greylist: delayed 1138 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 Mar 2018 14:13:33 UTC
Received: from out2-2.antispamcloud.com (out2-2.antispamcloud.com
	[185.201.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 23693789F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 14:13:33 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx43.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1etBj9-0008GE-Fo; Tue, 06 Mar 2018 13:30:54 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 6 Mar 2018 13:28:53 +0100
To: Quentin Schulz <quentin.schulz@bootlin.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180305082233.8493-1-quentin.schulz@bootlin.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <1a37561b-5f40-3435-a1fd-5aeb2a5acad2@topic.nl>
Date: Tue, 6 Mar 2018 13:28:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180305082233.8493-1-quentin.schulz@bootlin.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-AntiSpamCloud-Domain: topic.nl
X-AntiSpamCloud-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-AntiSpamCloud-Outgoing-Class: ham
X-AntiSpamCloud-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5lMmMfF+tJ2Wkl+q3cYujP1602E9L7XzfQH6nu9C/Fh9KJzpNe6xgvOx
	q3u0UDjvO/g8qvXryHBxBFfOCqxgZeierPYA1IhKA2BW1QLxBGWoBvlEbxwdRH3hG/5wJHRdcdR+
	8HojTXJ3B6Zuoq5fw8lz/3e0SnxCyhAPQHdV5dqpkaKRA6ceRpqoWlz96jWf6WiJWL/dxrmD96va
	w4mBRxsBcORxfCojcTOpEjtvWHp2/xt/nxZRqmzOIMaeZqNx/JIxUPZpIiOJ2+726V3wKDryAO7C
	7HzLGRKZEulrATbMIRFsicyJMEhQFtD8PLoinuYUcfEloDWv8y1k883/5L6WZvJ82v5qqDoKQEdl
	LW3+VM5Id7+GANvLtbMKKO3b12xTPHtUQWuqLHsWgCg1Hl1Ch4/BoUr51xumqgDvkAOcpSQY67ML
	ugWnEvNSWGezW2vJ8EC5nkS34sbG2b1t1gIa2g0zRKS089/GR/nxHXVtUvcE+6BC6sWr28M3V90M
	/7JmH6c7cHZMfUxfJDLzxtMHXjNCHtw7hBmI60teZwIr6+6JLwivUN4+iD3H0bnMHoxJ4/tP7LpA
	V9e4/IZ+noiHGvpzzikyn8bGLoxQ/wwR++DuIQUs/5JJj4C/n4CILslAoAq3fcYT61JyOhXihV9e
	nkMVIEfvX/noXp5nvt4lyAXK+0MOzR5uJrj7l9KbGnkxbFU0wjhtdR15L5J+1bxthWJcDArBQLlQ
	+zm4f1mvzr/0KYM9I9ZfiNV6UvEAfNM+m4WpRRDP6YzwkAPgQJY6esHm6kLAWQvwn+A+FUYa7mn3
	b7xTXt3w0FCYEAb4zDWYHp1t92nQBh2Xn3OP83gtWiE6JilRsYQPQ46kDZIS2qOcrJevGzVya8jZ
	pTnddn6m+UeFXprlCOm3BAEbJtB0qctqzZmCeuqx7oaqOmvYO4pi1vr7A4oVaEdmxKMVgU5zNiv/
	Yigg/b+fPZ1Ut4VknRDjH7QY7Fm+gQ0M40rB1CKJk5ycE+JMum+xOx7pLUmj6+ZLiP3cHUAE2k5j
	sXPHTXhIrVzYteKGVryF5qVZ
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Cc: thomas.petazzoni@bootlin.com
Subject: Re: [PATCH] busybox: mdev: make mdev auto load modules at boot
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
X-List-Received-Date: Tue, 06 Mar 2018 14:13:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 05-03-18 09:22, Quentin Schulz wrote:
> Thanks to the MODALIAS line at the beginning of mdev.conf, mdev supports
> module auto probing on hotplug.
>=20
> However, this does not work for cold plugged modules (i.e. modules for
> devices that were probed before mdev is added as hotplug handler).
> Running mdev -s to replay hotplug events does not work in that case.

I'd rather have this in a seperate bootscript, like this (which performs th=
e=20
same but applies a filter):
https://github.com/topic-embedded-products/meta-topic/tree/master/recipes-c=
ore/module-init-tools

This gives users a choice as to whether or not they want this to happen.

Another note: Since this runs at each and every boot, it'd be wise to optim=
ize=20
this for performance. That "sort -u" might be bad for performance, and=20
modprobe doesn't mind if modules were already probed.



> Let's manually modprobe all modules in the rootfs.
>=20
> Taken from:
>   - https://github.com/buildroot/buildroot/commit/07f46c2b6daec44a6176039=
c90be67e66c4c2e42
>   - https://github.com/buildroot/buildroot/commit/b4fc5a180c81689a982d5c5=
95844331684c14f51
>=20
> We need xargs to support zero termination of args so let's enable this
> configuration in the fragment for mdev.
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
> ---
>   meta/recipes-core/busybox/busybox/mdev.cfg | 2 ++
>   meta/recipes-core/busybox/files/mdev       | 1 +
>   2 files changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-core/busybox/busybox/mdev.cfg b/meta/recipes-co=
re/busybox/busybox/mdev.cfg
> index 6aefe90e43..0d60fc9560 100644
> --- a/meta/recipes-core/busybox/busybox/mdev.cfg
> +++ b/meta/recipes-core/busybox/busybox/mdev.cfg
> @@ -9,3 +9,5 @@ CONFIG_SETSID=3Dy
>   CONFIG_CTTYHACK=3Dy
>  =20
>   CONFIG_FEATURE_SHADOWPASSWDS=3Dy
> +
> +CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM=3Dy
> diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/bus=
ybox/files/mdev
> index 8c9c06e96c..165b275256 100755
> --- a/meta/recipes-core/busybox/files/mdev
> +++ b/meta/recipes-core/busybox/files/mdev
> @@ -9,6 +9,7 @@ touch /dev/mdev.seq
>   #sysctl -w kernel.hotplug=3D/sbin/mdev
>   echo "/sbin/mdev" > /proc/sys/kernel/hotplug
>   mdev -s
> +find /sys/ -name modalias -print0 | xargs -0 sort -u -z | xargs -0 modpr=
obe -abq
>  =20
>   #
>   # We might have mounted something over /dev, see if /dev/initctl is the=
re.
>=20



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




