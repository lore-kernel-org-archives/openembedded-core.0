Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 93D3975894
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:14:36 +0000 (UTC)
Received: by qgep100 with SMTP id p100so8951370qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 12:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=/9dpCbBgbo2TejHAOEQMgljORsG1HazPvWIqPD4mkz8=;
	b=TMY+SI46mdfDVX7o+vf1pfuocsF2kf51z/pBA6wJAixu3IbN7xk0jt3pDJtFYUgHp7
	IWHIYpJ0VnjsPePsRgw4e8L79H3+bCEWTzJLi+M+g+pCw4e+uxz23cDgf+AnJd5FsOcB
	nRVQh4Y1Ap+mw4n56N6jqijKKmQJRjmDHMDP98rsjuopElxlWJrHA0qGJxSCcCY+qxIN
	G5SHKHz06Wu9WrIRW36daxWDgHL8NWVKOZ93ougxwmct7sFYkfWIOAACXckQa7pstS5N
	JluMwN95wac/yh0rmR6Rg5oTmxDBdghZqNobh27mGNfeE/PeQ3/rmQcjmT0iNCv2JdNj
	J7Ug==
X-Gm-Message-State: ALoCoQmUrbdG71j5pFRZAUse5EQXtR90qC3p03UmPfvRayQwN0QM7T6R+dbKsYnoLg/kc5BX7eZq
X-Received: by 10.55.40.18 with SMTP id o18mr46519329qkh.58.1433877275449;
	Tue, 09 Jun 2015 12:14:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 9 Jun 2015 12:14:15 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jun 2015 20:14:15 +0100
Message-ID: <CAJTo0LY2C3d6ewKs7f1V0U9k7vqMQ47kCnANetzGz1OhMtfTFg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [RFC] remove neon from oe-core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Jun 2015 19:14:38 -0000
Content-Type: multipart/alternative; boundary=001a11440fb8a8309905181a91b4

--001a11440fb8a8309905181a91b4
Content-Type: text/plain; charset=UTF-8

Hi,

Since Subversion moved away from neon it appears the only user of it in
oe-core is GStreamer as a HTTP client plugin.  By virtue of being
maintained I suspect the libsoup plugin is generally the better choice
there, so as neon is now unmaintained upstream (last release September
2014, doesn't work with latest GnuTLS release) I propose moving it to
meta-oe.

Any comments?

Ross

--001a11440fb8a8309905181a91b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Since Subversion moved away from ne=
on it appears the only user of it in oe-core is GStreamer as a HTTP client =
plugin.=C2=A0 By virtue of being maintained I suspect the libsoup plugin is=
 generally the better choice there, so as neon is now unmaintained upstream=
 (last release September 2014, doesn&#39;t work with latest GnuTLS release)=
 I propose moving it to meta-oe.</div><div><br></div><div>Any comments?</di=
v><div><br></div><div>Ross</div></div>

--001a11440fb8a8309905181a91b4--
