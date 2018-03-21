Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1797C7894C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:29:04 +0000 (UTC)
Received: by mail-ua0-f171.google.com with SMTP id c14so2720893uak.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 00:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=AxS4lcAeoybbMD9o+nUXUnOFAPjNOpkKItCPYi9ISaw=;
	b=E1dMiEC3bwWPwIdkn0Rvd8pxZa4fXK5lIGpSLV9AKfuW29C8fRJlTtfFqRqW29sSuO
	HYVL31sKWNtTmvBsxbGrxtWFlsEYLeAjOr7ZXKAB05Xo8zrsojPjJLxvGm9gKfRtSNvL
	krWJTYHxQvquQWO9jWX49B+9ZZD0M1O+T/7X0Vp7JK/lS5mM2RB2Q6J4rthtzOtfZ93R
	h2OwS/G5VFrNx8UrUU4uDdKrMHnflPFmFzOqJwsjXQTuJIC0QDhpIpwa6BXNxtYtEnxN
	qKYMbIx5VUdsZOIZhzMBveoafLRBkCFhHbfeXcpXOAo1qFq1yUaSZ8J2XVzRQKraxHbf
	/rKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=AxS4lcAeoybbMD9o+nUXUnOFAPjNOpkKItCPYi9ISaw=;
	b=C2eq0p/8NwfsPB1wj3HYFqTH/UHCfP6kUxAjne2fAcbW6fX4YFrySpfw25Fx0s40+g
	/E+U/R58sB8CWrsyfbKCSArLCBQtOJSks6p7M8M1ztyYXws9QYeyK7ac4vtv2U9yFG8Q
	R49KIdDPQ8YioXfalitnV/qdzaIwjfH7U5T46GPOTlKUd0QMHGVAk9s5bA466QRPDXCA
	LrZKZgLhwr9EjXiTX9/O3gW4QWT7NNQk80mpSufDgrnU8tbUHTV6dNkirasb4AABNab4
	Rmp4mCiX41k67Q7Zsm0+nPWRhUqnGl5+/eQ9OgkEKzkz7PdwHCWyqPui50xUvCZ90I9A
	JRcw==
X-Gm-Message-State: AElRT7F4xKiFZ2rZRJ0grGSp/CUXezlREF/2sPyQNF4SLao8vpVaRNut
	qHBxmfcYALcFpc5wGKDZFsHWKo5S6ltbLG7x9aA6PQ==
X-Google-Smtp-Source: AG47ELvCpFWsy0QJJwhcpUHHvP8VZd2fT5SvCVFikqAm2pH8Gn6o7BmyFABzgz/QbL/M8+hEz974rU60PoDWYchonf8=
X-Received: by 10.159.61.203 with SMTP id e11mr6176967uaj.115.1521617345816;
	Wed, 21 Mar 2018 00:29:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 00:29:05 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Wed, 21 Mar 2018 12:59:05 +0530
Message-ID: <CAPGMVzEUccZZpxwJpH0akzn7+FyaZf0NbDZoN=73+u8g=yA4Fg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-openembeded] bug in adding network layer
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
X-List-Received-Date: Wed, 21 Mar 2018 07:29:05 -0000
Content-Type: multipart/alternative; boundary="089e0824502861ab7e0567e7252e"

--089e0824502861ab7e0567e7252e
Content-Type: text/plain; charset="UTF-8"

I am tryiing to add meta-networking layer (to get Internet connection to
poky)and i have included the following line of code in bbconfig file
/home/jarvis/poky/meta-openembedded/meta-networking \

but while building i get this below error


ERROR: ExpansionError during parsing
/home/jarvis/poky/meta-openembedded/meta-networking/recipes-support/libtdb/
libtdb_1.3.15.bb
Traceback (most recent call last):
bb.data_smart.ExpansionError: Failure expanding variable do_compile,
expression was     python ./buildtools/bin/waf
${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
 which triggered exception AttributeError: module 'oe.utils' has no
attribute 'parallel_make_argument'


DO help,

is there any other way to establish Internet connection inside poky?

Thanks

--089e0824502861ab7e0567e7252e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am tryiing to add meta-networking layer (to get Int=
ernet connection to poky)and i have included the following line of code in =
bbconfig file <br>/home/jarvis/poky/meta-openembedded/meta-networking \<br>=
<br></div>but while building i get this below error<br><br><div><div><br>ER=
ROR: ExpansionError during parsing /home/jarvis/poky/meta-openembedded/meta=
-networking/recipes-support/libtdb/<a href=3D"http://libtdb_1.3.15.bb">libt=
db_1.3.15.bb</a><br>Traceback (most recent call last):<br>bb.data_smart.Exp=
ansionError: Failure expanding variable do_compile, expression was=C2=A0=C2=
=A0=C2=A0=C2=A0 python ./buildtools/bin/waf ${@oe.utils.parallel_make_argum=
ent(d, &#39;-j%d&#39;, limit=3D64)}<br>=C2=A0which triggered exception Attr=
ibuteError: module &#39;oe.utils&#39; has no attribute &#39;parallel_make_a=
rgument&#39;<br><br><br></div><div>DO help,<br><br></div><div>is there any =
other way to establish Internet connection inside poky?<br><br></div><div>T=
hanks<br></div><div><br></div></div></div>

--089e0824502861ab7e0567e7252e--
