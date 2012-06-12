Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SeNEk-0005zV-UM
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 11:18:07 +0200
Received: by ghbz2 with SMTP id z2so3006403ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 02:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/qODrf3XAxUvJwbqXyHBOlI0avT1qrqJ5Q1JPX+L0TE=;
	b=tFSFFkAMe4rFgQm9XoiB1R7P6ov+WpoWcIJNFjAIQPMgxsukP+2o2SAF/pqtUWwNOy
	f5m7W+YfK2d+yYL140UPkjVjBxXil/GM/iXgLf/gcoC4/SOVi6HraieT53Vhqd4szwUu
	jJa0wPxM9Fy46dVIA+OPC6l+rCL3rgTWfaBqFys5sxfvNEJdXc4fI5YNhC0TXxv2SOGO
	A0Ot0KVOy5VgPO06bTw+ov1sqG/f0mnStRfp3LeOoqUQPr3fKgR2FfDOoNA1hZA8rAR0
	ZGp3mpVx9qzphCZfFjKnjMOjwbchja68ad/S1POLyAALnxXmGOAHrn9/qzXMquSKaTry
	MWYw==
MIME-Version: 1.0
Received: by 10.50.189.134 with SMTP id gi6mr7714853igc.55.1339492051516; Tue,
	12 Jun 2012 02:07:31 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Tue, 12 Jun 2012 02:07:31 -0700 (PDT)
Date: Tue, 12 Jun 2012 11:07:31 +0200
Message-ID: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: fixup_perms failure on linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2012 09:18:07 -0000
Content-Type: multipart/alternative; boundary=14dae9340a1be8fc8d04c242cb57

--14dae9340a1be8fc8d04c242cb57
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

building linux-libc-headers, at the do_package step I'm falling in this
error.

Error executing a python function in
/oelinux/condorg/openembedded-core/meta-stlinux/recipes-kernel/linux-libc-headers/
linux-libc-headers_2.6.32.bb:
OSError: [Errno 1] Operation not permitted:
'/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/usr'

It seems the fixup_perms python function is failing to change permissions.
I've aligned oe-core repository to the best so far yesterday afternoon.
I'm confident the problem should appear also for other packages during
build.

Any help, please?

Best Regards,
Giuseppe

--14dae9340a1be8fc8d04c242cb57
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>building linux-libc-headers, at the do=
_package step I&#39;m falling in this error.</div><div>=A0</div><div>Error =
executing a python function in /oelinux/condorg/openembedded-core/meta-stli=
nux/recipes-kernel/linux-libc-headers/<a href=3D"http://linux-libc-headers_=
2.6.32.bb">linux-libc-headers_2.6.32.bb</a>:<br>
OSError: [Errno 1] Operation not permitted: &#39;/oelinux/condorg/openembed=
ded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/linux-libc-h=
eaders-2.6.32-r1/package/usr&#39;</div><div>=A0</div><div>It seems the fixu=
p_perms python function is failing to change permissions. I&#39;ve aligned =
oe-core repository to the best so far yesterday afternoon.</div>
<div>I&#39;m confident the problem should appear also for other packages du=
ring build.</div><div>=A0</div><div>Any help, please?</div><div>=A0</div><d=
iv>Best Regards,</div><div>Giuseppe<br></div>

--14dae9340a1be8fc8d04c242cb57--
