Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1USMLH-0000Ka-0w
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 08:59:45 +0200
Received: by mail-da0-f51.google.com with SMTP id g27so629139dan.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=IoCQtFcSY+j4Sd8+h5VN/tBLxJzEu04aSj7r/iaeJSo=;
	b=QlxvbJbyUckXLtHho3EuSGDEA5eM0qhJMD6fdK710ZmKHIQDhY2lEMnugmIAxFVQ2I
	Ys9ACYR7vvK5uC4jsTLq3QISvzmNYhs3Mm8sO5JZE/tsOfWxr7dyvSjAEofp+cbVB6/V
	Zt31LLfBkYzYEf88lbfQmBI+9lXvj60l6f2RLvpMjWVGlrMmRX/QloQLV54/uKDM+IK/
	60gITencKw2qjvusSRjS17B0oCOk6zHuOimCHvYOaQFA8XoSkWRxhHwogYjuO0YIT8h6
	UQ83fpPbY6KlSLKbQYr1teIO+c8GutsF/03zTgQGnYmBmOpdBqT2H3kOer34gu1e+mTq
	Nb4w==
X-Received: by 10.69.0.132 with SMTP id ay4mr7166010pbd.62.1366180930846;
	Tue, 16 Apr 2013 23:42:10 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id gi10sm5099361pbc.40.2013.04.16.23.42.09
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 23:42:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
Date: Tue, 16 Apr 2013 23:42:08 -0700
Message-Id: <CE6CCFD7-CDBA-4669-9EA4-02BBA59EDE5E@gmail.com>
References: <CALbNGRRDhXutLhQMs+prxLG3wbs3Y4pZbwR-D=VNR4Z=OUycMg@mail.gmail.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: postinst does not finish
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
X-List-Received-Date: Wed, 17 Apr 2013 07:00:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

ran into same issue. I disabled post installs to run on boot

On Apr 16, 2013, at 11:28 PM, Andreas M=FCller =
<schnitzeltony@googlemail.com> wrote:

> Hi,
>=20
> sorry again me with another issue. I updated all layers from master
> few hours ago and built from scratch. On first boot with systemd
> postinst never finishes. I see only:
>=20
> [**  } A start job is running for Run pending postinsts
>=20
> and ** are moving around.
>=20
> Does anybody else face this one?
>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



