Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SXZ05-0005m5-P5
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 16:26:49 +0200
Received: by ghbz2 with SMTP id z2so1901712ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 07:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=mzq4knrgoP4fxBdEm4ynZhYT91z2hGVlepnq/fbTNj0=;
	b=PPDoSg8DlHOcWmtJMEsZqDucayfsz0RYxEZbYm2bUKCKKKrSxszPuhppOSrbIZWdJU
	YBK/BGpP+nio90uYfCTfO8EEoav5Vmkmhmn35Km4Q4Ale4ymXlpsl+cnqEe8GHFR1BaO
	is1MhpfLs04bdWJ1M4tTYt6MG6hSNPFxEKtwLxEi/cjDHBC1aPbSAWbauSmFyfG5ch4x
	VEoggwp6eRvAMQdro8deSxLg3ODzSaElY55K2ior7kWdMuDVpjWIC5uCOpFtAAJes5b0
	/z32GQ/qn8ljroxBFNaD4RfWw9pCk16I1TcVt1fZxJN4obfR34rO1/YOHK0LBeKQs6ZS
	4E5Q==
MIME-Version: 1.0
Received: by 10.50.185.232 with SMTP id ff8mr16932889igc.5.1337868997793; Thu,
	24 May 2012 07:16:37 -0700 (PDT)
Received: by 10.231.241.3 with HTTP; Thu, 24 May 2012 07:16:37 -0700 (PDT)
Date: Thu, 24 May 2012 16:16:37 +0200
Message-ID: <CAOHjBZuGGas8R4mO9oVcORC_3nn2usScg7+NXNthMF-1+f46ZA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: image post installation query issue
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
X-List-Received-Date: Thu, 24 May 2012 14:26:50 -0000
Content-Type: multipart/alternative; boundary=14dae9340f295e97db04c0c8e634

--14dae9340f295e97db04c0c8e634
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

just a question about core images rpm installation.

I have understood and verified that if PACKAGE_CLASSES is set to
package_rpm then the rootfs of the image we choose to build is filled with

the installation result of a sort of rpm -U command (accordingly tuned).

So I can think that, after the process has finished, I can query for
example a package by typing rpm -qa command passing the right dbpath.

I'm in trouble just in this: how can I do this? Looking at the temp files I
can see --dbpath is set to /var/lib/rpm and this should be relative to the
path specified in --root.

Isn'it it?

Please let me know.

Thanks,

Giuseppe

--14dae9340f295e97db04c0c8e634
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Hi All,</p><p>just a question about core images rpm installation.</p><p>=
I have understood and verified that if PACKAGE_CLASSES is set to package_rp=
m then the rootfs of the image we choose to build is filled with</p><p>the =
installation result of a sort of rpm -U command (accordingly tuned).</p>
<p>So I can think that, after the process has finished, I can query for exa=
mple a package by typing rpm -qa command passing the right dbpath.</p><p>I&=
#39;m in trouble just in this: how can I do this? Looking at the=A0temp fil=
es=A0I can see --dbpath is set to /var/lib/rpm and this should be relative =
to the path specified in --root.</p>
<p>Isn&#39;it it?</p><p>Please let me know.</p><p>Thanks,</p><p>Giuseppe</p=
>

--14dae9340f295e97db04c0c8e634--
