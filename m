Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rveah-0001nn-M8
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 01:43:55 +0100
Received: by lahc1 with SMTP id c1so2083120lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 16:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=sH8+I9CVWi2YJS9YOBe8Nb+wEd4vCldCkIvgLcB6LMg=;
	b=o69NzNRsajX7ofMwXjLe2ksRK8FDTkL48z58jgojSkyB5JagwkO+4hhypzF1nN3Nt2
	fVPuN6iW5vH3B7KvHDZEp0GOze6U7868PLblv7lfOJV5NVKtVDG+FEexHFiT1Sj49fjl
	a9isZvjRr1u8T6ioT6M+NNIhY0Ovpoh2LqaDg=
Received: by 10.152.125.20 with SMTP id mm20mr2674696lab.6.1328834150261; Thu,
	09 Feb 2012 16:35:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 9 Feb 2012 16:35:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2012 16:35:20 -0800
Message-ID: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Recipes with disabled parallel make
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
X-List-Received-Date: Fri, 10 Feb 2012 00:43:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi

Just grepped for the occurances of disabled parallel make and I see
around 40 cases on oe-core

git grep PARALLEL_MAKE.*=.*\"\" recipes* | grep -v "#"

If someone has time to kill then it would help to see if some of these
are fixed by time or can be fixed

it can help in paralleling the build a bit more.

Thanks
-Khem


