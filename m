Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TBK3g-0001KZ-Cz
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 08:34:52 +0200
Received: by wgbdr1 with SMTP id dr1so105281wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 23:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=9dV7BNW0VY2khmci74V2MAC7qMYhhywUxdYrX2cV+xg=;
	b=IxR8dL8sxOpyevlGWCX0sufPHTeq0RPaNk0kCu/bbNM/WIXlcZv5b2bXqqweZjUdv5
	OAknnOngEB/MHARsMnmkOBbcHp9PbLEasEaginu1CrurSqPdOj0xxzgf3WbFgRCPQx86
	i5QCteVGReeZHXl/seli3QLh6aXa8lCopUnbpIhSxVhy6w6TcCGJU45WuwlITUzsFvne
	5IknuFhhZkq+l1KEQgO8GE5Iur4tnlFfzF18C0YqvzykCZuz3HZrrG8cTjKwPb58zItI
	qZ6zgBqla33Lq67by+aQ3tXwVxyM+pw8ge52wLmdWj4mvJmLPnTM/7jgS4dpSDwVRRa5
	tsZw==
Received: by 10.180.106.97 with SMTP id gt1mr22682748wib.5.1347344541994;
	Mon, 10 Sep 2012 23:22:21 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cu1sm1049149wib.6.2012.09.10.23.22.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 23:22:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1347297632-16529-3-git-send-email-ross.burton@intel.com>
Date: Tue, 11 Sep 2012 08:22:19 +0200
Message-Id: <EF1BA017-A04B-4FA6-B519-916F2F052FA1@dominion.thruhere.net>
References: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
	<1347297632-16529-3-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQmL8/Qa1deKIBn+0i9I2FoRo0I4cSMG7zxnh00B3mJ23shZlk2w51rC7TgUc9tHXkp7zxWb
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libx11: don't split libX11-xcb out into a libx11-xcb package
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
X-List-Received-Date: Tue, 11 Sep 2012 06:34:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 sep. 2012, om 19:20 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> As XCB is a hard requirement for libX11, and libX11-xcb.so is a =
deprecated 3KB
> .so, it's not worth splitting it into a separate package.

What's the upgrade path? This commit will create a clash because now 2 =
packages will provide the same file. Is that pain really worth it?=


