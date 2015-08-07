Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 746677673D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 11:04:50 +0000 (UTC)
Received: by wicgj17 with SMTP id gj17so56958838wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 04:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=U9Bgfl3tfvlE2V6HCowvLKFWM4v9IbvmnB2JZa2066I=;
	b=ZrH8+xGk0yBhEgavzyvM4jAerToNpBxNGgp20NL9VwLnM2ioxZjhbw741b7ajUa9YD
	6f72vzD6udZjwgQGXbLsNtWGCnGP7xKKDOS5M2EsvFTeipD5dFwhUu/K9t0ji36igkot
	tzoX/Nw0/y2HgXG1Axh+Z7CbDyS/17o0+9ei4XUBi4pZPxxc6ekBsUt8bLVfvzRlrZBL
	IGoSCZDu5y3lXFcMNf02ze1B3qsVIP4tpt1GmD9eeNXrGaWLO80xLbnzOP8QOCNR9kLJ
	+Q4+7muzGLAys5HKDSnehx7ZXj+fRnKgn7X1bdwIDT7f2qGUd3DXZFsuvpVim1czoVe3
	6vjg==
X-Gm-Message-State: ALoCoQnYrresK7yN9ygbuRogOFDjJqWqokiNgvoDdMVoF3YrVQcOyAniOzSn+CN+FQVC3guoly/2
X-Received: by 10.180.187.193 with SMTP id fu1mr5339127wic.75.1438945490909;
	Fri, 07 Aug 2015 04:04:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.88.196 with HTTP; Fri, 7 Aug 2015 04:04:21 -0700 (PDT)
In-Reply-To: <43BA4AA7-911B-4F0E-8910-1A289F0D4240@gmail.com>
References: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
	<cover.1438849692.git.jussi.kukkonen@intel.com>
	<29f1e0392fbe4325b13dac7e0fca69319825da76.1438849692.git.jussi.kukkonen@intel.com>
	<43BA4AA7-911B-4F0E-8910-1A289F0D4240@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 7 Aug 2015 14:04:21 +0300
Message-ID: <CAHiDW_HYPq=6QA6C3MRO+MDCCmKzzDL1rnvacmGTvfB5S+2Gog@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] vte: Fix LICENSE to LGPL2.0
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
X-List-Received-Date: Fri, 07 Aug 2015 11:04:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 August 2015 at 06:34, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Aug 6, 2015, at 1:42 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> wr=
ote:
>>
>> Current releases of vte are LGPL 2.1+ but the one we have is still
>> LGPL 2.0.
>>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> ---
>> meta/recipes-support/vte/vte.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte=
/vte.inc
>> index 4081a7f..874062a 100644
>> --- a/meta/recipes-support/vte/vte.inc
>> +++ b/meta/recipes-support/vte/vte.inc
>> @@ -1,6 +1,6 @@
>> SUMMARY =3D "Virtual terminal emulator GTK+ widget library"
>> BUGTRACKER =3D "https://bugzilla.gnome.org/buglist.cgi?product=3Dvte"
>> -LICENSE =3D "LGPLv2.1+"
>> +LICENSE =3D =E2=80=9CLGPLv2.0"
>
> this brings to notice that this recipe needs upgrade
> latest vte srcs already use LGPL2.1 may be updating to latest version is =
0.40
> http://ftp.gnome.org/pub/gnome/sources/vte/0.40/

Yep, working on the upgrade lead me to finding this mistake...

Anything above our current version of libvte will depend on GTK+3.
That in itself is fine but I wanted to make sure I know the effects of
that change before I send it: Not just if something will fail to
compile (because it depends on GTK+2 and vte) but also if we end up
compiling two versions of gtk+ in cases where we used to manage with
one.

Jussi

>> DEPENDS =3D " glib-2.0 gtk+ intltool-native ncurses gobject-introspectio=
n-stub"
>> RDEPENDS_libvte =3D "vte-termcap"
>>
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

