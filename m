Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sidebranch.openembedded@gmail.com>)
	id 1RiYTF-0007iB-Cx for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 22:34:05 +0100
Received: by eaal1 with SMTP id l1so15867995eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 13:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=7etxCR0KzW/MVqyfv9l6MIfKPo/BelTfarmaRuu4py8=;
	b=BX6q7UGSvFOmj5+8ZONZHC73EnlSqOeXR71QvaUIgBoMg3FmUbg9fMCxt3fh0GIvun
	55gJT72voC1O5Fzl5E5YfxfWKj8fV5dvIUTibtKOvFeBjpGvQRoUryfpNQdfHSDZ3yXr
	RH3ObmWqX5P5Olusx/DMvGIYfC0l9Tn+tSum0=
MIME-Version: 1.0
Received: by 10.204.133.213 with SMTP id g21mr14598834bkt.126.1325712403265;
	Wed, 04 Jan 2012 13:26:43 -0800 (PST)
Received: by 10.205.121.142 with HTTP; Wed, 4 Jan 2012 13:26:43 -0800 (PST)
Date: Wed, 4 Jan 2012 22:26:43 +0100
Message-ID: <CAMvUbCzvVSiLqKPsMx1PyLHnaErKwd2R+nRZqbmLPtRfpoF=YQ@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: meta-openembedded: avahi-ui-0.6.30: 'Fetcher failure for URL: 'file://fix_for_automake_1.11.2.patch'
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
X-List-Received-Date: Wed, 04 Jan 2012 21:34:05 -0000
Content-Type: multipart/alternative; boundary=0015175cbb0adefac004b5ba78e3

--0015175cbb0adefac004b5ba78e3
Content-Type: text/plain; charset=ISO-8859-1

Hello,

avahi-ui-0.6.30 recipe appears in both openembedded-core and
meta-openembedded, is this intended and if so why? I do not see it doing
things differently.

The first one seems better maintained, the one in meta-openembedded has
MD5/SHA sums.

With todays GIT pull of both layers (meta-oe on top of oe-core), I run into
this problem:

-----
NOTE: package avahi-ui-0.6.30-r0: task do_fetch: Started
ERROR: Function 'Fetcher failure for URL:
'file://fix_for_automake_1.11.2.patch'. Unable to fetch URL
file://fix_for_automake_1.11.2.patch from any source.' failed
ERROR: Logfile of failure stored in:
/home/leon/sandbox/sidebranch/openembedded/imx53qsb/openembedded/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/avahi-ui-0.6.30-r0/temp/log.do_fetch.27184
Log data follows:
| DEBUG: Trying PREMIRRORS
| DEBUG: Trying Upstream
| ERROR: Function 'Fetcher failure for URL:
'file://fix_for_automake_1.11.2.patch'. Unable to fetch URL
file://fix_for_automake_1.11.2.patch from any source.' failed
ERROR: Task 2836
(/home/leon/sandbox/sidebranch/openembedded/imx53qsb/openembedded/meta-openembedded.git/meta-oe/recipes-connectivity/avahi/
avahi-ui_0.6.30.bb, do_fetch) failed with exit code '1'

meld ../openembedded-core.git/meta/recipes-connectivity/avahi/
avahi-ui_0.6.30.bb../meta-openembedded.git/meta-oe/recipes-connectivity/avahi/
avahi-ui_0.6.30.bb
-----

I cannot spot the error, other than that the patch exists in oe-core, but
it required from meta-oe. That should work, shouldn't it?

Regards,

Leon.

--0015175cbb0adefac004b5ba78e3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,<br><br>avahi-ui-0.6.30 recipe appears in both openembedded-core and =
meta-openembedded, is this intended and if so why? I do not see it doing th=
ings differently.<br><br>The first one seems better maintained, the one in =
meta-openembedded has MD5/SHA sums.<br>
<br>With todays GIT pull of both layers (meta-oe on top of oe-core), I run =
into this problem:<br>
<br>-----<br>NOTE: package avahi-ui-0.6.30-r0: task do_fetch: Started<br>ER=
ROR: Function &#39;Fetcher failure for URL: &#39;file://fix_for_automake_1.=
11.2.patch&#39;. Unable to fetch URL file://fix_for_automake_1.11.2.patch f=
rom any source.&#39; failed<br>

ERROR: Logfile of failure stored in: /home/leon/sandbox/sidebranch/openembe=
dded/imx53qsb/openembedded/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-g=
nueabi/avahi-ui-0.6.30-r0/temp/log.do_fetch.27184<br>Log data follows:<br>

| DEBUG: Trying PREMIRRORS<br>| DEBUG: Trying Upstream<br>| ERROR: Function=
 &#39;Fetcher failure for URL: &#39;file://fix_for_automake_1.11.2.patch&#3=
9;. Unable to fetch URL file://fix_for_automake_1.11.2.patch from any sourc=
e.&#39; failed<br>

ERROR: Task 2836 (/home/leon/sandbox/sidebranch/openembedded/imx53qsb/opene=
mbedded/meta-openembedded.git/meta-oe/recipes-connectivity/avahi/<a href=3D=
"http://avahi-ui_0.6.30.bb" target=3D"_blank">avahi-ui_0.6.30.bb</a>, do_fe=
tch) failed with exit code &#39;1&#39;<br>

<br>meld ../openembedded-core.git/meta/recipes-connectivity/avahi/<a href=
=3D"http://avahi-ui_0.6.30.bb" target=3D"_blank">avahi-ui_0.6.30.bb</a> ../=
meta-openembedded.git/meta-oe/recipes-connectivity/avahi/<a href=3D"http://=
avahi-ui_0.6.30.bb" target=3D"_blank">avahi-ui_0.6.30.bb</a><br>
-----<br><br>I cannot spot the error, other than that the patch exists in o=
e-core, but it required from meta-oe. That should work, shouldn&#39;t it?<b=
r><br>Regards,<br><br>Leon.<br><br>
<br><br>

--0015175cbb0adefac004b5ba78e3--
