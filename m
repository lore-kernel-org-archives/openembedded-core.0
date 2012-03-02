Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S3TFS-0007Eg-Qz
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 15:14:18 +0100
Received: by wibhq12 with SMTP id hq12so672917wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2012 06:05:48 -0800 (PST)
Received: by 10.180.100.196 with SMTP id fa4mr5384614wib.0.1330697148042;
	Fri, 02 Mar 2012 06:05:48 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cc3sm10393673wib.7.2012.03.02.06.05.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 06:05:47 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330695560.309.2.camel@ted>
Date: Fri, 2 Mar 2012 15:05:45 +0100
Message-Id: <5E812D36-C010-4494-9622-6536E8443097@dominion.thruhere.net>
References: <cover.1330684260.git.liezhi.yang@windriver.com>
	<81a428ea0e7515ab09e707fbdaba9b1a1b5050b6.1330684260.git.liezhi.yang@windriver.com>
	<1330694798.18076.3.camel@ted>
	<3707B894-6275-45C8-B2A3-37263D2C9B1C@dominion.thruhere.net>
	<1330695560.309.2.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnJdDfLvte2XfTKoTBAt5jZQBD1GeAlwpNvTPOGFTA1vXdOqbFcYVCdd+0kSF+08B1yQLMg
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
X-List-Received-Date: Fri, 02 Mar 2012 14:14:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mrt. 2012, om 14:39 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-03-02 at 14:31 +0100, Koen Kooi wrote:
>> Op 2 mrt. 2012, om 14:26 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Fri, 2012-03-02 at 18:34 +0800, Robert Yang wrote:
>>>> The libpam's has an error when generating the rootfs:
>>>>=20
>>>> chmod: cannot access `/usr/sbin/unix_chkpwd': No such file or =
directory
>>>>=20
>>>> This is because the following code in libpam_1.1.5.bb:
>>>>=20
>>>> pkg_postinst_pam-plugin-unix () {
>>>>   # below is necessary to allow unix_chkpwd get user info from =
shadow file
>>>>   # on lsb images
>>>>   chmod 4755 ${sbindir}/unix_chkpwd
>>>> }
>>>>=20
>>>> This is to set the setuid permission for unix_chkpwd (the lsb test
>>>> requires this), but it lacks a "${D}", and we can do this in the =
install
>>>> stage.
>>>>=20
>>>> [YOCTO #2049]
>>>>=20
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>=20
>>> Robert, in future patches could you use a subject line like:
>>>=20
>>> [PATCH 1/1 v2] Fix libpam's chmod
>>>=20
>>> instead of:
>>>=20
>>> [PATCH 1/1] V2 Fix libpam's chmod
>>>=20
>>> so that when the patches get applied, the V2 is stripped off?
>>>=20
>>> The reason is that the value isn't particularly within the =
repository
>>> once merged and doesn't look good when looking through commit =
history.
>>=20
>> Actually both versions above are wrong, the right version would be =
similar to:
>>=20
>> libpam 1.1.5: fix chmod in postinst
>>=20
>> We can debate the usefulness of the version specifier, but we do need =
to follow the commit guide for the rest.
>=20
> Good point, I was just commenting that the patch version specifier
> didn't look good. As you say, the package name should be first too, as
> per http://wiki.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> under Common Errors in Patch and Commit Messages: '- Short log does =
not
> start with the file or component being modified. Such as "foo: Update =
to
> new upstream version 5.8.9"'.
>=20
> If I was going to be picky, I'd suggest capitalisation of "fix" in =
your
> version ;-)

I'm a bit conflicted on that one. If I'm going to treat it as a sentence =
by using caps, I'd also like to use proper punctuation, which the =
guidelines don't allow. And that's why I said 'similar' :)

regards,

Koen=


