Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4363178548
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 11:38:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0GBc6Cq004478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 11:38:07 GMT
Message-ID: <1516102686.29722.267.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jan 2018 11:38:06 +0000
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Yocto Project, Spectre and Meltdown
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
X-List-Received-Date: Tue, 16 Jan 2018 11:38:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I just wanted to give people an update on where the project stands
with these issues.

We currently have three stable branches we're maintaining, rocko, pyro
and morty.

GCC:
====

Patches to support fixes have now made it into the upstream gcc master
branch. We'll be looking to port these patches to the default gcc
version in the stable releases and master. Version wise, the releases
contain:

master: 7.2
rocko: 7.2 6.3
pyro: 6.3 5.4
morty: 6.2 and 5.4

so we'll likely port to 7.2, 6.3 and 6.2.

If you need something to experiment with in the meantime, Juro did put
together:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jurob/gcc-patch_1

which is one of the older versions of the patchset. We have decided to
wait until something landed upstream due to the amount of discussion
around the patches before taking something to merge into master.


Kernel:
=======

There are a lot of patches around, some have made it into mainline,
some have been backported and some haven't made mainline yet. There are
reported stability issues on the stable branches and therefore we've
not pulled those in yet as they don't appear ready. As and when things
do make the stable trees, we'll pull them in and update the relevant
kernel versions.

There is a meta-intel experimental patch for 4.14 available:

http://git.yoctoproject.org/cgit.cgi/meta-intel-contrib/log/?h=clsulliv/clear-test
(also shows you to append to gcc to have the relevant gcc patch above
available)

Once there is a known good patchset, we'll look at filling in any
kernel version gaps for default kernel versions if there aren't
upstream patches/plans.


IA Microcode:
=============

There is an IA microcode update available in meta-intel:

http://git.yoctoproject.org/cgit.cgi/meta-intel/commit/?id=7969d8e442bdefd8036a334ca9d9ce133272399b


Webkit:
=======

The new webkit release which includes fixes related to this has already
been updated in master and the three stable releases (thanks Alex!).



If anyone knows of any other patches merged upstream to address related
issues please do let us know, I've tried to collate together here the
pieces I'm aware of. If there are other pieces of software that need
updates as a result of this, please also let me know.

Cheers,

Richard

