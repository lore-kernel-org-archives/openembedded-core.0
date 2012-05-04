Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SQDV3-0005fF-52
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 10:04:25 +0200
Received: by wibhj13 with SMTP id hj13so953940wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version:x-mailer;
	bh=f8iVK2v/zrAj9qL6MBOdPQcP35f2GQZTyjXPV1jwhfc=;
	b=mUmxURaCrHhrfnm8YTMLFtDBCCFiJiWhqW7MF0k0nlVzja5hVQ9Qz3u9Oi/G+D4eJs
	bIAJASUwoElCHu1Ld/0sfOnS5JIuH2ZP2KuSdwdlSAfSt82fyMsMZG7NSDXBo9m9oTCk
	HAMI+OZLt2PyHRha+otlOf21bqLzkrrBf+b+VA4W17Zt3XEPIwykZKzAZ0nXTj5c0ACB
	WBaff2PYWsWHIQHgTPk7tlhNzHYXM2Mo0DVMX4G7DN+PuAqcr/LLFlNVwKk1BNC0Kit1
	+8akRsB0yGDrl3+vKvCD9MaWoDe3OUoDN9HBw67FRXxYSVLYTuxooViHXvKtjJwKztlt
	nNJA==
Received: by 10.180.94.33 with SMTP id cz1mr10459311wib.13.1336118078749;
	Fri, 04 May 2012 00:54:38 -0700 (PDT)
Received: from [192.168.1.35] (39.Red-81-33-71.dynamicIP.rima-tde.net.
	[81.33.71.39])
	by mx.google.com with ESMTPS id fn2sm12504386wib.0.2012.05.04.00.54.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 00:54:37 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Fri, 4 May 2012 09:54:35 +0200
Message-Id: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
Subject: How to fix warning: set SYSTEMD_PACKAGES as <existing-package>-systemd
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
X-List-Received-Date: Fri, 04 May 2012 08:04:25 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C634D2E5-DD98-4D0A-AADF-71C4A7F16AFD"

--Apple-Mail=_C634D2E5-DD98-4D0A-AADF-71C4A7F16AFD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
      I get the following warnings when I try to do bitbake =
core-image-minimal

WARNING: =
/tool/yocto/meta-openembedded/meta-oe/recipes-connectivity/networkmanager/=
networkmanager_0.9.2.0.bb: it is recommended to set SYSTEMD_PACKAGES as =
<existing-package>-systemd

WARNING: =
/tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb: it =
is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

What is the appropriate change to make these two warnings go away?

Best regards,

Elvis Dowson=

--Apple-Mail=_C634D2E5-DD98-4D0A-AADF-71C4A7F16AFD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">Hi,<div>&nbsp; &nbsp; &nbsp; I get the following warnings when I try =
to do bitbake core-image-minimal</div><div><br></div><div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">WARNING: =
/tool/yocto/meta-openembedded/meta-oe/recipes-connectivity/networkmanager/=
networkmanager_0.9.2.0.bb: it is recommended to set SYSTEMD_PACKAGES as =
&lt;existing-package&gt;-systemd</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">WARNING: =
/tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb: it =
is recommended to set SYSTEMD_PACKAGES as =
&lt;existing-package&gt;-systemd</font></div></div><div><br></div><div>Wha=
t is the appropriate change to make these two warnings go =
away?</div><div><br></div><div>Best =
regards,</div><div><br></div><div>Elvis Dowson</div></body></html>=

--Apple-Mail=_C634D2E5-DD98-4D0A-AADF-71C4A7F16AFD--
