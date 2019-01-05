Return-Path: <jatedev@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id BBEA16C135
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jan 2019 03:21:38 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id b3so33422118ede.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2019 19:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=vYjcZzi3Le7bzMLtPOZBEutJb7ZPR2g4/iBGyYaL+28=;
	b=g377bVh89oTSVweUkDAGzuq7HB5+JGNHk7nnev56OSaNevNvTMuZHEz7TpquiogzNe
	76WiLYRKPSRquY/R8rv4Fh1YfqC6g8g+sDNyiioNHW0Gq6en8GVvH7B+gbyRpiT6pO5c
	2yIWti/zWEw0IXu8Geio5jQr/37jzwOwHp0yZ+9hoAXlGdT7sgO7L6Qi5kMNmxQw9BOc
	iSH2KIl1geKdG6o74/oN1AdPBHvpLzkQKuHsDGF7Ge+1AxU7vs1RxCsS75I+MsfErsMK
	zuGABzKqu9r6AwU5BfDZANcYNPeeH/Hg3O60LIikE7Cg6IvHXBQg/i8dhj8CNL1OXKMg
	0tEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=vYjcZzi3Le7bzMLtPOZBEutJb7ZPR2g4/iBGyYaL+28=;
	b=odbsphpPfk29EGr3p8CMuzJVbO8RmlZri0Pw3X5K74krT3hmLXg4wpNglkbX3BCi0a
	82sXJKT3D2dFKjtU5YejSBCmNsWg+jU55uuG9UqjeDJofEaKH+ORZe2+HZ+sJzl5IhH1
	FjCmkFnkwpcyhIyv8aMSY/yAI7T4JgSuQ9IZwD/5VO7qbhyf2O42yIzK9alO8xXiYJAU
	Vq1ozBlSi5TY9wici2w+IuZJOoYR/OAy3lwe86/FqscOAqhJZrHMcH7tUgJQrQ8MxqUH
	r1M3NpaC5gB+NKx/HlVYsoRFvma/YGfMNIbc6hzbEOI9GRm1pdMq4XGY8Ft7KF9tjH4z
	AeFA==
X-Gm-Message-State: AA+aEWZ5ibKF38ClZV5NeO45T1YlK4C9q7tcb1PLbrzFRNiDuEhuAeum
	8Fy6zsWCiIPdtLSjUK6IqFJNe0n77f9p/vCPQPFakQ==
X-Google-Smtp-Source: AFSGD/WDMLv9GY16bogOYI05JsNnYKnmAjrOp4Q2ldspwr80V61DYsIT39ZKMr/p1ihbONM8SQEV986FEQgGAWYOE/A=
X-Received: by 2002:aa7:d817:: with SMTP id v23mr48140544edq.255.1546658498999;
	Fri, 04 Jan 2019 19:21:38 -0800 (PST)
MIME-Version: 1.0
From: Jate Sujjavanich <jatedev@gmail.com>
Date: Fri, 4 Jan 2019 22:21:32 -0500
Message-ID: <CAPphmgbFBpuix8sEEY4AdWeY3Kb6-R=3t3ubVd93Usrm323CEw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Official sstate premirrors and builds
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
X-List-Received-Date: Sat, 05 Jan 2019 03:21:39 -0000
Content-Type: multipart/alternative; boundary="0000000000006bf7be057ead7eef"

--0000000000006bf7be057ead7eef
Content-Type: text/plain; charset="UTF-8"

I setup a machine on AWS and wanted to use the sstate cache mirror at
sstate.yoctoproject.org in my site.conf.

Bitbake does not pull the artifacts from the mirror despite the uninative C
library. I have tried checking out several tags and then pointed to the
appropriate directory on sstate mirror. For example, yocto-2.2.2 and
http://sstate.yoctoproject.org/2.2.2.

Bitbake populates several license setscene tasks, but no native packages.

Does anyone have this working?

- Jate S.

--0000000000006bf7be057ead7eef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I setup a machine on AWS and wanted to use the sstate=
 cache mirror at <a href=3D"http://sstate.yoctoproject.org">sstate.yoctopro=
ject.org</a> in my site.conf.</div><div><br></div><div>Bitbake does not pul=
l the artifacts from the mirror despite the uninative C library. I have tri=
ed checking out several tags and then pointed to the appropriate directory =
on sstate mirror. For example, yocto-2.2.2 and <a href=3D"http://sstate.yoc=
toproject.org/2.2.2">http://sstate.yoctoproject.org/2.2.2</a>.</div><div><b=
r></div><div>Bitbake populates several license setscene tasks, but no nativ=
e packages.</div><div><br></div><div>Does anyone have this working?</div><d=
iv><br></div><div>- Jate S.<br></div></div>

--0000000000006bf7be057ead7eef--
