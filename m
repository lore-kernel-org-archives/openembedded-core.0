Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <slapinid@gmail.com>) id 1Rdgd8-0003Uq-2g
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 12:16:10 +0100
Received: by wibhq7 with SMTP id hq7so2498903wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 03:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=MeqyKzKgvn5Of3cUmqVy8a1N/Df/ok3cNGGzSv9ctqM=;
	b=mcSE4hwxtf4iN2R9BKNyreQdfViQR6iZwvOXSgb6txNHDeWaARmQpkgJ7L1WG9+EkV
	mh+nJDfJbp7S6QoRaoN14rF/qQ3c4pbJL2vOU+rw0dsvYOXPY3pWCcXLi2tLqBJd3wHC
	0NWS5be1Sz01vmEMJ8NBjxP8WtaXoItiPzNL4=
MIME-Version: 1.0
Received: by 10.180.81.72 with SMTP id y8mr22371675wix.14.1324552144228; Thu,
	22 Dec 2011 03:09:04 -0800 (PST)
Received: by 10.216.167.69 with HTTP; Thu, 22 Dec 2011 03:09:04 -0800 (PST)
In-Reply-To: <1324487225.18348.11.camel@ted>
References: <1324289521-10140-1-git-send-email-b19537@freescale.com>
	<C27D8181-0988-4BF7-A858-BC873D7C47F8@dominion.thruhere.net>
	<CA452391058F6D4E9715FB2C29D9312A010B915F@039-SN2MPN1-023.039d.mgd.msft.net>
	<1324297600.4568.170.camel@ted>
	<CA452391058F6D4E9715FB2C29D9312A010B9EEF@039-SN2MPN1-023.039d.mgd.msft.net>
	<1324487225.18348.11.camel@ted>
Date: Thu, 22 Dec 2011 14:09:04 +0300
Message-ID: <CAFZPMobmLhrHoPo9devpvdgw_OSWXbR0_aiLc7bp5-ce+QG0yQ@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH oe-core] valgrind: add powerpc into the compatible host list
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
X-List-Received-Date: Thu, 22 Dec 2011 11:16:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2011 at 9:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-12-21 at 06:21 +0000, Luo Zhenhua-B19537 wrote:
>> Since nobody confirm that it works on mips, I will create a new patch to=
 define COMPATIBLE_HOST as following, does it make sense?
>> =A0 =A0 =A0 COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64|ppc|ppc6=
4|arm).*-linux'

Does it really work on armv4/v5?

S.


