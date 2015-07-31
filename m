Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 35DFF764A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:37:35 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZL8d4-00055G-Vu from Noor_Ahsan@mentor.com ;
	Fri, 31 Jul 2015 04:37:35 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.194]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.03.0224.002; Fri, 31 Jul 2015 12:37:34 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: ChenQi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V3 0/4] Fixes for systemd services in systemd
Thread-Index: AQHQyNV9z97/cm+CykilCKWeju8El531eF0g
Date: Fri, 31 Jul 2015 11:37:32 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095B9383@EU-MBX-01.mgc.mentorg.com>
References: <cover.1411721793.git.Qi.Chen@windriver.com>
	<55B6DC09.1090305@windriver.com>
In-Reply-To: <55B6DC09.1090305@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [PATCH V3 0/4] Fixes for systemd services in systemd
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
X-List-Received-Date: Fri, 31 Jul 2015 11:37:36 -0000
X-Groupsio-MsgNum: 68844
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_365E1805BC95084CBE82381A0B86999401095B9383EUMBX01mgcmen_"

--_002_365E1805BC95084CBE82381A0B86999401095B9383EUMBX01mgcmen_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Chen,

We are holding our patch for the warning message=20

sysklogd-1.5.1: sysklogd rdepends on initscripts-functions, but it isn't a =
build dependency? [build-deps]

see attached email. Either we need your fix to be merged or allow us to sen=
d the patch again.

Thanks.

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of ChenQi
Sent: Tuesday, July 28, 2015 6:34 AM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 0/4] Fixes for systemd services in systemd

ping

Any comment is welcome.
If these patches look OK, I'll rebase them and send out a new version.

Best Regards,
Chen Qi

On 09/28/2014 11:00 AM, Chen Qi wrote:
> Changes since V2:
> sysklogd: Unlink /dev/log only if it's not from systemd
>
> The following changes since commit f6a39cc957bf85ff43513f0b76afc3b2c9c906=
b6:
>
>    sstatesig: fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586 (2=
014-09-17 22:00:05 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-sy=
slog-service
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3DChenQi/systemd-syslog-service
>
> Chen Qi (4):
>    systemd: enable syslog.socket by default
>    busybox: fix for syslog service in systemd
>    sysklogd: add systemd support
>    sysklog: comment out configuration regarding xconsole
>
>   meta/recipes-core/busybox/busybox.inc              |   9 +-
>   .../busybox/files/busybox-klogd.service.in         |   4 +-
>   .../busybox/files/busybox-syslog.service.in        |   7 +-
>   meta/recipes-core/systemd/systemd_216.bb           |   2 +
>   .../files/0001-syslogd.c-add-systemd-support.patch | 246 ++++++++++++++=
+++++++
>   meta/recipes-extended/sysklogd/files/klogd.service |   9 +
>   .../sysklogd/files/sysklogd.service                |  14 ++
>   meta/recipes-extended/sysklogd/files/syslog.conf   |   8 +-
>   meta/recipes-extended/sysklogd/sysklogd.inc        |  38 +++-
>   9 files changed, 317 insertions(+), 20 deletions(-)
>   create mode 100644 meta/recipes-extended/sysklogd/files/0001-syslogd.c-=
add-systemd-support.patch
>   create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
>   create mode 100644 meta/recipes-extended/sysklogd/files/sysklogd.servic=
e
>

--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--_002_365E1805BC95084CBE82381A0B86999401095B9383EUMBX01mgcmen_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Fri, 31 Jul 2015 11:37:31 GMT";
	modification-date="Fri, 31 Jul 2015 11:37:31 GMT"

Received: from SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) by
 SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP Server
 (TLS) id 14.3.181.6; Fri, 19 Sep 2014 05:50:13 +0100
Received: from relay1.mentorg.com (147.34.91.1) by
 SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP Server
 (TLS) id 14.3.181.6; Thu, 18 Sep 2014 21:50:11 -0700
Received: from mx0b-0013c101.pphosted.com ([208.86.201.143])	by
 relay1.mentorg.com with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)	id
 1XUq95-0004b9-30 from openembedded-core-bounces@lists.openembedded.org 	for
 Noor_ahsan@mentor.com; Thu, 18 Sep 2014 21:50:11 -0700
Received: from pps.filterd (m0041854 [127.0.0.1])	by
 mx0b-0013c101.pphosted.com (8.14.5/8.14.5) with SMTP id s8J4niGD027704	for
 <Noor_ahsan@mentorg.com>; Thu, 18 Sep 2014 21:50:09 -0700
Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
	by mx0b-0013c101.pphosted.com with ESMTP id 1pf96vfvjn-1	for
 <Noor_ahsan@mentorg.com>; Thu, 18 Sep 2014 21:50:09 -0700
Received: from mail.openembedded.org (localhost [127.0.0.1])	by
 mail.openembedded.org (Postfix) with ESMTP id D80E871483;	Fri, 19 Sep 2014
 04:50:05 +0000 (UTC)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])	by
 mail.openembedded.org (Postfix) with ESMTP id 7ED1E71476	for
 <openembedded-core@lists.openembedded.org>;	Fri, 19 Sep 2014 04:50:00 +0000
 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id
 s8J4o1th009837	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;	Thu, 18 Sep 2014 21:50:01
 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;	Thu, 18 Sep
 2014 21:50:00 -0700
From: ChenQi <Qi.Chen@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sysklogd: set INHIBIT_UPDATERCD_BBCLASS if
 'sysvinit' not in DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH] sysklogd: set INHIBIT_UPDATERCD_BBCLASS if
 'sysvinit' not in DISTRO_FEATURES
Thread-Index: AQHP08UzY74CUZ4kp02KvHlJu/r3yg==
Sender: "openembedded-core-bounces@lists.openembedded.org"
	<openembedded-core-bounces@lists.openembedded.org>
Date: Fri, 19 Sep 2014 04:50:35 +0000
Message-ID: <541BB61B.7070905@windriver.com>
References: <1411099563-29139-1-git-send-email-fahad.usman@gmail.com>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
In-Reply-To: <1411099563-29139-1-git-send-email-fahad.usman@gmail.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthSource: SVR-ORW-FEM-06.mgc.mentorg.com
X-MS-Has-Attach: 
X-Auto-Response-Suppress: All
X-MS-TNEF-Correlator: 
list-post: <mailto:openembedded-core@lists.openembedded.org>
list-archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
errors-to: openembedded-core-bounces@lists.openembedded.org
list-id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
x-mailman-version: 2.1.12
x-beenthere: openembedded-core@lists.openembedded.org
user-agent: Mozilla/5.0 (X11; Linux x86_64;	rv:31.0) Gecko/20100101
 Thunderbird/31.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CE6AE25513524747B254CA213DCA4837@mentor.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

On 09/19/2014 12:06 PM, Fahad Usman wrote:
> We need to set INHIBIT_UPDATERCD_BBCLASS to "1" if 'sysvinit' is not
> present in DISTRO_FEATURES so that any un-necessary package dependencies
> are not added by update-rc.d.bbclass
>
> Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
> ---
>   meta/recipes-extended/sysklogd/sysklogd.inc |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-e=
xtended/sysklogd/sysklogd.inc
> index bcf8aa7..3cbbdfd 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -56,3 +56,8 @@ pkg_prerm_${PN} () {
>       fi
>       fi
>   }
> +
> +python __anonymous() {
> +    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,=
 d):
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}

I'm now adding systemd support for sysklogd.
This recipe will then inherit systemd.bbclass.
And the task of setting INHIBIT_UPDATERCD_BBCLASS is automatically done.

The patches will be sent out in one day or two.

Best Regards,
Chen Qi
--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

--_002_365E1805BC95084CBE82381A0B86999401095B9383EUMBX01mgcmen_--
