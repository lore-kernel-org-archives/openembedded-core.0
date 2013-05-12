Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UbeQo-0006qO-6U
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 00:07:50 +0200
Received: by mail-pb0-f43.google.com with SMTP id md12so3972711pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 14:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=L6tU6WRS9i+UYkb0j881pTPSIj+J8g6u6Pud8/Jvd1w=;
	b=YsElBNuh1od6DRFX3ptmPlmqLFgW1XIuAivwTr5btTsXJ0KXZqZSC1XZ/l0uGeNEod
	8g8XbP5A9mg8JuyAmhBL+hcnzT4vXvzCALOCBio583iuvLUDHj2I01oa7FP2essaqV3/
	OAtvlwnFHZ7JVTtXWoVjK0KyfTqYHoQdzF236aS8OnhhG5/nxf8h3JD+MLSxAxzMdMha
	Jx/poyVMJf/xOMTBTm1Zz/9mU+uHbTqc69AC/5rghFDvT6bLfNxEHaWBXQRQjZYtU6S4
	eqomq3GuFwiisgRnw20Zi6IXnH1FT9hwnYGdGZuvxPg8RhPbJMtghkQFxZEzy05p0etl
	19yg==
X-Received: by 10.66.233.9 with SMTP id ts9mr27308535pac.15.1368395380601;
	Sun, 12 May 2013 14:49:40 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	uv1sm11322316pbc.16.2013.05.12.14.49.39 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 14:49:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <518FD2F2.5070105@linux.intel.com>
Date: Sun, 12 May 2013 14:49:38 -0700
Message-Id: <020E3790-121B-49E9-87E3-55ACA9095B10@gmail.com>
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
	<9E4F6205-6171-4D60-A669-609A49F763C1@gmail.com>
	<518FD2F2.5070105@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
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
X-List-Received-Date: Sun, 12 May 2013 22:08:27 -0000
X-List-Received-Date: Sun, 12 May 2013 22:08:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On May 12, 2013, at 10:35 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/12/2013 09:29 AM, Khem Raj wrote:
>> Hi Saul
>>=20
>> There is one serious problem that I ran into was that qemuarm 3.8 =
kernel segfaulted
>> is it working for you ?
>>=20
> Nope your right there does appear to be a problem with ARM, I thought =
we where have sanity test issues again, I just completed a build and =
verified that I get a Kernel paninc with 3.8 Kernel and 4.8 GCC.
>=20
> Not ready yet!
>=20
> Khem, are you looking into it?  I have CC'ed Bruce for the kernel =
also.

haven't looked into the problem in detail. Its one of those either a =
problem in gcc or gcc uncovering a latent bug in kernel.




