Received: from mail-lb0-f174.google.com ([209.85.217.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UdqNg-0000xl-Ga
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 01:17:49 +0200
Received: by mail-lb0-f174.google.com with SMTP id u10so3470803lbi.33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2013 15:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=K2bKRNNQmgbof4ei6eY8cRxazNuWzh1HT4AO82+F2vw=;
	b=fpmDoSXKNuwgvfetWC/wrHufz79KyO+7jUYdr3htqknwDvQJzx/FqdbcIA7adwAVn3
	LeMgt2d2r6+NrJR9nzgD5LJbLKqU18KRCrYq0qXPSGwFVF0poC0XvOKvGDZyR5m3qJCG
	k0zbNh0WjFqDbs6bt0vluPOdMirPEKq0tpPPAI1qHX8pQqZTdF51OyrYf1UWukdkGl04
	IraOKcMnpIETgXvj3Wld2uYg7JqKSIPh45qgaCc0JFafbqYLKANlqsbSLiR3hOe9Ne9I
	qfK20bN+t6F3bNS6UkCuU8vB9clVZSk6Ba7qMLvnpYLTNUkCPSSCCXG44e1yFt/s8VRq
	iI/w==
MIME-Version: 1.0
X-Received: by 10.112.20.199 with SMTP id p7mr24855287lbe.71.1368917962359;
	Sat, 18 May 2013 15:59:22 -0700 (PDT)
Received: by 10.112.135.136 with HTTP; Sat, 18 May 2013 15:59:22 -0700 (PDT)
In-Reply-To: <276E57F3-518F-4A46-A7FB-0CE89A519905@gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
	<D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
	<alpine.DEB.2.02.1305140423590.26605@oneiric>
	<CADkTA4O1VFk1juzepWzjV1FjF9F2J_A83ga92USdgxwegd3Qwg@mail.gmail.com>
	<alpine.DEB.2.02.1305140824360.23009@oneiric>
	<CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
	<alpine.DEB.2.02.1305180850090.20316@oneiric>
	<276E57F3-518F-4A46-A7FB-0CE89A519905@gmail.com>
Date: Sun, 19 May 2013 00:59:22 +0200
Message-ID: <CAAQYJAtCNDiC6m9RJNxDhn_3edo4pqDsmftK8K+6rB7uLjej7A@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 May 2013 23:17:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, May 18, 2013 at 6:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On May 18, 2013, at 5:50 AM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>
>>
>>  just FYI, did a fresh build for qemumips64 from updated oe-core
>> layer alone, and it seems to work fine. i think it's a keeper.
>
> thanks. Now expecting people to build world with qemumips64 and report issues.

Well, I can already say that klibc (meta-initramfs layer) fails to
compile. Help much appreciated upstream.

Regards
Andrea


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


