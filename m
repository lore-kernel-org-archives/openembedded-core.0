Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.3343.1611208766916932188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 21:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from macbook-air.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0E8BE40007;
	Thu, 21 Jan 2021 05:59:23 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [OE-core] [master][gatesgarth][dunfell][PATCH] bluez: Whitelist CVE-2020-12351 and CVE-2020-12352
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
In-Reply-To: <CAOSpxdYiKrtF0t0wMJxp0rKqGz0bNHfbQ9XayjdgTtVNhQaoGg@mail.gmail.com>
Date: Wed, 20 Jan 2021 21:59:22 -0800
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Message-Id: <1F9D5FAF-DA64-4BB4-B7BD-804976B80613@redrectangle.org>
References: <20210117211445.2341303-1-robert.joslyn@redrectangle.org>
 <CAOSpxdYiKrtF0t0wMJxp0rKqGz0bNHfbQ9XayjdgTtVNhQaoGg@mail.gmail.com>
To: Steve Sakoman <steve@sakoman.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Jan 20, 2021, at 10:18 AM, Steve Sakoman <steve@sakoman.com> wrote:
>=20
> On Sun, Jan 17, 2021 at 11:16 AM Robert Joslyn
> <robert.joslyn@redrectangle.org> wrote:
>>=20
>> According to the Intel security advisory [1], these CVEs are mitigated =
by
>> the following kernel commits:
>>=20
>> eddb7732119d53400f48a02536a84c509692faa8 Bluetooth: A2MP: Fix not initi=
alizing all members
>> f19425641cb2572a33cb074d5e30283720bd4d22 Bluetooth: L2CAP: Fix calling =
sk_filter on non-socket based channel
>> b560a208cda0297fef6ff85bbfd58a8f0a52a543 Bluetooth: MGMT: Fix not check=
ing if BT_HS is enabled
>> a2ec905d1e160a33b2e210e45ad30445ef26ce0e Bluetooth: fix kernel oops in =
store_pending_adv_report
>>=20
>> The latest of these commits were backported from 5.10 to the stable ker=
nel
>> tree in the 5.8.16 and 5.4.72 releases. Since the kernels provied by OE=
-core
>> contain these fixes, mark them as whitelisted.
>=20
> This seems to be a good candidate for having the cpe database updated.
> Currently it is flagging all versions of bluez and Linux.
>=20
> I sent a request to have the entry updated.  If they accept the
> request then we won't need this patch.  If they deny it we can merge
> the patch.

Sounds good, thanks!

Robert

>=20
> Thanks for doing the research on this one!
>=20
> Steve
>=20
>> [1]: https://www.intel.com/content/www/us/en/security-center/advisory/i=
ntel-sa-00435.html?wapkw=3DCVE-2020-12351
>>=20
>> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
>> ---
>> meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/rec=
ipes-connectivity/bluez5/bluez5_5.55.bb
>> index 8190924562..051fdef8ce 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
>> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
>> @@ -3,6 +3,8 @@ require bluez5.inc
>> SRC_URI[md5sum] =3D "94972b8bc7ade60c72b0ffa6ccff2c0a"
>> SRC_URI[sha256sum] =3D "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e=
934fae8e0894e9b88"
>>=20
>> +CVE_CHECK_WHITELIST +=3D "CVE-2020-12351 CVE-2020-12352"
>> +
>> # noinst programs in Makefile.tools that are conditional on READLINE
>> # support
>> NOINST_TOOLS_READLINE ?=3D " \
>> --
>> 2.26.2
>>=20
>>=20
>>=20
>>=20
>=20
>=20

