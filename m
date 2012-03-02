Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S3SiJ-0003a0-OI
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 14:40:04 +0100
Received: by wera1 with SMTP id a1so1091197wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 05:31:32 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.83.97 as permitted sender)
	client-ip=10.180.83.97; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.83.97 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.83.97])
	by 10.180.83.97 with SMTP id p1mr5292054wiy.19.1330695092990 (num_hops
	= 1); Fri, 02 Mar 2012 05:31:32 -0800 (PST)
Received: by 10.180.83.97 with SMTP id p1mr4239852wiy.19.1330695092922;
	Fri, 02 Mar 2012 05:31:32 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm3536674wiy.7.2012.03.02.05.31.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 05:31:32 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330694798.18076.3.camel@ted>
Date: Fri, 2 Mar 2012 14:31:30 +0100
Message-Id: <3707B894-6275-45C8-B2A3-37263D2C9B1C@dominion.thruhere.net>
References: <cover.1330684260.git.liezhi.yang@windriver.com>
	<81a428ea0e7515ab09e707fbdaba9b1a1b5050b6.1330684260.git.liezhi.yang@windriver.com>
	<1330694798.18076.3.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQn1YHPoElab40fIAXMd0C0cdkGPaBWFLsxrmQPX1Nuk1RQsph0//wTLCZsUq4+VYabEkGgX
Subject: Re: [PATCH 1/1] V2 Fix libpam's chmod
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
X-List-Received-Date: Fri, 02 Mar 2012 13:40:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mrt. 2012, om 14:26 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-03-02 at 18:34 +0800, Robert Yang wrote:
>> The libpam's has an error when generating the rootfs:
>>=20
>> chmod: cannot access `/usr/sbin/unix_chkpwd': No such file or =
directory
>>=20
>> This is because the following code in libpam_1.1.5.bb:
>>=20
>> pkg_postinst_pam-plugin-unix () {
>>    # below is necessary to allow unix_chkpwd get user info from =
shadow file
>>    # on lsb images
>>    chmod 4755 ${sbindir}/unix_chkpwd
>> }
>>=20
>> This is to set the setuid permission for unix_chkpwd (the lsb test
>> requires this), but it lacks a "${D}", and we can do this in the =
install
>> stage.
>>=20
>> [YOCTO #2049]
>>=20
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>=20
> Robert, in future patches could you use a subject line like:
>=20
> [PATCH 1/1 v2] Fix libpam's chmod
>=20
> instead of:
>=20
> [PATCH 1/1] V2 Fix libpam's chmod
>=20
> so that when the patches get applied, the V2 is stripped off?
>=20
> The reason is that the value isn't particularly within the repository
> once merged and doesn't look good when looking through commit history.

Actually both versions above are wrong, the right version would be =
similar to:

libpam 1.1.5: fix chmod in postinst

We can debate the usefulness of the version specifier, but we do need to =
follow the commit guide for the rest.

regards,

Koen=


