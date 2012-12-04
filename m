Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TfojW-0007iN-DG
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:24:15 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so5664207ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=m/EFAjjAY2ggKbJ3C3Tg0APlGbfzXQmeXIBkLeH2L7A=;
	b=kbzB8NM8M0FvkgnUGXzMk05vgt59ZAMgq5htvXiR/ORpnSrvEPwxamqiP6jHHKqs6S
	OYZh/dcUoYoENkWDdU3mE5XHmcZuTn22eGqd1fux6KdvD0hdx1zSEeSsmx+Sa0Jcpve6
	P1ib4GGSm/l87v9jvp17zbAfLRnV7TF9cAewYBoeHXWtzi7skEdaMgYARzxP/BuiWU/E
	7eIVqlhy00b6cCo073pE1JZTNWfmEddoxupm98pkY/2RV4O2vN+I6ce2e1qjComrxMpl
	xyGOvkU84CW8+u7iQ9ivPkLF4UawPT/Pby1hm/QHevkK/VBKzSfL86kCbgypoi9ePUov
	+sgQ==
MIME-Version: 1.0
Received: by 10.43.49.199 with SMTP id vb7mr10480282icb.6.1354612183464; Tue,
	04 Dec 2012 01:09:43 -0800 (PST)
Received: by 10.64.24.179 with HTTP; Tue, 4 Dec 2012 01:09:43 -0800 (PST)
Date: Tue, 4 Dec 2012 10:09:43 +0100
Message-ID: <CAGiJk9c_5nDZbTwTo1DvHXMEtOXgO=4-YvbsDoD-ZXqY=cTi8g@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: EGL / GLES issues (mesa)
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
X-List-Received-Date: Tue, 04 Dec 2012 09:24:15 -0000
Content-Type: multipart/alternative; boundary=bcaec5299f8b00fc1e04d0033a02

--bcaec5299f8b00fc1e04d0033a02
Content-Type: text/plain; charset=UTF-8

Hi,

this regards to "e79987bc4bac1d739f92790f8e9840cd02f073d3 mesa: default to
enabling EGL and GLES"

So with my last update the behaviour changed and applications using EGL now
link against mesa instead of libgles-omap3, but deployed in my rootfs is
libgles-omap3.

This results in all Qt applications being broken (as I test EGL enabled Qt),
the resulting error message:  "application-name: error while loading shared
libraries: /usr/lib/libEGL.so: file too short"


Any ideas how this can be resolved gracefully?

-- 
Regards
Samuel

--bcaec5299f8b00fc1e04d0033a02
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>this regards to &quot;e79987bc4bac1d739f92790f8e9840cd02f073d3 m=
esa: default to enabling EGL and GLES&quot;<br><br clear=3D"all">So with my=
 last update the behaviour changed and applications using EGL now link agai=
nst mesa instead of libgles-omap3, but deployed in my rootfs is libgles-oma=
p3.<br>
<br>This results in all Qt applications being broken (as I test EGL enabled=
 Qt),<br>the resulting error message:=C2=A0 &quot;application-name: error w=
hile loading shared libraries: /usr/lib/libEGL.so: file too short&quot;<br>=
<br>
<br>Any ideas how this can be resolved gracefully?<br><br>-- <br>Regards<br=
>Samuel<br>

--bcaec5299f8b00fc1e04d0033a02--
