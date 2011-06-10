Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QVAOQ-0001Re-F1
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 00:41:30 +0200
Received: by wwi18 with SMTP id 18so1172224wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 15:38:09 -0700 (PDT)
Received: by 10.216.239.73 with SMTP id b51mr968648wer.63.1307745489029;
	Fri, 10 Jun 2011 15:38:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o75sm1645745weq.40.2011.06.10.15.38.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2011 15:38:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DF2991B.8090102@intel.com>
Date: Sat, 11 Jun 2011 00:38:06 +0200
Message-Id: <03944B36-5D69-4FA0-A4FE-9E1762F47EC5@dominion.thruhere.net>
References: <cover.1307058256.git.scott.a.garman@intel.com>	<f9c2ad2b00c9fd52962ee7689a809b2b17e4f735.1307058256.git.scott.a.garman@intel.com>	<5D76A268-DA2B-4F5A-BDE0-79211C403B0F@dominion.thruhere.net>	<4DF139D6.3070508@intel.com>
	<779A4D49-D122-4D67-9A8D-B9AA8ABC11DF@dominion.thruhere.net>
	<4DF2991B.8090102@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: shadow errors related to login.defs
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
X-List-Received-Date: Fri, 10 Jun 2011 22:41:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jun 2011, om 00:22 heeft Scott Garman het volgende geschreven:

> On 06/09/2011 02:25 PM, Koen Kooi wrote:
>>=20
>> Op 9 jun 2011, om 23:23 heeft Scott Garman het volgende geschreven:
>>=20
>>> On 06/09/2011 01:50 PM, Koen Kooi wrote:
>>>>=20
>>>> Op 3 jun 2011, om 01:50 heeft Scott Garman het volgende geschreven:
>>>>=20
>>>>> The passwd, group, and login.defs files in the target sysroot will
>>>>> be used when recipes create custom user and group permissions in
>>>>> their packages.
>>>>>=20
>>>>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>>>>> ---
>>>>> .../base-passwd/base-passwd-3.5.22/login.defs      |  386 =
++++++++++++++++++++
>>>>=20
>>>> I'm now getting tons and tons of the following when using shadow:
>>>>=20
>>>> [  900.349395] grpconv[682]: unknown configuration item =
`FAILLOG_ENAB'
>>>> [  900.357391] grpconv[682]: unknown configuration item =
`LASTLOG_ENAB'
>>>> [  900.364196] grpconv[682]: unknown configuration item =
`OBSCURE_CHECKS_ENAB'
>>>> [  900.371734] grpconv[682]: unknown configuration item =
`PORTTIME_CHECKS_ENAB'
>>>> [  900.381042] grpconv[682]: unknown configuration item =
`QUOTAS_ENAB'
>>>> [  900.387878] grpconv[682]: unknown configuration item `MOTD_FILE'
>>>> [  900.394256] grpconv[682]: unknown configuration item `FTMP_FILE'
>>>> [  900.400634] grpconv[682]: unknown configuration item =
`NOLOGINS_FILE'
>>>> [  900.407348] grpconv[682]: unknown configuration item `ENV_HZ'
>>>> [  900.413452] grpconv[682]: unknown configuration item =
`PASS_MIN_LEN'
>>>> [  900.420104] grpconv[682]: unknown configuration item =
`SU_WHEEL_ONLY'
>>>> [  900.426849] grpconv[682]: unknown configuration item =
`CRACKLIB_DICTPATH'
>>>> [  900.433929] grpconv[682]: unknown configuration item =
`PASS_CHANGE_TRIES'
>>>> [  900.441040] grpconv[682]: unknown configuration item =
`PASS_ALWAYS_WARN'
>>>> [  900.448028] grpconv[682]: unknown configuration item `CHFN_AUTH'
>>>> [  900.454376] grpconv[682]: unknown configuration item =
`ENVIRON_FILE'
>>>>=20
>>>>=20
>>>> which seems to be related to the login.defs change.
>>>=20
>>> What context is this happening in? Runtime, or during a buildstep?
>>=20
>> Runtime, during things like adduser and addgroup. I think I'm also =
seeing it during login, but I need to doublecheck.
>=20
> Hmmm...I'm not running into these errors at all. I'm testing it =
against core-image-sato, which does not come with shadow by default. So =
I copy over and install the shadow RPM and start creating users and =
groups, and I'm not getting any errors back. I've also tried running =
grpconv, with the same results.
>=20
> I need more information about your setup to duplicate the error. Which =
image, how was it built, what customizations, etc.

I get them with any image that has shadow installed, the easiest way to =
reproduce would be to build systemd-image with an angstrom setup=


