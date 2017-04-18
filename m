Return-Path: <ferlandm@amotus.ca>
X-Greylist: delayed 4713 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Apr 2017 15:20:02 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0123.outbound.protection.outlook.com [104.47.41.123])
	by mail.openembedded.org (Postfix) with ESMTP id 71BBE71C42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus.onmicrosoft.com; s=selector1-amotus-ca;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=0z2o9pFsV42OiopOAzxAxmbV2r73jOXAu/VDTk4+f50=;
	b=V51yNrv8sYivY0Vsqbtum2HZujNYMsfr08OnrgclGsD52S4d9Bd/SdJ4T1fmTaWbCejs5OB2MDtADQZ4anZfqy7qZ7fCMhFhFL6gWEnikAT6QeTm8p7hGlNGuauBjJypbmIrHuFo5OSb2g2mnx9f5MZdw8nNuBBavtMVLkpYGsk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=amotus.ca;
Received: from mail-oi0-f41.google.com (209.85.218.41) by
	BN6PR11MB1666.namprd11.prod.outlook.com (10.172.24.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1034.10; Tue, 18 Apr 2017 13:46:27 +0000
Received: by mail-oi0-f41.google.com with SMTP id r203so177116192oib.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:46:26 -0700 (PDT)
X-Gm-Message-State: AN3rC/6wczVBU3Hpsp7uCvaRZrkc79wGIJOMUDPbo4uhjp8qqjQKmysV
	zPLXSPv1z4DIt01+/G82d/AV7kvEng==
X-Received: by 10.157.89.224 with SMTP id u32mr8829956otg.32.1492523184039;
	Tue, 18 Apr 2017 06:46:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.111.9 with HTTP; Tue, 18 Apr 2017 06:46:23 -0700 (PDT)
In-Reply-To: <1492521609-26624-8-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
	<1492521609-26624-8-git-send-email-ferlandm@amotus.ca>
From: Marc Ferland <ferlandm@amotus.ca>
Date: Tue, 18 Apr 2017 09:46:23 -0400
X-Gmail-Original-Message-ID: <CAMRMzCDnCn4cGzo1MYcOyXKJc=gBEByzsywK_M7bdkM9wV7hYg@mail.gmail.com>
Message-ID: <CAMRMzCDnCn4cGzo1MYcOyXKJc=gBEByzsywK_M7bdkM9wV7hYg@mail.gmail.com>
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [209.85.218.41]
X-ClientProxiedBy: DM5PR19CA0009.namprd19.prod.outlook.com (10.175.226.147) To
	BN6PR11MB1666.namprd11.prod.outlook.com (10.172.24.15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de8ab53c-0e75-4e2c-c131-08d486614faf
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:BN6PR11MB1666; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1666;
	3:k6UP/mutKRsIOkoR9uQOy7zmOcqRdVFBoCWeMhqAhO0Rr5AOmw/xqv7KChJkakDF6JqKjoi4+yA/FkSf8/hzWYJX/2Pu1Ac6XxIJshEMEnEC7uk8VYqsI8cUBASt3jVRH5bk8/y5dItIkN9xTxrdornAy3k+ePdTIcs76q/b+O3x5A1G8WQeDNxRdTBsrUxX+puV0xNM4uB1rzyE7AVTrlzoyETLzCKAivFyoxc7BsDgQ+BUBgYYomGv/oqfzZKcoyfXBzTicHz2VUc0EuO+N2vcsQ7zoep7O+0wZk4GDrs=;
	25:k0xfMRMfjr8Y6I06ydqPkQ9iaCLMmqxuU7iSwKZSaIzIT31JBEt6BZsQDJyafvQmQE6AUjT9aN4Qz8fig9UHjU1FxpYg5/idgEOwOKVPKPq4XQ7QtlhoPfJkyIE4Z1DXD6FznuJjmXPGOZzJapn5vx/5dCHZC16eRPowKeEYdSjvHqah/qS9AV1Tu41+q7TGYn/b3y071GOz5q6amRJGaiQUWQ8lLooeMmbm1e9djKVSn0W6jmn7YuGSLCATeGr5rEofHlR8GPbgw2mzEZ7zcDA4vv1FNqyIWddE9f1Y9sZnlwh5xS5AOexu/Xe7y8xIZxADEgDVYztezg0jy6b9C+FWsPfKuOdqoPwt3mVI156eis+cY/+O8ln9p00jcoQrKdz1cSbMF6WlEEHm4YsVbBLaXrhAQbdYWgUU87LLcbISMUyTGgtYSZaxUWSXTWkWT8pn5stYhZIkamADJAfsag==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1666;
	31:LYM50wVhVDp8BI18SOC1wmpUFlJOvjd8leJn9MCvCsA8lWuWKUUsFoDEDCsniG1VaDDSEj69u18uggg7tw2vNGrv3PkRc8UnmHllayF8tx08WhBNREb5GukcKvVDmgPTiOx2pf8HE2+B66st/9Pf/DYF7qcB+ErtGRT6Z0L2TretTuO64Z1HwlM5OCTzW92jzYHt0h6xUwPUICC39TO1mdwJDIbl6t0ld9kDXZ82SotRlZG8eLKr7oOc4gAH1Pqr
X-Microsoft-Antispam-PRVS: <BN6PR11MB166643A71A782F13836B9844DC190@BN6PR11MB1666.namprd11.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123560025)(2016111802025)(20161123564025)(20161123555025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(6043046)(6072148);
	SRVR:BN6PR11MB1666; BCL:0; PCL:0; RULEID:; SRVR:BN6PR11MB1666; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1666;
	4:cvyC1IzMByWfzxJaxcL0diPv8/7ODQvZLimyn8MazD478qvo9aXu6G07OYWlGDLNbmh+mpIPVPHVmWgJRM5LBxQs5tnTJIIu6SuKHFqajJgXYeRUJLSiK7/JTSSJipJz3XDDpNK8fwvxpT2/pIp8z+ouXMLCzKyXfRb488IqwhS9dGDwRc3GBFU78VmaL5jmhzRCafdnPA6Ls+lclMh+L2xxUUmU5uNsvZXMQ1zg8RY4MFkqFNFdsQ9X5jpYzlkqsmLtHGEJHE1pIar+1vFB+qPchHkhO0Qy1EldjSHhuOZrKMKJmJy6q9nAB46hFg+0tS6URNIcMzMc+d4pZsQK962izALWiv9uxlvQswIbp6Wy3GuMsGiIJr7QF5TinxbJrbi0PLcSBdhsmbPyWduzZYd0fNPtbo1iwxyLKFR+gdL4Sf6K84jUI+3QRSYcYsDlWByKcnLJQRB+VzcknDUs4RoAPvzQtsrNcrqx9U+Tr+9lZRnSwwrb8RkNhxAzlwS+sRd93pGXBXJ4zcNEuhBX1j03TQcIS8h3tl5X/p1hPm9PoDJbDMlnotq3VZ1AoEn8fn6unh8O4jhmgJMbCHOTf136HybF1WNxfEcfqAKeADNhHWsCoeAWpULREWgXlSvYDRMyhVf2XOYbVEDYi+tnFf40K1h85moU/OPZci/8ol/SO/Ji5rIN/HnPR29pEUjIAh5xWPFQvRW3fi5wRkyMDRsShhDANuIBV23LHS2lkUelk9yyOJHPcGoKC0XzN7DzoePL/466yRsQDQFqHPaI6g==
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(39830400002)(39410400002)(39400400002)(39450400003)(377454003)(24454002)(6246003)(93516999)(498394004)(54356999)(63696999)(76176999)(50986999)(42186005)(2351001)(9686003)(53936002)(236005)(189998001)(74482002)(55446002)(512874002)(229853002)(7736002)(305945005)(2950100002)(6916009)(107886003)(38730400002)(110136004)(6116002)(3846002)(53546009)(4326008)(9896002)(5660300001)(8576002)(8676002)(81166006)(61726006)(61266001)(84326002)(98316002)(86362001)(66066001)(59536001)(2906002)(55456009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR11MB1666;
	H:mail-oi0-f41.google.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR11MB1666;
	23:GsVlPRvrg/GAT+1sGnqafCi36SzxvD8TMBFeVQbhb?=
	=?us-ascii?Q?XcXDrRaiK01RJSwuUtviQ57oEERJJTm6Px3zaD5Eb12olbn/QX8pfh/Oo0Rv?=
	=?us-ascii?Q?wMPzXeZLVLSNNiSQmKbuRfAD5+J2GumNYEESNTLNYZwQOf2g5RBev3+blUEh?=
	=?us-ascii?Q?YEt+ytnmoEIedWjLPA89cR+a+CWJnHl3T9F3chYx5TbbVYxi+f9gUXuBpdHi?=
	=?us-ascii?Q?VjsEccwQCZz+Ws2kOD/MDGdQliExiWlJyEIHZlp9YUzqWsvHnRYppd6ZojNn?=
	=?us-ascii?Q?aDQbF/Nn2rU/ltPjcjkjMlfsB5emsj0UHZGfyrciP+sGgUeZuTGFO+o0qNDM?=
	=?us-ascii?Q?blKnYoYKRjigxWP+Yw/cEXfHx1bQNvdB4IA3eKcTfgrxXQTk1jPXlCtKpy6O?=
	=?us-ascii?Q?YoU7McqKZrxr9JPZfSDF5OY4Ts83qYM99Uo6Gw846wPy5tucKxKBpDz+xmam?=
	=?us-ascii?Q?Rd/UE/VS1f1Nf/LyiagD5RZAQ9LmMwnYjARnq1Zplhexiina86uyQs+zECA/?=
	=?us-ascii?Q?4uYT06JqLoqqN8USSTy/12Olg782GP9ipF5zqvbpCdiTZLsrgtuq1SUbCYc3?=
	=?us-ascii?Q?rIHuoQ5AsbHgvlpfcVB83B/KQkGAf3DN3diEPUW6Uks6Uesu17uEKh1B+WvO?=
	=?us-ascii?Q?t9aIzPrsa3a6O+20TY6Wy3MZT/7lg2AWqoL1VNEx6brcTG+atmQYGqGkwjvh?=
	=?us-ascii?Q?E0VVBR69molLvorRhcDNMOj+JBfGrMDzgbI9ngWtN1edPlHCyqnpOAsK4Nin?=
	=?us-ascii?Q?tcuRymFh3hPbN0qjptQx5f+NVe6jsZIWUaC5W2rYDkGHbaeV80b/yVCq0dHM?=
	=?us-ascii?Q?s2X7pfvDppCplnrjkmJ1yZijH9/yugl40eGVt29UYSGmiLvF5xTTRZTEr773?=
	=?us-ascii?Q?G5P2kUAqwAX50SOhwEQ/jU2Je59ssL9K+xKqReVquEdMP+wT2qBYe07l2kK5?=
	=?us-ascii?Q?LFPOZu+JLWdX1mlGqR2Tn7ITL1kvgOsDlSxtEB2FZe1QJscQIU7WmO/ObwYu?=
	=?us-ascii?Q?nLnnh0z139mWF7Ro5K8ZJBaIiYin9Tv5VnQt0ywSyEEPBsu9jJ4LJOSb+H4l?=
	=?us-ascii?Q?KyKRM1Iq3FZzXNMxEQGs9suCruvUz+WKM8Xc605z5LU4eZRBUSnN+4DK0y1+?=
	=?us-ascii?Q?HKcA5iwsn3hG1McuBaqE56TCh+d4Au+VAib1JIeLXcgmPhQcF0cIZcq9jDQL?=
	=?us-ascii?Q?KtncVyYEXyhsKi6Fa85/04PRfWnNMf6UIwI?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1666;
	6:DiYtYAHM440IRq0xI3W4S0TWewStZNVglOJJrOWRNW8KNhuc2hLOBRi6jnUIlG1DHF5nl2dN1yJ48rFsp/LR29dMtJBKPZ+fB8cyCgJH9rZUkd+SxC9ytjCqOKsNUYBWRC/7RiOVWfX0Bs6CvRP1g1DKd6sUoiuy5Yo4hUercSW1jeXkcpd2RPdkKtVmb8B+cnZEKGHALYzfXziAaJVxGh5tGqckOt7GRRejZGRgIhUi+IeEh3wLPHR1rtvu4T+dUaeoeGJHhFofiFmJE/rFENn/hP/Dha05wecn2Vsg0c09Znv2qsbPYBYKM9+EHhZXPbZxXy4meFuGivP/W1VBxZMHdN7QhYOR6Q/VBS3H8Fay8mWykJ1pu1r8rPWTiBQdRBgk/beNrhGQqc9eLIeQNLTO3xmkGRthuFtIuQqUZ3ESGQHS7BlAkhrNhaIZMhd3oZjC6VhqkCksghWyiGeg/uI52aiVvo9ck+Msq5rdeVH76yPG1z/PPXzmoRswVsLosvV+2JfHdCtLBEURt0k3Yw==;
	5:SMbMindFzgsZA6QSihXhaKYptizB7Y7AgFDefW0uGoDS8oAZBClxbcEDm3QpKTObRwiRKGfPgaT6n1Xj6cJWo1L+R88mRHhMUqS6eUuts8GOLqnpxQr9XjFlyGvAlpwNsr1aMrSmw4tSh3kMv77brQ==;
	24:DJxWQfTHD1W0tsbW5Ql99YxupmlMivJTcB9TaAVNnQSQfPHDq8Lt39RJtxBtoLnYTsl0IZp2NIEThWCeysi+qZ8UcZ6tAm2T/UXFIVJlBwQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR11MB1666;
	7:zFbHeGjOAwENcjA7gTRVLy+You9egwp4t+/nvk+5T3riWeG3aXVTLumwbMJ9N6/c5PPl8cIWeL04Tcd4OIQB1uaD+eL7K/TJ+e132hyhGvePZtCLaJ5hrXootJhi4pJndCu0LEztKTz74jLHSrWwjeCbFemEhoELpabvwEKpLGS3vqhCu/hpOZU2eSn4wxNeLLIuXydlza4IbFczXgq85XJwc12iNSLpkiWkySFDO9KVfASIluDsiYamZnIQnNQiZuWXA9RVue+5UgU385NgxkFbW1kih7WMBmodUTYb6+0tjD8vozJmwwsJTPn3NDTnO45VJVC/IHPPTj6WMy9KLQ==
X-OriginatorOrg: amotus.ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2017 13:46:27.2930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1666
Subject: Re: [PATCHv3 7/8] bluez5: cleanup tabs and spaces
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
X-List-Received-Date: Tue, 18 Apr 2017 15:20:02 -0000
Content-Type: multipart/alternative; boundary="f4030435bee0342f26054d712216"

--f4030435bee0342f26054d712216
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 18, 2017 at 9:20 AM, Marc Ferland <ferlandm@amotus.ca> wrote:

> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc | 30
> ++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> index 47d8f22..01ade7d 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -57,24 +57,24 @@ do_install_append() {
>
>         install -d ${D}${sysconfdir}/bluetooth/
>         if [ -f ${S}/profiles/network/network.conf ]; then
> -           install -m 0644 ${S}/profiles/network/network.conf
> ${D}/${sysconfdir}/bluetooth/
> +               install -m 0644 ${S}/profiles/network/network.conf
> ${D}/${sysconfdir}/bluetooth/
>         fi
>         if [ -f ${S}/profiles/input/input.conf ]; then
> -           install -m 0644 ${S}/profiles/input/input.conf
> ${D}/${sysconfdir}/bluetooth/
> +               install -m 0644 ${S}/profiles/input/input.conf
> ${D}/${sysconfdir}/bluetooth/
>         fi
>
> -  if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
> -    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}/${sysconfdir}/init.d/
> bluetooth
> -  fi
> +       if [ -f ${D}/${sysconfdir}/init.d/bluetooth ]; then
> +               sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g'
> ${D}/${sysconfdir}/init.d/bluetooth
> +       fi
>
>         # Install desired tools that upstream leaves in build area
> -        for f in ${NOINST_TOOLS} ; do
> -           install -m 755 ${B}/$f ${D}/${bindir}
> +       for f in ${NOINST_TOOLS} ; do
> +               install -m 755 ${B}/$f ${D}/${bindir}
>         done
>
> -        # Patch python tools to use Python 3; they should be source
> compatible, but
> -        # still refer to Python 2 in the shebang
> -        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,'
> ${D}${libdir}/bluez/test/*
> +       # Patch python tools to use Python 3; they should be source
> compatible, but
> +       # still refer to Python 2 in the shebang
> +       sed -i -e '1s,#!.*python.*,#!${bindir}/python3,'
> ${D}${libdir}/bluez/test/*
>  }
>
>  PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
> @@ -84,8 +84,8 @@ FILES_${PN} += " \
>      ${systemd_unitdir}/ ${datadir}/dbus-1 \
>      ${libdir}/cups \
>  "
> -FILES_${PN}-dev += "\
> -  ${libdir}/bluetooth/plugins/*.la \
> +FILES_${PN}-dev += " \
> +    ${libdir}/bluetooth/plugins/*.la \
>  "
>
>  FILES_${PN}-obex = "${libexecdir}/bluetooth/obexd \
> @@ -115,10 +115,10 @@ INITSCRIPT_NAME_${PN} = "bluetooth"
>  EXCLUDE_FROM_WORLD = "1"
>
>  do_compile_ptest() {
> -        oe_runmake buildtests
> +       oe_runmake buildtests
>  }
>
>  do_install_ptest() {
> -        cp -r ${B}/unit/ ${D}${PTEST_PATH}
> -        rm -f ${D}${PTEST_PATH}/unit/*.o
> +       cp -r ${B}/unit/ ${D}${PTEST_PATH}
> +       rm -f ${D}${PTEST_PATH}/unit/*.o
>  }
> --
> 2.7.4
>
>
Oops my bad:

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>

--f4030435bee0342f26054d712216
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Apr 18, 2017 at 9:20 AM, Marc Ferland <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ferlandm@amotus.ca" target=3D"_blank">ferlandm@amotus.ca</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0meta/recipes-connectivity/<wbr>bluez5/bluez5.inc | 30 ++++++++++++++-=
--------------<br>
=C2=A01 file changed, 15 insertions(+), 15 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc b/meta/recipe=
s-connectivity/<wbr>bluez5/bluez5.inc<br>
index 47d8f22..01ade7d 100644<br>
--- a/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc<br>
+++ b/meta/recipes-connectivity/<wbr>bluez5/bluez5.inc<br>
@@ -57,24 +57,24 @@ do_install_append() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/bluetooth/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f ${S}/profiles/network/network.<wbr>conf=
 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/profiles/net=
work/network.<wbr>conf ${D}/${sysconfdir}/bluetooth/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S=
}/profiles/network/network.<wbr>conf ${D}/${sysconfdir}/bluetooth/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f ${S}/profiles/input/input.conf ]; then<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/profiles/inp=
ut/input.conf ${D}/${sysconfdir}/bluetooth/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S=
}/profiles/input/input.conf ${D}/${sysconfdir}/bluetooth/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 if [ -f ${D}/${sysconfdir}/init.d/<wbr>bluetooth ]; then<br>
-=C2=A0 =C2=A0 sed -i -e &#39;s#@LIBEXECDIR@#${libexecdir}#<wbr>g&#39; ${D}=
/${sysconfdir}/init.d/<wbr>bluetooth<br>
-=C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -f ${D}/${sysconfdir}/init.d/<wbr>bluetoot=
h ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s#@L=
IBEXECDIR@#${libexecdir}#<wbr>g&#39; ${D}/${sysconfdir}/init.d/<wbr>bluetoo=
th<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Install desired tools that upstream leaves in=
 build area<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in ${NOINST_TOOLS} ; do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${B}/$f ${D}/${bin=
dir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in ${NOINST_TOOLS} ; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${B}=
/$f ${D}/${bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch python tools to use Python 3; they sho=
uld be source compatible, but<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # still refer to Python 2 in the shebang<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;1s,#!.*python.*,#!${bindir}/<wb=
r>python3,&#39; ${D}${libdir}/bluez/test/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Patch python tools to use Python 3; they shou=
ld be source compatible, but<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# still refer to Python 2 in the shebang<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;1s,#!.*python.*,#!${bindir}/<wbr=
>python3,&#39; ${D}${libdir}/bluez/test/*<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES =3D+ &quot;${PN}-testtools ${PN}-obex ${PN}-noinst-tools&quo=
t;<br>
@@ -84,8 +84,8 @@ FILES_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_unitdir}/ ${datadir}/dbus-1 \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/cups \<br>
=C2=A0&quot;<br>
-FILES_${PN}-dev +=3D &quot;\<br>
-=C2=A0 ${libdir}/bluetooth/plugins/*.<wbr>la \<br>
+FILES_${PN}-dev +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${libdir}/bluetooth/plugins/*.<wbr>la \<br>
=C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-obex =3D &quot;${libexecdir}/bluetooth/obexd \<br>
@@ -115,10 +115,10 @@ INITSCRIPT_NAME_${PN} =3D &quot;bluetooth&quot;<br>
=C2=A0EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
<br>
=C2=A0do_compile_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake buildtests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake buildtests<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -r ${B}/unit/ ${D}${PTEST_PATH}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${PTEST_PATH}/unit/*.o<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/unit/ ${D}${PTEST_PATH}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${PTEST_PATH}/unit/*.o<br>
=C2=A0}<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br>Oops my bad:<br><br>Signed-off-by: Mar=
c Ferland &lt;<a href=3D"mailto:ferlandm@amotus.ca">ferlandm@amotus.ca</a>&=
gt;</div></div>

--f4030435bee0342f26054d712216--
