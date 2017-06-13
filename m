Return-Path: <freesilicon@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id AE817782DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 07:34:44 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id g76so125351130wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 00:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OCd/XS+tsamGnD8DxA4TakKSgpVSZScf4Bi2YT0py9s=;
	b=F7IlkujiXJ9AfO6WKCZiJ6s/UxW4nB0shJbaqUF1Wefwr/BfHS0gfBom1Ic2BZEBCE
	Hp+zn1g+1hGWR/z8MTCYx05aDK7e+fueg6SlgsVKtKVEShVB1/ZHczkTtA8VJP1uFGqe
	GHPRjSGa6ni2M6sEttqvA0VYDHGzX1j1NKj0J/RXUXrATqRIb8p+iVflVT0m2Un3TQ4e
	IhDfqF7QpJIBn5o2/gvStFXtiBZZQfLIdA0E5Q5AC6KUQlPsZWCOIcqutZ2d6KQKscV7
	KX4a7LQBYNqZ8TYYT1/PW8wfIL7w3PrEynBVw+ALR6t6usZ2ORR31JsDHrbKhBqljbyh
	YQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OCd/XS+tsamGnD8DxA4TakKSgpVSZScf4Bi2YT0py9s=;
	b=Ufn8anvSye0Ao3UXpSmARmsSc9XMKnPFBLKYm2F8rjxdq7u2XKmMpSs2MO4fofCFKn
	XXHiknhnyF2Yacp6kXKWKL3NybWlJ3B0qcdmJM7sVeWJW1l1YWnShVU7XWTXqP2nnNBY
	CBXji6vyMh3N4NMqFeEDdLae8b0nXue1WfX1zxk/5sahDq3inmhyCClVqD84yXusve8Y
	cOuQve8VbkDhsoGEORXqqn+4Zy378EQFQjY7CzyFAvQdN0YFlXGUWvH3dvYg4UvBQmRL
	wSfvN0jlHIsVXboHQCI21yTDrtg683E6uu0oJ2jjUhyeEWhNUlqLOMp7LbvwBn+PCFLl
	sFDw==
X-Gm-Message-State: AKS2vOzEarhj+L+JTJlv+kyxzYZ3HT8Q5jKH0WaYaw39bxYgD9uZyxvS
	aIPhFLVeQRqi5D3xbWk=
X-Received: by 10.223.161.154 with SMTP id u26mr1658026wru.191.1497339279606; 
	Tue, 13 Jun 2017 00:34:39 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	22sm23265473wrt.36.2017.06.13.00.34.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jun 2017 00:34:39 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Tue, 13 Jun 2017 09:33:19 +0200
Message-ID: <3868265.O3YA757UyB@crde-port-20.cahors.local>
In-Reply-To: <45a1aae1e696405fa99267c23ba63fcf@XBOX02.axis.com>
References: <20170609070429.17376-1-freesilicon@gmail.com>
	<20170609070429.17376-2-freesilicon@gmail.com>
	<45a1aae1e696405fa99267c23ba63fcf@XBOX02.axis.com>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RESEND 1/3] openssh: Package server configuration
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
X-List-Received-Date: Tue, 13 Jun 2017 07:34:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On vendredi 9 juin 2017 11:41:25 CEST Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > David Vincent
> > Sent: den 9 juni 2017 09:04
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH RESEND 1/3] openssh: Package server
> > configuration
> > 
> > Split sshd configuration for read-write/read-only rootfs in two
> > distinct
> > packages. Also, add a package dependency between openssh-sshd package
> > and a provider of sshd-config.
> > 
> > Signed-off-by: David Vincent <freesilicon@gmail.com>
> > ---
> > 
> >  meta/recipes-connectivity/openssh/openssh_7.5p1.bb | 51
> > 
> > ++++++++++++++++++----
> > 
> >  1 file changed, 42 insertions(+), 9 deletions(-)
> > 
> > diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > index 5b96745aae..e22e6c672d 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
> > @@ -91,13 +91,17 @@ do_compile_ptest() {
> > 
> >  }
> >  
> >  do_install_append () {
> > 
> > -	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
> > +	# Create default config files
> > +	install -m 0644 ${D}${sysconfdir}/ssh/sshd_config
> > ${D}${sysconfdir}/ssh/sshd_config_default +	rm -f
> > ${D}${sysconfdir}/ssh/sshd_config
> > +
> > +	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" =
> > "pam" ]; then> 
> >  		install -D -m 0644 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
> > 
> > -		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/
sshd_config
> > +		sed -i -e 's:#UsePAM no:UsePAM yes:'
> > ${D}${sysconfdir}/ssh/sshd_config_default> 
> >  	fi
> > 
> > -	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
> > -		sed -i -e 's:#X11Forwarding no:X11Forwarding yes:'
> > ${D}${sysconfdir}/ssh/sshd_config +	if [
> > "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" = "x11"
> > ]; then +		sed -i -e 's:#X11Forwarding no:X11Forwarding yes:'
> > ${D}${sysconfdir}/ssh/sshd_config_default> 
> >  	fi
> 
> Instead of all the changes above you could just do this here instead:
Yes, it is simpler that way. If a v2 is to be sent, I will do that change.
> 
> 	mv ${D}${sysconfdir}/ssh/sshd_config
> ${D}${sysconfdir}/ssh/sshd_config_default
> >  	install -d ${D}${sysconfdir}/init.d
> > 
> > @@ -110,7 +114,7 @@ do_install_append () {
> > 
> >  	# Create config files for read-only rootfs
> >  	install -d ${D}${sysconfdir}/ssh
> 
> Creating the directory here again is unnecessary.
That's the old code, maybe it should be dropped.
> 
> > -	install -m 644 ${D}${sysconfdir}/ssh/sshd_config
> > ${D}${sysconfdir}/ssh/sshd_config_readonly +	install -m 644
> > ${D}${sysconfdir}/ssh/sshd_config_default
> > ${D}${sysconfdir}/ssh/sshd_config_readonly> 
> >  	sed -i '/HostKey/d' ${D}${sysconfdir}/ssh/sshd_config_readonly
> >  	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >>
> >  	${D}${sysconfdir}/ssh/sshd_config_readonly echo "HostKey
> >  	/var/run/ssh/ssh_host_dsa_key" >>
> >  	${D}${sysconfdir}/ssh/sshd_config_readonly> 
> > @@ -134,30 +138,59 @@ do_install_ptest () {
> > 
> >  ALLOW_EMPTY_${PN} = "1"
> > 
> > -PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp
> > ${PN}-misc ${PN}-sftp-server" +PACKAGES =+ "${PN}-keygen ${PN}-scp
> > ${PN}-ssh ${PN}-sshd-config ${PN}-sshd-config-readonly ${PN}-sshd
> > ${PN}-sftp ${PN}-misc ${PN}-sftp-server"> 
> >  FILES_${PN}-scp = "${bindir}/scp.${BPN}"
> >  FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
> > 
> > +FILES_${PN}-sshd-config = "${sysconfdir}/ssh/sshd_config_default"
> > +FILES_${PN}-sshd-config-readonly =
> > "${sysconfdir}/ssh/sshd_config_readonly"> 
> >  FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd
> >  ${systemd_unitdir}/system"> 
> > -FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli
> > ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly
> > ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
> > +FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli
> > ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"> 
> >  FILES_${PN}-sftp = "${bindir}/sftp"
> >  FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
> >  FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
> >  FILES_${PN}-keygen = "${bindir}/ssh-keygen"
> >  
> >  RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> > 
> > -RDEPENDS_${PN}-sshd += "${PN}-keygen
> > ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit
> > pam-plugin-loginuid', '', d)}" +RDEPENDS_${PN}-sshd += "${PN}-keygen
> > sshd-config ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> > 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"> 
> >  RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
> >  
> >  RPROVIDES_${PN}-ssh = "ssh"
> > 
> > +RPROVIDES_${PN}-sshd-config = "sshd-config"
> > +RPROVIDES_${PN}-sshd-config-readonly = "sshd-config"
> > 
> >  RPROVIDES_${PN}-sshd = "sshd"
> >  
> >  RCONFLICTS_${PN} = "dropbear"
> > 
> > +RCONFLICTS_${PN}-sshd-config = "${PN}-sshd-config-readonly"
> > +RCONFLICTS_${PN}-sshd-config-readonly = "${PN}-sshd-config"
> > 
> >  RCONFLICTS_${PN}-sshd = "dropbear"
> >  RCONFLICTS_${PN}-keygen = "ssh-keygen"
> > 
> > -CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
> > +CONFFILES_${PN}-sshd-config = "${sysconfdir}/ssh/sshd_config_default"
> > +CONFFILES_${PN}-sshd-config-readonly =
> > "${sysconfdir}/ssh/sshd_config_readonly"> 
> >  CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
> > 
> > +pkg_postinst_${PN}-sshd-config () {
> > +#!/bin/sh
> > +if [ -e $D${sysconfdir}/ssh/sshd_config ]; then
> > +    rm $D${sysconfdir}/ssh/sshd_config
> > +fi
> > +
> > +# Make sure destination directory exists, before creating the symlink
> > +mkdir -p $D${sysconfdir}/ssh
> > +ln -s sshd_config_default $D${sysconfdir}/ssh/sshd_config
> > +}
> > +
> > +pkg_postinst_${PN}-sshd-config-readonly () {
> > +#!/bin/sh
> > +if [ -e $D${sysconfdir}/ssh/sshd_config ]; then
> > +    rm $D${sysconfdir}/ssh/sshd_config
> > +fi
> > +
> > +# Make sure destination directory exists, before creating the symlink
> > +mkdir -p $D${sysconfdir}/ssh
> > +ln -s sshd_config_readonly $D${sysconfdir}/ssh/sshd_config
> > +}
> > +
> 
> I do not like changing /etc/ssh/sshd_config to be a link. I know at least
> we have our own rootfs-postcommands that will be affected by such a change.
> 
> How about you use a PACKAGESPLITFUNCS function instead and move the files
> back into place before they are packaged, so that both configuration
> packages contain the /etc/ssh/sshd_config file.
I have another problem, when I package my configuration, I do not want any 
postcommand tasks to modify it unpredictibly in my release builds. Maybe I 
should find another workaround to not break the current workflows.
> 
> Something like this should work (totally untested):
> 
> PACKAGESPLITFUNCS += "restore_sshd_config"
> 
> restore_sshd_config() {
> 	for file in ${PKGDEST}/*${sysconfdir}/sshd/sshd_config_*; do
> 		mv $file ${file%_*}
> 	done
> }
> 
> >  ALTERNATIVE_PRIORITY = "90"
> >  ALTERNATIVE_${PN}-scp = "scp"
> >  ALTERNATIVE_${PN}-ssh = "ssh"
> > 
> > --
> > 2.13.0
> 
> //Peter


--
David

