Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6iq2-0002qc-HY
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 16:01:46 +0200
Received: by wibhn17 with SMTP id hn17so578184wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 06:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=XulrvL9AOHYnMHrTd5Nz/4DgMQgDkpEDTXC+JWxqtjU=;
	b=Yjysk9JSs0uAUFi0uildPAoww+qTJgL/L1GnLjRBBPK0vLQ0lHwXMuH8y9E+UPkRkF
	00OHrylwfQK3SXk5RndDhW3wmtxBT7N+vYkH5apwzw0Fv1lki4ccBSFnSLz0HTqaxtBN
	VYaewO1AzIojKam+jwzlV9AzBoMt46m/532JxU0MQ1a4a8JwGiVRtwvLnthcje53Cdco
	Z5C1j4NKn5ogadZLKk6oSzTjRpiw+uvst+kf3aAn3V4uQ38dOptPXCIMH25U5F0BQfPr
	LOua0rXVu1qC/0PY+YdVDizxCuhn0Elhqkg3lHNVN0jKJP01dTwjclXHa6xZAXahHKX4
	mE5Q==
Received: by 10.216.195.40 with SMTP id o40mr1053061wen.36.1346248172359;
	Wed, 29 Aug 2012 06:49:32 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id do5sm3924037wib.10.2012.08.29.06.49.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 06:49:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAHUNapRRLtTO_z8e3r06UEvcaPrmnwPyiG7YzJhOxJbRBe3N5w@mail.gmail.com>
Date: Wed, 29 Aug 2012 15:49:25 +0200
Message-Id: <0A0650B1-F918-4CBE-8AA7-25C6F038A03A@dominion.thruhere.net>
References: <897CCE6A-604A-484A-8ACD-452701801FAA@dominion.thruhere.net>
	<CAHUNapRRLtTO_z8e3r06UEvcaPrmnwPyiG7YzJhOxJbRBe3N5w@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnA4/hcWDeu17x4LTRpxS3Kx06VJ2C/ls4y316w3C3/25eYSu/dGOhlqwFoknusQerX4k9U
Cc: scott.m.rifenbark@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: Bitbake distro packages: kill them with fire
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
X-List-Received-Date: Wed, 29 Aug 2012 14:01:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 aug. 2012, om 15:27 heeft Trevor Woerner <twoerner@gmail.com> het =
volgende geschreven:

> On Wed, Aug 29, 2012 at 8:49 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> These might not be the appropiate lists, but I might reach a few of =
the culprits. Over the years people have been doing 'apt get install =
bitbake' or 'make install' to put bitbake into /usr/bin and after a few =
minutes to get on irc/email/etc to complain that everything is suddenly =
broken. There are checks for bitbake versions in the metadata, but it =
can (and will!) still break with due to python path nastiness.
>>=20
>> So to every person packaging bitbake for their distro: stop doing =
that!
>>=20
>> If someone has a better suggestion to avoid this problem (more =
documentation doesn't work), please speak up.
>=20
> I certainly agree that documentation doesn't work (for the most part).
> But maybe it wouldn't hurt to put in a small note about this issue in
> the quick start guide(s)? Perhaps in the section where it is telling
> you what packages you need installed before starting, it could include
> a note to make sure to not have bitbake installed from your distro?

The problem I'm facing is that people decide on their own to install it =
and they are usually the people who don't read docs (or read them, =
disagree and continue). Furthermore the quickstart is too yocto specific =
to recommend for general use.=


