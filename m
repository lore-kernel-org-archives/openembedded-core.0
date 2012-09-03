Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1T8Ong-00022D-VZ
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 07:02:17 +0200
Received: by obblz20 with SMTP id lz20so8724703obb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Sep 2012 21:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=tNtfKiIxh+ZTMDmsfCSHcFGfGiJGkozyvDc46nJ21Vs=;
	b=FtQGGXm9KmBQlluwJBdCxMt/tnb36SLsV2GNJUEmv6oc/wW6ywjAamKnXhr3lRpHY0
	IriQIPeo5wk2mcD8Xoe5iQMp1MpDM8tcQtUUNC89qovMZsv6VB53/ZChjJ0KZ+pqCgHz
	J/Hti4dE10OQCnBZL5E/e8k7YgOOLrdoxhPCZulezDRK8HOPx4mycqSJ1TTNef1tMmpm
	4pJ2GChl7wjMyBGuzR+PK45XU2kfwj8BN9ptcjOljzbGsimK+Fu6d1pk7yb+X3vY8YAz
	cMI73hNlm1e0mfHWMO+uU4ibGi9NkUzcCMT01MABD0Ib3vZeItnPx85YaarqSDViJCPH
	jtHw==
MIME-Version: 1.0
Received: by 10.60.171.138 with SMTP id au10mr13455959oec.39.1346647796430;
	Sun, 02 Sep 2012 21:49:56 -0700 (PDT)
Received: by 10.60.33.201 with HTTP; Sun, 2 Sep 2012 21:49:56 -0700 (PDT)
Date: Mon, 3 Sep 2012 06:49:56 +0200
Message-ID: <CAOHjBZs0nD_7QjvxpQjF+on5a-e2nSDz_+NyatkVPKB4qyXkYw@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Cannot find -lssp during uclibc package build
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
X-List-Received-Date: Mon, 03 Sep 2012 05:02:17 -0000
Content-Type: multipart/alternative; boundary=bcaec554051c8b35fa04c8c4df67

--bcaec554051c8b35fa04c8c4df67
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem, All

I'm building an uclibc image using gcc 4.6.3 instead of the 4.7 version
oe-core provides.
I'm falling in the following linker error during uClibc package build:

"Cannot find -lssp"

Now, ssp support is enabled in the uClibc package and disabled in the
gcc-cross-initial package, so
ld should not include that by default. Instead it does and if I switch to
old OE-Core repository (June 2012)
I can see all goes right just because the gcc-cross-intermediate package
was still present and uClibc depends on it
for building. Now, I know the -intermediate package was moved out and the
-initial one should include it, but
that's it.
I've not tested that with gcc 4.7 version, this is out of my scope.
Please, can you address me to solve this issue?

Best Regards,
Giuseppe

--bcaec554051c8b35fa04c8c4df67
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem, All</div><div>=A0</div><div>I&#39;m building an uclibc=A0imag=
e using gcc 4.6.3 instead of the 4.7 version oe-core provides.</div><div>I&=
#39;m falling in the following linker=A0error during uClibc package build:<=
/div>
<div>=A0</div><div>&quot;Cannot find -lssp&quot;</div><div>=A0</div><div>No=
w, ssp support is enabled in the uClibc package and disabled in the gcc-cro=
ss-initial package, so</div><div>ld should not include that by default. Ins=
tead it does and if I switch to old OE-Core repository (June 2012)</div>
<div>I can see all goes right just because the gcc-cross-intermediate packa=
ge was still present and uClibc depends on it</div><div>for building. Now, =
I know the -intermediate package was moved out and the -initial one should =
include it, but</div>
<div>that&#39;s it.</div><div>I&#39;ve not tested that with gcc 4.7 version=
, this is out of my scope.</div><div>Please, can you address me to solve th=
is issue?</div><div>=A0</div><div>Best Regards,</div><div>Giuseppe</div><di=
v>
=A0</div>

--bcaec554051c8b35fa04c8c4df67--
