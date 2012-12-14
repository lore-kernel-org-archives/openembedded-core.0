Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TjYYn-000221-2t
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 17:56:31 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so3661668oag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 08:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QEeKPeisZdNg9KAVX32qwWGfOoFfYkNb5ejx/bNTODU=;
	b=McCqrxo8Ogaijv9n8tp3ro+NdU/ncq3t0abNDmAwrxjyFVruZotG+ydJ2tcui2+9Gl
	uYlp6sxoruD4zps+Xreccy0ElFz4sXZQlabQMi4rTmNZpKXqOmLTmg/EJoj5OoUsvtWk
	FBddv2veo5HEng4m5cfm5AWychbylylHHeEeXBvkbDqluMFcIavMF0KQRay2rsuWqHam
	o7nnrzbyBuYiJ6bPCIKetXWMdyLIH+ydJIhP9Q9x9rkB26frB/Y7x9/hDLIjU4M5r1Vu
	Gy4fTBbcf8NNu64U9yAbBRUNAyQs53DfQ+0nKbfVQKABxivjuS3x/hTgCby/xZo5xder
	k+Ag==
MIME-Version: 1.0
Received: by 10.60.169.177 with SMTP id af17mr4941798oec.103.1355503312196;
	Fri, 14 Dec 2012 08:41:52 -0800 (PST)
Received: by 10.60.8.39 with HTTP; Fri, 14 Dec 2012 08:41:52 -0800 (PST)
Date: Fri, 14 Dec 2012 17:41:52 +0100
Message-ID: <CAOHjBZvW_wovoRDXuk=sbc-sgf64zLjsZYwDv+1UnXgkrLE_Nw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: gcc-4.7.inc wrong FILESPATH setting?
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
X-List-Received-Date: Fri, 14 Dec 2012 16:56:31 -0000
Content-Type: multipart/alternative; boundary=bcaec517a6ba6a53ed04d0d2b520

--bcaec517a6ba6a53ed04d0d2b520
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I've seen that, in the given .inc file, the FILESPATH is statically set to

FILESPATH = "${FILE_DIRNAME}/gcc-4.7"

This seems to avoid any FILESEXTRAPATHS_prepend usage on append file.
I need to add further patches for gcc-4.7.2 in my own meta layer but if I
set the FILESEXTRAPATHS_prepend as usual
nothing happens, sources are taken only from the directory set by FILESPATH.
Also I saw this setting was different in the past
FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"

Comments are welcome.
Cheers,
Giuseppe

--bcaec517a6ba6a53ed04d0d2b520
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>I&#39;ve seen that, in the given .inc =
file, the FILESPATH is statically set to</div><div>=A0</div><div>FILESPATH =
=3D &quot;${FILE_DIRNAME}/gcc-4.7&quot;</div><div>=A0</div><div>This seems =
to avoid any FILESEXTRAPATHS_prepend usage on append file.</div>
<div>I need to add further patches for gcc-4.7.2 in my own meta layer but i=
f I set the FILESEXTRAPATHS_prepend as usual</div><div>nothing happens, sou=
rces are taken only from the directory set by FILESPATH.</div><div>Also I s=
aw this setting was different in the past<br>
</div><div>FILESPATH =3D &quot;<a href=3D"mailto:${@base_set_filespath">${@=
base_set_filespath</a>([ &#39;${FILE_DIRNAME}/gcc-4.7&#39; ], d)}&quot;</di=
v><div>=A0</div><div>Comments are welcome.</div><div>Cheers,</div><div>Gius=
eppe</div>

--bcaec517a6ba6a53ed04d0d2b520--
