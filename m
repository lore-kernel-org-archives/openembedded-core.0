Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from rediffmail.com (unknown [202.137.235.163])
	by mail.openembedded.org (Postfix) with SMTP id 9C6FB70499
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 16:40:10 +0000 (UTC)
Received: (qmail 3940 invoked by uid 510); 14 Jul 2014 16:40:00 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=hV2InNfBSSMTW1Kq4FyUYxS9YmLw8ni6ipCe8fPG1Aqxpsb250U0mYPtp+qOxLddBdkvNRz7cw3z/FSHvaMGekQAinD6IvT3UUjqpbNI/xInirK2lljHr7rBNVtyhGnWL4e8va6+kJ1leOQ2aLSU7Nn3CXu6gxTJHYD8lu+eljU=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160204.53C407DB.005D, ss=1, re=-6.500, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 14 Jul 2014 16:39:54 -0000
MIME-Version: 1.0
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Received: from unknown 122.177.78.45 by rediffmail.com via HTTP;
	14 Jul 2014 16:39:54 -0000
Message-ID: <1405355124.S.42508.RU.sfs22, sfs22, 89,
	922.3584.f4mail-235-118.rediffmail.com.old.1405355994.3554@webmail.rediffmail.com>
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
Subject: Regarding ./configure and Makefile
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
X-List-Received-Date: Mon, 14 Jul 2014 16:40:16 -0000
Content-Type: multipart/alternative;
	boundary="=_12e366c44c4247fc48017fe05bfcd356"

--=_12e366c44c4247fc48017fe05bfcd356
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

Hi,

Suppose I have a package and to compile and install that package, it is required to run following:

./configure
make 
make install

Then how can I include these in my package receipe.

Please help.

Regards,
Himanshu

&nbsp;

From: Robert Yang &lt;liezhi.yang@windriver.com&gt;
Sent: Fri, 11 Jul 2014 06:42:31 
To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;
Cc: "openembedded-devel@lists.openembedded.org" &lt;openembedded-devel@lists.openembedded.org&gt;
Subject: Re: Regarding pptpd package


Seems that we don't have the pptpd recipes, you can search from here:



http://layers.openembedded.org/layerindex/branch/master/recipes/?q=pptpd



For the configure error:



sh: util/bindvar.sh: No such file or directory



You need check where is the bindvar.sh, and why can't find it.



// Robert





On 07/10/2014 07:29 PM, Himanshu Pandey wrote:

&gt; Hi,

&gt;

&gt; &nbsp;From where can I find pptpd in git.

&gt;

&gt; Please help.

&gt;

&gt; Regards,

&gt; Himanshu

&gt;

&gt;

&gt;

&gt;

&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

&gt; Sent: Thu, 10 Jul 2014 16:24:38

&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;

&gt; Cc: "openembedded-devel@lists.openembedded.org"

&gt; &lt;openembedded-devel@lists.openembedded.org&gt;

&gt; Subject: Re: Regarding dhcp package

&gt;

&gt; The error is:

&gt;

&gt; configure: error: source directory already configured; run "make distclean"

&gt; there first

&gt;

&gt; Try a clean build ?

&gt;

&gt; For example:

&gt;

&gt; bitbake dhcp -ccleansstate &amp;&amp; bitbake dhcp

&gt;

&gt; If you get the same error again, you may need inherit autotools-brokensep

&gt; rather than autotools as a quick workaround.

&gt;

&gt; // Robert

&gt;

&gt; On 07/10/2014 05:50 PM, Himanshu Pandey wrote:

&gt; &nbsp;&gt; Hi,

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; As advised by you I have done that but again I am getting an error.

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; Please find the log as attachment.

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; Regards,

&gt; &nbsp;&gt; Himanshu

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

&gt; &nbsp;&gt; Sent: Thu, 10 Jul 2014 14:08:59

&gt; &nbsp;&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;

&gt; &nbsp;&gt; Cc: "openembedded-devel@lists.openembedded.org"

&gt; &nbsp;&gt; &lt;openembedded-devel@lists.openembedded.org&gt;

&gt; &nbsp;&gt; Subject: Re: Regarding dhcp package

&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; On 07/10/2014 04:17 PM, Himanshu Pandey wrote:

&gt; &nbsp;&gt; &nbsp;&gt; Hi Robert,

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; I am getting an error while compiling my dhcp package. Please find the log as

&gt; &nbsp;&gt; &nbsp;&gt; attachment.

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; My dhcp bb file is as follows:

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; SECTION = "base"

&gt; &nbsp;&gt; &nbsp;&gt; SUMMARY = "Internet Software Consortium DHCP package"

&gt; &nbsp;&gt; &nbsp;&gt; DESCRIPTION = "DHCP (Dynamic Host Configuration Protocol) is a protocol \

&gt; &nbsp;&gt; &nbsp;&gt; which allows individual devices on an IP network to get their own \

&gt; &nbsp;&gt; &nbsp;&gt; network configuration information from a server. &nbsp;DHCP helps make it \

&gt; &nbsp;&gt; &nbsp;&gt; easier to administer devices."

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; HOMEPAGE = "http://www.isc.org/"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; LICENSE = "CLOSED"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; DEPENDS = "openssl bind"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; SRC_URI =

&gt; &nbsp;&gt; "svn://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd="

&gt; &lt;http://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd="&gt;

&gt; &nbsp;&gt; &lt;http://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=branch;user=;pswd="&gt;

&gt; &nbsp;&gt; &nbsp;&gt; SRCREV = "${AUTOREV}"

&gt; &nbsp;&gt; &nbsp;&gt; S= "${WORKDIR}/trunk"

&gt; &nbsp;&gt; &nbsp;&gt; #inherit autotools

&gt; &nbsp;&gt; &nbsp;&gt; do_compile() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#cp -f ${WORKDIR}/trunk/include/site.h ${S}/includes

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cd ../trunk

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;./configure --prefix=${prefix} --host=${HOST_SYS}

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;make

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; I think that these are wrong, you should not disable the "inherit autotools",

&gt; &nbsp;&gt; and should not use "./configure" or "make" directly, try to enable

&gt; &nbsp;&gt; the "inherit autotools", and remove the do_compile section to see what

&gt; &nbsp;&gt; would happen, maybe you need:

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; inherit autotools

&gt; &nbsp;&gt; S = "${WORKDIR}/trunk"

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; // Robert

&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; do_install_append () {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${sysconfdir}/init.d

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${sysconfdir}/default

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${sysconfdir}/dhcp

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /etc/dhcp

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /sbin

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /var/db

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /var/lib

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /usr/local/sbin/

&gt; &nbsp;&gt; &nbsp;&gt; install -m 0755 ${D}/sbin/dhcrelay

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/sbin/dhcpd

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/sbin/dhclient-script

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/var/db/dhcpd.leases

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/var/lib/dhcpd

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${D}/usr/local/sbin/dhclient

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sudo touch ${D}/usr/local/bin/dhcpd-pools

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm -f ${D}${sysconfdir}/dhclient.conf*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm -f ${D}${sysconfdir}/dhcpd.conf*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm -f /etc/dhcpd.conf*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0644 ${WORKDIR}/dhcpd.conf ${D}/etc/dhcpd.conf

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0644 ${WORKDIR}/dhclient.conf ${D}/etc/dhcp/dhclient.conf

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${base_sbindir}/

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ "${sbindir}" != "${base_sbindir}" ]; then

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${S}/client/scripts/linux

&gt; &nbsp;&gt; &nbsp;&gt; ${D}${base_sbindir}/dhclient-script

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay

&gt; dhcp-omshell"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_${PN} = ""

&gt; &nbsp;&gt; &nbsp;&gt; RDEPENDS_${PN}-dev = ""

&gt; &nbsp;&gt; &nbsp;&gt; RDEPENDS_${PN}-staticdev = ""

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"

&gt; &nbsp;&gt; &nbsp;&gt; RRECOMMENDS_dhcp-server = "dhcp-server-config"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server

&gt; &nbsp;&gt; &nbsp;&gt; ${sysconfdir}/dhcp/dhcpd.conf"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay

&gt; &nbsp;&gt; &nbsp;&gt; ${sysconfdir}/default/dhcp-relay"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script

&gt; &nbsp;&gt; &nbsp;&gt; ${sysconfdir}/dhcp/dhclient.conf"

&gt; &nbsp;&gt; &nbsp;&gt; RDEPENDS_dhcp-client = "bash"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-omshell = "${bindir}/omshell"

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; pkg_postinst_dhcp-server() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;mkdir -p $D/${localstatedir}/lib/dhcp

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;touch $D/${localstatedir}/lib/dhcp/dhcpd.leases

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; pkg_postinst_dhcp-client() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;mkdir -p $D/${localstatedir}/lib/dhcp

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; pkg_postrm_dhcp-server() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;if ! rmdir $D/${localstatedir}/lib/dhcp 2&gt;/dev/null; then

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;fi

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; pkg_postrm_dhcp-client() {

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;if ! rmdir $D/${localstatedir}/lib/dhcp 2&gt;/dev/null; then

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;fi

&gt; &nbsp;&gt; &nbsp;&gt; }

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Please help.

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Regards,

&gt; &nbsp;&gt; &nbsp;&gt; Himanshu

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Sent: Wed, 02 Jul 2014 15:22:14

&gt; &nbsp;&gt; &nbsp;&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;,

&gt; &nbsp;&gt; &nbsp;&gt; "openembedded-devel@lists.openembedded.org"

&gt; &nbsp;&gt; &nbsp;&gt; &lt;openembedded-devel@lists.openembedded.org&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Subject: Re: [bitbake-devel] Regarding rp-pppoe package

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; On 07/02/2014 05:49 PM, Himanshu Pandey wrote:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Hi,

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; I am getting following error when I tried to add and compile rp-pppoe

&gt; &nbsp;&gt; pacakage:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Please add the full error log, thanks.

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Btw, I will go to have dinner now, may reply tomorrow.

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; // Robert

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; ERROR: oe_runconf failed

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Please help.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Regards,

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Himanshu

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Sent: Wed, 02 Jul 2014 13:16:17

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Cc: openembedded-devel &lt;openembedded-devel@lists.openembedded.org&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Subject: Re: [bitbake-devel] Regarding Net-Snmp package

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; I think that this email should go into oe-devel (see the cc) since

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; the net-snmp is from the meta-networking layer, please see:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static

&gt; &nbsp;&gt; &nbsp;&gt; ${PN}-libs \

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; ${PN}-server-snmptrapd"

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; There is no net-snmp in the PACKAGES, I think that you need use

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; net-snmp-client or net-snmp-server.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; // Robert

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; On 07/02/2014 03:36 PM, Himanshu Pandey wrote:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Hi,

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; I am getting following errors:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Error: net-snmp not found in the base feeds (genericx86_64 x86_64

&gt; &nbsp;&gt; noarch any

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; all).

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; sed: can't read

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/net-snmp/5.7.2-r1/image/usr/bin/net-snmp-config:

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; No such file or directory

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Please help.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Regards,

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Himanshu

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with

&gt; Company

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; email.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company

&gt; &nbsp;&gt; &nbsp;&gt; email.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &nbsp;&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company

&gt; &nbsp;&gt; email.

&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &nbsp;&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &nbsp;&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company

&gt; email.

&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*

&gt; &nbsp;&gt;

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt; &nbsp;&gt;

&gt;

&gt; &lt;http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;

&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app with Company email.

&gt; &nbsp;&nbsp;&nbsp;*Know More &gt;*

&gt; &lt;http://track.rediff.com/click?url=___http://businessemail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=sign-1-10-13___&amp;cmp=host&amp;lnk=sign-1-10-13&amp;nsrv1=host&gt;

&gt;


Get your own FREE website,  FREE domain &amp; FREE mobile app with Company email. &nbsp;Know More &gt;

--=_12e366c44c4247fc48017fe05bfcd356
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

Hi,<br><br>Suppose I have a package and to compile and install that package=
, it is required to run following:<br><br>./configure<br>make <br>make inst=
all<br><br>Then how can I include these in my package receipe.<br><br>Pleas=
e help.<br><br>Regards,<br>Himanshu<br><br>&nbsp;<br><br>From: Robert Yang =
&lt;liezhi.yang@windriver.com&gt;<br>Sent: Fri, 11 Jul 2014 06:42:31 <br>To=
: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;<br>Cc: "openembe=
dded-devel@lists.openembedded.org" &lt;openembedded-devel@lists.openembedde=
d.org&gt;<br>Subject: Re: Regarding pptpd package<br><br>
Seems that we don't have the pptpd recipes, you can search from here:<br>
<br>
<a href=3D'http://layers.openembedded.org/layerindex/branch/master/recipes/=
?q=3Dpptpd'>http://layers.openembedded.org/layerindex/branch/master/recipes=
/?q=3Dpptpd</a><br>
<br>
For the configure error:<br>
<br>
sh: util/<a href=3D'http://bindvar.sh'>bindvar.sh</a>: No such file or dire=
ctory<br>
<br>
You need check where is the <a href=3D'http://bindvar.sh'>bindvar.sh</a>, a=
nd why can't find it.<br>
<br>
// Robert<br>
<br>
<br>
On 07/10/2014 07:29 PM, Himanshu Pandey wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; &nbsp;From where can I find pptpd in git.<br>
&gt;<br>
&gt; Please help.<br>
&gt;<br>
&gt; Regards,<br>
&gt; Himanshu<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;<br>
&gt; Sent: Thu, 10 Jul 2014 16:24:38<br>
&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt;<br>
&gt; Cc: "openembedded-devel@lists.openembedded.org"<br>
&gt; &lt;openembedded-devel@lists.openembedded.org&gt;<br>
&gt; Subject: Re: Regarding dhcp package<br>
&gt;<br>
&gt; The error is:<br>
&gt;<br>
&gt; configure: error: source directory already configured; run "make distc=
lean"<br>
&gt; there first<br>
&gt;<br>
&gt; Try a clean build ?<br>
&gt;<br>
&gt; For example:<br>
&gt;<br>
&gt; bitbake dhcp -ccleansstate &amp;&amp; bitbake dhcp<br>
&gt;<br>
&gt; If you get the same error again, you may need inherit autotools-broken=
sep<br>
&gt; rather than autotools as a quick workaround.<br>
&gt;<br>
&gt; // Robert<br>
&gt;<br>
&gt; On 07/10/2014 05:50 PM, Himanshu Pandey wrote:<br>
&gt; &nbsp;&gt; Hi,<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; As advised by you I have done that but again I am getting a=
n error.<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; Please find the log as attachment.<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; Regards,<br>
&gt; &nbsp;&gt; Himanshu<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&gt;<br>
&gt; &nbsp;&gt; Sent: Thu, 10 Jul 2014 14:08:59<br>
&gt; &nbsp;&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediffmail.com&gt=
;<br>
&gt; &nbsp;&gt; Cc: "openembedded-devel@lists.openembedded.org"<br>
&gt; &nbsp;&gt; &lt;openembedded-devel@lists.openembedded.org&gt;<br>
&gt; &nbsp;&gt; Subject: Re: Regarding dhcp package<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; On 07/10/2014 04:17 PM, Himanshu Pandey wrote:<br>
&gt; &nbsp;&gt; &nbsp;&gt; Hi Robert,<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; I am getting an error while compiling my dhcp pa=
ckage. Please find the log as<br>
&gt; &nbsp;&gt; &nbsp;&gt; attachment.<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; My dhcp bb file is as follows:<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; SECTION =3D "base"<br>
&gt; &nbsp;&gt; &nbsp;&gt; SUMMARY =3D "Internet Software Consortium DHCP p=
ackage"<br>
&gt; &nbsp;&gt; &nbsp;&gt; DESCRIPTION =3D "DHCP (Dynamic Host Configuratio=
n Protocol) is a protocol \<br>
&gt; &nbsp;&gt; &nbsp;&gt; which allows individual devices on an IP network=
 to get their own \<br>
&gt; &nbsp;&gt; &nbsp;&gt; network configuration information from a server.=
 &nbsp;DHCP helps make it \<br>
&gt; &nbsp;&gt; &nbsp;&gt; easier to administer devices."<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; HOMEPAGE =3D "<a href=3D'http://www.isc.org/"'>h=
ttp://www.isc.org/"</a><br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; LICENSE =3D "CLOSED"<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; DEPENDS =3D "openssl bind"<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; SRC_URI =3D<br>
&gt; &nbsp;&gt; "svn://<a href=3D'http://192.43.23.436/home/repo/dhcp-4.2.4=
-P2;module=3Dbranch;user=3D;pswd=3D'>192.43.23.436/home/repo/dhcp-4.2.4-P2;=
module=3Dbranch;user=3D;pswd=3D"</a><br>
&gt; &lt;<a href=3D'http://192.43.23.436/home/repo/dhcp-4.2.4-P2;module=3Db=
ranch;user=3D;pswd=3D"&gt;'>http://192.43.23.436/home/repo/dhcp-4.2.4-P2;mo=
dule=3Dbranch;user=3D;pswd=3D"&gt;</a><br>
&gt; &nbsp;&gt; &lt;<a href=3D'http://192.43.23.436/home/repo/dhcp-4.2.4-P2=
;module=3Dbranch;user=3D;pswd=3D"&gt;'>http://192.43.23.436/home/repo/dhcp-=
4.2.4-P2;module=3Dbranch;user=3D;pswd=3D"&gt;</a><br>
&gt; &nbsp;&gt; &nbsp;&gt; SRCREV =3D "${AUTOREV}"<br>
&gt; &nbsp;&gt; &nbsp;&gt; S=3D "${WORKDIR}/trunk"<br>
&gt; &nbsp;&gt; &nbsp;&gt; #inherit autotools<br>
&gt; &nbsp;&gt; &nbsp;&gt; do_compile() {<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;#cp -f ${WORKD=
IR}/trunk/include/site.h ${S}/includes<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cd ../trunk<br=
>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;./configure --=
prefix=3D${prefix} --host=3D${HOST_SYS}<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;make<br>
&gt; &nbsp;&gt; &nbsp;&gt; }<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; I think that these are wrong, you should not disable the "i=
nherit autotools",<br>
&gt; &nbsp;&gt; and should not use "./configure" or "make" directly, try to=
 enable<br>
&gt; &nbsp;&gt; the "inherit autotools", and remove the do_compile section =
to see what<br>
&gt; &nbsp;&gt; would happen, maybe you need:<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; inherit autotools<br>
&gt; &nbsp;&gt; S =3D "${WORKDIR}/trunk"<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; // Robert<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; do_install_append () {<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D=
}${sysconfdir}/init.d<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D=
}${sysconfdir}/default<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D=
}${sysconfdir}/dhcp<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /et=
c/dhcp<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /sb=
in<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /va=
r/db<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /va=
r/lib<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d /us=
r/local/sbin/<br>
&gt; &nbsp;&gt; &nbsp;&gt; install -m 0755 ${D}/sbin/dhcrelay<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 075=
5 ${D}/sbin/dhcpd<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 075=
5 ${D}/sbin/dhclient-script<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 075=
5 ${D}/var/db/dhcpd.leases<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 075=
5 ${D}/var/lib/dhcpd<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 075=
5 ${D}/usr/local/sbin/dhclient<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;sudo touch ${D=
}/usr/local/bin/dhcpd-pools<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm -f ${D}${sy=
sconfdir}/dhclient.conf*<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm -f ${D}${sy=
sconfdir}/dhcpd.conf*<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rm -f /etc/dhc=
pd.conf*<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 064=
4 ${WORKDIR}/dhcpd.conf ${D}/etc/dhcpd.conf<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 064=
4 ${WORKDIR}/dhclient.conf ${D}/etc/dhcp/dhclient.conf<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D=
}${base_sbindir}/<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if [ "${sbindi=
r}" !=3D "${base_sbindir}" ]; then<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fi<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 075=
5 ${S}/client/scripts/linux<br>
&gt; &nbsp;&gt; &nbsp;&gt; ${D}${base_sbindir}/dhclient-script<br>
&gt; &nbsp;&gt; &nbsp;&gt; }<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; PACKAGES +=3D "dhcp-server dhcp-server-config dh=
cp-client dhcp-relay<br>
&gt; dhcp-omshell"<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; FILES_${PN} =3D ""<br>
&gt; &nbsp;&gt; &nbsp;&gt; RDEPENDS_${PN}-dev =3D ""<br>
&gt; &nbsp;&gt; &nbsp;&gt; RDEPENDS_${PN}-staticdev =3D ""<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-server =3D "${sbindir}/dhcpd ${syscon=
fdir}/init.d/dhcp-server"<br>
&gt; &nbsp;&gt; &nbsp;&gt; RRECOMMENDS_dhcp-server =3D "dhcp-server-config"=
<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-server-config =3D "${sysconfdir}/defa=
ult/dhcp-server<br>
&gt; &nbsp;&gt; &nbsp;&gt; ${sysconfdir}/dhcp/dhcpd.conf"<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-relay =3D "${sbindir}/dhcrelay ${sysc=
onfdir}/init.d/dhcp-relay<br>
&gt; &nbsp;&gt; &nbsp;&gt; ${sysconfdir}/default/dhcp-relay"<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-client =3D "${base_sbindir}/dhclient =
${base_sbindir}/dhclient-script<br>
&gt; &nbsp;&gt; &nbsp;&gt; ${sysconfdir}/dhcp/dhclient.conf"<br>
&gt; &nbsp;&gt; &nbsp;&gt; RDEPENDS_dhcp-client =3D "bash"<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; FILES_dhcp-omshell =3D "${bindir}/omshell"<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; pkg_postinst_dhcp-server() {<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;mkdir -p $D/${localstatedir}=
/lib/dhcp<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;touch $D/${localstatedir}/li=
b/dhcp/dhcpd.leases<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;touch $D/${localstatedir}/li=
b/dhcp/dhcpd6.leases<br>
&gt; &nbsp;&gt; &nbsp;&gt; }<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; pkg_postinst_dhcp-client() {<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;mkdir -p $D/${localstatedir}=
/lib/dhcp<br>
&gt; &nbsp;&gt; &nbsp;&gt; }<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; pkg_postrm_dhcp-server() {<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/li=
b/dhcp/dhcpd.leases<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/li=
b/dhcp/dhcpd6.leases<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;if ! rmdir $D/${localstatedi=
r}/lib/dhcp 2&gt;/dev/null; then<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo "Not remo=
ving ${localstatedir}/lib/dhcp as it is non-empty."<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;fi<br>
&gt; &nbsp;&gt; &nbsp;&gt; }<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; pkg_postrm_dhcp-client() {<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/li=
b/dhcp/dhclient.leases<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;rm -f $D/${localstatedir}/li=
b/dhcp/dhclient6.leases<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;if ! rmdir $D/${localstatedi=
r}/lib/dhcp 2&gt;/dev/null; then<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;echo "Not remo=
ving ${localstatedir}/lib/dhcp as it is non-empty."<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp;fi<br>
&gt; &nbsp;&gt; &nbsp;&gt; }<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; Please help.<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; Regards,<br>
&gt; &nbsp;&gt; &nbsp;&gt; Himanshu<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; From: Robert Yang &lt;liezhi.yang@windriver.com&=
gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; Sent: Wed, 02 Jul 2014 15:22:14<br>
&gt; &nbsp;&gt; &nbsp;&gt; To: Himanshu Pandey &lt;pandey_himanshu80@rediff=
mail.com&gt;,<br>
&gt; &nbsp;&gt; &nbsp;&gt; "openembedded-devel@lists.openembedded.org"<br>
&gt; &nbsp;&gt; &nbsp;&gt; &lt;openembedded-devel@lists.openembedded.org&gt=
;<br>
&gt; &nbsp;&gt; &nbsp;&gt; Subject: Re: [bitbake-devel] Regarding rp-pppoe =
package<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; On 07/02/2014 05:49 PM, Himanshu Pandey wrote:<b=
r>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Hi,<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; I am getting following error when I t=
ried to add and compile rp-pppoe<br>
&gt; &nbsp;&gt; pacakage:<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; Please add the full error log, thanks.<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; Btw, I will go to have dinner now, may reply tom=
orrow.<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; // Robert<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; ERROR: oe_runconf failed<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Please help.<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Regards,<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Himanshu<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; From: Robert Yang &lt;liezhi.yang@win=
driver.com&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Sent: Wed, 02 Jul 2014 13:16:17<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; To: Himanshu Pandey &lt;pandey_himans=
hu80@rediffmail.com&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Cc: openembedded-devel &lt;openembedd=
ed-devel@lists.openembedded.org&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Subject: Re: [bitbake-devel] Regardin=
g Net-Snmp package<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; I think that this email should go int=
o oe-devel (see the cc) since<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; the net-snmp is from the meta-network=
ing layer, please see:<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; meta-networking/recipes-protocols/net=
-snmp/net-snmp_5.7.2.bb<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; PACKAGES =3D "${PN}-dbg ${PN}-doc ${P=
N}-dev ${PN}-staticdev ${PN}-static<br>
&gt; &nbsp;&gt; &nbsp;&gt; ${PN}-libs \<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; ${PN}-server-snmptrapd"<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; There is no net-snmp in the PACKAGES,=
 I think that you need use<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; net-snmp-client or net-snmp-server.<b=
r>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; // Robert<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; On 07/02/2014 03:36 PM, Himanshu Pand=
ey wrote:<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Hi,<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; I am getting following err=
ors:<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Error: net-snmp not found =
in the base feeds (genericx86_64 x86_64<br>
&gt; &nbsp;&gt; noarch any<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; all).<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; sed: can't read<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/net-snmp=
/5.7.2-r1/image/usr/bin/net-snmp-config:<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; No such file or directory<=
br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Please help.<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Regards,<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Himanshu<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &lt;<a href=3D'http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www=
.rediffmail.com/signatureline.htm@Middle?&gt;'>http://sigads.rediff.com/Rea=
lMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;</a=
><br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Get your own *FREE* websit=
e, *FREE* domain &amp; *FREE* mobile app with<br>
&gt; Company<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; email.<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &g=
t;*<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &lt;<a href=3D'http://track.rediff.com/click?url=3D___http://businesse=
mail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=
=3Dsign-1-10-13___&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&g=
t;'>http://track.rediff.com/click?url=3D___http://businessemail.rediff.com/=
email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13__=
_&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&gt;</a><br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &lt;<a href=3D'http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www=
.rediffmail.com/signatureline.htm@Middle?&gt;'>http://sigads.rediff.com/Rea=
lMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;</a=
><br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* d=
omain &amp; *FREE* mobile app with Company<br>
&gt; &nbsp;&gt; &nbsp;&gt; email.<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &lt;<a href=3D'http://track.rediff.com/click?url=3D___http://businesse=
mail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=
=3Dsign-1-10-13___&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&g=
t;'>http://track.rediff.com/click?url=3D___http://businessemail.rediff.com/=
email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13__=
_&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&gt;</a><br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &lt;<a href=3D'http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www=
.rediffmail.com/signatureline.htm@Middle?&gt;'>http://sigads.rediff.com/Rea=
lMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;</a=
><br>
&gt; &nbsp;&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp;=
 *FREE* mobile app with Company<br>
&gt; &nbsp;&gt; email.<br>
&gt; &nbsp;&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*<br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &lt;<a href=3D'http://track.rediff.com/click?url=3D___http://businesse=
mail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=
=3Dsign-1-10-13___&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&g=
t;'>http://track.rediff.com/click?url=3D___http://businessemail.rediff.com/=
email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13__=
_&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&gt;</a><br>
&gt; &nbsp;&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &nbsp;&gt;<br>
&gt; &lt;<a href=3D'http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www=
.rediffmail.com/signatureline.htm@Middle?&gt;'>http://sigads.rediff.com/Rea=
lMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;</a=
><br>
&gt; &nbsp;&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mob=
ile app with Company<br>
&gt; email.<br>
&gt; &nbsp;&gt; &nbsp; &nbsp;*Know More &gt;*<br>
&gt; &nbsp;&gt;<br>
&gt; &lt;<a href=3D'http://track.rediff.com/click?url=3D___http://businesse=
mail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=
=3Dsign-1-10-13___&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&g=
t;'>http://track.rediff.com/click?url=3D___http://businessemail.rediff.com/=
email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13__=
_&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&gt;</a><br>
&gt; &nbsp;&gt;<br>
&gt;<br>
&gt; &lt;<a href=3D'http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www=
.rediffmail.com/signatureline.htm@Middle?&gt;'>http://sigads.rediff.com/Rea=
lMedia/ads/click_nx.ads/www.rediffmail.com/signatureline.htm@Middle?&gt;</a=
><br>
&gt; Get your own *FREE* website, *FREE* domain &amp; *FREE* mobile app wit=
h Company email.<br>
&gt; &nbsp;&nbsp;&nbsp;*Know More &gt;*<br>
&gt; &lt;<a href=3D'http://track.rediff.com/click?url=3D___http://businesse=
mail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_cid=
=3Dsign-1-10-13___&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&g=
t;'>http://track.rediff.com/click?url=3D___http://businessemail.rediff.com/=
email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13__=
_&amp;cmp=3Dhost&amp;lnk=3Dsign-1-10-13&amp;nsrv1=3Dhost&gt;</a><br>
&gt;<br>
<br><a href=3D'http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.redi=
ffmail.com/signatureline.htm@Middle?'><img src=3D"http://sigads.rediff.com/=
RealMedia/ads/adstream_nx.ads/www.rediffmail.com/signatureline.htm@Middle&r=
ogue=3D1716b54fe387786204c5115fd1c9b84babf33ef6"></a><table cellpadding=3D"=
0" cellspacing=3D"0"><tbody><tr><td><div style=3D"font-family: Arial, Helve=
tica, sans-serif; font-size:14px">Get your own <span style=3D"padding-botto=
m: 0px; background-color: #cc0000; padding-left: 3px; padding-RIGHT: 3px; f=
ont-family: Arial, Helvetica, sans-serif; color: #ffffff; font-size: 12px; =
padding-top: 0px"><b>FREE</b></span> website,  <span style=3D"padding-botto=
m: 0px; background-color: #c00; padding-left: 3px; padding-RIGHT: 3px; font=
-family: Arial, Helvetica, sans-serif; color: #ffffff; font-size: 12px; pad=
ding-top: 0px"><b>FREE</b></span> domain &amp; <span style=3D"padding-botto=
m: 0px; background-color: #c00; padding-left: 3px; padding-RIGHT: 3px; font=
-family: Arial, Helvetica, sans-serif; color: #ffffff; font-size: 12px; pad=
ding-top: 0px"><b>FREE</b></span> mobile app with Company email. &nbsp;</di=
v></td><td><a href=3D'http://track.rediff.com/click?url=3D___http://busines=
semail.rediff.com/email-ids-for-companies-with-less-than-50-employees?sc_ci=
d=3Dsign-1-10-13___&cmp=3Dhost&lnk=3Dsign-1-10-13&nsrv1=3Dhost'><b>Know Mor=
e &gt;</b></a><!--  <in-put type=3D"button" cl-ass=3D"button" on-click=3D"p=
arent.location=3D&#39;http://track.rediff.com/click?url=3D___http://busines=
semail.rediff.com/company-email-hosting-services?sc_cid=3Dsignature-23-9-13=
___&amp;cmp=3Dsignature-23-9-13&amp;lnk=3Dmypagelogout&amp;nsrv1=3Dhost&#39=
;" value=3D"Know more &gt;"> </input>  --></td></tr></tbody></table>
<br><A HREF=3D"http://sigads.rediff.com/RealMedia/ads/click_nx.ads/www.redi=
ffmail.com/signatureline.htm@Middle?" target=3D"_blank"><IMG SRC=3D"http://=
sigads.rediff.com/RealMedia/ads/adstream_nx.ads/www.rediffmail.com/signatur=
eline.htm@Middle"></A><table cellpadding=3D"0" cellspacing=3D"0"><tbody><tr=
><td><div style=3D"font-family: Arial, Helvetica, sans-serif; font-size:14p=
x">Get your own <span style=3D"padding-bottom: 0px; background-color: #cc00=
00; padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica, s=
ans-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></=
span> website,  <span style=3D"padding-bottom: 0px; background-color: #c00;=
 padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica, sans=
-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></spa=
n> domain &amp; <span style=3D"padding-bottom: 0px; background-color: #c00;=
 padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Helvetica, sans=
-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>FREE</b></spa=
n> mobile app with Company email. &nbsp;</div></td><td><a href=3D"http://tr=
ack.rediff.com/click?url=3D___http://businessemail.rediff.com/email-ids-for=
-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13___&cmp=3Dhost&=
lnk=3Dsign-1-10-13&nsrv1=3Dhost" style=3D"font-family: Arial, Helvetica, sa=
ns-serif; color: #fff; font-size: 14px; color:#0000cc" target=3D"_blank"><b=
>Know More ></b></a><!-- <in-put type=3D"button" cl-ass=3D"button" on-click=
=3D"parent.location=3D&#39;http://track.rediff.com/click?url=3D___http://bu=
sinessemail.rediff.com/company-email-hosting-services?sc_cid=3Dsignature-23=
-9-13___&amp;cmp=3Dsignature-23-9-13&amp;lnk=3Dmypagelogout&amp;nsrv1=3Dhos=
t&#39;" value=3D"Know more &gt;"> </input> --></td></tr></tbody></table>

--=_12e366c44c4247fc48017fe05bfcd356--
