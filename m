Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2766CF26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 06:30:26 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so2055966pbc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2013 23:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=F0tW0gT4u6fHg0Sl+O784pmScohuee3gJpOEwTr1NhY=;
	b=f07uSk19blvCkecylF27d3bZm7z98McnhfJjbDWLcOzjVyZxj2b0PlduxMjfW3C932
	6ISJfd2DIej3MjNp6GOG+gmftLN3wpE5+1L9lx6r7ERgTP2WXOOAA5l56QLUt/OMikDj
	sgldGYZfZeFM5be76fy+wrQxBhT/yEpKYft/x2FcVKRbbvKc69QixNIunVqFsnLdVh6x
	9FEDDdmjZFFRixRGo5y2has/fgxw5dCUKxWL46RN9Hkiqeh+nE7IpTzr5DOW4VFUFeuz
	aLoHq5zBoH/c7PPmlY1Vuek1Lrl6IPic6KTcVjZo+7e5Fi0qJXzw5qg9DEXT76UOqN/3
	NbBQ==
X-Received: by 10.66.119.202 with SMTP id kw10mr13803944pab.118.1381386628052; 
	Wed, 09 Oct 2013 23:30:28 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	go4sm50887319pbb.15.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Oct 2013 23:30:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <D14FF4AA-C9DA-40C4-B706-3953E31F1A35@dominion.thruhere.net>
Date: Wed, 9 Oct 2013 23:30:25 -0700
Message-Id: <2013BC5B-3177-47F4-8914-07A9A8E00AAD@gmail.com>
References: <D14FF4AA-C9DA-40C4-B706-3953E31F1A35@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1510)
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Architectures with underscores in their names, how to handle that?
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
X-List-Received-Date: Thu, 10 Oct 2013 06:30:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Oct 9, 2013, at 11:27 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

> Hi,
>=20
> I'm working on adding support for big-endian armv8 and the toolchain =
people decided that it should be named 'aarch64_eb'. That currently =
works in OE because there isn't a 'eb' override yet, but there might be =
one in the future.
>=20

why not suggest them to use aarch64eb is that too hard a change ?
it matches other known Big Endian naming conventions like mips and so on =
in autotools world.

> So my question is, how can I safely handle a name like this?
>=20
> regards,
>=20
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


