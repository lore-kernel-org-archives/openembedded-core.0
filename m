Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S1DeI-0001vg-Gv
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 10:10:38 +0100
Received: by wgbdr12 with SMTP id dr12so490051wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 01:02:15 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.181.12.106 as permitted sender)
	client-ip=10.181.12.106; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.181.12.106 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.181.12.106])
	by 10.181.12.106 with SMTP id ep10mr2585461wid.8.1330160535031
	(num_hops = 1); Sat, 25 Feb 2012 01:02:15 -0800 (PST)
Received: by 10.181.12.106 with SMTP id ep10mr2020679wid.8.1330160534929;
	Sat, 25 Feb 2012 01:02:14 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fw5sm8471817wib.0.2012.02.25.01.02.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 01:02:13 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330132760-12519-1-git-send-email-obi@opendreambox.org>
Date: Sat, 25 Feb 2012 10:02:12 +0100
Message-Id: <D1EF2FB1-9919-42C2-B9D0-E6584B6C7BD8@dominion.thruhere.net>
References: <1330132760-12519-1-git-send-email-obi@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlkSqAaFUofKTXR1YZBnq/wkv4o/dH44gegBckposyPz7B7ritWUy602PDhbtD6AZDBGIA1
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
X-List-Received-Date: Sat, 25 Feb 2012 09:10:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 feb. 2012, om 02:19 heeft Andreas Oberritter het volgende =
geschreven:

> * Create libbz2 (and -dev, -staticdev), which can be
>  installed without the bzip2 executables.

You need a PR bump for everything that links against libbz2 to ensure =
clean upgrade paths.=


