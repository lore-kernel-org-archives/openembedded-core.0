Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwwbS-0002TP-5V
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:42:18 +0200
Received: by qcad10 with SMTP id d10so5078461qca.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=tkSi9LQOYWmgKfdfSO4JrqqIjzvHHq4A7+DqMR1XIpE=;
	b=VpHgNPpa+p/YvGWVR570P42rm0C9SlcPM3kXqQvy5HLklF1w9u2mw3nxBRHdhd3gCG
	f4MYOfOWeD6PRntHabx4opuztdZwAhfsW5Az7fD+vatAviZ+d0IU90vfn6JfmgEmSDOc
	kkXUqgX9b3VCiOpKkAmn5MwBsCdJ6DBsAcT7XFzjlevvBXY6qiVy0jWANqjk4KWRZxxv
	A7E00JIEGJeV7ydjSKpmEj3OyAP95xLUp/ktu47yJbXzjBE3OygUrn2sOFJZAmRKg3vf
	QvTgxvFZQ1z7jir51zy1U43BNITh3Su71ij/eiVDQ9gQOpS6ACl+wI0SXS5p/m2kG3nk
	9oiQ==
Received: by 10.60.27.41 with SMTP id q9mr36899621oeg.47.1343917837958;
	Thu, 02 Aug 2012 07:30:37 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id z4sm5929269obo.3.2012.08.02.07.30.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 07:30:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20120802115012.GO16306@jama.jama.net>
Date: Thu, 2 Aug 2012 07:30:38 -0700
Message-Id: <C496D1D2-DB12-4B52-9D3A-5BB5E663FBC3@gmail.com>
References: <20120801065021.GC15199@jama.jama.net>
	<20120801065401.GD15199@jama.jama.net>
	<8071B2D8-3431-4B9B-A810-0F01D4837779@gmail.com>
	<20120802115012.GO16306@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
Subject: Re: u-boot do_compile should be reentrant even with ld-is-gold
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
X-List-Received-Date: Thu, 02 Aug 2012 14:42:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 2, 2012, at 4:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Aug 01, 2012 at 04:02:24PM -0700, Khem Raj wrote:
>>=20
>> On Jul 31, 2012, at 11:54 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>=20
>>> well not exactly like this one as this is causing
>>> /bin/sh: 1: Syntax error: Bad fd number
>>> probably from ">&" in dash
>>=20
>>=20
>> yes. I swear I have since fixed this patch this seems to be an older =
version
>> did you look into meta-ti/master ?
>=20
> Yes, your patch is fixed in meta-ti, but cannot be used together with
> Otavio's patch to u-boot.inc.
>=20
> meta-ti is fine because it provides own u-boot.inc, but with your =
patch
> and u-boot.inc from oe-core it ends like this


so why don't you migrate the patch from meta-ti into OE-Core ? and leave =
this sed
thing out ?



