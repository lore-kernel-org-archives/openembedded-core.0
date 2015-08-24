Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-11.smtp.antispamcloud.com (mx18-11.smtp.antispamcloud.com
	[207.244.64.180])
	by mail.openembedded.org (Postfix) with ESMTP id 868626AC1E
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:08:09 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZTrTl-0005pU-0n for Openembedded-core@lists.openembedded.org;
	Mon, 24 Aug 2015 15:08:06 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 24 Aug 2015 15:07:22 +0200
Message-ID: <55DB1720.6090808@topic.nl>
Date: Mon, 24 Aug 2015 15:07:44 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: OE-core <Openembedded-core@lists.openembedded.org>
References: <1439362843-27419-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1439362843-27419-1-git-send-email-mike.looijmans@topic.nl>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw2ggrN+bCKyRV12i0wK0eHOM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtXS/WgqDgJCS36fZcYt9LJrOKL6xdzDR/pdX43UCRuwnoxr2uZp0cbf0Dnt
	hka207c8CVsONrMJuGzuoGnKTKcy2xFkLpfI2GROc/TVFQ1M5w/S+L3ktki0yiouSvOolqeLT0PR
	GeOtHp8CevJaVP3RKAlmn4QY0Xa5w5mR23/WmQwqvMBYMukOyP3wW5yT57cTh6E2XHkoWr32bjya
	7gAvW4NAR0qbrlxNRt9ZoMCfLnY+akJNhL5qAttvzUBLxkQ2a3rCoHjHfcJIyKVF5T5LG2eHru/B
	zfgwTimxhZy/nuLrWedC6pqQQw+IVEM3KmRfQ4GqUWvgp7phkSqv0ZsqmdySlZou9qHIGOZDEEo7
	OyMdMb9bjBpP2U+fB0pr5dMhsfVz6trBKg1q8knCBzevPnb7rI0VfeqD9XJhW9OTh11z/z4WnEoC
	8C13cWABWlhWPxtvTWQlG7LubmSVPcFB6J1fhOzjF0b4LXcjJZ5lorygWaquS4QUc2X9/UmaFDUh
	sTbOm0n23gAH4LW5RBSd12aoSjUKxdXaKO35Ea/DrU+pok6SWPRM754kFPO4pu4=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00873960316236)
X-Recommended-Action: accept
Subject: Re: [PATCH] image.bbclass: Always try to run populate-volatile.sh at rootfs time
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
X-List-Received-Date: Mon, 24 Aug 2015 13:08:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFAny comments on this?

And if unacceptable, how about at least making=20
"rootfs_populate_volatile_cache" available as a sort of library method so i=
t=20
doesn't get repeated at each image recipe?

On 12-08-15 09:00, Mike Looijmans wrote:
> Currently populate-volatile.sh will only run when "readonly-rootfs" is
> selected.
>
> Running this script is very useful even on read/write root filesystems,
> because it reduces the number of "fixup" actions at first boot of the
> device. That not only reduces boot time, it also reduces the flash space
> usage. Also, when the system happens to have a read-only filesystem
> because for example the "read-only" switch of the SD card was set, or
> because the filesystem had errors on it, it will still be able to boot.
>
> I've been manually adding these lines to each and every image recipe I've
> used, so I guess it's time to move this into core.
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>   meta/classes/image.bbclass | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index ff2ed0d..68deb84 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -185,6 +185,9 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains=
_any("IMAGE_FEATURES", [ 'deb
>   # Create /etc/timestamp during image construction to give a reasonably =
sane default time setting
>   ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp ; "
>
> +# Create the volatile cache. Required for read-only rootfs, useful for a=
ll sysvinit systems to reduce writes to the system
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("DISTRO_FEATURES",=
 "sysvinit", "rootfs_populate_volatile_cache;", "", d)}'
> +
>   # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs =
is enabled
>   ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES",=
 "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
>
> @@ -216,6 +219,16 @@ do_rootfs[cleandirs] +=3D "${S}"
>   # task, so that we have a single fakeroot context for the whole process=
.
>   do_rootfs[umask] =3D "022"
>
> +
> +# Run populate-volatile.sh at rootfs time to set up basic files and
> +# directories to reduce writes at first boot and to support read-only
> +# rootfs.
> +rootfs_populate_volatile_cache() {
> +		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
> +			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
> +		fi
> +}
> +
>   # A hook function to support read-only-rootfs IMAGE_FEATURES
>   read_only_rootfs_hook () {
>   	# Tweak the mount option and fs_passno for rootfs in fstab
> @@ -226,11 +239,6 @@ read_only_rootfs_hook () {
>   		if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
>   			sed -i 's/ROOTFS_READ_ONLY=3Dno/ROOTFS_READ_ONLY=3Dyes/' ${IMAGE_ROO=
TFS}/etc/default/rcS
>   		fi
> -		# Run populate-volatile.sh at rootfs time to set up basic files
> -		# and directories to support read-only rootfs.
> -		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
> -			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
> -		fi
>   		# If we're using openssh and the /etc/ssh directory has no pre-genera=
ted keys,
>   		# we should configure openssh to use the configuration file /etc/ssh/=
sshd_config_readonly
>   		# and the keys under /var/run/ssh.
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






