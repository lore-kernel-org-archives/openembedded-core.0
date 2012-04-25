Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pcjegan@gmail.com>) id 1SMy8v-0003Hz-Md
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 11:04:09 +0200
Received: by wgbdr1 with SMTP id dr1so526125wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 01:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9ENrcUxv3m50XAulAhIDhbVEs+DRFEDhAOT7+7FEhP0=;
	b=d9QdltUH/taDfndZut0Jmp6+BgSl+a/CIUCWdTBBKtFrQWK2ntxgBS6cm6CDXkUKbL
	hEzuwnbwgN3AmKwG6IKPitVXj1EYi125cQqPPy/pgSFdmGjSQmpizqui8442PnHMgtkw
	Vw95AyixOrClNR1rC399bpUwFhwbcQEynqjMzXLYDMXg149+MLBw3CEelPb64AgYlBQS
	mLwJ/iVsAYYZwxEA0+v51XXBdEIvtc5YbtiuBCR1GKfDo0MhRIO7FKdy7Vbrcan0zkun
	ZqN4Z+rzTWC8JuZS5hLqb79GeWV2CwJjZgRoL0gcFXdTIntHjZfHM3JjutU/iofj99yH
	p0zQ==
Received: by 10.180.83.72 with SMTP id o8mr4579612wiy.5.1335344074189; Wed, 25
	Apr 2012 01:54:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.185.195 with HTTP; Wed, 25 Apr 2012 01:54:13 -0700 (PDT)
In-Reply-To: <CAAA4K6J1SNRCr0uM1tT=DjyV47mk-KqGUZjT+B8qgujANw9ZTQ@mail.gmail.com>
References: <CAAA4K6J1SNRCr0uM1tT=DjyV47mk-KqGUZjT+B8qgujANw9ZTQ@mail.gmail.com>
From: Jegan Chandru <pcjegan@gmail.com>
Date: Wed, 25 Apr 2012 14:24:13 +0530
Message-ID: <CAAA4K6L7GxoqUdOdn8MCd0YX8pKtJz-noEmbMarO93zYGCAmxw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yocto@yoctoproject.org
Subject: Re: adding package nss in rootfs failed with dependency "/usr/local/bin/perl"
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
X-List-Received-Date: Wed, 25 Apr 2012 09:04:09 -0000
Content-Type: multipart/alternative; boundary=f46d0442887e31ea4004be7d0508

--f46d0442887e31ea4004be7d0508
Content-Type: text/plain; charset=ISO-8859-1

> This is a bug in the nss package.  It has an executable shell script that
has a:

> #! /usr/local/bin/perl

> in it, which causes RPM to add a dependency on that specific path, and
nothing
> is providing the path.

> The fix is either, decide this is a sample/demo shell script and remove
it from
> the nss package -- or fix the script to use the proper perl location of
> "${bindir}/perl"

Thanks Mark for pointing it out. That solved it. I fixed the script to use
proper perl and added nss in rootfs with no problem.

-JC

--f46d0442887e31ea4004be7d0508
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra">&gt; This is a bug in the nss package. =A0It has=
 an executable shell script that has a:</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">&gt; #! /usr/local/bin/perl</div><div cla=
ss=3D"gmail_extra">

<br></div><div class=3D"gmail_extra">&gt; in it, which causes RPM to add a =
dependency on that specific path, and nothing=A0</div><div class=3D"gmail_e=
xtra">&gt; is providing the path.</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">

&gt; The fix is either, decide this is a sample/demo shell script and remov=
e it from=A0</div><div class=3D"gmail_extra">&gt; the nss package -- or fix=
 the script to use the proper perl location of=A0</div><div class=3D"gmail_=
extra">

&gt; &quot;${bindir}/perl&quot;</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Thanks Mark for pointing it out. That solved it. =
I fixed the script to use proper perl and added nss in rootfs with no probl=
em.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">-JC</div><d=
iv class=3D"gmail_extra"><br><br>
</div>

--f46d0442887e31ea4004be7d0508--
