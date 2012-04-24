Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pcjegan@gmail.com>) id 1SMfri-0003nP-Kh
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 15:33:10 +0200
Received: by wgbds1 with SMTP id ds1so3379522wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 06:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type;
	bh=3dyKUKSDzXzfS1zCdIuMvMWEoNhGLb4PM1wOsCAA6e4=;
	b=XET9FYsPwu0LuLa4z/1t2TQK/ptCowUK9IMUa8VM7EqUNc8ZVN048O4wj/vZQZBEPt
	li+icRitsbmT6X4UkZ5JabZey3HFoXMRlfAmkCug5KxDQz2jpZIdUAEpGmo4iNGfvWUc
	J0fmuTnyQ4zMDVv5pmEjlWShE8/QOWH9Y9zrO1puS5ddyaO3ekvhcU38TUgS4NdAYEd0
	IUBWXtvrzPJZ6PUMMYnZFU2frCwK8aQ5TEMZDWfdMaJEDwpQ0lllqOl1VQn9TGAv/xfI
	b7xDX5b68zWdT8rfM7kN49z3a3DNmMgGjBwBlhV6zlbGIpRlNJ6tdtKXmOKiyUA9Gk0s
	kt9Q==
Received: by 10.180.85.70 with SMTP id f6mr31534050wiz.5.1335273815984; Tue,
	24 Apr 2012 06:23:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.185.195 with HTTP; Tue, 24 Apr 2012 06:23:14 -0700 (PDT)
From: Jegan Chandru <pcjegan@gmail.com>
Date: Tue, 24 Apr 2012 18:53:14 +0530
Message-ID: <CAAA4K6J1SNRCr0uM1tT=DjyV47mk-KqGUZjT+B8qgujANw9ZTQ@mail.gmail.com>
To: yocto@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: adding package nss in rootfs failed with dependency "/usr/local/bin/perl"
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
X-List-Received-Date: Tue, 24 Apr 2012 13:33:10 -0000
Content-Type: multipart/alternative; boundary=f46d041825587ac98504be6ca9f8

--f46d041825587ac98504be6ca9f8
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have cross compiled NSS 3.13.1 for x86 64 bit environment, but when I try
to add NSS package in rootfs, i am getting the following error,

*error: Failed dependencies:
       /usr/local/bin/perl is needed by nss-3.13.1-r0.x86_64*

I know perl is needed for nss, but the path which is trying to look perl,
is quite confusing me, for perl doesn't exist in that location at all. Can
anyone please tell me whats going on here and what have I missed?

P.S: I am using Yocto-1.1.1 and Ubuntu host-11.10 64 bit.

Thanks all for your help,
JC

--f46d041825587ac98504be6ca9f8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>I have cross compiled NSS 3.13.1 for x86 64 bit environment, but=
 when I try to add NSS package in rootfs, i am getting the following error,=
<br><br><i>error: Failed dependencies:<br> =A0 =A0 =A0 =A0/usr/local/bin/pe=
rl is needed by nss-3.13.1-r0.x86_64</i><br>

<br>I know perl is needed for nss, but the path which is trying to look per=
l, is quite confusing me, for perl doesn&#39;t exist in that location at al=
l. Can anyone please tell me whats going on here and what have I missed?<br=
>

<br>P.S: I am using Yocto-1.1.1 and Ubuntu host-11.10 64 bit.<br><br><div>T=
hanks all for your help,</div><div>JC</div>

--f46d041825587ac98504be6ca9f8--
