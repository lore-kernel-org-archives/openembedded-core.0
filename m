Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWY5I-0008EO-Qm
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 20:11:28 +0200
Received: by wye20 with SMTP id 20so4696434wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=1lZiTkA6ctTtbsHMbCKjpNm6VzUI/7b90vXQy3wHncU=;
	b=Rq1EifIUsENygKPJbNYaNRbbVuS7m4we3V/mwMIHKLbsQr4hGMVkKK0FnSG+GyGDeo
	1wjxYsQ3Ar4egoWIZIE4bPLv6Ee7Ep8jqM+QnA6lcqwJEnt26Apj1jwCIQK3t/bh9qR5
	rn9SoaeCOxiXY1YeeWUPeoKrnodVPnbcQorEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=lKu/y+vqjOcC2PKjMi3JrY8Ow/CzfCqDWhUWIomI1BIkAmHX0zAM5cNpX47ddyIK6J
	z5LjFL/rhMITZe03rwjgQ5ClDqLCjPGTbuZzb4ipKXynZvCFEPVkfZPCa+0q7YCEPDF4
	YL9gLPA7zpssCXzeXISMvnE+br4FtySHCyG2I=
Received: by 10.216.205.26 with SMTP id i26mr6901378weo.58.1308074882148; Tue,
	14 Jun 2011 11:08:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.37.197 with HTTP; Tue, 14 Jun 2011 11:07:32 -0700 (PDT)
In-Reply-To: <0B94ABA3-4644-41E5-8F1C-C168BF1A1C5B@dominion.thruhere.net>
References: <cover.1307945310.git.raj.khem@gmail.com>
	<c4a7531b0361a57f7f4b2e4d92ae52b563ce0872.1307945310.git.raj.khem@gmail.com>
	<0B94ABA3-4644-41E5-8F1C-C168BF1A1C5B@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 11:07:32 -0700
Message-ID: <BANLkTi=5huGWc6rPMRYphD7aYDRf77EqtQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] eglibc 2.12/2.13: Upgrade SRCREV
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
X-List-Received-Date: Tue, 14 Jun 2011 18:11:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2011 at 9:07 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> It seems that this broke do_patch, could you have a look at it please?
>

for 2.13 its ok on my build box right now. Let me try 2.12

> Op 13 jun 2011, om 08:10 heeft Khem Raj het volgende geschreven:
>
>> We need http://www.eglibc.org/archives/patches/msg00923.html
>> to get through the problem we see when OPTION_EGLIBC_RTLD_DEBUG
>> is disabled. This patch has been backported to both 2.12 and 2.13
>> branches. We bump SRCREVs to have that change.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/recipes-core/eglibc/eglibc_2.12.bb | =C2=A0 =C2=A02 +-
>> meta/recipes-core/eglibc/eglibc_2.13.bb | =C2=A0 =C2=A02 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core=
/eglibc/eglibc_2.12.bb
>> index e69cd0f..d851b5d 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.12.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
>> @@ -4,7 +4,7 @@ DEPENDS +=3D "gperf-native"
>> FILESPATHPKG =3D. "eglibc-svn:"
>> PR =3D "r14"
>>
>> -SRCREV =3D "11982"
>> +SRCREV =3D "14158"
>>
>> EGLIBC_BRANCH=3D"eglibc-2_12"
>> SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH=
};proto=3Dhttp \
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core=
/eglibc/eglibc_2.13.bb
>> index c77bf3c..9a9773c 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.13.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
>> @@ -1,6 +1,6 @@
>> require eglibc.inc
>>
>> -SRCREV =3D "13356"
>> +SRCREV =3D "14157"
>>
>> DEPENDS +=3D "gperf-native"
>> FILESPATHPKG =3D. "eglibc-svn:"
>> --
>> 1.7.4.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


