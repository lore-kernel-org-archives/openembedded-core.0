Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.24400.1610918731637330209
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 13:25:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 64.126.143.203
Received: from [192.168.0.122] (w143203.es-a.wireless.fsr.net [64.126.143.203])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 529B3FF802
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Jan 2021 21:25:28 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [OE-core] [master][gatesgarth][dunfell][PATCH] bluez: Whitelist CVE-2020-12351 and CVE-2020-12352
Date: Sun, 17 Jan 2021 13:25:26 -0800
References: <165B2189DDB58CAA.8629@lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <165B2189DDB58CAA.8629@lists.openembedded.org>
Message-Id: <04D12686-3A55-45CF-8F15-216218889B84@redrectangle.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_55DCCC8D-F192-4767-942C-26EDA7C14B5A"

--Apple-Mail=_55DCCC8D-F192-4767-942C-26EDA7C14B5A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 17, 2021, at 1:14 PM, Robert Joslyn =
<robert.joslyn@redrectangle.org> wrote:
>=20
> According to the Intel security advisory [1], these CVEs are mitigated =
by
> the following kernel commits:
>=20
> eddb7732119d53400f48a02536a84c509692faa8 Bluetooth: A2MP: Fix not =
initializing all members
> f19425641cb2572a33cb074d5e30283720bd4d22 Bluetooth: L2CAP: Fix calling =
sk_filter on non-socket based channel
> b560a208cda0297fef6ff85bbfd58a8f0a52a543 Bluetooth: MGMT: Fix not =
checking if BT_HS is enabled
> a2ec905d1e160a33b2e210e45ad30445ef26ce0e Bluetooth: fix kernel oops in =
store_pending_adv_report
>=20
> The latest of these commits were backported from 5.10 to the stable =
kernel
> tree in the 5.8.16 and 5.4.72 releases. Since the kernels provied by =
OE-core
> contain these fixes, mark them as whitelisted.
>=20
> [1]: =
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-=
00435.html?wapkw=3DCVE-2020-12351
>=20
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
> meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb =
b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
> index 8190924562..051fdef8ce 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
> @@ -3,6 +3,8 @@ require bluez5.inc
> SRC_URI[md5sum] =3D "94972b8bc7ade60c72b0ffa6ccff2c0a"
> SRC_URI[sha256sum] =3D =
"8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
>=20
> +CVE_CHECK_WHITELIST +=3D "CVE-2020-12351 CVE-2020-12352"
> +
> # noinst programs in Makefile.tools that are conditional on READLINE
> # support
> NOINST_TOOLS_READLINE ?=3D " \
> --=20
> 2.26.2

I=E2=80=99m not sure if this is the best solution, but figured I=E2=80=99d=
 send the patch and see what others think. The CVEs call out bluez =
running on the Linux kernel in the vulnerable CPE names, but no versions =
are listed. It seems to me like the CPE names associated with the CVE =
should really just be against the kernel, with appropriate version =
numbers added. Is this something likely to be updated in the CVE =
database, or is whitelisting them here the best option? Does =
cve-check.bbclass handle the =E2=80=9Cbluez running on/with =
linux_kernel=E2=80=9D case described in the CVE?

Thanks,
Robert


--Apple-Mail=_55DCCC8D-F192-4767-942C-26EDA7C14B5A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
Jan 17, 2021, at 1:14 PM, Robert Joslyn &lt;<a =
href=3D"mailto:robert.joslyn@redrectangle.org" =
class=3D"">robert.joslyn@redrectangle.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">According to the Intel security advisory [1], these CVEs are =
mitigated by<br class=3D"">the following kernel commits:<br class=3D""><br=
 class=3D"">eddb7732119d53400f48a02536a84c509692faa8 Bluetooth: A2MP: =
Fix not initializing all members<br =
class=3D"">f19425641cb2572a33cb074d5e30283720bd4d22 Bluetooth: L2CAP: =
Fix calling sk_filter on non-socket based channel<br =
class=3D"">b560a208cda0297fef6ff85bbfd58a8f0a52a543 Bluetooth: MGMT: Fix =
not checking if BT_HS is enabled<br =
class=3D"">a2ec905d1e160a33b2e210e45ad30445ef26ce0e Bluetooth: fix =
kernel oops in store_pending_adv_report<br class=3D""><br class=3D"">The =
latest of these commits were backported from 5.10 to the stable =
kernel<br class=3D"">tree in the 5.8.16 and 5.4.72 releases. Since the =
kernels provied by OE-core<br class=3D"">contain these fixes, mark them =
as whitelisted.<br class=3D""><br class=3D"">[1]: <a =
href=3D"https://www.intel.com/content/www/us/en/security-center/advisory/i=
ntel-sa-00435.html?wapkw=3DCVE-2020-12351" =
class=3D"">https://www.intel.com/content/www/us/en/security-center/advisor=
y/intel-sa-00435.html?wapkw=3DCVE-2020-12351</a><br class=3D""><br =
class=3D"">Signed-off-by: Robert Joslyn &lt;<a =
href=3D"mailto:robert.joslyn@redrectangle.org" =
class=3D"">robert.joslyn@redrectangle.org</a>&gt;<br class=3D"">---<br =
class=3D""> meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 2 ++<br =
class=3D""> 1 file changed, 2 insertions(+)<br class=3D""><br =
class=3D"">diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb =
b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb<br class=3D"">index =
8190924562..051fdef8ce 100644<br class=3D"">--- =
a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb<br class=3D"">+++ =
b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb<br class=3D"">@@ -3,6 =
+3,8 @@ require bluez5.inc<br class=3D""> SRC_URI[md5sum] =3D =
"94972b8bc7ade60c72b0ffa6ccff2c0a"<br class=3D""> SRC_URI[sha256sum] =3D =
"8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"<br =
class=3D""><br class=3D"">+CVE_CHECK_WHITELIST +=3D "CVE-2020-12351 =
CVE-2020-12352"<br class=3D"">+<br class=3D""> # noinst programs in =
Makefile.tools that are conditional on READLINE<br class=3D""> # =
support<br class=3D""> NOINST_TOOLS_READLINE ?=3D " \<br class=3D"">-- =
<br class=3D"">2.26.2<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div><font color=3D"#000000" class=3D"">I=E2=80=99m not =
sure if this is the best solution, but figured I=E2=80=99d send the =
patch and see what others think. The CVEs call out bluez running on the =
Linux kernel in the vulnerable CPE names, but no versions are listed. It =
seems to me like the CPE names associated with the CVE should really =
just be against the kernel, with appropriate version numbers added. Is =
this something likely to be updated in the CVE database, or is =
whitelisting them here =
the&nbsp;best&nbsp;option?&nbsp;Does&nbsp;cve-check.bbclass handle =
the&nbsp;=E2=80=9Cbluez running on/with linux_kernel=E2=80=9D =
case&nbsp;described in the CVE?</font></div><div><font color=3D"#000000" =
class=3D""><br class=3D""></font></div><div><font color=3D"#000000" =
class=3D"">Thanks,</font></div><div><font color=3D"#000000" =
class=3D"">Robert</font></div></div><br class=3D""></body></html>=

--Apple-Mail=_55DCCC8D-F192-4767-942C-26EDA7C14B5A--
