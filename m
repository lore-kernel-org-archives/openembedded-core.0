Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3A4731A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 15:50:04 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y7so16075785pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=2DqFMmTrYWn8/ARywHE22vTbL1Ih3CDLugGBT3zpi38=;
	b=caBTGHTVr+wvmLIoqkyneHFbepA77bf3UJdjX4ovevI8jaae4T5ozh9vdZ9Wy7KHGB
	gg3IM2Md1rERgjc/JSYTXpiHmUL8NkHD/sNkgfb5aEnCy4Rns/heUjrKew2BoynEO0/Y
	XeCKuSKlMmWtpeH79hnpP7BplcuOUQ+STFmZtlXV91eVxEN4krprtBvlnGYGqOw/0FUn
	ReuEX+c7f9levCFKfT3NsVT3TpvZUQmkT+6LFUKLH+32TBLxZkQ9XhoJgTyEJkNvuUMe
	g36pzwOm1MS2nlO4mT/ftqY7rDiyfznPOijrbB6eQfpjXXM6E9NzuE74MrMlY0cUGmUt
	oEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2DqFMmTrYWn8/ARywHE22vTbL1Ih3CDLugGBT3zpi38=;
	b=UnYxrV8MU/CJq96BY1q9ij3egTCAzP652UAcORQ3KOkm7k6emeRl78ud4DjVff/zVv
	6zmCT7T+/14sUGUD7jaGb+6DXeN9PDyXojS7g3VV+2JaF+2Fb2WWTm9IUDoDJQ2IGrFb
	jmB1IwXKxXuQdXbJcDjDF2sOT9kg1bWWiJsqgYNptM0qLHeQ0WpdVNSEDV75RAShQK7H
	Ro61BTgIG+bssABTpYN0MK6nTLVzgY93dsp1IHdB8p5tz4o8sYkgLl8Z+E52phmo7XZY
	U+Wjsbtb3R9WTGw5Mnq08j+JpdLfHMZoZdTnCKvo1N4vKgZUQG8R/CKS7jLO2lUWQJs2
	uHLw==
X-Gm-Message-State: AOPr4FUz/WSM8TspQENG8wdd/6JmExWnJB+JTBO+8d23QohkO6Z7rFg4cVplXyuLLoMd1w==
X-Received: by 10.98.47.66 with SMTP id v63mr46439495pfv.67.1463413805102;
	Mon, 16 May 2016 08:50:05 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:dd3:cb39:a42f:8eaf?
	([2601:646:8800:5a9a:dd3:cb39:a42f:8eaf])
	by smtp.gmail.com with ESMTPSA id
	80sm48256529pfx.68.2016.05.16.08.50.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2016 08:50:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
Date: Mon, 16 May 2016 08:50:04 -0700
Message-Id: <314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
	<CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Mon, 16 May 2016 15:50:08 -0000
X-Groupsio-MsgNum: 82157
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7FBD8B22-F62F-4680-8083-6C6BE165D21A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7FBD8B22-F62F-4680-8083-6C6BE165D21A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 16, 2016, at 3:43 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> On Mon, May 16, 2016 at 5:18 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>> On 13 May 2016 at 23:15, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> On Thu, May 12, 2016 at 4:20 AM, Jussi Kukkonen
>>> <jussi.kukkonen@intel.com> wrote:
>>>> Support for multiple new protocols, many new features:
>>>> =
https://lists.freedesktop.org/archives/wayland-devel/2016-February/027039.=
html
>>>>=20
>>>> Weston now depends on wayland-protocols (which is protocol
>>>> collection split off from weston).
>>>>=20
>>>> Remove upstreamed patches, add a patch to fix the wayland-protocols
>>>> path used during build.
>>>>=20
>>>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>>=20
>>> I am working on rework the weston recipes and it seems Weston 1.11 =
is
>>> close of release. I think instead of adding 1.10 we could use =
1.10.91
>>> and upgrade it to 1.11.0 when it is out (end of May). This avoids
>>> another cycle of rebase of patches during 2.2 development cycle.
>>>=20
>>> What do you think?
>>=20
>> I don't have a burning need to get 1.10 in at all (I almost didn't
>> send these in the first place because of 1.11 being just two weeks
>> away). If you'd rather avoid the churn I'm fine with doing other
>> things and looking at this again after 1.11 release. I'm also totally
>> happy to keep my paws off this completely if your rework is going to
>> include the 1.9 -> 1.11 upgrade in it.
>>=20
>> Here's my current 1.10 branch in case it's useful (the important
>> change is the WAYLAND_PROTOCOLS_SYSROOT_DIR hack to get multilib
>> working with allarch wayland-protocols):
>>  git://git.yoctoproject.org/poky-contrib jku/wayland-1.10
>>  =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Djku/wayland-1.1=
0
>>=20
>> Just to be clear: Based on this discussion I don't currently plan to
>> send a V2 to list unless there's demand for it.
>=20
> As I said, I would work on 1.10.91 as it is close of 1.11 and easy the
> upgrade. But all my patches are based on 1.10 now so it is fine with
> me as well so please send the v2.

If 1.11 is around the corner then why not work on 1.11 ( pre-release ) =
itself

--Apple-Mail=_7FBD8B22-F62F-4680-8083-6C6BE165D21A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc57CwACgkQuwUzVZGdMxTYMACdGuF01VrEn5RD0UdzstHsfu0F
2B0AnRGf2HXpPvpEwJkOXij9A/zNQqJ6
=ffvk
-----END PGP SIGNATURE-----

--Apple-Mail=_7FBD8B22-F62F-4680-8083-6C6BE165D21A--
