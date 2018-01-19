Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id AFE787871D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 13:31:59 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id f89so2168358ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 05:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=LHK/8/kD5Mj/BJedJU7GWAKF+ATMjZDls9mX76K++H0=;
	b=xvzGZ/ZFWZL0syBTjFEfnrnRCtQrEyGp8Bse+kZjqY4D/wHh5qAwhCOQ9LiZJQo+iG
	XRhKxLssrXOoXzxhYRA2lD8WWV30+aO9TCfxW0ehokAylx6DzL5eiumrWJMOXDQclxKW
	rb2i25iKYpBzqazVQllhR7EPogKmoYsKjf9mqN3R6hFHYPbk0LYIiHt6Zu5aiR65uBDz
	FKE1/5deS5O26+CrTjruJ7xLxE/qgEWv6OE0PmKKeSU0LPqP2YHnGbF8PouAzNLcA2Ll
	XA//aSQ5YCDyJtMWdWNOvJ/mzvfzaGYZm+mepPTSuf0Q/TDZN8TwDCecFw/Oz6Bf+ehm
	Y4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=LHK/8/kD5Mj/BJedJU7GWAKF+ATMjZDls9mX76K++H0=;
	b=e1GZaYi+VVQAZRwxLkpP4HNOhnl2b/vix6OklCPAHf1GqluV7TkrJoX2OwykOzBoAL
	r7Z29e7CwegbK7VwUMR7E37sutufV+B9n1/kCbVpvGNqvyinFp+RIgG17mVzQA3O44lD
	6XBjFfEoJ9FSeUNE1887BplSjyYsrJbuU0yhgBSz1T2ll+kZWhLeIHPLXbeHzEJs3w9y
	27rOMbXA5yZ/2kGsYQCQvW45RUdhR/9BDVtujmCEwQE22SaafLmxM1MAAMRcXgjcR7jL
	4IsFTdjpFSi0Sfh4qa8oRpvcjdpS4vLp+pzTFxMSB2FFffBQC+1Iijs5CL6XiDwFtLnf
	2siA==
X-Gm-Message-State: AKwxyted2T961EHchVXXel49VGjTaQO4MEcrKq627Bp0aDBXMjgOX88n
	GnFFnmX0fFOixeIr5ZVFIw3d2/mTSl83lmsSSIEVrw==
X-Google-Smtp-Source: ACJfBotrvUWP25Bpfj6wv910WyydQcO3XXlrviEg4tgU33CEpzgFUjO0aRwBrqmvF0o7qUmtmaoE85Cvoep3cDXLiEU=
X-Received: by 10.107.186.86 with SMTP id k83mr18242990iof.208.1516368720604; 
	Fri, 19 Jan 2018 05:32:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 19 Jan 2018 05:31:40 -0800 (PST)
In-Reply-To: <trinity-b50cf031-4a89-4af1-9fcc-c9caa29e98a6-1516367853822@3c-app-mailcom-lxa10>
References: <1516359976-26345-1-git-send-email-ole2mail@mail.com>
	<CAJTo0LYxWfHvpFQUGk8Qy=AG7A7=PCY6CSm4UWW_8qbCWTO5RA@mail.gmail.com>
	<trinity-b50cf031-4a89-4af1-9fcc-c9caa29e98a6-1516367853822@3c-app-mailcom-lxa10>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jan 2018 13:31:40 +0000
Message-ID: <CAJTo0LYf2eQqpm534m8JMDiPa1WZCKjEqHGzk2_MZjzKWDy9pw@mail.gmail.com>
To: Oleg Kokorin <ole2mail@mail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 13:31:59 -0000
Content-Type: multipart/alternative; boundary="94eb2c076a70f0dec30563211afe"

--94eb2c076a70f0dec30563211afe
Content-Type: text/plain; charset="UTF-8"

On 19 January 2018 at 13:17, Oleg Kokorin <ole2mail@mail.com> wrote:

> hello Ross
> why do I see this e-mail from you?
> "Signed-off-by: Oleg Kokorin <ole2mail@mail.com>" is in the patch.
>

The file mtd-utils-fix-hashtable_iterator.patch needs this information
too.  See the wiki link I added (and the mail from patchtest that was also
sent).

Ross

--94eb2c076a70f0dec30563211afe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On 19 January 2018 at 13:17, Oleg Kokorin <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ole2mail@mail.com" target=3D"_blank">ole2mai=
l@mail.com</a>&gt;</span> wrote:<br></div><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex"><div><div style=3D"font-family:Verdan=
a;font-size:12px"><div>
<div>hello Ross</div>

<div>why do I see this e-mail from you?</div>

<div>&quot;Signed-off-by: Oleg Kokorin &lt;<a href=3D"mailto:ole2mail@mail.=
com" target=3D"_blank">ole2mail@mail.com</a>&gt;&quot; is in the patch.</di=
v></div></div></div></blockquote><div><br></div>The file mtd-utils-fix-hash=
table_iterator.patch needs this information too.=C2=A0 See the wiki link I =
added (and the mail from patchtest that was also sent).<div><br></div><div>=
Ross=C2=A0</div></div></div></div>

--94eb2c076a70f0dec30563211afe--
