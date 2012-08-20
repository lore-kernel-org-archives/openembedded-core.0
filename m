Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T3UJc-0001qn-Np
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 17:54:57 +0200
Received: by pbcwy7 with SMTP id wy7so8147065pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to:x-mailer;
	bh=h+JaQwLNd/Wowi09tL36ICjrqHn+JKmJGsfcQsmeRMk=;
	b=hlTbmE+Prp0j7t6B+QUXA8Two6Gw5v6GDuGEdbnMHh1a5ko43vfr8zum1N1CCdXQoq
	ti4MxEBEzjIv3KWZB3K5J7N2ZzSRnQfaRFeLr3DtSs7jqoTrjYFYrKSTdojTQIc9/WCw
	O6ZUVFLZ2kjCVAyd7nedsdOc5jAjE0E8QceUZVHIY2YWlqXwan1Naj0Yo3W4H81Er2f0
	isxW0joC5EX3Gq6edvxn4lRX4I7fiZcx9otEmz2dnBzxMrZN1gjQEEHFYaK7AF7SWgz5
	G5XhzRBn4jlCDFPn4isKpnvpkXLlhp9vzYNxxy/3SUw44wJD/0Q/LfubDQpmT3JsMnh9
	30nQ==
Received: by 10.68.217.69 with SMTP id ow5mr35253898pbc.35.1345477373284;
	Mon, 20 Aug 2012 08:42:53 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id y11sm11298267pbv.66.2012.08.20.08.42.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 08:42:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <1450996.gKDeWNK0nL@helios>
Date: Mon, 20 Aug 2012 19:42:47 +0400
Message-Id: <E8F2C9F0-E7CE-44CC-9FBE-1B058F1CE6B7@gmail.com>
References: <50320C3E.8030009@nedap.com> <1450996.gKDeWNK0nL@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: can't login??
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
X-List-Received-Date: Mon, 20 Aug 2012 15:54:57 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_059ADB62-2BAF-4404-B5B7-B2D360CB7D14"

--Apple-Mail=_059ADB62-2BAF-4404-B5B7-B2D360CB7D14
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

On Aug 20, 2012, at 2:34 PM, Paul Eggleton wrote:
>=20
> Is "debug-tweaks" in IMAGE_FEATURES?
>=20


I too have the same problem, I've got debug-tweaks in IMAGE_FEATURES, =
but it doesn't allow me to login.  If I type root as the username, it =
does nothing and brings up the login prompt again.

Starting syslogd/klogd:=20
Yocto (Built by Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0

(none) login: root

Yocto (Built by Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0

(none) login:=20
Yocto (Built by Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0

(none) login:=20
Yocto (Built by Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0

(none) login:=20


Elvis Dowson=

--Apple-Mail=_059ADB62-2BAF-4404-B5B7-B2D360CB7D14
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">Hi,<div><br><div><div>On Aug 20, 2012, at 2:34 PM, Paul Eggleton =
wrote:</div><blockquote type=3D"cite"><div><font =
class=3D"Apple-style-span" color=3D"#000000"><br></font>Is =
"debug-tweaks" in =
IMAGE_FEATURES?<br><br></div></blockquote></div><div><br></div>I too =
have the same problem, I've got debug-tweaks in IMAGE_FEATURES, but it =
doesn't allow me to login. &nbsp;If I type root as the username, it does =
nothing and brings up the login prompt =
again.<div><br></div><div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">Starting =
syslogd/klogd:&nbsp;</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">Yocto (Built by Poky 7.0) =
1.2+snapshot-20120820 (none) ttyS0</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">(none) login: root</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">Yocto (Built by Poky 7.0) =
1.2+snapshot-20120820 (none) ttyS0</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">(none) login:&nbsp;</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">Yocto (Built by =
Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">(none) login:&nbsp;</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">Yocto (Built by =
Poky 7.0) 1.2+snapshot-20120820 (none) ttyS0</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">(none) =
login:&nbsp;</font></div></div><div><br></div><div><br></div><div>Elvis =
Dowson</div></div></body></html>=

--Apple-Mail=_059ADB62-2BAF-4404-B5B7-B2D360CB7D14--
