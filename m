Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 204FD71B2F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 12:25:35 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id 11so120077703qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 04:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=50gbquHMiz1bCKW9O9kSFfpM3Evtd67B7fo8HYAhRxk=;
	b=SdHIeT4z2WFlre4nAxZHD0b0MEo3ARbbR+rwld0gam8DSQtQKXRdsgV1I+lSqqXcYC
	Wl3BiASNyv8HFE83uT3S/9oq4o0rt0Vbw7eoxFo3BueA81oOhqG9RKJTkZ1zr5qKHuQ+
	bPT2jp34ldbqt//nQPkdZ+XCp7TPsVQabo3hP7k6GI+XhV0C6dNtuH3IBZhSG/MzRsNI
	w9tOF8jtsAsJxHtom/hABw5el0H/UHIwE+D+0Dxwcr6gNpuleeY6z1udTkMsp+BPm8Z+
	+RVzTo14TUypC3gQfo3ZXEnxG1iRnTuwvfBpDN0wHsDH+7+Sw88sTOksBT+qNbJa5AIb
	oLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=50gbquHMiz1bCKW9O9kSFfpM3Evtd67B7fo8HYAhRxk=;
	b=LWDxsGYmM0JOKCWxyE6bGVTqHZsqYMOYTsCmAPqqEcL3RbBsF5Xao75bm3asASHoXO
	Dd9BEq1YGPJhNOTtfxLgIkQ5/UaGBaI5V7srSb5rL++qPVDyW4ewAGFjdsMUzsPUpHci
	uG968GMU0O5GbMN1VsikxnztjV7RvSkFfkYNi7J1DCBpkDobLuVOwGijshkA3B5CPixO
	Hu5hb9F4kEr/et224EyxUpUuoNAX1o4lUILWJ36ulYmRk/36Gu3C+/n1xkKP6x8vyAle
	OsD6FB2ZfG6vA55zxl5+r9b6FVSSStJazGBrKXhBnW71HpWitruDbObq9k2Plpyp4OnD
	y9HQ==
X-Gm-Message-State: AMke39mQzMOG9S3sEa2xaBdzKVuUF3qtg3ECZgE4QR7IDlIRzJKLq0aSzp1h8HSUmgd4buc6d+YpQRO15qBUDBUI
X-Received: by 10.55.175.195 with SMTP id y186mr19287200qke.26.1486556736269; 
	Wed, 08 Feb 2017 04:25:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 8 Feb 2017 04:25:15 -0800 (PST)
In-Reply-To: <a60fd7af23251a9d275621c3b886b7a7ea9cecd0.1486523726.git.hongxu.jia@windriver.com>
References: <cover.1486523726.git.hongxu.jia@windriver.com>
	<a60fd7af23251a9d275621c3b886b7a7ea9cecd0.1486523726.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Feb 2017 12:25:15 +0000
Message-ID: <CAJTo0LYiX8wtrkqbsR=AhMXJ9k9MVKDOe3CLg=9L6nuT4spVDA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/13] libgpg-error: 1.25 -> 1.26
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
X-List-Received-Date: Wed, 08 Feb 2017 12:25:43 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093c34c6d4054803f650

--94eb2c06093c34c6d4054803f650
Content-Type: text/plain; charset=UTF-8

packages/corei7-64-poky-linux/libgpg-error/libgpg-error: FILELIST: removed
"/usr/lib/libgpg-error.so.0.20.0", added
"/usr/share/libgpg-error/errorref.txt /usr/lib/libgpg-error.so.0.21.0"

errorref.txt is part of the documentation so should be in PN-doc.

Ross

--94eb2c06093c34c6d4054803f650
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">packages/corei7-64-poky-linux/libgpg-error/libgpg-error: F=
ILELIST: removed &quot;/usr/lib/libgpg-error.so.0.20.0&quot;, added &quot;/=
usr/share/libgpg-error/errorref.txt /usr/lib/libgpg-error.so.0.21.0&quot;<b=
r><div><br></div><div>errorref.txt is part of the documentation so should b=
e in PN-doc.</div><div><br></div><div>Ross</div></div>

--94eb2c06093c34c6d4054803f650--
