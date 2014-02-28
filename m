Return-Path: <jvp.vuorivirta@gmail.com>
Received: from mail-wg0-f65.google.com (mail-wg0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 08CD86D305
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 09:02:57 +0000 (UTC)
Received: by mail-wg0-f65.google.com with SMTP id l18so120360wgh.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 01:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=//E5sRaN4n+o3F9AB0GOc8gJPtu5jGLy0I9x/raVy5o=;
	b=p50CAIC/Tx8MPSmqYU0cEFdGlJioZSkW0j1JrZl+5wzsmvzMPxH8KKVUIrQtiZyVkz
	lt7q4CDMtRGGsSn0Cvbg+7a3GO96BlXJORxSClI8m5pPUsq+a45lhikB21K/6Ea1rwIQ
	Jr1bkwksUO2WNb+tiri5hiDPwF0y/e452ViJSiqAOnnuPZgEIagsZ8+aH74P/D2IVL7O
	IJs4V/su3cNXE4Ub698bSCvtN4PDJ106xMxvWnzka5tM2fNUoJ5cm/EB3oFDgsp09iWq
	Ksk3ZSOdig7oPGYhOh0lGGZng8N+Dz4vQTe2TkWeSWDbzurtULSvSgSgTRmq4JYOK6QU
	5sfw==
MIME-Version: 1.0
X-Received: by 10.194.92.164 with SMTP id cn4mr649417wjb.74.1393578177835;
	Fri, 28 Feb 2014 01:02:57 -0800 (PST)
Received: by 10.194.22.39 with HTTP; Fri, 28 Feb 2014 01:02:57 -0800 (PST)
Date: Fri, 28 Feb 2014 11:02:57 +0200
Message-ID: <CAEpurxHdgtzVsGo1+YTNiOx1YFAAxEMUkt8muL2kkG3jKC7EuQ@mail.gmail.com>
From: Juha Vuorivirta <jvp.vuorivirta@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Update linux-firmware files.
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
X-List-Received-Date: Fri, 28 Feb 2014 09:02:58 -0000
Content-Type: multipart/alternative; boundary=047d7bfceb4a41ba6104f373b40e

--047d7bfceb4a41ba6104f373b40e
Content-Type: text/plain; charset=ISO-8859-1

Hello!

I have ath6k WLAN drivers enabled and linux-firmware-ath6k package added in
my custom board build. Now we need to update aht6k files in
/lib/firmware/ath6k/AR6003/hw2.1.1 to match our needs.

How can I do this properly? I tried with linux-firmware_git.bbappend file
but it tries to pull files from git, but I have those files already, so I
do not need to pull them from git.

Furthermore I tried to add files to my own layer and install files there
but got lots of QA issue errors.

br,

JV

--047d7bfceb4a41ba6104f373b40e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello!</div><div>=A0</div><div>I have ath6k WLAN driv=
ers enabled and linux-firmware-ath6k package added in my custom board build=
. Now we need to update=A0aht6k files in /lib/firmware/ath6k/AR6003/hw2.1.1=
 to match our needs.</div>
<div>=A0</div><div>How can I do this properly? I tried with linux-firmware_=
git.bbappend file but it tries to pull files from git, but I have those fil=
es=A0already, so I do not need to pull them from git.</div><div>=A0</div><d=
iv>
Furthermore I tried to add files to my own layer and install files there bu=
t got lots of=A0QA issue errors.</div><div>=A0</div><div>br,</div><div>=A0<=
/div><div>JV=A0=A0</div></div>

--047d7bfceb4a41ba6104f373b40e--
