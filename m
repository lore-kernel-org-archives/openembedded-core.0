Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S0fP1-0004Ny-C6
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 21:36:35 +0100
Received: by werc1 with SMTP id c1so1076260wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 12:28:13 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.181.12.106 as permitted sender)
	client-ip=10.181.12.106; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.181.12.106 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.181.12.106])
	by 10.181.12.106 with SMTP id ep10mr6352798wid.8.1330028893583
	(num_hops = 1); Thu, 23 Feb 2012 12:28:13 -0800 (PST)
Received: by 10.181.12.106 with SMTP id ep10mr5182405wid.8.1330028893528;
	Thu, 23 Feb 2012 12:28:13 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm6659593wib.4.2012.02.23.12.28.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 12:28:12 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1330025248.git.paul.eggleton@linux.intel.com>
Date: Thu, 23 Feb 2012 21:28:11 +0100
Message-Id: <A8AEC4FF-9450-4896-A486-09CCE518A34D@dominion.thruhere.net>
References: <cover.1330025248.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkxFOk5SI1vLclgWmUWJpCOAEaTQS8Oh+URjpvK7UKsoxW2C1HXD2KJmcM39x/bfkG5Nxo5
Subject: Re: [PATCH 0/2] psplash improvements v2
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
X-List-Received-Date: Thu, 23 Feb 2012 20:36:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 feb. 2012, om 20:30 heeft Paul Eggleton het volgende geschreven:

> Implements the psplash changes as discussed on the mailing list [1] =
and
> by the TSC [2].
>=20
> [1] =
http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg13=
800.html
> [2] http://lists.linuxtogo.org/pipermail/tsc/2012-January/000330.html
>=20
> Since v1 I've done away with the additional script and integrated .png
> conversion into the recipe (optional) as well as used alternatives to
> allow selecting the psplash at runtime. I also decided against =
renaming
> the default header file as it would break existing bbappends.
>=20
> Note for meta-yocto there is a corresponding change that should be
> applied at the same time which I will send out shortly.
>=20
> (No changes since the RFC except for rebasing on top of current =
master.)

I haven't had time to test it yet, but it looks good judging from a =
quick read.

regards,

Koen=


