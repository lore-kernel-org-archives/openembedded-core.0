Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TW86C-0005j8-Np
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Nov 2012 17:03:28 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so1691171oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2012 07:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=fxn2CooLiAs2YqaxgBxN0ca3AdVxcIUhjktezwHOAeI=;
	b=mmegMFdfleN/lL7wS7eccd+2YQiX6KqUpfAL2H68J2LRq7DMIL/QUVhadmVq+0cJ//
	+TyhGXKt9n6xlZWAQeJqIK2AUZhHunPMx+2gCYJ/6cPnXGVtTm/IueCrH33l95UMYWEV
	jj2lfSNaqhCuwRlVBRNq7wDgQQDV09lv7um1zGXKPEor7ioOWL4Mo++NA3pp4xpFy/C+
	mpHrC+FIr3iwBo7rhYuonmv/oYfRvREXtwhMReqvS8P8KP1AVM6i8+ivbBdxYFK2KLeF
	wzWW66Ad64sphCHyM9GyKBRhxL2X36Yz7IURefeE6fXk4JrN+VqHQz9AdVfEP/qfJ88v
	PsyA==
MIME-Version: 1.0
Received: by 10.60.168.238 with SMTP id zz14mr2363586oeb.97.1352303382006;
	Wed, 07 Nov 2012 07:49:42 -0800 (PST)
Received: by 10.60.123.47 with HTTP; Wed, 7 Nov 2012 07:49:41 -0800 (PST)
Date: Wed, 7 Nov 2012 16:49:41 +0100
Message-ID: <CAOHjBZsXDK5NfrPwfHrKDSKeNvF8mf-rH9wXd-WKE8KvBTnpxw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Mips32 uclibc build failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2012 16:03:29 -0000
Content-Type: multipart/alternative; boundary=bcaec54a336ab68d5f04cde9aa94

--bcaec54a336ab68d5f04cde9aa94
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

building for mips32, uclibc build failed with

libc/sysdeps/linux/common/getppid.c:14:1: error: expected expression before
'=' token

Has someone met the same issue?

Please let me know.
Cheers,
Giuseppe

--bcaec54a336ab68d5f04cde9aa94
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>building for mips32, uclibc build fail=
ed with</div><div>=A0</div><div>libc/sysdeps/linux/common/getppid.c:14:1: e=
rror: expected expression before &#39;=3D&#39; token</div><div>=A0</div><di=
v>Has someone met the same issue?</div>
<div>=A0</div><div>Please let me know.</div><div>Cheers,</div><div>Giuseppe=
</div>

--bcaec54a336ab68d5f04cde9aa94--
