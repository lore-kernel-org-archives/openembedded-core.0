Return-Path: <kirgene@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 96E5A61086
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 12:04:54 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id n20so2766224qaj.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 05:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=FPK+E1OVGVNI2RWxByy0UrJA5I1oy1yHUPuxZVZZ7Qg=;
	b=fHzWyEGTrx3uRKBB3DbaqCiuD/N2xnBAzg0zEles7OLdl1ECJPBsMzhFvRAPae7ZCK
	7HbJ1rvzURhoVuzSRi+hdtYcrUonT7uGYd4/ugrenvypJnH5IbDGRF+lfsvkIdBB4k1+
	5k7O6QYHGzsKfWhNBecArPvHM0By2CCn2rQg2iDUcBmxp+1nCX41MVUSf78TxNNWv+rS
	WUQeG6Em0u1WNIdBBi1ZOIQUcPaBJGOuAHatEzd0FE6OAWY3XT5kOACoqkgGU8I/TQ4k
	RsnGuJ8lgTPzls4FXQ1ffEBkQNrw8p59ePW8u0tuIIOEc09vT88Rt8O9Q2n8XFNpN+ff
	CAAg==
MIME-Version: 1.0
X-Received: by 10.49.105.97 with SMTP id gl1mr37809220qeb.76.1372766695232;
	Tue, 02 Jul 2013 05:04:55 -0700 (PDT)
Received: by 10.49.59.3 with HTTP; Tue, 2 Jul 2013 05:04:55 -0700 (PDT)
Date: Tue, 2 Jul 2013 15:04:55 +0300
Message-ID: <CADV-EXEu9adLK7ArMTZv30gTdppzPwMpNMC1JPpVhSm9jQqTag@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Create btrfs subvolume during image building
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
X-List-Received-Date: Tue, 02 Jul 2013 12:04:54 -0000
Content-Type: multipart/alternative; boundary=047d7b677cc23a9c8004e08627a7

--047d7b677cc23a9c8004e08627a7
Content-Type: text/plain; charset=ISO-8859-1

Hi!

I'd like to create image with btrfs rootfs partition.
I want to store all files on separate subvolume on btrfs partition.
For this purpose I'm creating *.bbclass that simply extends IMAGE_CMD.

The problem is that to create btrfs subvolume I need to mount it first, but
only root can execute "mount".

Are there any ways to accomplish this?

Best regards,
Yevhen

--047d7b677cc23a9c8004e08627a7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Hi!</div><div style><br></div><div style><div>I=
&#39;d like to create image with btrfs rootfs partition.</div><div>I want t=
o store all files on separate subvolume on btrfs partition.</div><div>For t=
his purpose I&#39;m creating *.bbclass that simply extends IMAGE_CMD.</div>
<div><br></div><div>The problem is that to create btrfs subvolume I need to=
 mount it first, but only root can execute &quot;mount&quot;.</div></div><d=
iv style><br></div><div style>Are there any ways to accomplish this?</div>
<div style><br></div><div style>Best regards,<br></div><div>Yevhen</div>
</div>

--047d7b677cc23a9c8004e08627a7--
