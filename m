Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1137E7EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 09:37:01 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s7so1404105iob.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IxqFoJ6JRKWaxg30t2ulh4VZ+NAf56KxgKRAokBKBEQ=;
	b=RT1jubEWRNAjBQ8Jk+luW9RI0AX2xmw67iHrWOlJ7C8VTejHfSwmZOYwVp3ydkfuxW
	dWjmzyzz6aSVa55p3hIa42HlEcBXEo6doqblzh+n94r6MQobW5xWDrsVIFK+ELbHDJRK
	zN/X/OYxkU63trN4XNovE6fbpTCujNwwwBX+EJYNbxr57vpf0/ijTQM/ySO/qbnm/Edq
	Rw4/QJNXQit6xTCIP1WCHUZG17Pu/hccU7yVIcJ494MxIzcGRZc3xGLRWRJp0nfawc+V
	eXYf0zRdnteT7JvuqlOecFOGeqIdhk4EuOLqj51eHjEqQajy03pZVD5psAgfAewSBdBQ
	fPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IxqFoJ6JRKWaxg30t2ulh4VZ+NAf56KxgKRAokBKBEQ=;
	b=L+kAMihcG0fsI8qs4bAewe0hupo5lYbrkyLbBvTisnAeha2ZuYbWRQ/pLXp5VcUbuQ
	j4+ubnSF87Up/7oNFcfeqfuIPQHg7ZbTSdT8kKtD319JNdTsdsIxlvX3IzcCJbf3Zdbc
	SbwwRqnJMZ9fIPoyvnFpW4mc+AWvCNDFI9ouQNVjzobkgqYgxZhR/97NzLe/pqD3ZDkI
	277s4Fz9k6pAu0e5hFdBp2VPZFEuGzuJ+aKm0KN1eGP0T4AVV182X0ZfQcEj/ckv4flB
	0nDfYf68ECLZoXcAXcVsYye5BElWwdsJaqVfJTOjTq1kmZjnZfQ9RWUM6+vEeOUPlF7j
	yBhw==
X-Gm-Message-State: APjAAAXIBKNZ2MHn9R6ZUyBL6Z/JS5zy6UDWAviIq1Z3AbMTSFwsKqgN
	k5aD+W5+1TJBkqsg7oYs3G0FMk6Q5hC7WWnxNij4J8iu
X-Google-Smtp-Source: APXvYqyjRo90crJwxsmFeOSNRDnsWAiHj1Or29gHb21m/e7MswObkoo15icP6ULcVhjXsoPOOD34EiEwtx19nrQktPc=
X-Received: by 2002:a6b:c80a:: with SMTP id y10mr14036721iof.170.1561023422974;
	Thu, 20 Jun 2019 02:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
In-Reply-To: <20190619202149.GA12516@localhost>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Thu, 20 Jun 2019 11:36:51 +0200
Message-ID: <CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Thu, 20 Jun 2019 09:37:02 -0000
Content-Type: multipart/alternative; boundary="0000000000009ccddc058bbe16bd"

--0000000000009ccddc058bbe16bd
Content-Type: text/plain; charset="UTF-8"

> Not sure which of the changes is responsible, but this is new:
> WARNING: flex-native-2.6.0-r0 do_cve_check: Found unpatched CVE
> (CVE-2015-1773)
>
> https://nvd.nist.gov/vuln/detail/CVE-2015-1773
>
> Note that the flex tool is completely unrelated to Apache Flex.
>
>
I see, the 4/4 patch is responsible for that (Consider CVE that affects
versions with less than operator). It takes into account the comparison
operator in the json NVD file (new 'version_affected' field that was not in
the XML data feed). So this CVE matches because 2.6.0 <= 4.14.0. But it
should not match because it concerns another product (flex_project/flex vs
Apache/flex).

There is indeed a problem I didn't manage. The CVE_PRODUCT variable we use
in cve-check only takes the product name (here 'flex') into account, we
should also consider the vendor name (here 'flex_project').

Without this patch (4/4), the behaviour should be the same as before.

Pierre

--0000000000009ccddc058bbe16bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Not sure=
 which of the changes is responsible, but this is new:<br>
WARNING: flex-native-2.6.0-r0 do_cve_check: Found unpatched CVE (CVE-2015-1=
773)<br>
<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2015-1773" rel=3D"noreferre=
r" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2015-1773</a><br>
<br>
Note that the flex tool is completely unrelated to Apache Flex.<br>
<br></blockquote><div><br></div><div>I see, the 4/4 patch is responsible fo=
r that (Consider CVE that affects versions with less than operator). It tak=
es into account the comparison operator in the json NVD file (new &#39;vers=
ion_affected&#39; field that was not in the XML data feed). So this CVE mat=
ches because 2.6.0 &lt;=3D 4.14.0. But it should not match because it conce=
rns another product (flex_project/flex vs Apache/flex).</div><div><br></div=
><div>There is indeed a problem I didn&#39;t manage. The CVE_PRODUCT variab=
le we use in cve-check only takes the product name (here &#39;flex&#39;) in=
to account, we should also consider the vendor name (here &#39;flex_project=
&#39;).</div><div><br></div><div>Without this patch (4/4), the behaviour sh=
ould be the same as before.</div><div><br></div><div>Pierre<br></div>=C2=A0=
</div></div>

--0000000000009ccddc058bbe16bd--
