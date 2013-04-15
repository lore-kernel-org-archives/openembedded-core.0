Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URgzz-0003r2-13
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:50:59 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so2097823ead.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=xRptSAyTZh+EIbWe1YBlupln08+JZIU49F0Lf2p7cR4=;
	b=nEVC0YckWkLz2NP97+ser/3t85kfadudQP5d6FgJscH0Bwdq3MqNx/efYyN4VedIzF
	Q5jKMG8gO7jjPf/sH3lGPSsVBIeE0wSiQrCvyOnwO+icB+R6IaKs1Vcjcd17au0LjfGK
	nBHMVZmjpk0VmWKi9cry4NGHfVXDiK3Lv1MaCCFGKBivbVy+Qp9REyfDldrK6mQyMtU3
	vE2ltXxsuCluMpqcmJvBOHcS2ktJJvFAevv7pP1r8lD7IlR481syoRw9WWDVAlAoNlHo
	zuklY3EE01yGfuOVwg2O2nhCYjUkX6jBbevQsNYU+ZUS089E/TXZwMYyvu5D8wbNBibs
	DuUA==
X-Received: by 10.14.104.6 with SMTP id h6mr60617195eeg.5.1366022010393;
	Mon, 15 Apr 2013 03:33:30 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a2sm24649539eem.11.2013.04.15.03.33.28
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 03:33:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CADV-EXFrm6O3x7mNEz4X87inG-jLd6Kb5UNDhszh4hLXGgOvXw@mail.gmail.com>
Date: Mon, 15 Apr 2013 12:33:28 +0200
Message-Id: <D36FF37C-5906-4F9E-AC08-57B159AEF560@dominion.thruhere.net>
References: <CADV-EXFrm6O3x7mNEz4X87inG-jLd6Kb5UNDhszh4hLXGgOvXw@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmub21CnIXQYyRhbI5IKNjlbdV4C1YloxKbCCr0SDvRvBXN3zyQTQi/QE7Lq69E0G/jMJ9f
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Multiple *.bbappend files support
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
X-List-Received-Date: Mon, 15 Apr 2013 10:51:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 12:26 heeft Yevhen Kyriukha <kirgene@gmail.com> het =
volgende geschreven:

> Is there a way to use multiple *.bbappend files in different layers?
>=20
> I'm using meta-raspberrypi and my own layer.
> Both extend base-files with *.bbappend and both have PRINC =3D "1".
> But only first of *.bbappend files applied (that is in =
meta-raspberrypi).
> PR of base-files also increments by one (not by two).

Yeah, try to make all bbappends use:

	PRINC :=3D "${@int(PRINC) + 1}"

regards,

Koen=


