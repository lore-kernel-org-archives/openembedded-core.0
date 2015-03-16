Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id CFAC76AC43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 16:37:01 +0000 (UTC)
Received: by padcy3 with SMTP id cy3so69458710pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 09:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=23aqkkG/qq0piJOoozsog521L6qacZPFd98IB9pu7P4=;
	b=ThTyj1iGTyoo72pKWg2MFf/V8qtd+4HcJKs19WE9ygFFoGLYh0lsNrjt2smLmac2K4
	M+FdeyzNnodJJuuVEm7JJe06vF50oJZNp4NNhSl7/WzJQso9g9BPUdpdTQcQxlc9MvQO
	i2mEpfHn9lQoRkeQYZ3honmeCYQDbLjLS+UNCeFl/hP8Y5i5/eoQNfgTqPwWktSVuqQT
	0I8IE9nMHpbegkWGxbF1RqEpnBL0RHS8EkvX80fcBN2CIVd1iqMj/d31Y7ivlPm2ovb5
	sR4C4KrejfBhRY7N2uo+vchVsvwSGIKkcRO5Thh6pVnZTHPqCTNuK26S53hmclu6LQvj
	d2tQ==
X-Received: by 10.70.128.203 with SMTP id nq11mr7001695pdb.169.1426523822752; 
	Mon, 16 Mar 2015 09:37:02 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:1d43:cf03:319c:2e61?
	([2601:9:3580:84c:1d43:cf03:319c:2e61])
	by mx.google.com with ESMTPSA id
	ht2sm18118070pdb.23.2015.03.16.09.37.01
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Mar 2015 09:37:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZvk3Y7ZuN1pX7ES2iGFThRLE_0w=w904xVVkupmCJULA@mail.gmail.com>
Date: Mon, 16 Mar 2015 09:37:00 -0700
Message-Id: <445C5029-77B7-4AE4-AB25-D5F42E271ECB@gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<73D5E895-8D8E-445E-B269-68F62A89B413@gmail.com>
	<CAJTo0LZvk3Y7ZuN1pX7ES2iGFThRLE_0w=w904xVVkupmCJULA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 16:37:07 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C63D390C-84FE-4CFD-9D13-F70754A3209C"

--Apple-Mail=_C63D390C-84FE-4CFD-9D13-F70754A3209C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 16, 2015, at 9:26 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 16 March 2015 at 18:24, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> Patches are fine in this series, however I just want to set the =
expectations right here. While having that libc-independent goal is =
fine.
> Sometimes we just can not do it, since uclibc or musl
> does not have all the features that glibc has and an app might also be =
using it.
> making glibc users not have those features is unfair
> given that we have a strong mechanism of overrides in OE, it should be =
used to this advantage.
>=20
> But these patches, which add configure options to enable/disable the =
relevant functionality and have been sent upstream - represent the ideal =
case as once they're merged won't cost us any effort in the future.
>=20

yes, you might have read the first line in my reply.

> Ross=20


--Apple-Mail=_C63D390C-84FE-4CFD-9D13-F70754A3209C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Mar 16, 2015, at 9:26 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 16 March 2015 at 18:24, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4bd" =
class=3D"a3s" style=3D"overflow:hidden">Patches are fine in this series, =
however I just want to set the expectations right here. While having =
that libc-independent goal is fine.<br class=3D"">
Sometimes we just can not do it, since uclibc or musl<br class=3D"">
does not have all the features that glibc has and an app might also be =
using it.<br class=3D"">
making glibc users not have those features is unfair<br class=3D"">
given that we have a strong mechanism of overrides in OE, it should be =
used to this advantage.</div></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">But these patches, which add configure =
options to enable/disable the relevant functionality and have been sent =
upstream - represent the ideal case as once they're merged won't cost us =
any effort in the future.</div><div class=3D""><br =
class=3D""></div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>yes, you might have read the first line in my =
reply.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div class=3D"">Ross&nbsp;</div></div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_C63D390C-84FE-4CFD-9D13-F70754A3209C--
