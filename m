Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QPbIS-0003Kt-3z
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 16:12:20 +0200
Received: by vxd7 with SMTP id 7so604794vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 07:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=mnbtemsTbsgmRDxRRETwEb3u6ntKzm4r9SsTrFtoGms=;
	b=KaxPKnz6M3OZBH1aps4pV+qTVwqSUKxNnyKdAPMrMwpOC+DSnr3QSgD8CbZ19NivhT
	qGqg4CiRILa0fyPfPLWMTAlIlwnpLNlJqmikv13NK9OVfWGrJcBclPK1tu//QF/KGAaU
	uTCtDVCXdy5ocU7dgOUbIosNl9wlI7x2RmkEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=TE3andG70Gp0ue6pyeHaIagMQhqNTfXWVO5y7bxGqfPOmjHB36QXrfxuwsvgTm/d7Z
	Aeo9sTSlL5SumbcHHo98dnnBLKM2TJMHrZUPyIu0OTo7MC0EGMGx3S2hKwAVktEYRcfG
	kbUzRvGYgGbFzqBH1QqRwpGuHqCKF3Wy/eMFY=
Received: by 10.52.183.164 with SMTP id en4mr1265924vdc.108.1306418955036;
	Thu, 26 May 2011 07:09:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.109.202 with HTTP; Thu, 26 May 2011 07:08:55 -0700 (PDT)
In-Reply-To: <4DDE5A8F.5050101@linux.intel.com>
References: <cover.1306385875.git.dvhart@linux.intel.com>
	<c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
	<732E0947-423B-4DD0-BA56-4C11313BD5DA@beagleboard.org>
	<4DDE5A8F.5050101@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 May 2011 07:08:55 -0700
X-Google-Sender-Auth: qS3br-BI0fnMIks0_T4zV_cfh6w
Message-ID: <BANLkTi=VWVtuC1N6+tRYbHNFM_O1Y_8GkA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [pull-oe-uboot 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Thu, 26 May 2011 14:12:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2011 at 6:50 AM, Darren Hart <dvhart@linux.intel.com> wrote=
:
>>> -UBOOT_MACHINE ?=3D "${MACHINE}_config"
>>> +python () {
>>> + =C2=A0 =C2=A0if not bb.data.getVar('UBOOT_MACHINE', d, 1):
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug("To build %s, see u-boot_git.bb f=
or instructions on \
>>
>> If this file was renamed, don't you also want to update this printout?
>
> Oh, tricky. This should be addressed in the 2/2 patch.... but what to
> name it too. Do I have access to the filename of the recipe that
> included this one, causing this code to run? Perhaps I should move the
> instructions into this .inc file since the u-boot_*.bb recipe name will
> change over time if my 2/2 patch is accepted?
>

FILE should refer to the recipe, if it's not evaluated until the end
of the parse process, so I expect you could just use it in the
anonymous python snippet. Would definitely want to confirm that though
:)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


