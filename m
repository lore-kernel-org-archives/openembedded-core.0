Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 61E1977835
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 14:44:10 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id p64so7039003qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 06:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SF9fhOYAaIxu1Qs0D4XqmvTjOZXPd3x/gE4sp8sJTn8=;
	b=xIU37wt5VBc5Z7RttUhjtHXsPtoTaRDXLgbRJLgk77wVPjsqvAJVSG5fSezDtf3JM9
	futwbsEhldpy6QYDfBEjD4VDO6KPPIkzppsj2HTCzCBnu+8lMs3aMeeH4DVfjfY0RaOf
	pL5KcFjnR6ZK/bE39non68k3CxkqDbPXPM0SZxXDOb+9XuR7PTRpPGm87tSWr+9hHs+T
	dGczqGJUQEd0o09AOxQuxyELWyz/hTK9EJaulSA4rBdKLk2DVaSigscgeMU9FGn8piEx
	WcttcOYZ5WSmvXZvQEobDs3+rPE3VKWPjBunvZ8kOO+VEixFwXQo3X7U98xXJH+7QNz1
	awHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SF9fhOYAaIxu1Qs0D4XqmvTjOZXPd3x/gE4sp8sJTn8=;
	b=hEn9LxL7y3zbHTQfsar5aPgyCorpJJqCOQAfXjUYFiNfvflgSdHdHGBhNGmq+iKBR4
	maafR+rvm14EQJOMtPwaNDo3PmLooTYJ7K+k8Tgnfmct162/ItSSrgDwz85qzOYQ9Y/Y
	9DDvcfNre38VvoFFKTDQKUOmCak2f92xBoRNpu/LM9wgNLWVa5Qdc45Jdnea4tG3vZGb
	K7gm76zRzxTUPX1YhZHPqFFL+Hor5Ri0PrtJgH/1GwP5MwbejUUQCKzodMFJv3Vig3f2
	4bDJiy376Y4iT00tSaW6O6ZJ+3XHmHr6JOPAtHT74pWNFFsYiRFtb4gobKmqBbCg7mNo
	AhIQ==
X-Gm-Message-State: AMke39mNrDUUdkOsHMFhx6R2VSOWgGHWc37W6uFh+tSFGWv9wVwh0G+l8FzU8qGuGDgHA6fYmKHfd/iFPjus5cfw
X-Received: by 10.237.33.69 with SMTP id 63mr747801qtc.109.1488897852118; Tue,
	07 Mar 2017 06:44:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 7 Mar 2017 06:43:51 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1703070613280.6444@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702191313250.8096@localhost.localdomain>
	<CAJTo0LbM=BKU5CEcr5mVV0cw_VJS_NsCR992Q5RgpH_x8LRHOw@mail.gmail.com>
	<alpine.LFD.2.20.1702200654200.27683@localhost.localdomain>
	<CAJTo0LYVkVgQ3DgEvRU-Ey+x=3pFJD=t=cddD6_d88bXXD9OYw@mail.gmail.com>
	<158ae21e-23b2-aa04-4977-0e640e1f6e55@windriver.com>
	<alpine.LFD.2.20.1703070613280.6444@uk63952.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Mar 2017 14:43:51 +0000
Message-ID: <CAJTo0LZcUdU-6x8E5cWe5WSdyCz_-=K9vWg_A5zX8ZXiT_DmVA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: something seems to have happened to "gpgme" in latest oe-core
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
X-List-Received-Date: Tue, 07 Mar 2017 14:44:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc8955e67054a250bd7

--94eb2c0c7fc8955e67054a250bd7
Content-Type: text/plain; charset=UTF-8

On 7 March 2017 at 11:13, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   glad to see i'm not the only person ... anyone have a fix?


Looks like it finds host swig and then turns on Python support, using the
host python.

Can you try adding --enable-languages="cpp" to EXTRA_OECONF?

Ross

--94eb2c0c7fc8955e67054a250bd7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 7 March 2017 at 11:13, Robert P. J. Day &lt;<a href=3D"=
mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>&gt; =
=C2=A0 glad to see i&#39;m not the only person ... anyone have a fix?<br><b=
r><br>Looks like it finds host swig and then turns on Python support, using=
 the host python.<div><br></div><div>Can you try adding --enable-languages=
=3D&quot;cpp&quot; to EXTRA_OECONF?</div><div><br></div><div>Ross</div></di=
v>

--94eb2c0c7fc8955e67054a250bd7--
