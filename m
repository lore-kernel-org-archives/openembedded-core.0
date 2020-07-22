Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.18911.1595424827729639516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=KnLD2lLp;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4423; q=dns/txt; s=axis-central1;
  t=1595424828; x=1626960828;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xxzUt9z6G9f+0rbfAocuYGWdHRyx6dxbQTxBwYYudMI=;
  b=KnLD2lLpa93veXv/Do1auIAzTsXOls59ZcPklY/KXJW5e3slblL40kpu
   btGvnQ7qosqb0uWJrvpSg/CXmr4u8zwLS5XXjyZvqkiNLR4BUnZBG1mBM
   W3KH+/Yle1E4hV/YKxtU/r7wwEcHV0VNb4J8E5PVjr4+/mVuVCPiRO+2d
   YoJa9fQ/BNv+XyyPDW8p4lFgUY3j73Pp+Mc+YPUtQ8e2iN074BoOzPq3J
   YGSIhLPSn0i7dxHzjWElIv1Y8i2Qe463/LuUxqSC9+lzluAWv+Lk/gi7X
   mjL/uCSmF30/OshzSQo0abAieehdCGsROzvr4IPuwNFz+gAl2Q0W6MOy6
   A==;
IronPort-SDR: WQ5+c8NWzIo+Nqh4ZyYblLqcDtnTiKRX/9Z/OF/0fG/b06FdNkTBHQJJw9T8Uqn6SlwpjqKz9L
 eFhVjon9fGfH02L26PlPuBxPqH6P47t3xFhIPgo77WGrkQiz7Q5vRjdfe6B94m66o5LJeGkUYj
 yiwpow3ylQ8l/MpyzPBi2iIvYZZ2a7niQvEfyRMs8n8eOGQhBnY4W9/sdouYJeKAWZcsvWl1g7
 1S279wFwBOAqXctBBg+DrFIZjYoXClxxDIjD9Iu01cB0EjKwVpZeBtA7MQy7sCRAAFx5RkHgV8
 jnM=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="11107744"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Paul Barker <pbarker@konsulko.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, tools-cfpbuild-internal
	<tools-cfpbuild-internal@axis.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH v4 01/12] Move rpm manifest to its own subdir
Thread-Topic: [PATCH v4 01/12] Move rpm manifest to its own subdir
Thread-Index: AQHWUS9HKFExdm4B+0exxdD/0h6qFKj/GLQwgAA86oCAB2F99IAGtXaAgAZJ9xM=
Date: Wed, 22 Jul 2020 13:33:45 +0000
Message-ID: <1595424825526.56776@axis.com>
References: <20200703114402.8850-1-fredrigu@axis.com>
 <20200703114402.8850-2-fredrigu@axis.com> <1594291329382.85415@axis.com>
 <CAM9ZRVtH5m14PHydagC1k9XnaEu=USX2oFRraGUvCh=911scxg@mail.gmail.com>
 <1594710174328.5614@axis.com>,<CAM9ZRVs_KNN4pqA7k1YmQkThsDdDAJbTdyiVY=2uAdnPmaFz5Q@mail.gmail.com>
In-Reply-To: <CAM9ZRVs_KNN4pqA7k1YmQkThsDdDAJbTdyiVY=2uAdnPmaFz5Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Paul,=0A=
thank you for your review, I hope you're feeling better!=0A=
I think I've managed to fix all your comments.=0A=
Some imports was not possible to move to the top of the file but those=0A=
who where possible to move I've moved.=0A=
=0A=
Please note that I'll be away from monday and four weeks forward. Please=0A=
don't take my silence then as a lack of interest. This has my highest prior=
ity.=0A=
=0A=
Best regards=0A=
Fredrik=0A=
________________________________________=0A=
From: Paul Barker <pbarker@konsulko.com>=0A=
Sent: Saturday, July 18, 2020 5:29 PM=0A=
To: Fredrik Gustafsson=0A=
Cc: openembedded-core@lists.openembedded.org; tools-cfpbuild-internal; Rich=
ard Purdie=0A=
Subject: Re: [PATCH v4 01/12] Move rpm manifest to its own subdir=0A=
=0A=
On Tue, 14 Jul 2020 at 08:02, Fredrik Gustafsson=0A=
<Fredrik.Gustafsson@axis.com> wrote:=0A=
>=0A=
> Thank you, just let me know if I can make it any easier to review this,=
=0A=
> I know it's a big patch.=0A=
=0A=
Hi Fredrik,=0A=
=0A=
Sorry for the delays here, I've been unable to get back to this until=0A=
today due to other commitments and a few health issues.=0A=
=0A=
Here's my feedback on the series as a whole. Overall I think it's=0A=
excellent, I much prefer the result where the code is grouped by=0A=
package manager (opkg, dpkg or rpm) to the existing code where it's=0A=
spread across package_manager.py, rootfs.py, manifest.py and sdk.py.=0A=
=0A=
1) Please edit the first line of each commit message to follow the=0A=
style guide at https://www.openembedded.org/wiki/Commit_Patch_Message_Guide=
lines.=0A=
=0A=
2) Please also fix the following whitespace errors reported when=0A=
applying these patches:=0A=
=0A=
$ git am ../v4-Move-rpm-manifest-to-its-...-and-11-more.mbox=0A=
Applying: Move rpm manifest to its own subdir=0A=
.git/rebase-apply/patch:148: new blank line at EOF.=0A=
+=0A=
warning: 1 line adds whitespace errors.=0A=
Applying: Move ipk manifest to its own subdir=0A=
.git/rebase-apply/patch:187: new blank line at EOF.=0A=
+=0A=
warning: 1 line adds whitespace errors.=0A=
Applying: Move deb manifest to its own subdir=0A=
Applying: Move rpm rootfs to its own dir=0A=
.git/rebase-apply/patch:161: new blank line at EOF.=0A=
+=0A=
warning: 1 line adds whitespace errors.=0A=
Applying: Move ipk rootfs to its own dir=0A=
Applying: Move deb rootfs to its own dir=0A=
.git/rebase-apply/patch:222: new blank line at EOF.=0A=
+=0A=
warning: 1 line adds whitespace errors.=0A=
Applying: Move rpm sdk to its own dir=0A=
.git/rebase-apply/patch:127: new blank line at EOF.=0A=
+=0A=
warning: 1 line adds whitespace errors.=0A=
Applying: Move ipk sdk to its own dir=0A=
.git/rebase-apply/patch:42: trailing whitespace.=0A=
self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS"),=0A=
.git/rebase-apply/patch:109: new blank line at EOF.=0A=
+=0A=
warning: 2 lines add whitespace errors.=0A=
Applying: Move deb sdk to its own dir=0A=
.git/rebase-apply/patch:108: new blank line at EOF.=0A=
+=0A=
warning: 1 line adds whitespace errors.=0A=
Applying: Move rpm package manager to its own dir=0A=
.git/rebase-apply/patch:840: new blank line at EOF.=0A=
+=0A=
warning: 1 line adds whitespace errors.=0A=
Applying: Move ipk package manager to its own dir=0A=
.git/rebase-apply/patch:951: new blank line at EOF.=0A=
+=0A=
warning: 1 line adds whitespace errors.=0A=
Applying: Move deb package manager to its own dir=0A=
.git/rebase-apply/patch:1042: new blank line at EOF.=0A=
+=0A=
warning: 1 line adds whitespace errors.=0A=
=0A=
3) I'd recommend the new module keeps the name package_manager. You=0A=
can do this by moving the existing code into=0A=
package_manager/__init__.py and then splitting it up inside that=0A=
directory. Imports and wrappers in the __init__.py file can be used to=0A=
ensure no other bit of the code needs to worry about the changes.=0A=
=0A=
4) Please avoid unnecessarily using imports inside functions. In=0A=
rootfs.py, manifest.py and sdk.py you can import the required classes=0A=
at the top level. Functions like create_rootfs(), populate_sdk(), etc=0A=
should not require any changes as part of this patch series.=0A=
=0A=
I'll run as much of the selftest suite as I can on this series as-is=0A=
to see if there are any other issues.=0A=
=0A=
Thanks,=0A=
=0A=
--=0A=
Paul Barker=0A=
Konsulko Group=0A=
