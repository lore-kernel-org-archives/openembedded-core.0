Return-Path: <prvs=0268497409=mike.looijmans@topicproducts.com>
X-Greylist: delayed 3097 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Apr 2017 09:41:59 UTC
Received: from mx18-09.smtp.antispamcloud.com (mx18-09.smtp.antispamcloud.com
	[207.244.64.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB05377A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 09:41:59 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1cvgdv-0000li-UP; Wed, 05 Apr 2017 10:50:23 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 5 Apr 2017 10:50:13 +0200
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-core@lists.openembedded.org>
References: <1491314085.15389.1.camel@andred.net>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <219f123d-e126-1ef7-4f73-ee3080ffbe97@topic.nl>
Date: Wed, 5 Apr 2017 10:50:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1491314085.15389.1.camel@andred.net>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.19)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W/95+6ZE6dI+d
	FNTaLLKrTD4PkK8WOoKuw32u9iEtZmisSr42qUwvK7U11fJ5smF5bE7GwnNXTE7JFCR1ojdwNPLJ
	y1UVQ5eobqUwgxWcNhS8/a3wqJ9QEDVsytmQL5AlnIQeK9m0OSpJdTQT81cI2GbjO41FyBEqIaDu
	dcVplPGNaieKxw/vh63RdlaW2Zj1hcQD6Dxo9kokFZNwiacNPxeTCKssqlJePCDBHWfCYUvWOATT
	vnG+QUCcfrSs6FZc7tZ3vKwSN7Mv0HNteAusUZ8BuYwGqmI8Tx/Ism0pnCcmlWACu0WC7nIKSPYV
	aBAANeo6Hr4UJMIZEVOGlXeApA3I626B4k1VCg2pmPRu/tsFQJrw3CXBQQrpTco7fJK8qWDREgN4
	nnc3zNPE0mSnZr3upx1n/FUf/NwbTI+uRoXlWvXEyVXmV1DcCGMoc6ig/SVaKi0jvtxxX4zA29pu
	2ONYQFX+rhdRbxagFZk9QeUTMKkbMlXz2JUArHA+14sz3sbskoLsCzHbimU89cr33RKm353ztx8x
	waw1cKnsBGxm83Bq3Dr745Bh95etgupgGplHcpVCCoX989hgB8R+yFNe0necuBmgAaEH47pnSozS
	cx6dixYXWS0UC4sPAz0+AzQePLXQzHCxFVh7JpEHm1dVG3udxDVjJl88/rWN0QJAZs8O0qGELL5L
	HSCgBqXfiEc3YcCUDBl3OGV65ZQULuQ0Yt6sBXejfJJliPYr+dnJSZw2WpDy9OSdSQJ8DIJaHEXf
	UijDC0/Rz8RBrz8o0oz7+wVUyggefPEmmLBPACapbEJ69tR6B0KuqSfwE3+xPCboOUgzVvkqUbox
	4bR18A==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: tainting other recipe's specific task
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
X-List-Received-Date: Wed, 05 Apr 2017 09:42:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 04-04-17 15:54, Andr=C3=A9 Draszik wrote:
> Hi,
>
> Is it possible to invalidate one recipe's hash for a specific task from
> another recipe?

I hope not...


> More specifically, I have an initramfs image recipe and a main image reci=
pe
> where do_rootfs of the main image [depends] on do_deploy of initramfs.
>
> If do_rootfs of the main image needs to be re-run, I need to make sure th=
at
> do_rootfs of the initramfs image is re-run (and of course do_deploy) befo=
re.
> Basically I want to add a timestamp to both images, and the timestamp sho=
uld
> be the same.
>
> Using my current dependencies, do_rootfs of the main image is re-run if t=
he
> initramfs is re-deployed:
>
> --- snip main_image.bb: ---
> do_rootfs[depends] +=3D "initramfs:do_deploy"
> --- snap ---
>
> but I need this both ways. Just adding the equivalent to the initramfs
> recipe results in bitbake complaining about a recursive dependency loop.
>
>
> Can this be achieved? Even some pointers would be helpful...
>
>
> Or some other approach where I can add the same timestamp to both images =
if
> either of the images needed to be rebuilt due to some change?

What I did was have two image recipes, let's say "big-image" and=20
"small-image". The big-image included a package called "big-project". To th=
e=20
"big-project.bb" recipe I added:

DEPENDS +=3D "small-image"
do_install[depends] +=3D "small-image:do_image_complete"

And in the do_install I copy the stuff from small-image into whereever I=20
wanted it to be insided the small image.

Maybe this covers your use case?


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






