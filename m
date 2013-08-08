Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 27CB66B0D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 20:06:53 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so3930099pab.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 13:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=tSMu7QYYY7LxwxaQNktGfYn/0LlVoBo+ls04QB2m/2k=;
	b=xGAXr6ulGjLKqYI/7hJQyC093KH6SgpHbxoEFerV08D0dyGFVoj2twmHXQ4UyStWRb
	EO7ThkwM0tKPfupAQhMVDFcJj+r3BWJAsZJPNTBM0vyLRbCtxZP3XUab0H7Hb7Ud79+8
	lONf8r9F3S+DKiG3gvJ+NzwxCY9iQeT3UK8UXSwL9KeEkO5Rtw3rpQ8R1C0pYvjDi4h5
	kImIugNfS6NLBolClQrE8aXJzO5YPtU50wNH1443/70k4vurdGmz0BLkDWC6b0DZ95VB
	2gDanFiNCzHmcN1LAEwYmnF/cXQrsjF2ZpZCxaDHM+FN4GsQcbwb7eI6aLPhBIsOSC3s
	I2Fg==
X-Received: by 10.68.218.199 with SMTP id pi7mr7956354pbc.19.1375992413586;
	Thu, 08 Aug 2013 13:06:53 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id xe9sm18262941pab.0.2013.08.08.13.06.52
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 13:06:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <52034F09.1090904@enea.com>
Date: Thu, 8 Aug 2013 13:06:54 -0700
Message-Id: <F003F4EE-D6D2-4E64-9B2D-CA0D2ED2C819@gmail.com>
References: <52034F09.1090904@enea.com>
To: Vali Cobelea <valentin.cobelea@enea.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: GCC PARALLEL_MAKE changed
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
X-List-Received-Date: Thu, 08 Aug 2013 20:06:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Vali

On Aug 8, 2013, at 12:55 AM, Vali Cobelea <valentin.cobelea@enea.com> =
wrote:

> Hi,
>=20
> We noticed that the GCC parallel make flag (PARALLEL_MAKE, located in =
"meta/recipes-devtools/gcc/gcc-cross-canadian_4.?.bb") got changed from =
"-j 32" to simply nothing.
> We are wondering what was the reason for this change, which seems to =
have been made somewhere before the fall of 2012, while the GCC was =
around version 4.6 or earlier (for each we dont have the repository to =
track down the change).
>=20
> After several builds where the compile time for GCC got measured, I =
can say that this flag indeed reduces the build time, when it is put at =
"-j 32" (using a proper build machine).
> In average the build time frame was reduced by 18%.
>=20
> Much appreciated any thoughts on this, I know that it has been a while =
since this change happen.
>=20


There were race conditions happening with the build. I have not verified =
if they have been fixed. However you could try
remove=20

PARALLEL_MAKE =3D ""

from recipe and then it should respect the global -j value and see if =
this builds consistently. If it does
propose a patch to remove it

> Thank you very much,
> Vali
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


