Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id A53546093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 15:28:38 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id m11so1324835iob.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 07:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J7080xE7PHLwisS+VvkAYEMqT3PwVnLmNk3giZaX7OM=;
	b=BN1I7OP5Or0Gz3UHHcQslg2534+NYp5Adz9KFkZ5fhhLPwOwB3Xyry9IhMkV8F/3DN
	k/tewmC3ToNfAeNm8KGmge+Anc0pAhGQoVWG/w52sk1MdW1aaAVb5VlVyW6UvekUPMSN
	E9p056T7mhwuB69onPTe+my1ds95kbg1WVAC/GteHnzCH8ftVQnyha7i9/AFw0HS6H0G
	8iK0jrzk63viT+Gfa1MB++x1gxJYKqPQiVS1Trc9OYtHKDBga0SdQX+J1PwRXUuFxbEd
	+/gxQEQC7u0rowCzSxLjdFjsgAKzraxa52egfoSHPjUrtKZI2BgdRZ9fyWQy4793M++H
	ogTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J7080xE7PHLwisS+VvkAYEMqT3PwVnLmNk3giZaX7OM=;
	b=dEiWhMpCd9yNL/zV/fc2g4bYh1+QeRFFq4SZTIgKjPQvELuw5OECXEDyaarx70AxOS
	Kw748/S/LTF/TDNmZcZxRlIMe/+ZHifG++/w57hlmB0tfE8ulX0M43ZXAKmWQKd//Tcw
	/JVqJVQMr+OsBNr9BmGj41EJukhKiaOXovrDaD4jhmzNzFt7yREVgSXdd/2uq7mItszt
	iei15d9s8dg2NHurjb+cgerpwFSBwdCd2TIXcpvxIznhzdonatyfTZlRVJQi/BV4RRAn
	/5zSAXkEAhUZnG9sX2B0EKbiAeAxBX6Gb1gidbQ6h0qFqm342mTCz6cbmdWFu4wm9Ugk
	5t0g==
X-Gm-Message-State: AKwxytfci8Kr1m6dpMzW3YwJjs9GzaXqjb2TqGZBTOhs5VeOkXB5Jhzs
	EI+b1h5OPZzCOBegXKi8RBkOJuhzBLMF+E14VjyQsA==
X-Google-Smtp-Source: AH8x224ZISwCp140U0uEBhE2DgLGuiXsKr5CzjJk7d19DKVYxNOFWOR5qU5sNdE4efIw3tm4b/gyDufJv2GwkwhjDas=
X-Received: by 10.107.175.8 with SMTP id y8mr4086710ioe.37.1516721319900; Tue,
	23 Jan 2018 07:28:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Tue, 23 Jan 2018 07:28:19 -0800 (PST)
In-Reply-To: <88adb573-a7be-6da8-38d7-b160acb4716c@windriver.com>
References: <20180122154442.23769-1-ross.burton@intel.com>
	<88adb573-a7be-6da8-38d7-b160acb4716c@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jan 2018 15:28:19 +0000
Message-ID: <CAJTo0LYHogXbdwAdO3c_teSSFrSG8oSszLEbo6ySrYr9oQsCGg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: correctly handle LICENSE_${PN}
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
X-List-Received-Date: Tue, 23 Jan 2018 15:28:38 -0000
Content-Type: multipart/alternative; boundary="001a1144a2687f0c2405637333bb"

--001a1144a2687f0c2405637333bb
Content-Type: text/plain; charset="UTF-8"

On 22 January 2018 at 16:32, Mark Hatle <mark.hatle@windriver.com> wrote:

> An alternative (i -really- do not like) is to name the overall first entry
> as
> something like:
>

I agree that's not a realistic alternative.  I'll send a V2 with the
warning added.

Thanks,
Ross

--001a1144a2687f0c2405637333bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 22 January 2018 at 16:32, Mark Hatle <span dir=3D"ltr">=
&lt;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatl=
e@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">An alternative (i -reall=
y- do not like) is to name the overall first entry as<br>
something like:<br></blockquote><div><br></div><div>I agree that&#39;s not =
a realistic alternative.=C2=A0 I&#39;ll send a V2 with the warning added.</=
div><div><br></div><div>Thanks,</div><div>Ross</div></div></div></div>

--001a1144a2687f0c2405637333bb--
