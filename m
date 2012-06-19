Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sh5Ha-00023d-Vx
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 22:44:15 +0200
Received: by eaal1 with SMTP id l1so2207201eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=8H3qq0YL38H0l8/7D7TKTDditrxQDLRcg1GBFx/ix7s=;
	b=uSlUt18j35w2nS+KvRqp/HKUwc/5lNR3zQBnyVg1MzXVtJf6bCGfJVUK+pH9opOmVl
	ao9vvGEYSu+B/PTgabgayPjyTiF4y5ygdG5QJYV9d+vx6Tg20xJtDCb1WB64SGeBtugi
	UyZi0VVAGUZz/E+aZJsPgWIbWw1uoYrkZ2zMaX3rbVVHrPXaVBOIKQsLSHXNeaJnlWrR
	OGNiqTO+vQf7kzXgKShZeeEosY+6rf4BXigleo1XT+ib6VjvtSRbqPVUE1pM9emksPps
	6u+Qg8R67oAnKejxxvLqt1vqJzjh8AU0jNK+hUemMas+OL0zksWgcx4KYWOI6DGdSVZX
	EFFQ==
MIME-Version: 1.0
Received: by 10.14.37.206 with SMTP id y54mr4811061eea.218.1340138011221; Tue,
	19 Jun 2012 13:33:31 -0700 (PDT)
Received: by 10.14.219.71 with HTTP; Tue, 19 Jun 2012 13:33:31 -0700 (PDT)
In-Reply-To: <CANrdZLjpmXK5j+jr=fTD43je2Ni6exWGcrCkejKgE1ZZXe5TGQ@mail.gmail.com>
References: <CANrdZLjpmXK5j+jr=fTD43je2Ni6exWGcrCkejKgE1ZZXe5TGQ@mail.gmail.com>
Date: Tue, 19 Jun 2012 13:33:31 -0700
Message-ID: <CAMKF1spWqFCoXRbnevoKz+ftThQf41nObpMQ6N46YQ6_fucznQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Generating a movable SDK
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
X-List-Received-Date: Tue, 19 Jun 2012 20:44:15 -0000
Content-Type: multipart/alternative; boundary=bcaec517a71c1bdec904c2d93271

--bcaec517a71c1bdec904c2d93271
Content-Type: text/plain; charset=UTF-8

On Tuesday, June 19, 2012, Steve English <steve.english@navetas.com> wrote:
> Hi,
> I've generated a cross compiling ARM SDK
(angstrom-eglibc-x86_64-armv7a-v2012.05-toolchain.tar.bz2) that works great
if installed in /usr/local/oecore-x86_64. I would like to move these
binaries and run them from under my home directory (on this and other host
machines).
>
> I can tweak the PATH and use --sysroot where appropriate, but the ELF
binaries themselves specify a loader of
/usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2
in their .interp header. Is it possible to generate an SDK that uses the
standard host loader, or at least uses a relative path for the built loader?


Sdk is not install time relocatable yet there is a feature enhancement
request in yo to bugzilla for the same

M>
> I have also asked this question (in a slightly more generic form) on
Stack Overflow http://stackoverflow.com/q/11104609/307745
>
> Thanks,
>
> Steve
>

--bcaec517a71c1bdec904c2d93271
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, June 19, 2012, Steve English &lt;<a href=3D"mailto:stev=
e.english@navetas.com">steve.english@navetas.com</a>&gt; wrote:<br>&gt; Hi,=
<br>&gt; I&#39;ve generated a cross compiling ARM SDK (angstrom-eglibc-x86_=
64-armv7a-v2012.05-toolchain.tar.bz2) that works great if installed in /usr=
/local/oecore-x86_64. I would like to move these binaries and run them from=
 under my home directory (on this and other host machines).<br>
&gt;<br>&gt; I can tweak the PATH and use --sysroot where appropriate, but =
the ELF binaries themselves specify a loader of /usr/local/oecore-x86_64/sy=
sroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2 in their .interp h=
eader. Is it possible to generate an SDK that uses the standard host loader=
, or at least uses a relative path for the built loader?<br>
<br><br>Sdk is not install time relocatable yet there is a feature enhancem=
ent request in yo to bugzilla for the same<br><br>M&gt;<br>&gt; I have also=
 asked this question (in a slightly more generic form) on Stack Overflow <a=
 href=3D"http://stackoverflow.com/q/11104609/307745">http://stackoverflow.c=
om/q/11104609/307745</a><br>
&gt;<br>&gt; Thanks,<br>&gt;<br>&gt; Steve<br>&gt;

--bcaec517a71c1bdec904c2d93271--
