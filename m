Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1Rrtny-0008Q9-NQ
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 17:10:06 +0100
Received: by ggnp4 with SMTP id p4so1822918ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 08:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=TMts4EbI3fHE/lR4Q6ED6bUf/knooIJLveG+4kvffYU=;
	b=vUbDeU+f1aGvFBcLRv8gaOtzbLmdlaaqSGjMdQHotAmFPcMMaAgggtYl/8LKE8xlUi
	1CJoqHxTofnETne/jW1CW+piYFNknyDJLQsDlxwEFzbjNstbSmD5Peq8ON4qHg/wpAfC
	L9G8mmBVh5UqDBVns0Y3MDK9t9mHS+j4WJXTQ=
MIME-Version: 1.0
Received: by 10.182.38.7 with SMTP id c7mr29289004obk.44.1327939332912; Mon,
	30 Jan 2012 08:02:12 -0800 (PST)
Received: by 10.60.3.228 with HTTP; Mon, 30 Jan 2012 08:02:12 -0800 (PST)
In-Reply-To: <87FF40C2-C1D3-42D0-BB4E-50F2F39203EA@dominion.thruhere.net>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
	<1327936840-13937-5-git-send-email-steve@sakoman.com>
	<87FF40C2-C1D3-42D0-BB4E-50F2F39203EA@dominion.thruhere.net>
Date: Mon, 30 Jan 2012 08:02:12 -0800
Message-ID: <CAGDS+nn1XAkuT2rReedWOf7D0fHuS10bXB2ZDRCJPNwNj_zAGA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] zypper: add missing runtime dependences on gzip and gnupg
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
X-List-Received-Date: Mon, 30 Jan 2012 16:10:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 7:29 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 30 jan. 2012, om 16:20 heeft Steve Sakoman het volgende geschreven:
>
>> gzip is required to uncompress repository files
>> gnupg is required for the support of signed repositories.
>>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>> meta/recipes-extended/zypper/zypper_git.bb | =A0 =A04 +++-
>> 1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-e=
xtended/zypper/zypper_git.bb
>> index e5963be..1a6b83c 100644
>> --- a/meta/recipes-extended/zypper/zypper_git.bb
>> +++ b/meta/recipes-extended/zypper/zypper_git.bb
>> @@ -5,7 +5,9 @@ LICENSE =A0=3D "GPLv2+"
>> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3201406e350b39e05a82e28b5020f=
413"
>>
>> DEPENDS =A0=3D "libzypp augeas"
>> -PR =3D "r1"
>> +RDEPENDS =3D "gzip gnupg"
>
> RDEPENDS_${PN} and move it to the proper place in the recipe.

Indeed!  Will resubmit.

Steve


