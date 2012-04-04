Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SFU7O-0004dH-5U
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:35:38 +0200
Received: by pbcum15 with SMTP id um15so438750pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=HxpnPVBK5GidlD5eUwn4dZp9kl9E6lv0Hci9wGy9r3w=;
	b=HnaLag/xlbjaJ9+QT9Zo9yDI42CGWmnyDRt2UfVYU2HSwfJ+KA5iPz4YT3LUeNexOt
	/AtkEsshQt5yvEvDEfHd7jDMukg2FmppQuTenjsjNnvn8EL77HDpJcm7SrLmUnu4nyc2
	fBvgpbVTfaqsSUwHfdPn4Pbo+HiPTTwyhRv2tjl/pPgSmeyNmChiifsgCnXGSw76fMrQ
	8Mv1MqFE1pyzWHO6Du/TqxT4/pimMnIhz2rQt+ts0V/fmwYkuwKqk+ZBVTrdcwLSvPa4
	jYm846V0YK9UVl/MuSM8sBsry0OMHthXKQIAixEF9JPzC+Y35O+ShtfsUYfJB7DsVfJe
	k39A==
MIME-Version: 1.0
Received: by 10.68.202.167 with SMTP id kj7mr39843544pbc.9.1333560386786; Wed,
	04 Apr 2012 10:26:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.60.161 with HTTP; Wed, 4 Apr 2012 10:26:26 -0700 (PDT)
In-Reply-To: <8496577.GTiH3Bl1do@helios>
References: <cover.1333553396.git.paul.eggleton@linux.intel.com>
	<0d5a88036c74a354a62e13cf83d05f99fca8175b.1333553396.git.paul.eggleton@linux.intel.com>
	<CAP9ODKpPhyGJ-Jbu2JUGyzsYpAVAkOjTQGrvu3CN7p0JXb8cUQ@mail.gmail.com>
	<8496577.GTiH3Bl1do@helios>
Date: Wed, 4 Apr 2012 14:26:26 -0300
X-Google-Sender-Auth: 8qDKykyatFuDPKF2hqAP_7dBLsM
Message-ID: <CAP9ODKqd=B8aLrVkLrD=1GgOEbFeqyG+b2=0YBikybx0BMR0RQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] classes/image_types: add IMAGE_TUNE2FS_ext3
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
X-List-Received-Date: Wed, 04 Apr 2012 17:35:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2012 at 14:12, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Are you suggesting this would hold the entire post-command to be run? If =
not,
> what other post command could we be referring to in the case of other
> filesystems? (tune2fs being valid for ext2, ext3 and ext4).

Yes; it is more generic and for someone using it, it makes no
difference in complexity et all.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


