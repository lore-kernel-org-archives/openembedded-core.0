Return-Path: <B40290@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0250.outbound.messaging.microsoft.com [213.199.154.250])
	by mail.openembedded.org (Postfix) with ESMTP id 0BFDF61619
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 09:16:30 +0000 (UTC)
Received: from mail36-db9-R.bigfish.com (10.174.16.253) by
	DB9EHSOBE019.bigfish.com (10.174.14.82) with Microsoft SMTP Server id
	14.1.225.22; Wed, 31 Jul 2013 09:16:30 +0000
Received: from mail36-db9 (localhost [127.0.0.1])	by mail36-db9-R.bigfish.com
	(Postfix) with ESMTP id 18A112E0065;
	Wed, 31 Jul 2013 09:16:30 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I542I1432Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah1de096h8275bh8275dh1de097hz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail36-db9 (localhost.localdomain [127.0.0.1]) by mail36-db9
	(MessageSwitch) id 1375262188513976_372; Wed, 31 Jul 2013 09:16:28 +0000
	(UTC)
Received: from DB9EHSMHS018.bigfish.com (unknown [10.174.16.242])	by
	mail36-db9.bigfish.com (Postfix) with ESMTP id 6F8622A0048;
	Wed, 31 Jul 2013 09:16:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS018.bigfish.com
	(10.174.14.28) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 31 Jul 2013 09:16:28 +0000
Received: from 039-SN2MPN1-023.039d.mgd.msft.net ([169.254.3.139]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.03.0136.001;
	Wed, 31 Jul 2013 09:16:26 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: ChenQi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] base-files: remove symbolic link from
	/etc/mtab to /proc/mounts
Thread-Index: AQHOjcqBL9En2D30PUSY2LoV5d25iZl+fUrg
Date: Wed, 31 Jul 2013 09:16:26 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E104309CB@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1375258783-9009-1-git-send-email-B40290@freescale.com>
	<51F8CEFF.2050406@windriver.com>
In-Reply-To: <51F8CEFF.2050406@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: Re: [PATCH] base-files: remove symbolic link from /etc/mtab to /proc/mounts
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
X-List-Received-Date: Wed, 31 Jul 2013 09:16:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I add libhugetlbfs package into my rootfs and run the below command in my b=
oard .
root@p1021rdb:~# hugeadm --create-mounts
    hugeadm:WARNING: Unable to add entry /var/lib/hugetlbfs/pagesize-4MB to=
 /etc/mtab, error: Invalid argument
    hugeadm:WARNING: Unable to add entry /var/lib/hugetlbfs/pagesize-16MB t=
o /etc/mtab, error: Invalid argument
root@p1022ds:~# ls /etc/mtab -l
lrwxrwxrwx 1 root root 12 Jul 31 07:28 /etc/mtab -> /proc/mounts
root@p1022ds:~# ls /proc/mounts=20
/proc/mounts
root@p1022ds:~# ls /proc/mounts -l
lrwxrwxrwx 1 root root 11 Jul 31 07:58 /proc/mounts -> self/mounts



thanks,
chunrong



-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of ChenQi
Sent: Wednesday, July 31, 2013 4:47 PM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] base-files: remove symbolic link from /etc/m=
tab to /proc/mounts

On 07/31/2013 04:19 PM, Chunrong Guo wrote:
>      *If /etc/mtab is a symlink to /proc/self/mounts,
>       mounting fails because addmntent returns an error.
>       As a consequence, the Private directory is unusable
>       because /proc/self/mounts is read-only feature.

Could you please detail your environment a little bit?
Where does this error come from?

Besides, if you're going to make this change, please take a read-only rootf=
s into consideration. There should be more to fix.

Best Regards,
Chen Qi

> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>   meta/recipes-core/base-files/base-files_3.0.14.bb |    1 -
>   1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb=20
> b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 054fefa..1843bdd 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -100,7 +100,6 @@ do_install () {
>   	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
>   	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
>  =20
> -	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
>   }
>  =20
>   do_install_basefilesissue () {

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core



