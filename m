Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id EA992780C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 10:59:16 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id y201so150375848qka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=erNBXr21jibRlEKnNpH7lI0fOaImOlaqbvv5QGsrerM=;
	b=T8EFvF//DC6w0cC6yI2N1Qt8tHu7kfV3FXFRjDg6Rpbrqd7e5Td6xbjh8n+MsQFCjI
	IZ705k9QRyDNRCPY0hNNHGjGdtBmm0gQiTWw0cPUsQfF0Bdfp56Zhr3wVGjf+ebvqJAK
	p9BDq5M2QqgoNaAv84eQNvtVOCAU3XczKzIDjN6AnJcvrPCjc+Y8kXJrcvbiMJd7cK1K
	ifRbJulWRvWYc3ahoH8xcyFrAjob/niCRSFghexE6jHa2Aue+eU44rOPiAPrW9TxuWz7
	qMp57L1ItxoMjbtzdI0qBrmCchfxVvrjPtFA0Wcd6XOT15k+QeNUZOvTnRBX1ZcOdrLx
	0L8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=erNBXr21jibRlEKnNpH7lI0fOaImOlaqbvv5QGsrerM=;
	b=CGRWuVlGq1kad/agMUStzMRnCzIpNkvHu4yDNzXRThqYgnJsJgD1kmOIAXuKACV83x
	az2YqCmrRLGH9tL9ju5hz6xPDyqV8nDYIUqf/PrIq3ULKJTmK+rpDUk3TocyGG3xNP7p
	FTqKz1goQOv5Zn/pRKO/wsuESlwzPDBsrM3Xae9YS3tvDv/vw3O2eUtE7fuapqIO++Ro
	XkUAXCPFoXD6moskYZ2PQFiXNUqKsVH/mD5LgQG7K3qk1uKfPE1hkYOBEkRbppFXNS20
	zFQAGNstR3JT51lNuVcuBQosJL0if4SGrPKbvRIV/UGKHtsZpVhjSIdq4MC9HdE7q69h
	+iIA==
X-Gm-Message-State: AODbwcDe1NOQDKbwxtSrC1Mpnm9mJz1NJIw9yvJNYxWxs+L8KTKOMAg/
	RsZ4Udx32gRuGDgGuAal60UBc6gsvRMz
X-Received: by 10.55.140.65 with SMTP id o62mr29753367qkd.127.1495623557539;
	Wed, 24 May 2017 03:59:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Wed, 24 May 2017 03:58:57 -0700 (PDT)
In-Reply-To: <20170523234744.34487-3-raj.khem@gmail.com>
References: <20170523234744.34487-1-raj.khem@gmail.com>
	<20170523234744.34487-3-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 May 2017 11:58:57 +0100
Message-ID: <CAJTo0LbJVNpJ5JVHw8bB2NRhSCLCPuUS97e+C_YxAC_An7rCew@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] apt-native: Remove USE_NLS = "yes"
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
X-List-Received-Date: Wed, 24 May 2017 10:59:17 -0000
Content-Type: multipart/alternative; boundary="94eb2c05430edd806f055042fe0c"

--94eb2c05430edd806f055042fe0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 24 May 2017 at 00:47, Khem Raj <raj.khem@gmail.com> wrote:

> USE_NLS is target specific, its redundant for native packages
>

I don't think you're right:

| In file included from
/data/poky-master/tmp/work/x86_64-linux/apt-native/1.2.12-r0/build/include/=
apt-private/private-cachefile.h:12:0,
|                  from
/data/poky-master/tmp/work/x86_64-linux/apt-native/1.2.12-r0/apt-1.2.12/apt=
-private/private-output.cc:15:
| /usr/include/libintl.h:44:14: error: expected unqualified-id before =E2=
=80=98char=E2=80=99
|  extern char *dgettext (const char *__domainname, const char *__msgid)
|               ^
| /usr/include/libintl.h:44:14: error: expected initializer before =E2=80=
=98char=E2=80=99
| In file included from /usr/include/features.h:374:0,
|                  from /usr/include/x86_64-linux-gnu/sys/types.h:25,
|                  from /usr/include/regex.h:23,
|                  from
/data/poky-master/tmp/work/x86_64-linux/apt-native/1.2.12-r0/build/include/=
apt-pkg/configuration.h:31,
|                  from
/data/poky-master/tmp/work/x86_64-linux/apt-native/1.2.12-r0/apt-1.2.12/apt=
-private/private-output.cc:4:
| /usr/include/libintl.h:82:52: error: expected unqualified-id before
=E2=80=98throw=E2=80=99
|  extern char *textdomain (const char *__domainname) __THROW;
|                                                     ^
| /usr/include/libintl.h:82:52: error: expected initializer before =E2=80=
=98throw=E2=80=99
| /usr/include/libintl.h:87:32: error: expected unqualified-id before
=E2=80=98throw=E2=80=99
|          const char *__dirname) __THROW;
|                                 ^
| ERROR: oe_runmake failed
| /usr/include/libintl.h:87:32: error: expected initializer before =E2=80=
=98throw=E2=80=99

native.bbclass sets USE_NLS=3Dno but I think apt requires it to be enabled,
thus the assignment.

Ross

--94eb2c05430edd806f055042fe0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 24 May 2017 at 00:47, Khem Raj <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a=
>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204)=
;padding-left:1ex">USE_NLS is target specific, its redundant for native pac=
kages<br></blockquote><div><br></div><div>I don&#39;t think you&#39;re righ=
t:</div><div><br></div><div>| In file included from /data/poky-master/tmp/w=
ork/x86_64-linux/apt-native/1.2.12-r0/build/include/apt-private/private-cac=
hefile.h:12:0,</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0from /data/poky-master/tmp/work/x86_64-linux/apt-native/1.2.1=
2-r0/apt-1.2.12/apt-private/private-output.cc:15:</div><div>| /usr/include/=
libintl.h:44:14: error: expected unqualified-id before =E2=80=98char=E2=80=
=99</div><div>| =C2=A0extern char *dgettext (const char *__domainname, cons=
t char *__msgid)</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^</div><div>| /usr/include/libintl.h:44:14: error: expected initializer=
 before =E2=80=98char=E2=80=99</div><div>| In file included from /usr/inclu=
de/features.h:374:0,</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0from /usr/include/x86_64-linux-gnu/sys/types.h:25,</div=
><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from =
/usr/include/regex.h:23,</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from /data/poky-master/tmp/work/x86_64-linux/apt-na=
tive/1.2.12-r0/build/include/apt-pkg/configuration.h:31,</div><div>| =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /data/poky-mas=
ter/tmp/work/x86_64-linux/apt-native/1.2.12-r0/apt-1.2.12/apt-private/priva=
te-output.cc:4:</div><div>| /usr/include/libintl.h:82:52: error: expected u=
nqualified-id before =E2=80=98throw=E2=80=99</div><div>| =C2=A0extern char =
*textdomain (const char *__domainname) __THROW;</div><div>| =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^</div><div>| /usr/include/libintl.h:82:52: error: exp=
ected initializer before =E2=80=98throw=E2=80=99</div><div>| /usr/include/l=
ibintl.h:87:32: error: expected unqualified-id before =E2=80=98throw=E2=80=
=99</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *__dirname) __=
THROW;</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>| ERROR=
: oe_runmake failed</div><div>| /usr/include/libintl.h:87:32: error: expect=
ed initializer before =E2=80=98throw=E2=80=99=C2=A0</div><div><br></div><di=
v>native.bbclass sets USE_NLS=3Dno but I think apt requires it to be enable=
d, thus the assignment.</div><div><br></div><div>Ross</div></div></div></di=
v>

--94eb2c05430edd806f055042fe0c--
