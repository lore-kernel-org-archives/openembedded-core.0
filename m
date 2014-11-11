Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 19EBC65CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:00:46 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x13so10968887wgg.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 01:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=09ersbB/EKNx83pJLAkC9/P8jiCLv/3e3VhhTVzaLYY=;
	b=Wcj79AxCqLXiTVmqdiyq9wiZQHizBXHCmVKo4azqyZ1htarsqitaoDYvOTSfpC8fE2
	Ki83/XmfdY3Ct5vxN5pcft1u2rYaSzunqrFa2AxHiQgLmjqeunP21+8swOz3oLoyCm6D
	Ixuk/zexgXdpgCwGvIrAbcpIFQSVMa31rTHMSW8DUll5TTrlsv/6G9117UfcYCZ0d9ag
	VvZBCzOgdOn8557wpTJDASqUwhDRA369fSQvL8IGS7wcONbbqL95/8rYbpfVUJD3BEuP
	Q1+BtyMT+Xa1rrl2Rj8MIjyBXzK+3dcnxI1UC6fL6E0rXHRv3l//8TSPvH6ozXa6Kdb7
	vSmg==
X-Gm-Message-State: ALoCoQlEcf/FGFug4VQ/NS/f2X7elNfBsegGp71Vr2NNp4IMt4Ezk3k6p1rNgfyJPQ9IBNkH95i5
X-Received: by 10.194.243.106 with SMTP id wx10mr48420698wjc.97.1415696446174; 
	Tue, 11 Nov 2014 01:00:46 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id x3sm16610284wiy.4.2014.11.11.01.00.44
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Nov 2014 01:00:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CANyK_8eJYijsMH2y4s6bGTMTOpmz=-zFeuDG5CkM4h=YvLGUQw@mail.gmail.com>
Date: Tue, 11 Nov 2014 10:00:43 +0100
Message-Id: <ED3281C6-D24B-4406-B92E-065939B4EAAA@dominion.thruhere.net>
References: <CANyK_8eJYijsMH2y4s6bGTMTOpmz=-zFeuDG5CkM4h=YvLGUQw@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
X-Mailer: Apple Mail (2.1990.1)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Replace procps with procps-ng
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Nov 2014 09:00:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 10 nov. 2014, om 11:38 heeft Paul Barker <paul@paulbarker.me.uk> =
het volgende geschreven:
>=20
> Hi all,
>=20
> I've tried upstreaming a patch against procps by sending it to the
> listed maintainer and the mailing list and I've had no reply from
> either. The last change to the CVS repository seems to be 3 years old
> and the mailing list archive is mostly just full of spam.
>=20
> It looks like Arch Linux, Debian, Fedora and openSUSE have moved on to
> procps-ng. I suggest we do the same during the v1.8 development cycle
> if possible. procps-ng is actively developed and looks to be open to
> patches.
>=20
> I'm sadly pretty limited on development time at the minute but I may
> be able to give this a go in December. I'd rather focus the time I do
> have on opkg though so if anyone else wants to pick this up that'd be
> great.

With the util-linux -> util-linux-ng -> util-linux change in mind I =
strongly encourage to keep using 'procps' are package name or ensure =
that the appropriate (R)PROVIDES are in place.

regards,

Koen=

