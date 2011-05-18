Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QMkyM-0006Qb-Qv
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:55:51 +0200
Received: by pwj9 with SMTP id 9so893297pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 10:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=XUMftwQzulSdWuj6wX30VmWcxNhpGRovA3dNF6y9bI4=;
	b=xsywv+YK2qkZIjYV4qpphJz5yjDJo7Bs20zPPLsvKr35b3zj43uN6OrK5fG1Z1PQym
	BK9oqu3/9Gb2HMkX9muQAGlFkkWWY96NvOoa6/HvD/mfaaEHtvmLxIuubjvO1aL2mhOc
	mMbTzCwnr7KXqPoAdiT2TeQOtC07vrCs8Jzdg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=eYW6Y6yYXD+yWV0a629vAXOwkqGefwWO7gjKvb7ItzawiUw6mJdbs3+Dlrsuwwvs7i
	PD45nY76KJCFuUdTQzqVRWvnzN39yhz3l4q1jlQ7OjkreoI4b//3AcmsiJM658rhC3TJ
	vfjzdDvg2DhbFgLJthpxD3ILavf3dY6BT000w=
MIME-Version: 1.0
Received: by 10.68.20.202 with SMTP id p10mr3377512pbe.270.1305741170639; Wed,
	18 May 2011 10:52:50 -0700 (PDT)
Received: by 10.68.59.9 with HTTP; Wed, 18 May 2011 10:52:50 -0700 (PDT)
In-Reply-To: <8A91C5F6-313A-4A0F-A18E-094CFC3BB337@dominion.thruhere.net>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
	<BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
	<1305738527.18415.126.camel@lenovo.internal.reciva.com>
	<8A91C5F6-313A-4A0F-A18E-094CFC3BB337@dominion.thruhere.net>
Date: Wed, 18 May 2011 19:52:50 +0200
Message-ID: <BANLkTinvqEeyXsiH79UHb3Zhx+qkXZRJ5w@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Wed, 18 May 2011 17:55:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, May 18, 2011 at 7:29 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 18 mei 2011, om 19:08 heeft Phil Blundell het volgende geschreven:
>
>> On Wed, 2011-05-18 at 09:40 -0700, Khem Raj wrote:
>>> Problem I have is, I dont want udev in RDEPENDS which is added by
>>> task-core-boot
>>> and task-core-boot is added to DISTRO_EXTRA_RDEPENDS through
>>> default-distrovars.inc -> defaultsetup.conf -> bitbake.conf
>>>
>>> and my distro adds DISTRO_EXTRA_RDEPENDS to its RDEPENDS
>>> as I think the variable is meant for distro's to define some extra
>>> stuff if needed.
>>>
>>> How should I solve this problem ?
>>
>> Well, what I did in micro-base-image was simply to not use
>> task-core-boot at all. =A0But in your case I was thinking that you could
>> overlay that recipe with from your distro's layer and make it do
>> whatever you wanted.
>
> The fact that we have layers does not mean we need to follow the silo men=
tality you seem to prefer. If task-base in oe-core stops being usefull we s=
hould fix it, now play around in our own little sandboxes.
>
If task-base is getting less useful, removing it altogether (I found
the  reasons mentioned by Phil convincing)  should be at least
considered as an alternative.

I am not sure why we should keep task-base as something generic --all
distro's have their own specific requirements and configurations, even
for task-base, so why not move this functionality into the distro and
out of oe-core?

I never quite saw what task-base gained us on a netto basis, but I
think I am biased towards small tweaked images, so these are just my
two cents.

Regards,
--=20
Leon


