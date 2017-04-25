Return-Path: <ferlandm@amotus.ca>
X-Greylist: delayed 938 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Apr 2017 16:46:17 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0118.outbound.protection.outlook.com [104.47.34.118])
	by mail.openembedded.org (Postfix) with ESMTP id 4649860079
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus.onmicrosoft.com; s=selector1-amotus-ca;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4yvoe+z8CMGkA756QtpvZvMyABgAoA3nAZvhu2j4YUk=;
	b=OydixgqgR8Jck8Ttq5pa8oIHPb/IcNF0W2RFWH/oVpBc2XRvkRuPcLL5fghJQWpcPf57Q16gSSWySKzO/qTQth0PSWfnOY45LRm/xXUCtl6EK52+SP+on+gpqskYPumwQqM00e6Dp93gWelJtz3lNqqrQlUJ/wrWae8vRPdTVJ4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=amotus.ca;
Received: from mail-oi0-f50.google.com (209.85.218.50) by
	MWHPR11MB1677.namprd11.prod.outlook.com (10.172.55.18) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1047.13; Tue, 25 Apr 2017 16:30:37 +0000
Received: by mail-oi0-f50.google.com with SMTP id y11so145894812oie.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 09:30:37 -0700 (PDT)
X-Gm-Message-State: AN3rC/6G91TD96smc0upJLwJ8JxHKruFGKhPPjywLUFX+RHuK6zjNdi7
	NkJsFpuLgYhto5wD3idH92h6N3c1TA==
X-Received: by 10.202.4.83 with SMTP id 80mr18009564oie.196.1493137833319;
	Tue, 25 Apr 2017 09:30:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.111.9 with HTTP; Tue, 25 Apr 2017 09:30:32 -0700 (PDT)
In-Reply-To: <20170425151350.GC28641@jama>
References: <1493131720-19456-1-git-send-email-ferlandm@amotus.ca>
	<1493131720-19456-5-git-send-email-ferlandm@amotus.ca>
	<20170425151350.GC28641@jama>
From: Marc Ferland <ferlandm@amotus.ca>
Date: Tue, 25 Apr 2017 12:30:32 -0400
X-Gmail-Original-Message-ID: <CAMRMzCBQcoOSFO8e7DR9YdVqc7Rs04_BCEPGLJe8C6-T9VgfjQ@mail.gmail.com>
Message-ID: <CAMRMzCBQcoOSFO8e7DR9YdVqc7Rs04_BCEPGLJe8C6-T9VgfjQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Originating-IP: [209.85.218.50]
X-ClientProxiedBy: MWHPR13CA0009.namprd13.prod.outlook.com (10.169.208.19) To
	MWHPR11MB1677.namprd11.prod.outlook.com (10.172.55.18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f775703-b9f4-4b8a-14b3-08d48bf8680b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:MWHPR11MB1677; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1677;
	3:AqJS/UGBU/5fAA9nVdtw3Wyjcd+oF4mo+/ZX3DWXpnl7PWx0qZGDKst4qC1/+vqXxkLTm0eqNYMHbrfhElJJmfrHPZBRw93znFxJiwnl3TVSLw9dMTY/pKF0zpAghz0dcA6hCJwhAvRtRcZ4P8V1YU1PdhMTrspirJHoZWVfchJfoBazeXbCD+Yn1u1kan2jK/fsE+V3pBY7NeDW0hy8Q1+eFkH5i69yo6tM8oZ3BhuuGT4pCFwUMb9pOahwNptcQS09IIaJkWAN/WkX++axKxfyUE5vA7skJ2jQcV+oCk4=;
	25:zKUL0dyhnt/o4c08qs76Oo7927tBa2SBKK18P4qVIzwdC4RcOXC+X6cYPFBeHGy1cr/Fm6N0k760Oh5h4LOvZNCmn89ym6eJ5jhmrQ8OhDZkwcVss9bCbsUBFLJsZFaXqs2bnHpxPNEYKX2dBwyA+wqxUkDS2aC3fu34/TGqK0B1rcqFYaFeCJhuLnVccMarlGa8fOz1l8wklRyNOJ+iuvJSo2uy5kC6yv3x25TKixUHP/7RiU/ScnZNpV+UiwyMOS59kKSYMnGG2m2zTEx1QiTaZ9APVAShKf1NiTQpkzG0Lm5icvShn3HZ/kTgM8ueNyFcWmTj4OJv2UCynFhQCgeuucamkHf1IARViAVZsQdpkpnWODEoM/DV4TfjlscjmchsZmML0F7PxIQy143BbfRMufT0mKey86B0wPVRkAQvTqLo3WBhQs5FiqmBW+Aq8RsAKmKDxhKGM3dHr4QtCw==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1677;
	31:10AeRrDn+zmKMhs21zxWen4kzs21ntYNk4w2+Q3Sm3+TE3IXQdxgDloQYmzA4hCF5FCq1dQxDImt2M1rLkSrtmldfTeDwxdupEQ7f2uowi2PTLAI8Ah2TFvq3L8fQQWSnUGCaJFgyNVWKNQrr5hYoZQR1/8y/iyxKKnDHgt1Zyu3fehhepwlCX0upPoVQ7001IyQKUu8y0Tan41JEzPke3botRkTNniTwwqBcgLSfKx43DCzgHWTyvfVZUXcpsGgai3c1r3/vVjKo+08Melggg==
X-Microsoft-Antispam-PRVS: <MWHPR11MB16778150B390CF3A30CEF220DC1E0@MWHPR11MB1677.namprd11.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(20161123562025)(20161123560025)(2016111802025)(20161123555025)(20161123564025)(6072148)(6043046);
	SRVR:MWHPR11MB1677; BCL:0; PCL:0; RULEID:; SRVR:MWHPR11MB1677; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1677;
	4:ZvKhYv/wz4DTSEeU9bYfgmHW7WOAaU0BIFtHE1pXMPjNsmxiqU0Gxq9smIFy2EOXD3U46wuE53GCcYHTeHmyTDB4MPTuFd+aReERm+6VuupqC9DKtjFEwipt7AcwhlszjoZW2C+E4BsIZoC3Wwl/XkY6dyoZoViK/bvmnBZeju7P4/wsh8LldMYVUQFzPI0iWx3xpTOnT6LJWzQTSQSQ20qff4mHkTM12egYQ7Ct/zoz7NjRVBjfQxKti5sXvk9knADUFqh0eFiFeGoTqhgGKLnZFdg+fsK7lJgiDmwYeS2RGhn1xHEsAX+1N/w/qDwca8MuKVeU5+a/x9nvXUTz0EvBwGadvkafghfr/Ny7NvOX/iwuR9rfw9n9fHRLOJdYDGhtTWKIVK6Yjb0n4tXahNcUNCO8wxi5S7aa0qFZzsvIS4vtgMVya+iVPvARMlU/cgKhRGTgOo4+MJxobO99UZ1hnc882Zc7PiWXImdhyyCeoD0ZAkdXfQ4fNjfEXxJQRBihuwFKljPnkbI1Nx7S757ufnGo4vKnbkaj4uVxRLMFLA2oyKoCXQvCagdV9NT/1097UMwFkMAAc3qU0/Gc6XIM8TNogKQZK/ug30hJrh8UUx82LimDR0wmmW8e653HBlBBdqBcJ/Rri1D+g4Toz3UoHVazGfYC3rik+nr/Q3lKtn+9sJVxyRNahp7lO/mfI73s+AFYMKazT2EeH1/rTRLRe1ugFF1jElNFxICun7bZB2Svo6DZ5niASwKACj3u7/q0pZ/J5ZESgd2lXnl5Ag==
X-Forefront-PRVS: 0288CD37D9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(39410400002)(39450400003)(39830400002)(39400400002)(24454002)(377454003)(6116002)(236005)(9686003)(81166006)(8576002)(189998001)(53936002)(3846002)(84326002)(9896002)(66066001)(5660300001)(122856001)(305945005)(7736002)(110136004)(61726006)(38730400002)(54356999)(93516999)(2950100002)(76176999)(86362001)(6862004)(55446002)(63696999)(50986999)(6246003)(512874002)(4326008)(42186005)(59536001)(2906002)(8676002)(229853002)(53546009)(74482002)(498394004)(55456009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR11MB1677;
	H:mail-oi0-f50.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR11MB1677;
	23:19Bro7YIfsTG3jYvsaSgF77Nfewz6nkhTNFIJl4/0?=
	=?us-ascii?Q?F2Ot8vFOhGKHtHuZLAsOxHzvmSW86bF+Ehclu6AAksFx99j+mqvr/hEZrgbR?=
	=?us-ascii?Q?ivPVDJ8IHPiJLT+T5ZXS0PQZVhM+7ahGTHzaVtF7nC7R2Dwf07xaUnKbAR1I?=
	=?us-ascii?Q?s08jDdQCC+Sc+PZAK7OjVnE3y7MYZgdUe8fVJD3NBGC67bulgs2aoKp6eQqh?=
	=?us-ascii?Q?MC3w5NVI9NEpABcXnSxTPjDxX64P4o7n4vuIKBK12eITrFNiSHlYsBLUdq5S?=
	=?us-ascii?Q?4IPleLTYHnxCz7dc1wWtUflAHVDjKl6wGVCTmtCLiwgco39CDkjfzeazlR7m?=
	=?us-ascii?Q?56aa/DnuzW8kgSXbZxdLKZNnJPAWSwnBXGd1zMDqx+lt9xUdRpjRUp2ZDwlx?=
	=?us-ascii?Q?KhNZowH+PREe1MvqHCuCKE1pRiy7KVBAmtpZc7z+L3QmdUs4WaOOqjxzpbEh?=
	=?us-ascii?Q?eAOfhSahFB9E7CYDYtW3HdyJrH26VUC0bc4A7bZtBDP0draPE+zxRRbYEZWS?=
	=?us-ascii?Q?ORlCgIn+EBd4Ra4Tnlg3HVTRewfN8nqFQGdqenSjmDhkjT4b6Qvjzuz2sacc?=
	=?us-ascii?Q?Lj95xWFftqfpAP7awqWhob8brtB45etmJz/rYkDIrewh2/whlWNkwbI4UXKr?=
	=?us-ascii?Q?JAa76ul6om+ohRUeGGg4uqD+swu/0Yj81R8i62+ujMPxBpqoU5qzY0piHcGR?=
	=?us-ascii?Q?sWYZXmVG4skEHgUcycVPi16GNrtmjwpNbWySbx6n4zp9Do+Uf9qPgJ6fLx2f?=
	=?us-ascii?Q?fCCGhP7OD31booT+MIYOd6JGMPAvpITfUCdrdUGxnZM14FiD7HqfTDc7wmgJ?=
	=?us-ascii?Q?Mh99lmTTTzSlIrkuqGSxUJwZfNXHZb3OqtVrJXdR6sqEyemJYZuvUIbFYrWr?=
	=?us-ascii?Q?jJVenNuji115mneIwuPbRsoIoChw1tZXEqh3eAI7UaCL2UgEmzWfaQZArvvx?=
	=?us-ascii?Q?0GF5uB5y5RsLQrxFXaFQPrmVGuAbSfTpBXaRa0Wr4S+a1cOESV4EGl/OFoxC?=
	=?us-ascii?Q?4uxNMEDsyrZvNwX9n8kA9NM58CmgGOEZ1uWGJBoEFG6Sotb0jg9R9NWqWizo?=
	=?us-ascii?Q?O9KfRa3jyWO2IzmRIr4ys+nWl2S2H1fzv3czwKXQlXlORKBT5LxCauuYkvvN?=
	=?us-ascii?Q?J9csHCIoM7yrrJIj1reJqp4zxOapuEj?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1677;
	6:iRndWbGZBSKroX86mbgEgy7p9fCpHNLsFOCgWT3HLbMgzdRvBAUV/JZ5GD5FprjcJYuWbcZ+5h+5KWAfIatOuoxo46ENj+eaRw627CkQLE/yvVuGj3gI73SPkO6vI/lDHgTMLJvsETrFqPyTkOU0PKx6X92R8fuGlLUn3I4t3L9q7VIhkGC01dmDFQObtUNyzOd+BCGaIfsSOdechk/nTcMjYNKoSzF8QIoPR+jK/o+egmiI1cxh/Q8wmkUVkcb4txodEstwg1aq56LLjxAZkBmuA2AcStIQLvV+znEAfcM6YZ3aW/3RBqgnyoFOBwxBBISKdiPd44nq/mQXSot/h2gJniSK8VQfwGjN2wWr0FwOpVL3ekcBYbGZjE/nhk16LNAcXTkwF9lSx2OYBcnUAEfcyh2w0MozFPNaGZH9j05EQaYcS01ZXb2NzBza0smexHmjVs5p9bLSz1YWUIbrMYxSpuK/QlzTPXalFKk6FOi77SN9HUZ9pj6HA/xKKoRlYtfLfICJQepxotXAOEXgFQ==;
	5:jD57zS/LYvzB2fiOyLvOIbkEJ2yERUcbMXjG4p8LLgL+WfBFXdKORYrWJc8bCamLuoydIIRS6Fl0aLEWs8mNhNngRAlVWPtqFQZWoJVHKk9WbsPytMsneXBqws/vhHOeC68mGP1j6iMMNkXZWwMqIg==;
	24:DYPlYoetbtCu50KWh7/+VLzwOBtomRYbrd897nKNRbEJ2hTUgQGZXe2DCOLBZ47XzdO+Oge2oWWfVlcB2RweX7kkcLCbn43Mp09sHIXTPo4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR11MB1677;
	7:apOj4fxJHpFa8qY4uZ29mP0h0w8jLjFDCLuC7dCyQHgpKmItlOEhjiN1dlm68kWtutsxntGN4D8niKJmVfRnLD98/B+nHtYgSrPbCGP1zDNzdalFK0TysWS3/3rbNyyfeJXO9jJ6ovISGWBp2wgs2cfGhlFWEppmOjHcDhtps/cpIC0WL/IkYTnJBHktygXmm8v6LzPwF/3TlfztrmsNJ1Fm2h6U88Cnuto9pj5Gwg55fNPh1HLIcuuGudYbm0GLek8MVS5aHOO+Wog2Q1jnKVnvrDHMJaGDEQ7oZOcGnBXE01OUI1oqTGST8dxK8K8earDKqBjZsEqanwssC9BTnw==
X-OriginatorOrg: amotus.ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2017 16:30:37.9779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1677
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4 4/7] bluez5: add PACKAGECONFIG option for systemd
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
X-List-Received-Date: Tue, 25 Apr 2017 16:46:22 -0000
Content-Type: multipart/alternative; boundary="001a113c037c27e7ac054e003e2c"

--001a113c037c27e7ac054e003e2c
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 25, 2017 at 11:13 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:
>
> On Tue, Apr 25, 2017 at 10:48:37AM -0400, Marc Ferland wrote:
> > Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
> > ---
> >  meta/recipes-connectivity/bluez5/bluez5.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
b/meta/recipes-connectivity/bluez5/bluez5.inc
> > index 687656e..71a5016 100644
> > --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> > +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> > @@ -12,11 +12,12 @@ RPROVIDES_${PN} += "bluez-hcidump"
> >
> >  RCONFLICTS_${PN} = "bluez4"
> >
> > -PACKAGECONFIG ??= "obex-profiles readline"
> > +PACKAGECONFIG ??= "obex-profiles readline
${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> >  PACKAGECONFIG[obex-profiles] = "--enable-obex,--disable-obex,libical"
> >  PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
> >  PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
> >  PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
> > +PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
> >
> >  SRC_URI = "\
> >      ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
> > @@ -36,7 +37,6 @@ EXTRA_OECONF = "\
> >    --disable-cups \
> >    --enable-test \
> >    --enable-datafiles \
> > -  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
'--enable-systemd', '--disable-systemd', d)} \
>
> Why not use just the options from PACKAGECONFIG?
>
> >    --enable-library \
> >  "

enable-library builds and installs the libbluetooth library along with
the header files. I guess it's something pretty much everyone
wants/expects, a sane default, probably also why it was "hard-coded"
in EXTRA_OECONF.

There are many other build options in bluez5 which aren't exposed as
PACKAGECONFIG options. The majority of them being for more finer
grained stuff (the current options are mostly for obvious external
dependencies).

I'll take a look at it and come up with a separate patch if that's okay.

Marc

--001a113c037c27e7ac054e003e2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Tue, Apr 25, 2017 at 11:13 AM, Martin Jansa &lt;<a=
 href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrot=
e:<br>&gt;<br>&gt; On Tue, Apr 25, 2017 at 10:48:37AM -0400, Marc Ferland w=
rote:<br>&gt; &gt; Signed-off-by: Marc Ferland &lt;<a href=3D"mailto:ferlan=
dm@amotus.ca">ferlandm@amotus.ca</a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=
=A0meta/recipes-connectivity/bluez5/bluez5.inc | 4 ++--<br>&gt; &gt; =C2=A0=
1 file changed, 2 insertions(+), 2 deletions(-)<br>&gt; &gt;<br>&gt; &gt; d=
iff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-conn=
ectivity/bluez5/bluez5.inc<br>&gt; &gt; index 687656e..71a5016 100644<br>&g=
t; &gt; --- a/meta/recipes-connectivity/bluez5/bluez5.inc<br>&gt; &gt; +++ =
b/meta/recipes-connectivity/bluez5/bluez5.inc<br>&gt; &gt; @@ -12,11 +12,12=
 @@ RPROVIDES_${PN} +=3D &quot;bluez-hcidump&quot;<br>&gt; &gt;<br>&gt; &gt=
; =C2=A0RCONFLICTS_${PN} =3D &quot;bluez4&quot;<br>&gt; &gt;<br>&gt; &gt; -=
PACKAGECONFIG ??=3D &quot;obex-profiles readline&quot;<br>&gt; &gt; +PACKAG=
ECONFIG ??=3D &quot;obex-profiles readline ${@bb.utils.filter(&#39;DISTRO_F=
EATURES&#39;, &#39;systemd&#39;, d)}&quot;<br>&gt; &gt; =C2=A0PACKAGECONFIG=
[obex-profiles] =3D &quot;--enable-obex,--disable-obex,libical&quot;<br>&gt=
; &gt; =C2=A0PACKAGECONFIG[readline] =3D &quot;--enable-client,--disable-cl=
ient,readline,&quot;<br>&gt; &gt; =C2=A0PACKAGECONFIG[testing] =3D &quot;--=
enable-testing,--disable-testing&quot;<br>&gt; &gt; =C2=A0PACKAGECONFIG[mid=
i] =3D &quot;--enable-midi,--disable-midi,alsa-lib&quot;<br>&gt; &gt; +PACK=
AGECONFIG[systemd] =3D &quot;--enable-systemd,--disable-systemd&quot;<br>&g=
t; &gt;<br>&gt; &gt; =C2=A0SRC_URI =3D &quot;\<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \<br>&gt; &gt;=
 @@ -36,7 +37,6 @@ EXTRA_OECONF =3D &quot;\<br>&gt; &gt; =C2=A0 =C2=A0--dis=
able-cups \<br>&gt; &gt; =C2=A0 =C2=A0--enable-test \<br>&gt; &gt; =C2=A0 =
=C2=A0--enable-datafiles \<br>&gt; &gt; - =C2=A0${@bb.utils.contains(&#39;D=
ISTRO_FEATURES&#39;, &#39;systemd&#39;, &#39;--enable-systemd&#39;, &#39;--=
disable-systemd&#39;, d)} \<br>&gt;<br>&gt; Why not use just the options fr=
om PACKAGECONFIG?<br>&gt;<br>&gt; &gt; =C2=A0 =C2=A0--enable-library \<br>&=
gt; &gt; =C2=A0&quot;<br><br>enable-library builds and installs the libblue=
tooth library along with<br>the header files. I guess it&#39;s something pr=
etty much everyone<br>wants/expects, a sane default, probably also why it w=
as &quot;hard-coded&quot;<br>in EXTRA_OECONF.<br><br>There are many other b=
uild options in bluez5 which aren&#39;t exposed as<br>PACKAGECONFIG options=
. The majority of them being for more finer<br>grained stuff (the current o=
ptions are mostly for obvious external<br>dependencies).<br><br>I&#39;ll ta=
ke a look at it and come up with a separate patch if that&#39;s okay.<br><b=
r></div>Marc<br></div>

--001a113c037c27e7ac054e003e2c--
