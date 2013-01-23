Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>)
	id 1Txoig-0007j1-72; Wed, 23 Jan 2013 02:01:49 +0100
Received: by mail-vc0-f173.google.com with SMTP id fy7so4044444vcb.18
	for <multiple recipients>; Tue, 22 Jan 2013 16:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=VjUx6OmI+DnBGzz/w2EHvTV0L+Kjg/yZ+Xrwsp7ig+g=;
	b=TEwB9o1Q5AzAkMt0lIiVYskNvKSi9bugQs6h45jCXj/o4POjKbmHUDZMnHwaVxH2K/
	JMhiqtXm2UlxFU8WA1EhruQ/ug2X4T+W943jCsOW98kGHeBJafo0eTKoemIZOFxVY90d
	xOqP99tEmPsLHjDTjUBn6b1IvtYo3yYZxX+Cs3Rk09ROo98ODunW9pv1tp4saPw7HV32
	QpGtDu0I2OLuhSqjiJdGgg6a078YaRfMlAcYxNyokef2TUzhw5t1FSccDbNqu+4xFWLA
	ZIj2o6sNjRWgd/tQVDoUuvjefQN3O6Z++6jnOKodjTlwJcOkgKjAMEy+zq1kcHOa+x5x
	rq6A==
MIME-Version: 1.0
X-Received: by 10.220.149.81 with SMTP id s17mr11513829vcv.31.1358901967115;
	Tue, 22 Jan 2013 16:46:07 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Tue, 22 Jan 2013 16:46:06 -0800 (PST)
Date: Wed, 23 Jan 2013 01:46:06 +0100
Message-ID: <CALbNGRTpOzUnNrOMH9AsTnG320z88iT1pmz2qrj0GBkyrkgLYw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core@lists.openembedded.org
Subject: future of meta-systemd
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
X-List-Received-Date: Wed, 23 Jan 2013 01:01:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have followed the systemd migration to oe-core only sporadic without
having tests / experiences so far because other issues are waiting for
closure.
Major difference is that we now get a distro feature for init system
(for systemd part kind of D=C3=A9j=C3=A0-vu for me..). As I see it, we shou=
ld
now merge all appends back into the layers, align some configurations
depending on systemd and remove meta-systemd.

If this is correct: Is anybody out there willing to or already working on t=
his?
If not: What is the suggested layout?

Andreas


