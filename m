Return-Path: <matt@madison.systems>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 148AF60621
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 17:00:40 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id pv2so193327099lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 09:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=eIfPYpLQUO0JHL0YYd1y/a07YY5QUlNLVYrImH0/J5Q=;
	b=ZQkyb7vxRJrs3vFSb2624yMSqUQz9E/tprqhFRFqUA1C/+4kyFc+yVIKmvEWT1fZAg
	TdUO8uK+H0YcjUlaDPehlrv2cSmr4ymFDYwkhVVT04SpUQYyDBq183PxaG+FXTm/RpL3
	ymXoZ1PV6JUAohfhtrST+vMLjUnVpExQyVYk3F9ypn8GOLzweH/+j8Go78I0EzzH/R61
	6Wwace+goCx7j+SXVWL2SH3KEI4LwhGRx7WALyhIcE4tc6UF4lqXNmDpJxZTXC6hxb+Y
	YieTU3wGO8rgUFZ7mkC9Rvic39Ia2TZS02HZiytFcjeaNWbzrY4bhMD34NqNePzM1KkN
	Xg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=eIfPYpLQUO0JHL0YYd1y/a07YY5QUlNLVYrImH0/J5Q=;
	b=LMK6e5XT03JjvQcf+IyfrsQD0irzNWUGuKAWxf560m/FWR1NB2JepWnhP9tuTW+7X0
	LYIX6ACr1i4dB5GnVqB+OBSJLDq/HSoSdXNf3NygipJhOtuKH+uabDaJxJnYq+6NV9MF
	2E56yBFWNETwYu7DPS0fPcQGuBHyCc36m9rtaMXIJ1xXQm7fOYClAl3jwgvqSHHVfRTm
	gqFgqYMKkbrsokSvU03VyGsgfRN/++jr2YyJGai/QEn9ACoxX8Djqp40vhCa5WIigjGU
	aMjWnIGNIKlXnhrHFu1ghiJxxFgrMgN8tMkar2NkCJ6oTZrQ//0acjZuwaNL/RBfqDb3
	eKgw==
X-Gm-Message-State: ALoCoQk41RDNuc298kH5BhcXYjUZc4EdfEiu9o8q8IIZh3chCNeChd3LOsQHLd9w9Rd39iVYcONJWsJ4Gt+ctKFtlyLHP2X+0g==
MIME-Version: 1.0
X-Received: by 10.112.64.5 with SMTP id k5mr15634643lbs.133.1452013240723;
	Tue, 05 Jan 2016 09:00:40 -0800 (PST)
Received: by 10.25.26.7 with HTTP; Tue, 5 Jan 2016 09:00:40 -0800 (PST)
In-Reply-To: <568ADC82.4040009@linux.intel.com>
References: <1450449271-28582-1-git-send-email-matt@madison.systems>
	<568ADC82.4040009@linux.intel.com>
Date: Tue, 5 Jan 2016 09:00:40 -0800
Message-ID: <CAGgRHJp9ERz00TSoTB1sYUT=M=1XRN-+v5YAuiG0XwdHj2d3Xw@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] Debian multilib packaging fixes
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
X-List-Received-Date: Tue, 05 Jan 2016 17:00:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 4, 2016 at 12:56 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> Hi Matt,
>
> Sorry for the delay in the response, i'll test again your patches with
> the new one and the same error appears when build
> core-image-full-cmdline or core-image-sato.

No problem, I figured things would be slow around the holidays.

I think the problem with this specific configuration has to do with
trying to add lib32-connman to an image build that already had a
dependency on connman (from packagegroup-core-x11-sato-base, for
example).  I modified the DpkgPM class in package-manager.py to run an
'apt-get -f install' to fix the dependencies that APT thinks are
broken if the initial installation attempt fails.  That appears to
work around the issue adequately, and I see APT reporting

   ignore old unsatisfied important dependency on connman-conf:amd64

which is there because it cannot install both connman-conf and
lib32-connman-conf, since PACKAGE_ARCH is ${MACHINE_ARCH} in the
connman-conf recipe.

For my particular application, I didn't have any conflicts between
32-bit and 64-bit packages, so the patches I submitted were enough.

I'm not sure what the right answer for this should be; hacking in the
additional 'apt-get -f install' works around the problem here, but I'm
not sure it solves the general problem correctly.   APT implements the
Debian policy, and it's complicated - to do it "right" , we'd have to
ensure that all of the packages get tagged with the right combination
of Architecture and Multi-Arch headers, and I think we'd have to
change how we write dependencies in the control files to use the
'<pkg>:any' notation when that's appropriate.  I'm not even sure if
that could be computed automatically; it could require a significant
amount of manual review.

Thanks,
-Matt

>
>         MACHINE ??=3D "qemux86-64"
>
>         IMAGE_INSTALL_append =3D " lib32-connman"
>         require conf/multilib.conf
>         MULTILIBS =3D "multilib:lib32"
>         DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
>
>
> I'm reviewing if this an error in the meta data (because
> core-image-minimal builds) or in the class.
>
> Best regards,
>         alimon
>
> On 12/18/2015 08:34 AM, Matt Madison wrote:
>> This adds a third patch that fixes the problem where APT couldn't
>> resolve dependencies between when two packages of different architecture=
s
>> both depended on an allarch package.
>>
>> Matt Madison (3):
>>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>>     function
>>   package_manager.py: fixes for multilib deb packaging builds
>>   package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packages
>>
>>  meta/classes/cross-canadian.bbclass |  2 +-
>>  meta/classes/package_deb.bbclass    | 37 +++++++++++++++++++++++++++---=
-------
>>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>>  3 files changed, 39 insertions(+), 17 deletions(-)
>>

