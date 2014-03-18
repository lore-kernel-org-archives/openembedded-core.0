Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id C867F6F8F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 12:26:55 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so5317208eei.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 05:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=IionRd3G3ECZKWqNMp0PoU4SvWCZ7LI97DFywB7jC9I=;
	b=KkoWXgF00hVpowXYQ0SkyXE7MFKRuK2cb0BFba55lvcadMtpOuxNQ3Yu26tS9wHEW7
	cvSYUGQAv8Cffqu+jiJ9NqLnQIRFvadrbM98ltTH+RSBzIsaZHkjcYcSvdknqq1Jr6ha
	iPIWdSsYLCtz6V99wplam8yboIjnjtgHf9lBmowxKVePgRjE+yKjAsX4WN0yXazKnS8K
	y7BP9BbcbJpqR8DSB3XxlaCZZO+79LRokz8+I26U+IQwt4w68DysTk+ClA2mOdYPuH7A
	fzZAij2cwyKCL1cEJzHTrDbpweUHfMr+TG2GXZBZEsGMzjqd/CH8HsTzhgR2JnIqWJly
	JK/w==
X-Gm-Message-State: ALoCoQn62dTttsXw4u8eFg1omVac+JPPUWcLaaagA2MOvwByXHWmNmHBt/xVqKJH2RzI1FbJi5hr
X-Received: by 10.14.213.135 with SMTP id a7mr29851077eep.57.1395145615866;
	Tue, 18 Mar 2014 05:26:55 -0700 (PDT)
Received: from ?IPv6:2001:610:612::e437:a208:16de:e1a5?
	([2001:610:612:0:e437:a208:16de:e1a5])
	by mx.google.com with ESMTPSA id o4sm14443530eef.20.2014.03.18.05.26.54
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Mar 2014 05:26:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
Date: Tue, 18 Mar 2014 13:29:48 +0100
Message-Id: <23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
To: Chase Maupin <Chase.Maupin@ti.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Tue, 18 Mar 2014 12:27:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mrt. 2014, om 12:56 heeft Chase Maupin <Chase.Maupin@ti.com> het =
volgende geschreven:

> * The power management test utilities from Linaro can be used
>  to test multiple PM features such as cpufreq, cpuidle, thermal
>  control and suspend operations.
> * These utilities are not platform specific and can be used by
>  a broader base of users.

PN should me 'pm-qa' or 'pm-qa-utils'. And it would fit better in =
meta-oe since it's not 'core' enough for oe-core.

>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
> .../linaro-pm-qa/linaro-pm-qa-utils_git.bb         |   63 =
++++++++++++++++++++
> 1 file changed, 63 insertions(+)
> create mode 100644 =
meta/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
>=20
> diff --git =
a/meta/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb =
b/meta/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
> new file mode 100644
> index 0000000..610f3a7
> --- /dev/null
> +++ b/meta/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
> @@ -0,0 +1,63 @@
> +DESCRIPTION =3D "Utilities from Linaro for testing Power Management"
> +HOMEPAGE =3D =
"https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite=
/PmQa"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> +
> +PV =3D "0.4.4"
> +
> +BRANCH ?=3D "master"
> +SRCREV =3D "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
> +
> +SRC_URI =3D =
"git://git.linaro.org/tools/pm-qa.git;protocol=3Dgit;branch=3D${BRANCH}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +CFLAGS +=3D "-pthread"
> +
> +do_compile () {
> +    # Find all the .c files in this project and build them.
> +    for x in `find . -name "*.c"`
> +    do
> +        util=3D`echo ${x} | sed s/.c$//`
> +        oe_runmake ${util}
> +    done
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -d ${D}${bindir}/linaro-pm-qa-include
> +
> +    # Install the compiled binaries the were built in the previous =
step
> +    for x in `find . -name "*.c"`
> +    do
> +        util=3D`echo ${x} | sed s/.c$//`
> +        util_basename=3D`basename ${util}`
> +        install -m 0755 ${util} ${D}${bindir}/${util_basename}
> +    done
> +
> +    # Install the helper scripts in the include directory
> +    for script in `find . -name "*.sh" | grep include`
> +    do
> +        # Remove hardcoded relative paths
> +        sed -i -e 's#..\/utils\/##' ${script}
> +
> +        script_basename=3D`basename ${script}`
> +        install -m 0755 $script =
${D}${bindir}/linaro-pm-qa-include/${script_basename}
> +    done
> +
> +    # Install the shell scripts NOT in the include directory since =
those
> +    # will be installed elsewhere
> +    for script in `find . -name "*.sh" | grep -v include`
> +    do
> +        # if the script includes any helper scripts from the include
> +        # directory then change the include path to the absolute path
> +        # to reflect the install location of the helper scripts.
> +        sed -i -e "s#source ../include#source =
${bindir}/linaro-pm-qa-include#g" ${script}
> +        # Remove hardcoded relative paths
> +        sed -i -e 's#..\/utils\/##' ${script}
> +
> +        script_basename=3D`basename ${script}`
> +        install -m 0755 $script ${D}${bindir}/${script_basename}
> +    done
> +}
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


