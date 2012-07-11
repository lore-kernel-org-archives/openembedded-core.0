Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Soy41-0001Ct-3Z
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 16:38:50 +0200
Received: by wibhq4 with SMTP id hq4so4637386wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 07:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=deTNu61U3OzHw4rH1Am99/R+MBvaWQ1aoQnkNrGbq1s=;
	b=M+lI9YuYdiUoaTTfVFLQSLkKod0ZbpA7aHtWc91DomCv7wsJrx9ImzRvU7dR91g72H
	jOozloHXg9hWR5AMKjuU6vCwa3bskVtU4j99H0OihIPhP3aWtrfzxy6qQyPtHwKa+ptc
	pqURuzt9PEI1m4ISLsFvVqXYHIt8cUKG1eMZokx+EAKOqHa/O0Ib2EysiVwjexxFrBCQ
	8adrhM/yGvwj8q+18GNAXx81op97vsUsf+OVpvQtnFryduc8H9Y7LJtsgKBOAh0N8qMq
	Z+STjpk3wDKLCFctLPGfyoufMRGSgKE5A3Q//TIl17xYxh/nN5htH0XZsYzEVrB8F+jg
	Cojw==
Received: by 10.180.81.165 with SMTP id b5mr47592837wiy.17.1342016854796;
	Wed, 11 Jul 2012 07:27:34 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id l5sm5385538wix.5.2012.07.11.07.27.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 07:27:32 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LbdM=sqQXYSW8KPJno5mYMR-U08Jy=t3ta9ziJ3_2MLbw@mail.gmail.com>
Date: Wed, 11 Jul 2012 16:27:27 +0200
Message-Id: <A01489C6-E020-455F-BA5A-C66DA0786408@dominion.thruhere.net>
References: <CAJTo0LYRGSkOGOV04C+Pb3ypi7JvbbjC7UJY-Yxywk12FQusaQ@mail.gmail.com>
	<CAJTo0LbdM=sqQXYSW8KPJno5mYMR-U08Jy=t3ta9ziJ3_2MLbw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmqPsuHWPfRfIXIT3eAVSn7VKV7pwKBG1zY0wSdO62vRtMYqeHEH4BW+qny6SwqbZTbGght
Subject: Re: [RFC] webkit-gtk upgrade
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
X-List-Received-Date: Wed, 11 Jul 2012 14:38:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jul. 2012, om 16:05 heeft Burton, Ross het volgende geschreven:

> Hi,
>=20
> On 27 June 2012 07:40, Burton, Ross <ross.burton@intel.com> wrote:
>> In the git branch poky-contrib/ross/webkit I've upgraded webkit-gtk
>> from a 1.7.1-ish git snapshot to the 1.8.1 tarball.  I've tested that
>> web builds and Midori (from meta-oe) works, although obviously more
>> testing is needed -- both users of the library and architectures.
>>=20
>> I'm going away for a week now so if interested parties could test =
this
>> it would be much appreciated!
>=20
> Is there really nobody out there using webkit-gtk for real?  I've just
> rebased my branch (poky-contrib:ross/webkit) against the current
> master, and the webkit-gtk change is a single commit, so please anyone
> who actually uses webkit beyond a few minutes of testing in Web -
> speak now.

I'm using midori and ephiphany, but I haven't been able to build oe-core =
master for a few weeks now due to all the bbappend issues.=


