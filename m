Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sqimu-0000ek-Ae
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 12:44:24 +0200
Received: by weyr6 with SMTP id r6so3406666wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 03:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=kbnD0ildMpTwQKw1p1E7dom2BmQ9F6ENFl0Dwv1JVEU=;
	b=k1LkAKom7PX6mVjNE0alZ/hPfwuTvvrUuXAvoh73q1KAwAxLQyPqTRxShFPErjKosp
	eEHIdWxTUShuDT74v4xkLFgwq87n65c1sR+GvCZbguPK+jz31wjNuaYU9rdA4jfYl5vW
	3CljSC5Zoj1Tps4oXLoNk+5i+lfZBydHuGb0bI9OBDYJzaY0oLiItsIa8IBETMWjDvQk
	upkOsuvsz2BSysPhetEy6tspnAbQ8FbOVv8damDfo/X0uK0AAR25EqmeAT8ryCCpT03Y
	Ygr21JDqFTcWnjhwcIthm6pBtg2/99yand/zl1GzHXMjrlMVnFwlJ9cWc5cqJIFfNHI0
	YyMg==
Received: by 10.216.220.89 with SMTP id n67mr6314506wep.73.1342434785417;
	Mon, 16 Jul 2012 03:33:05 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id y5sm20904802wiw.9.2012.07.16.03.33.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 03:33:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0Laa4jNytbBv1ozJWE9kf=-4hSE4_gsZN+VA2N5C1MJVeQ@mail.gmail.com>
Date: Mon, 16 Jul 2012 12:33:00 +0200
Message-Id: <8F9AE1A6-06B6-432B-B336-B8F72D3C2697@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
	<CAJTo0Laa4jNytbBv1ozJWE9kf=-4hSE4_gsZN+VA2N5C1MJVeQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQk7yZO5HOQojezi94Cr3mZo68QjWXZ+DqsagQU22n21PO1IY0fknyGDKQK1xYCWD1TFxkm+
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 10:44:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jul. 2012, om 10:47 heeft Burton, Ross het volgende geschreven:

> On 16 July 2012 07:11, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> Please add proper Upstream-Status for the patches; it is nice to =
have
>>> those to track the pending patches.
>>=20
>> Isn't that field only used to put in "pending" and then backslap each =
other on doing such a good job?
>=20
> Personally I find it incredibly useful to differentiate between
> patches that should be going upstream and patches that are OE-specific
> for various reasons.

I'm not debating the usefulness of the U-S field, I'm debating the =
usefulness of using 'Pending' as a catch-all. I can do:

for patch in *.patch ; do
	echo "Upstream-Status: Pending" >> $patch
done

And it will get accepted, but is ultimately useless.

Anyway, I added proper U-S fields (not 'Pending') locally and will =
resubmit later this week.

regards,

Koen=


