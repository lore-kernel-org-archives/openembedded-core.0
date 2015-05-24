Return-Path: <vm.rod25@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 15A2A70331
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 May 2015 12:58:53 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so20280673igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 May 2015 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=b1A98pLE9UVASxTG1r06oLRYmqqmDEKuKegUBvlZTko=;
	b=O+71TyGrUrXzvmXah01tWKfVT1nZdh3iei24YY14FQN6cL8RVqryRa1QVesEoLi8Z0
	byrvUUFs/VcD94CqTjiOJrsnVontRbyxovIhtLHSKSJqtSJMRLHdKvrssm5lWY7B+xjD
	JuFH1fUUcLGBo1bI1YhlshDL7+5oz0821PDXulm1fIxFjA+BU3Q9gflBFbfNH8SJFV2X
	MfbOqtur7rM0OLjMoD4Jw5wH0VvgohqZgxnbMKvREkqZjRs2bJJZlCKiui8BVi3EO3GH
	wd7zWhAINMTd36UV42Ib+UbuEXcwP1xe+GygerBkBijtFtm0sWXIyA8rXgKfYatoDcjT
	FZDg==
MIME-Version: 1.0
X-Received: by 10.42.76.146 with SMTP id e18mr20257648ick.42.1432472334814;
	Sun, 24 May 2015 05:58:54 -0700 (PDT)
Received: by 10.50.141.228 with HTTP; Sun, 24 May 2015 05:58:54 -0700 (PDT)
Date: Sun, 24 May 2015 07:58:54 -0500
Message-ID: <CAK5mtexc_ZOPST3z77xCNEgKnu3o57LT2X9wq_zD4RV4nqf+AQ@mail.gmail.com>
From: Victor Rodriguez <vm.rod25@gmail.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Subject: Unable to change binary names in do_install_append
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
X-List-Received-Date: Sun, 24 May 2015 12:58:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi team

After a successful build I have the binaries I need but with the
prefix i586-poky-linux

I tried to change their names with this:

do_install_append () {
    mv ${D}${bindir}/i586-poky-linux-hydra_nameserver
${D}${bindir}/hydra_nameserver
    mv ${D}${bindir}/i586-poky-linux-hydra_persist  ${D}${bindir}/hydra_persist
    mv ${D}${bindir}/i586-poky-linux-hydra_pmi_proxy
${D}${bindir}/hydra_pmi_proxy
    mv ${D}${bindir}/i586-poky-linux-mpiexec ${D}${bindir}/mpiexec
    mv ${D}${bindir}/i586-poky-linux-mpiexec.hydra ${D}${bindir}/mpiexec.hydra
    mv ${D}${bindir}/i586-poky-linux-mpirun ${D}${bindir}/mpirun
}

Despite the fact that the rpm is deploying fine:

%files
%defattr(-,-,-,-)
%dir "/usr"
%dir "/usr/bin"
%dir "/usr/lib"
"/usr/bin/mpicxx"
"/usr/bin/mpiexec.hydra"
"/usr/bin/mpic++"
"/usr/bin/mpiexec"
"/usr/bin/hydra_persist"
"/usr/bin/mpivars"
"/usr/bin/parkill"
"/usr/bin/hydra_nameserver"
"/usr/bin/hydra_pmi_proxy"
"/usr/bin/mpichversion"
"/usr/bin/mpicc"
"/usr/bin/mpirun"
"/usr/lib/libmpi.so.12"
"/usr/lib/libmpicxx.so.12.0.1"
"/usr/lib/libmpicxx.so.12"
"/usr/lib/libmpi.so.12.0.1"



I can not run the binary ( is not in the PATH ) and even "ls
/us/bin/<binary>" is not working :(

Meanwhile I will reset the patch and adapt  the benchmark I need to
run to these names

I might be doing something wrong .. so all the help is more than welcome

Best regards

Victor Rodriguez

