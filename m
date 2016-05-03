Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 388386FF4E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 16:25:19 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id p64so2860551lfg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=DR8zKD9sd8oamMVb+i/9+v9lezGIiz28uybSDpxznAw=;
	b=Gwehu7aCR9DoQ0/OWrZFriC3R3ZhdEo3hH9NHDpneXQ6Jv3BZig59TW24Ipt+j+5KF
	bCo0kgMLZipxgZwZxtpiRgZYRwWKjxIfw4qAz7VPOO6ymtbOjqgF7r4hKlX8G/re5xcC
	GU/nULFaaxyHJtD90GWZbIxEqEtc8lx38yChQYLs1SVHHDH9cUweLvuPHz68NFm/E/Uo
	uTMByiIWTfLCwkOhKJvi2/9f/xDL4SV9MkJ4BIdD2Cbx3Xu4DkPlKsclSoY1S74W7viB
	XPSUWadxCGaV/Q+8ViArxleRnT7CoajjcdaIuH13i3Z3ZIIhDPQxtjAWqL5m/DuaWIUH
	fAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DR8zKD9sd8oamMVb+i/9+v9lezGIiz28uybSDpxznAw=;
	b=VRE4Jd33hzv+8cZ3R7uwGPrwLgKdeS0PJCkK7YcTyWUl9SG3Si2AjUZ4gSp9by6s/a
	2BibcXsEKl9vwbzkVdzP+tb9FImQwxhEH5j2WTd1zmSq50kLeuwDqeO/G7FLH8HNhFqE
	oOL2IjJw62nvnLhMFsev0T6Yh7LVhBOAufGTwJBpEzpSVAFob9RmL6WWY2rPE7ZvFMgc
	ufR7mAIAbnReEYgiwn48x6UHrFc3l+yosyPOJgSn6UtTRYOsC9QY40ga7dmMnIEOUZY3
	4RgeHwSdC+dFHQuKO3RiIvKm28bMq1hpJuO85f4Tt41+VqfdWRiEQZRaK7vx1Mt0tosP
	P7Mg==
X-Gm-Message-State: AOPr4FWSX1gN7M2sj609sZg2RUNkL1cwX0Vn5jM1jlvc7URAlaGIe6TtfgOhc7pbDsD0W1M7fOqDyGsIt5e1Wg==
X-Received: by 10.25.165.129 with SMTP id o123mr1579464lfe.105.1462292718660; 
	Tue, 03 May 2016 09:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.22.193 with HTTP; Tue, 3 May 2016 09:24:49 -0700 (PDT)
X-Originating-IP: [187.23.154.250]
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 3 May 2016 13:24:49 -0300
Message-ID: <CAAPZna1xLfbyYUKa+qcLfeGCv=mqg7JwWtirfAbqfM+TCu5m7g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: npm class usage
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
X-List-Received-Date: Tue, 03 May 2016 16:25:21 -0000
Content-Type: multipart/alternative; boundary=001a113fb15c0dd8280531f28e0f

--001a113fb15c0dd8280531f28e0f
Content-Type: text/plain; charset=UTF-8

Hi all!

I'm trying to install some recipes that use npm class and I have two
questions.

1 - Why use S = "${WORKDIR}/npmpkg"? This not work for me.

2 - Using option --no-registry inside npm_do_compile task I get this error:

| npm ERR! Registry not defined and registry files not found:
"/home/user/prj/build/tmp/work/all-linux-musleabi/gulp-cli/1.2.1-r0/npm_cache/noregistry/wreck/.cache.json",
"/home/user/prj/build/tmp/work/all-linux-musleabi/gulp-cli/1.2.1-r0/npm_cache/wreck/.cache.json".
| npm ERR!
| npm ERR! If you need help, you may report this error at:
| npm ERR!     <https://github.com/npm/npm/issues>
| npm ERR! Linux 3.18.0-trunk-amd64
| npm ERR! argv
"/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/bin/node"
"/home/user/prj/build/tmp/sysroots/x86_64-linux/usr/bin/npm"
"--arch=arm" "--production" "--no-registry" "install"
| npm ERR! node v4.4.1
| npm ERR! npm  v2.14.20

I found this issue https://github.com/npm/npm/issues/5509 and using
--cache-min 99999 instead of --no-registry this error doesn't appears and
build works fine.

I noticed that nodejs recipe is using this patch
https://github.com/bendaaron/meta-oe-dev/commit/3e02a40d689a7002547215473a00606d8213ce0c
but seems not fix for me.

I'm missing something to use this class?

Regards.

--001a113fb15c0dd8280531f28e0f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi all!<br><br>I&#39;m trying to install some =
recipes that use npm class and I have two questions.<br><br>1 - Why use S =
=3D &quot;${WORKDIR}/npmpkg&quot;? This not work for me.<br><br>2 - Using o=
ption --no-registry inside npm_do_compile task I get this error:<br><br>| n=
pm ERR! Registry not defined and registry files not found:<br>&quot;/home/u=
ser/prj/build/tmp/work/all-linux-musleabi/gulp-cli/1.2.1-r0/npm_cache/noreg=
istry/wreck/.cache.json&quot;,<br>&quot;/home/user/prj/build/tmp/work/all-l=
inux-musleabi/gulp-cli/1.2.1-r0/npm_cache/wreck/.cache.json&quot;.<br>| npm=
 ERR!<br>| npm ERR! If you need help, you may report this error at:<br>| np=
m ERR!=C2=A0=C2=A0=C2=A0=C2=A0 &lt;<a href=3D"https://github.com/npm/npm/is=
sues">https://github.com/npm/npm/issues</a>&gt;<br>| npm ERR! Linux 3.18.0-=
trunk-amd64<br>| npm ERR! argv &quot;/home/user/prj/build/tmp/sysroots/x86_=
64-linux/usr/bin/node&quot;<br>&quot;/home/user/prj/build/tmp/sysroots/x86_=
64-linux/usr/bin/npm&quot;<br>&quot;--arch=3Darm&quot; &quot;--production&q=
uot; &quot;--no-registry&quot; &quot;install&quot;<br>| npm ERR! node v4.4.=
1<br>| npm ERR! npm=C2=A0 v2.14.20<br><br>I found this issue <a href=3D"htt=
ps://github.com/npm/npm/issues/5509">https://github.com/npm/npm/issues/5509=
</a> and using<br>--cache-min 99999 instead of --no-registry this error doe=
sn&#39;t appears and build works fine.<br><br>I noticed that nodejs recipe =
is using this patch <a href=3D"https://github.com/bendaaron/meta-oe-dev/com=
mit/3e02a40d689a7002547215473a00606d8213ce0c">https://github.com/bendaaron/=
meta-oe-dev/commit/3e02a40d689a7002547215473a00606d8213ce0c</a><br>but seem=
s not fix for me.<br><br>I&#39;m missing something to use this class?<br><b=
r>Regards.<br><br></div></div>

--001a113fb15c0dd8280531f28e0f--
