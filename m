Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 550A861616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 12:00:40 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id h10so4796271vbh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=G0d9EyV6U9K5PGRhEw2nD2Q20p7FZgHHknENEm/3z14=;
	b=Pw3ApPAzHYCNB2GKRPWlNWi5HXoso8tNGNATewVrouqiyflkLYzNIswPk5PBA6sDoN
	cbZqp0hUlPg0y/cPFBsxUQ4KDmzA79RthNJ1CRmrnAbhtsyfuHf6gqtEtoZN47hM2rO1
	QiiKvL2C0RU5g3I9qUzW7vY89HYgORnQlm3AaFa0knG80lIriydyg3r8Hu6F8KG45mDO
	rb6Jb4Bqih0VJUJan9skGNeAYgWyrXsveRAnAd6Nivhbmsxvvw0q8Ntehjqh/PvVgtqO
	BgqmQr2z4gB1pOXaDoqBrO7Lgz3zK6qzOZxPNQyVcWGXI0T6Bo4K5Ipv0KC2zmLlZNLO
	DWbA==
X-Received: by 10.52.118.73 with SMTP id kk9mr18863167vdb.13.1378814441490;
	Tue, 10 Sep 2013 05:00:41 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.155.17 with HTTP; Tue, 10 Sep 2013 05:00:01 -0700 (PDT)
In-Reply-To: <CAFyqS9rEabcr+RMS_i+9+JMpVMnKucSB8GU9GS5pJf8SAr-MSA@mail.gmail.com>
References: <00D40DBB-D50A-44EE-B939-8EC0AD1024EB@gmail.com>
	<CAFyqS9rEabcr+RMS_i+9+JMpVMnKucSB8GU9GS5pJf8SAr-MSA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 10 Sep 2013 13:00:01 +0100
X-Google-Sender-Auth: CTHx2v-SsINdaHbFZRXJy_d8WmU
Message-ID: <CANyK_8duW8cshoAkNKo3mnRdmaCNz12ZK3xKVCni9Uxx1hVftA@mail.gmail.com>
To: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Tue, 10 Sep 2013 12:00:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 10 September 2013 12:44, Hans Beck=E9rus <hans.beckerus@gmail.com> wrote=
:
> Could someone please verify if this patch (original v3 post) can be
> saved without line-feed corruption? It seems very client dependent how
> a message is saved, irrespective of source format. Some client seems
> to cut lines like crazy, others does not.
>
> Thanks.
> Hans
>

Looking at "Show Original" in gmail still shows this to be garbled.
Perhaps save it as a .patch file and attach that to an email? That
should prevent any mail client from touching it.

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

