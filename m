Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SknxW-0006nI-W0
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 05:02:55 +0200
Received: by eekd49 with SMTP id d49so1559726eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 19:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=iRGXFWKkLTIZhNR7oYDyWqVFdJBD7w8olw/qnNUPzDs=;
	b=KcMDq4C4rb7jmkVw2ZbKp5x3Cbxuevptt8lcrq3Q4GddK60UU1dVJ9WZWwLHkHaj/0
	s9zdQtmFzSpP465jZ1luMNjqiu4pqo7RYurxWpsgeugJCy+HxRb8JKoqG3lDhe8em5Ci
	NynKLAl1cfH2p69OqkGMfDJ6gtE3W7UwI15LvjrXZbznWjNhtO9sJnopmEsIObbMySR2
	9+da4/mcIwu9HWwkxhqY5S4o9JHh8oDvnfNkYSaCnxYoudzI38xgTd0Q947xOm8Joyew
	lKjASi51HhfJpipRYoazduTACiAUEBBlIy5IPvajC4okPd6hBlFTmCZYOJ9XM21qvnya
	gh5w==
Received: by 10.14.119.202 with SMTP id n50mr1197449eeh.33.1341024718575; Fri,
	29 Jun 2012 19:51:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 19:51:28 -0700 (PDT)
In-Reply-To: <4FEE292E.6020806@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
	<d273d0ea0fd0059499c54b68ba420043a31f2bb7.1341004548.git.sgw@linux.intel.com>
	<CAMKF1so_1JQY-4eRWZ8Xkq4ixQ7cCmCSVAEohtjRJEFd9KoZiA@mail.gmail.com>
	<4FEE253F.805@linux.intel.com>
	<CAMKF1sp9Nw4ko-8b1TC0u0r+dyyWaO_TbrTKUuFWBribxF-h0w@mail.gmail.com>
	<4FEE292E.6020806@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2012 19:51:28 -0700
Message-ID: <CAMKF1soHT3x5rXN-Z-me8VbJG8xmALF25-=oa8Ws=f3O0iNMBQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] bitbake.conf: Add PACKAGE_BEFORE_PN to PACKAGES
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
X-List-Received-Date: Sat, 30 Jun 2012 03:02:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 29, 2012 at 3:16 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> No it can't appear after because PN is greedy and will grab all the bindi=
r
> and base_bindir executable. =C2=A0If anything I could move PN-bin definit=
ion back
> into lib_package, but I found it clear to define it in bitbake.conf with =
all
> the other PN-* definitions.

right. In this case I think adding a variable is ok probably


