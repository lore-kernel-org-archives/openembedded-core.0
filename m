Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S1klm-0002Wn-C4
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 21:32:34 +0100
Received: by wiax18 with SMTP id x18so213482wia.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 12:24:09 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.100.228 as permitted sender)
	client-ip=10.180.100.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.100.228 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.100.228])
	by 10.180.100.228 with SMTP id fb4mr22113278wib.1.1330287849186
	(num_hops = 1); Sun, 26 Feb 2012 12:24:09 -0800 (PST)
Received: by 10.180.100.228 with SMTP id fb4mr17690877wib.1.1330287849128;
	Sun, 26 Feb 2012 12:24:09 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p10sm17756914wic.0.2012.02.26.12.24.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 12:24:07 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F4A6B8D.5030103@opendreambox.org>
Date: Sun, 26 Feb 2012 21:24:05 +0100
Message-Id: <A266A12D-2C8A-4854-B22C-E48CF5075E88@dominion.thruhere.net>
References: <1330132760-12519-1-git-send-email-obi@opendreambox.org>
	<D1EF2FB1-9919-42C2-B9D0-E6584B6C7BD8@dominion.thruhere.net>
	<4F4A6B8D.5030103@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnfcU3fGx6MPlHL00dekwLz4G51DnmBcbwDUvo+P7/uf/qz7qri174bkF4rEIqXHCG1LF1K
Subject: Re: [PATCH] bzip2: split into binary and library packages
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
X-List-Received-Date: Sun, 26 Feb 2012 20:32:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 feb. 2012, om 18:27 heeft Andreas Oberritter het volgende =
geschreven:

> On 25.02.2012 10:02, Koen Kooi wrote:
>>=20
>> Op 25 feb. 2012, om 02:19 heeft Andreas Oberritter het volgende =
geschreven:
>>=20
>>> * Create libbz2 (and -dev, -staticdev), which can be
>>> installed without the bzip2 executables.
>>=20
>> You need a PR bump for everything that links against libbz2 to ensure =
clean upgrade paths.
>=20
> Are you sure? I'm asking because existing packages still depend on
> bzip2, which now depends on libbz2.

DEPENDS yes, RDEPENDS yes, shlibdeps, no




