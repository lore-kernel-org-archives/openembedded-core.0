Return-Path: <nathan.rossi@xilinx.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0187.outbound.messaging.microsoft.com [213.199.154.187])
	by mail.openembedded.org (Postfix) with ESMTP id A06246D84A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 01:08:36 +0000 (UTC)
Received: from mail117-db8-R.bigfish.com (10.174.8.241) by
	DB8EHSOBE008.bigfish.com (10.174.4.71) with Microsoft SMTP Server id
	14.1.225.22; Tue, 3 Dec 2013 01:08:35 +0000
Received: from mail117-db8 (localhost [127.0.0.1])	by
	mail117-db8-R.bigfish.com (Postfix) with ESMTP id 43C413C05E3;
	Tue,  3 Dec 2013 01:08:35 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -4
X-BigFish: VPS-4(z579ehzbb2dI98dI9371I542I1432Izz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2fh95h109h839h944hd24hf0ah119dh1220h1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h2216h2336h906i1155h)
Received-SPF: pass (mail117-db8: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail117-db8 (localhost.localdomain [127.0.0.1]) by mail117-db8
	(MessageSwitch) id 1386032913427404_26404;
	Tue,  3 Dec 2013 01:08:33 +0000 (UTC)
Received: from DB8EHSMHS026.bigfish.com (unknown [10.174.8.253])	by
	mail117-db8.bigfish.com (Postfix) with ESMTP id 59E82320057;
	Tue,  3 Dec 2013 01:08:33 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by DB8EHSMHS026.bigfish.com
	(10.174.4.36) with Microsoft SMTP Server id 14.16.227.3; Tue, 3 Dec 2013
	01:08:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1VneTX-0008F8-4R; Mon, 02 Dec 2013 17:08:31 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] attr: attr_2.4.47 release tarball missing
	configure.ac
Thread-Index: AQHO75k/Z259bUQR0kukBhLK7CuLLppBpuRg
Date: Tue, 3 Dec 2013 01:08:22 +0000
References: <41a9a78e-e827-4551-88c6-78628b1e34da@DB8EHSMHS028.ehs.local>
	<529CE6D9.3090307@linux.intel.com>
In-Reply-To: <529CE6D9.3090307@linux.intel.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.13]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <42863352-0600-408a-b4f4-7469c21cff89@DB8EHSMHS026.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: attr_2.4.47 release tarball missing configure.ac
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
X-List-Received-Date: Tue, 03 Dec 2013 01:08:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, December 03, 2013 6:00 AM
> To: Nathan Rossi; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] attr: attr_2.4.47 release tarball missing
> configure.ac
> =

> On 11/25/2013 12:18 AM, Nathan Rossi wrote:
> > The release tarball of attr 2.4.47 is missing the configure.ac file.
> > This prevents the autotools bbclass from being able to regenerate the
> > configure script which leads to other side affects. (e.g. using
> > outdated config.sub)
> >
> > This patch adds the configure.ac file via a patch.
> > (obtained via the source repository at the v2.4.47 tag)
> >
> > See the mailing list thread for additional information:
> > http://lists.nongnu.org/archive/html/acl-devel/2013-05/msg00024.html
> >
> > Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
> > ---
> >
> > On an additional note, acl 2.2.52 is also affected by this issue.
> > However it does not affect oe-core as acl has yet to be updated to this=

> > version and currently sits on the older 2.2.51 version.
> >
> > ---
> >   meta/recipes-support/attr/attr_2.4.47.bb           |    3 +
> >   .../attr/files/attr-Missing-configure.ac.patch     |   62
> ++++++++++++++++++++
> >   2 files changed, 65 insertions(+)
> >   create mode 100644 meta/recipes-support/attr/files/attr-Missing-
> configure.ac.patch
> >
> > diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-
> support/attr/attr_2.4.47.bb
> > index a1f2e05..ad40c9b 100644
> > --- a/meta/recipes-support/attr/attr_2.4.47.bb
> > +++ b/meta/recipes-support/attr/attr_2.4.47.bb
> > @@ -1,5 +1,8 @@
> >   require attr.inc
> >
> > +# configure.ac was missing from the release tarball. This should be
> fixed in
> > +# future releases of attr, remove this when updating the recipe.
> > +SRC_URI_append +=3D "file://attr-Missing-configure.ac.patch"
> >
> >   SRC_URI[md5sum] =3D "84f58dec00b60f2dc8fd1c9709291cc7"
> >   SRC_URI[sha256sum] =3D
> "25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859"
> > diff --git a/meta/recipes-support/attr/files/attr-Missing-
> configure.ac.patch b/meta/recipes-support/attr/files/attr-Missing-
> configure.ac.patch
> > new file mode 100644
> > index 0000000..5887ed5
> > --- /dev/null
> > +++ b/meta/recipes-support/attr/files/attr-Missing-configure.ac.patch
> > @@ -0,0 +1,62 @@
> > +Subject: [PATCH] attr: Missing configure.ac
> > +
> > +Upstream-Status: Backport [Upstream released tarball missing this file=
]
> =

> You need a Signed-off-by: tag in this patch also
> =


Hi Saul,

This patch has already been pushed onto the master branch. http://git.opene=
mbedded.org/openembedded-core/commit/?id=3Db28f12a272a9e2f0c3084a58b91605ac=
b05f58f8

Would you like me to submit a follow up patch which adds just the signed-of=
f-by line? Or would you prefer a V2 of this patch with the additional chang=
e?

Regards,
Nathan



