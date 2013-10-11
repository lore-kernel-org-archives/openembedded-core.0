Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7E96CC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:08:16 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u57so4366707wes.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 08:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=8JepWYmP03WtgmsSxEZ69qECKZ6Tx3sUsIEzGb7eCck=;
	b=DG3bWVZHsjas+Xiz17LG5QBWs0ILHTFu4P6VtD7NtZm3+/PL+X4jydKgDZs9Xlvubt
	O2xbVrW66qcT6xvsgFGQMDTlvWrQL+2GBsUFwgIxv3P8zC0B/CC52aGrJXYdLoe6fpvK
	9wDen9Tja2tuGrhevADzQxPQYM/SsEht6733t+VmRYpKoscTOfocOUGt/NJID0K/ZKYf
	iq371MNLBxo9ltgBjMdYckDLFqwKjlg2lKjFgQxnJbj0pUclwVzlvLZjoOMczhdg7h6/
	tkEXdBQMgUKsqDfsGkl/EIfIFPB0rudU2+fexbX73MNSOYf8szOW6wXqW5eXh8Ncg4FI
	wt6A==
X-Gm-Message-State: ALoCoQmGfL9ilR/pb9LpW+5fhmF5ccKJnXAC2NGHW8VgnoEW5qNu2Y5t18lXbNujP+R9wdyPNzqm
X-Received: by 10.180.12.243 with SMTP id b19mr3656111wic.18.1381504097751;
	Fri, 11 Oct 2013 08:08:17 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d04:70cd:6d6d:11d0?
	([2001:610:612:0:d04:70cd:6d6d:11d0])
	by mx.google.com with ESMTPSA id i8sm6517769wiy.6.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 08:08:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <52580CC0.10808@communistcode.co.uk>
Date: Fri, 11 Oct 2013 17:08:16 +0200
Message-Id: <896EBFD8-C648-4871-BE44-B4EE469B9E05@dominion.thruhere.net>
References: <52580CC0.10808@communistcode.co.uk>
To: ml@communistcode.co.uk
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Setting root password
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
X-List-Received-Date: Fri, 11 Oct 2013 15:08:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 okt. 2013, om 16:35 heeft Jack Mitchell <ml@communistcode.co.uk> =
het volgende geschreven:

> What is the best way to set the root password for an image during =
build
> time?
>=20
> I have come across this snippet:
>=20
> ROOTFS_POSTPROCESS_COMMAND +=3D " \
>        sed 's%^root:[^:]*:%root:${PASSWD}:%' \
>        < ${IMAGE_ROOTFS}/etc/shadow \
>> ${IMAGE_ROOTFS}/etc/shadow.new;\
>        mv ${IMAGE_ROOTFS}/etc/shadow.new ${IMAGE_ROOTFS}/etc/shadow ;"
>=20
> but it feels a bit hacky...

indeed, gnu sed has had a -i option for some years now, no needs to that =
intermediate file.=

