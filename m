Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2B56D6F66A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 07:59:50 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u57so1761645wes.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 00:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=nS272VBxmO5EqA/20IUKMVmnjyD3rzTTI7awNnZqW1E=;
	b=esyqtQ1z2qs0Ev7G8xt9bMUxdE6riauEN04DrV7XL/8iJ6+E/jLtri7uXoTlzQ6UyU
	CG51gFbVFqnuBNZRK/nVeR8Q5SJ6bsMkpKylvNlWJg6O6AqWB4yDadnDCIHxU0/lgWS2
	jnpTixLfU1PGExQMTVz+GXIRDgDOMJwFIulj7i0yGQwyFD2qbZE8qkRUUENJqIn4MrfW
	Hi5lHd4Jj3OkgTr8A9V/CLw1xfWM7GEiPRqW53iKVgHGsEu+8qfItWu7Po5DzZct1d6r
	zhnRlku/emBVl4BU4IUDeiiNnyUESgOCr36ASRxVkvRl/D2OZuPKQHXrTidcgkzCM9H/
	EiEA==
X-Gm-Message-State: ALoCoQmEu/QcVc2K5JwRRmIFkL2C7ALDmBDzwcO6OQf/MDCNq8IafcbY+lZh0bpJfTHwL29+2j1m
X-Received: by 10.180.221.68 with SMTP id qc4mr4903086wic.30.1394783991011;
	Fri, 14 Mar 2014 00:59:51 -0700 (PDT)
Received: from ?IPv6:2001:610:612::554e:e619:6eeb:4131?
	([2001:610:612:0:554e:e619:6eeb:4131])
	by mx.google.com with ESMTPSA id f3sm14546261wiv.2.2014.03.14.00.59.49
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Mar 2014 00:59:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1394761267.3808.5.camel@ted>
Date: Fri, 14 Mar 2014 08:59:42 +0100
Message-Id: <0D740EA4-F9C7-40AD-A580-C745899C3FEB@dominion.thruhere.net>
References: <1390302081-29499-1-git-send-email-koen.kooi@linaro.org>
	<20140121130110.GC4100@jama> <52DE6FEA.5070300@linaro.org>
	<FA39033B-6625-4625-A550-8A55B5D70FBE@dominion.thruhere.net>
	<1394761267.3808.5.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1874)
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd 208: move stray /usr/lib/systemd/* into /lib/systemd
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
X-List-Received-Date: Fri, 14 Mar 2014 07:59:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 mrt. 2014, om 02:41 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Thu, 2014-03-13 at 10:09 +0100, Koen Kooi wrote:
>> Op 21 jan. 2014, om 14:02 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:
>>=20
>>> On 01/21/2014 02:01 PM, Martin Jansa wrote:
>>>> On Tue, Jan 21, 2014 at 12:01:21PM +0100, Koen Kooi wrote:
>>>>> From: Koen Kooi <koen@dominion.thruhere.net>
>>>>>=20
>>>>> Apps testing for systemd config get confused when both =
/usr/lib/systemd and /lib/systemd exist. This fixes (among other things) =
dracut systemd detections.
>>>>>=20
>>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>>> ---
>>>>> meta/recipes-core/systemd/systemd_208.bb | 6 ++++++
>>>>> 1 file changed, 6 insertions(+)
>>>>>=20
>>>>> diff --git a/meta/recipes-core/systemd/systemd_208.bb =
b/meta/recipes-core/systemd/systemd_208.bb
>>>>> index 6590235..710624c 100644
>>>>> --- a/meta/recipes-core/systemd/systemd_208.bb
>>>>> +++ b/meta/recipes-core/systemd/systemd_208.bb
>>>>> @@ -113,6 +113,12 @@ do_install() {
>>>>>=20
>>>>>         # Delete journal README, as log can be symlinked inside =
volatile.
>>>>>         rm -f ${D}/${localstatedir}/log/README
>>>>> +
>>>>> +	# fix up libdir confusion
>>>>> +	if [ -d ${D}${libdir}/systemd ] ; then
>>>>> +		cp -a ${D}${libdir}/systemd/* ${D}${systemd_unitdir}
>>>>> +		rm -rf ${D}${libdir}/systemd
>>>>> +	fi
>>>>=20
>>>> It's not your fault, but the indentation looks inconsistent with =
rest of
>>>> do_install()
>>>=20
>>> And I did especially pay attention to use tabs after all the meta-oe =
patches I did :)
>>=20
>> Ping
>=20
> This kind of patch sets off all the alarm bells. Why? It becomes
> impossible to know which recipes this is fixing

It's fixing the systemd_208.bb recipe to address runtime issues with =
systemd itself (ignored files in the wrong dir) and issues with runtime =
rootlibdir detection by e.g. dracut. I'm working on a patch for dracut =
to check for systemd binaries instead of 'if [ -d =
/usr/lib/systemd/systemd ]', but I suspect there are a lot more scripts =
out there with similar (broken) logic.

> and whether there are
> other underlying issues.

The underlying issue is that upstream doesn't really care for rootlibdir =
!=3D /usr/lib, which means bugs like this happen :(

> Once added it would be near impossible to
> remove or improve upon.
>=20
> I'd much rather we fix recipes to put files into the correct location
> and thrown errors if they put files somewhere incorrect.
>=20
> I appreciate its tempting to hack around it but I'm not keen...

Systemd 211 should have a partial fix for this, but you still need =
patching for the case where rootlibdir !=3D /usr/lib

regards,

Koen=

