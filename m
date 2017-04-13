Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id A0DDD77E4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:38:21 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c45so8132273qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Jrx+CPxu7kh6Ppq1WHZyQFCyd3l6FPmiQttzIwBFqfo=;
	b=BSc/ekAUe0OGU8QE4pDiTagP1+6hOV+K/f+77ihLfahEUFXy9PUAeBrdlN4GDzkWKz
	Xl9ZljgkgjRPvZDY9vQI2eINf8T4VIe6SChcS9K8Kh2CceEIkZ+tyTjgAzH8kqeX2ZM/
	cQ+sKt3a66mzfewTngBCt0y+ROoTcGPbXqJp0BNaeayMsV/ui8jliWBBPPzOESorpuP/
	lJV0Pbj4sCxy/qedWD1PJRartJLdJ8TAnsIBuPMnGy7Qr1t3K7vvwBaDASAb8gxMBIdG
	4cumfi0M8NLabHkLxw/gITVhofgoSpEDOZyq5YuZkdmmN3wqfgpxVtfCw4Oht70/aTX2
	AUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=Jrx+CPxu7kh6Ppq1WHZyQFCyd3l6FPmiQttzIwBFqfo=;
	b=WpuyhNsc61i67dt2JkjlfVfyj1ZJdOemKv2Hc1Npd3PMayLj0jtnzpxXepUKk25e0k
	cDCmE+CooiFsSuvuakq0KVlWcFZJKuKnLr92G1utshYX6DthRK/CPvQzKK4u8QqELhgE
	RNIDqzW4wzM5KHD0Sz5M6kmWYMU/A6VQKqBmEMen3YEL6kSuKoizX45F6fcvrh2XOiVR
	FGcyidtyO/DyuvJGggQ8Et/GC3GugRx4irQh7ZdLs0Hqp5CYRbmvE7VBkK3xgf1VNvK7
	mM+IiK/CVrp9+TkumDJy2SiNg+4FT+0uBUdkDzMqLID/2Z/AMcHYo8M0bsEW5+l1sJvM
	Rt2w==
X-Gm-Message-State: AN3rC/5mxiM6cFq1DU1hmI/qTyVK/CyqkGINEAk4FXN3LQ4d8o23gfUG
	u+ow/D01Q2RWBnaf6js=
X-Received: by 10.237.50.197 with SMTP id z63mr2931041qtd.48.1492094302204;
	Thu, 13 Apr 2017 07:38:22 -0700 (PDT)
Received: from [10.5.3.6] ([189.114.111.135]) by smtp.gmail.com with ESMTPSA id
	w51sm11939918qtb.13.2017.04.13.07.38.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 07:38:21 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20170405120916.17095-1-fabio.berton@ossystems.com.br>
	<20170405120916.17095-2-fabio.berton@ossystems.com.br>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Organization: OS Systems
Message-ID: <bcdeb3c2-ec45-760d-dd5d-e62cd55b8b89@ossystems.com.br>
Date: Thu, 13 Apr 2017 11:38:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170405120916.17095-2-fabio.berton@ossystems.com.br>
Subject: Re: [PATCH 2/2] openssh: Use systemd-tmpfiles to create volatiles files and dirs
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
X-List-Received-Date: Thu, 13 Apr 2017 14:38:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 04/05/2017 09:09 AM, Fabio Berton wrote:
> Volatiles files are installed in different locations depending on
> distro feature update-rc.d or systemd. For update-rc.d volatiles
> configuration files are installed in /etc/default/volatiles and
> for systemd in /etc/tmpfiles.d/. So, we need to install volatiles
> files in correct location depending on what distro feature is used.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  .../openssh/openssh/sshd.tmpfiles.d                |  2 ++
>  meta/recipes-connectivity/openssh/openssh_7.4p1.bb | 27 +++++++++++++---------
>  2 files changed, 18 insertions(+), 11 deletions(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/sshd.tmpfiles.d
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd.tmpfiles.d b/meta/recipes-connectivity/openssh/openssh/sshd.tmpfiles.d
> new file mode 100644
> index 0000000000..a2ae06ad94
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd.tmpfiles.d
> @@ -0,0 +1,2 @@
> +d /var/run/sshd     0755    root    root    -   -
> +f /var/log/lastlog  0644    root    root    -   -
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
> index c8093d4e2b..eff83de135 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://sshd@.service \
>             file://sshdgenkeys.service \
>             file://volatiles.99_sshd \
> +           file://sshd.tmpfiles.d \
>             file://add-test-support-for-busybox.patch \
>             file://run-ptest \
>             file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
> @@ -104,8 +105,7 @@ do_install_append () {
>  	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
>  	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
>  	rmdir ${D}${localstatedir}/run/sshd ${D}${localstatedir}/run ${D}${localstatedir}
> -	install -d ${D}/${sysconfdir}/default/volatiles
> -	install -m 644 ${WORKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
> +
>  	install -m 0755 ${S}/contrib/ssh-copy-id ${D}${bindir}
>
>  	# Create config files for read-only rootfs
> @@ -117,14 +117,19 @@ do_install_append () {
>  	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>  	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>
> -	install -d ${D}${systemd_unitdir}/system
> -	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
> -	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
> -	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
> -	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> -		-e 's,@SBINDIR@,${sbindir},g' \
> -		-e 's,@BINDIR@,${bindir},g' \
> -		${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
> +	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +		install -d ${D}${systemd_unitdir}/system
> +		install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
> +		install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
> +		install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/system
> +		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +			-e 's,@SBINDIR@,${sbindir},g' \
> +			-e 's,@BINDIR@,${bindir},g' \
> +			${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/*.service
> +		install -Dm 0644 ${WORKDIR}/sshd.tmpfiles.d ${D}${sysconfdir}/tmpfiles.d/sshd.conf
> +	else
> +		install -Dm 0644 ${WORKDIR}/volatiles.99_sshd ${D}/${sysconfdir}/default/volatiles/99_sshd
> +	fi
>  }
>
>  do_install_ptest () {
> @@ -138,7 +143,7 @@ PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc $
>  FILES_${PN}-scp = "${bindir}/scp.${BPN}"
>  FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
>  FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_unitdir}/system"
> -FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
> +FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd ${sysconfdir}/tmpfiles.d/sshd.conf"
>  FILES_${PN}-sftp = "${bindir}/sftp"
>  FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
>  FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
>

