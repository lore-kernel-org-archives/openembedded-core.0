Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX19tc4EdVJq5CwyDCISlo2TPXEBGNWOif2o=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QpNhd-0006IO-Ob
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:56:54 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p75GqNQu023262;
	Fri, 5 Aug 2011 11:52:24 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <2706988A-EDF1-4963-AC3D-065238FAF8D9@kernel.crashing.org>
Date: Fri, 5 Aug 2011 11:52:26 -0500
Message-Id: <1D9E81EA-A7A5-4D30-B310-9385C86506DE@kernel.crashing.org>
References: <1311858624-3686-1-git-send-email-galak@kernel.crashing.org>	<37BC502A-3FEA-4059-85FB-F6A3F401C3F9@kernel.crashing.org>	<4E3985C8.9070000@linux.intel.com>	<D9C996B9-65E0-4373-90F5-5B5286E05444@kernel.crashing.org>	<1312410888.2344.718.camel@rex>
	<0BDD06D6-757A-4F43-B38E-95C857324D14@kernel.crashing.org>
	<4E3A1813.3010906@linux.intel.com>
	<2706988A-EDF1-4963-AC3D-065238FAF8D9@kernel.crashing.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/oe-buildenv-internal: Add	SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Fri, 05 Aug 2011 16:56:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

>>>>>>> On Jul 28, 2011, at 8:10 AM, Kumar Gala wrote:
>>>>>>>=20
>>>>>>>> If a SOCKS5 gateway is needed for a proxy access like git it =
might also
>>>>>>>> require authentication to the proxy via a password and =
username.  Adding
>>>>>>>> SOCKS5_USER&   SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for =
automation
>>>>>>>> of the authentication request to occur when something like a =
git fetch
>>>>>>>> is going through the proxy.
>>>>>>>>=20
>>>>>>>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>>>>>>>> ---
>>>>>>>> * Fixes issue with a git fetch request failing to get pass a =
firewall
>>>>>>>>=20
>>>>>>>> scripts/oe-buildenv-internal |    2 +-
>>>>>>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>>>>>>=20
>>>>>>>> diff --git a/scripts/oe-buildenv-internal =
b/scripts/oe-buildenv-internal
>>>>>>>> index c13fc40..b223292 100755
>>>>>>>> --- a/scripts/oe-buildenv-internal
>>>>>>>> +++ b/scripts/oe-buildenv-internal
>>>>>>>> @@ -55,4 +55,4 @@ unset BITBAKEDIR
>>>>>>>> export BUILDDIR
>>>>>>>> export PATH
>>>>>>>>=20
>>>>>>>> -export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC =
http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy =
SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE =
BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND"
>>>>>>>> +export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC =
http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy =
SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE =
BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND SOCKS5_PASSWD =
SOCSK5_USER"
>>>>>>>> --
>>>>>>>> 1.7.3.4
>>>>>>>=20
>>>>>>> Ping on this patch
>>>>>>>=20
>>>>>> Kumar,
>>>>>>=20
>>>>>> I think you were asked to modify this patch so that the additinal
>>>>> SOCKS5_* do not get into sstate, Paul Eggleton provided the
>>>>> BB_HASHSPACE_WHITELIST info.
>>>>>>=20
>>>>>> Please update this patch
>>>>>>=20
>>>>>> Thanks
>>>>>> 	Sau!
>>>>>=20
>>>>> =46rom the thread it sounded as if that was NOT needed.  As =
nothing
>>>>> refers to SOCKS5_* we didn't need to add it.  Much like how it =
doesn't
>>>>> have SSH_AGENT_PID or SSH_AUTH_SOCK in it.
>>>>=20
>>>> It would be good is someone could confirm it but its in the =
environment
>>>> so it likely is needed.
>>>=20
>>> Not sure I follow.  Confirm what?
>>>=20
>> Kumar,
>>=20
>> I think Richard wants you to confirm that the SSH_* and SOCKS5_* =
information is not stored in the shared state hash.
>=20
> How?

Still looking for directions on how to verify this.

- k=


