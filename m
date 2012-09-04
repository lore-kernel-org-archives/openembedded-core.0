Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T8ptS-0002u4-Hh
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 11:58:02 +0200
Received: by iaky10 with SMTP id y10so9007487iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 02:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=c5+Mxv/mARueqIqimJBb/ygN1rh6WlPmw+aEpx6m3vc=;
	b=NcTuO/ZI+2KvieVCuqwi6bSbS+ShxxekDQN9YmwRFvMusprwAzHUPYUIYKoJDTnI1j
	lSOO5v7LEJ450/UuguHWGKq53sH2+wTFQ4v8U9pve73ORlcyXswjiQAedvkfFY0H+3Jh
	CDdMY3uWMi3O4fzkHTlaqPFTcE/2D5MmuZj8Z2WPfzR6QvQzx34b68v/3d64/IXy1AgO
	WxlrSujDZrMtcVY2gZ+m0eoLnKVCuQx+j27jwtceIQo9LiAaFDtRNEYc+aO+rrRCrODV
	nSU/Gn6JrtFWWBSH/KuZardRNl3mDFsHltfWelvC1h75kU608g6hLKrRaQ2VYh2SVF9T
	oe2g==
MIME-Version: 1.0
Received: by 10.50.104.230 with SMTP id gh6mr5280101igb.50.1346751940476; Tue,
	04 Sep 2012 02:45:40 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Tue, 4 Sep 2012 02:45:40 -0700 (PDT)
In-Reply-To: <CALbNGRTHoEqc5FBuNDCiOogU+xker62u3ue4paTTvwr3EFfgvA@mail.gmail.com>
References: <CALbNGRTHoEqc5FBuNDCiOogU+xker62u3ue4paTTvwr3EFfgvA@mail.gmail.com>
Date: Tue, 4 Sep 2012 11:45:40 +0200
Message-ID: <CALbNGRRvPK7HZN08-QnyEoC61jyjQ_JRcXrk1+aFacy4RsinZg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: checksums linux-libc-headers
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
X-List-Received-Date: Tue, 04 Sep 2012 09:58:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 4, 2012 at 11:35 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> checksums changed upstream?
>
> | File: '/home/andreas/data/Downloads/packets/dl/linux-3.4.3.tar.bz2'
> has md5 checksum 635c7c2376b9eda4c0ccc67d34205e73 when
> 3aefa02db55715d627ed23a01667057d was expected
> | File: '/home/andreas/data/Downloads/packets/dl/linux-3.4.3.tar.bz2'
> has sha256 checksum
> 2fbce991cae0c9f1f363ad1386e35c2095c6cce1b43e74ed5a96186578074ae0 when
> 17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc was
> expected
> | Your checksums:
> | SRC_URI[md5sum] =3D "635c7c2376b9eda4c0ccc67d34205e73"
> | SRC_URI[sha256sum] =3D
> "2fbce991cae0c9f1f363ad1386e35c2095c6cce1b43e74ed5a96186578074ae0"
>
> Andreas

Sorry for noise - I tried twice before sending out this email. Seems
my network is causing this I get every time different checksums and
unpacking fails.

Andreas


