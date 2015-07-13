Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1F21D607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 08:05:05 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so54528245wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=EmaPrqBkcTdQj4V4O4mNxoUSho4lMx5YDcjQrWUziko=;
	b=yP+rMWdU7TTvTn7t4tO3Cbmkiq5xRyFlAtwFxHk74dnwRW0Z7Be9E8qmQ7dN0GVG/F
	sYRTAdMUdbjfY0oYqXrFhchqT7qKhhJXJ8uajraDzn4auPBDq3XwZ+fA7wFlZ++fR38/
	M5ct2XjEuE8QEWNAp1YZflwarpEfCdlNME3pto4jajtwrrgdWJXj6vuZW1Xp9pZ4RnvM
	xls1dROINMrUk8tMaNT8CaoEZdsJikSxcRKIjxysEYPAuMsWOWEw1wtCxN78UE0y9hlj
	dvyJ9qvmz0bAWVPmMnpFrJHUyGFvsMFKBz1jQAdVLgtIHdTXKu5pDrQluf+qMyVlPepc
	yGHA==
X-Received: by 10.195.11.168 with SMTP id ej8mr64858169wjd.150.1436774705660; 
	Mon, 13 Jul 2015 01:05:05 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id u7sm13134586wif.3.2015.07.13.01.05.04
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Jul 2015 01:05:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <35ED4FEA-E9B6-4791-886C-0302E513117D@gmail.com>
Date: Mon, 13 Jul 2015 10:05:30 +0200
Message-Id: <D30CC457-0BD2-4209-B8D6-60F1CE447C1B@gmail.com>
References: <A7F547A4-FD07-4674-8DAB-A09FA32921E3@gmail.com>
	<CAJTo0LbJf+oDxvzQZztW9-Biz0zdLUXiWg3ks7KhVhXxGw5tZA@mail.gmail.com>
	<35ED4FEA-E9B6-4791-886C-0302E513117D@gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Mailer: Apple Mail (2.2102)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Perl recipe fixes and some updates
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
X-List-Received-Date: Mon, 13 Jul 2015 08:05:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 11.07.2015 um 03:31 schrieb Tim Orling <ticotimo@gmail.com>:
>=20
>=20
>=20
> On Jul 10, 2015, at 3:52 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>> Hi Jens,
>>=20
>> On 9 July 2015 at 17:22, Jens Rehsack <rehsack@gmail.com> wrote:
>> With my client's update to fido I grabbed the tuit and did some =
patches: https://github.com/rehsack/poky/commits/fido
>>=20
>> Can you rebase those onto master and send them to the list as =
attached patches (i.e. git send-email)?
>>=20
> If not, I will gladly help Jens on this.

We discussed that on ELCE and no, I can't - but it was told to me that =
it's valid to submit patches via GitHub.

Unfortunately our development environment doesn't allow me to send mails =
in sane way from development VLAN.
But we're allowed to put our development to GitHub.

Using my private mailbox to send mails with the patches on GitHub is =
spare time.
Next point: I'm not going to store my mail password on any machine which =
is not 100% under my control. Maybe you understand that.

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


