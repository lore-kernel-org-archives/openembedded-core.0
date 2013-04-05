Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UOAJt-0002LW-3a
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 19:21:27 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz11so2142429pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=zIID2XU1yCe2CTamCtmm8P+BVS06IyMgCEhGzTBbtm4=;
	b=zNjAjsdXHSRXgjA4afWf2hSsRADOr+YlqaXR/kt1RSZ+W+67ANoiPy0NFdeNKu4TUn
	dyZ/0D9MV2NZBr3mxJ3oavxefgNe+n5K74P7Ue9hvXQ/LX8/Sj6KA01LJczG7x5b2JQs
	NHfpsfJInmhjxxPjS297b/fD2Ew2isHixvyuxYpPDvpChvIOzgVOdHnMe4cQg3IcO/Wd
	C7aDyEL8kjwDmKgLvqaHLtDgGOaFEMz5ZLZrqvDRsBhDpGHEpwm2w90v+5EQgPd2nhUk
	+0TmKuNsC9a8XLubFTu8W3tPhnMd/1XZC/qNv8FQPp9/6X6EAl6AdjrGYcCoTXbH1OAn
	F+8A==
X-Received: by 10.66.145.166 with SMTP id sv6mr16575577pab.1.1365181421867;
	Fri, 05 Apr 2013 10:03:41 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id hp1sm16764415pac.3.2013.04.05.10.03.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 10:03:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <515EFD76.2090009@communistcode.co.uk>
Date: Fri, 5 Apr 2013 10:03:38 -0700
Message-Id: <0CA85874-9D57-4E2A-B47D-79DAAD3E78A6@gmail.com>
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
	<515EFD76.2090009@communistcode.co.uk>
To: ml@communistcode.co.uk
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-cross-initial Failure
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
X-List-Received-Date: Fri, 05 Apr 2013 17:21:32 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Apr 5, 2013, at 9:36 AM, Jack Mitchell <ml@communistcode.co.uk> =
wrote:

> I build for the beaglebone and I changed them in line with your =
default beaglebone build patch you posted a week or so ago. I think it =
moved it form soft to hard float possibly...

yes do a clean build if possible=


