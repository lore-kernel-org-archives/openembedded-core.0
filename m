Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rq1f9-0006UK-Hl
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 13:09:15 +0100
Received: by wibhq7 with SMTP id hq7so1062088wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 04:01:29 -0800 (PST)
Received: by 10.180.88.169 with SMTP id bh9mr10529377wib.20.1327492889139;
	Wed, 25 Jan 2012 04:01:29 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fv6sm714189wib.8.2012.01.25.04.01.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 04:01:28 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1327488436-28526-1-git-send-email-eric@eukrea.com>
Date: Wed, 25 Jan 2012 13:01:26 +0100
Message-Id: <A1F13823-5353-4D31-9614-C5C2317D122E@dominion.thruhere.net>
References: <1327488436-28526-1-git-send-email-eric@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQnbMIQdfLkPEazfA9G5r2Msoq1//+KnsR4OL5FL22FCQS5ZcPD8i9P7yRX395gfPHwAre0c
Subject: Re: [PATCH] qt4-tools-nativesdk-4.8.0: fix build
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
X-List-Received-Date: Wed, 25 Jan 2012 12:09:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 25 jan. 2012, om 11:47 heeft Eric B=E9nard het volgende geschreven:

> the build is actually failing because host g++ and ld are used to
> compile and link

This is missing a PR bump in the affected recipes.

regards,

Koen=


