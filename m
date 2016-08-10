Return-Path: <jianxun.zhang@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 718557709E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 19:15:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 10 Aug 2016 12:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,501,1464678000"; d="scan'208";a="863231035"
Received: from jzhang80-mac02.jf.intel.com ([10.24.5.7])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 12:15:33 -0700
From: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Message-Id: <62923916-C590-43AC-B0CC-0A7F54E7F45E@linux.intel.com>
Date: Wed, 10 Aug 2016 12:15:33 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Subject: REPLACEMENT: Gummiboot to Systemd-boot
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
X-List-Received-Date: Wed, 10 Aug 2016 19:15:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear All,
The gummiboot has been merged into systemd project and is =
=E2=80=9Csystemd-boot=E2=80=9D now. The project at the location referred =
in recipes is obsoleted and not maintained any more. The systemd-boot =
provides same functionality of gummiboot from my understanding and test. =
Seeing no much benefit to keep gummiboot, we suggest to replace it with =
systemd-boot in OE.

Please refer to the below list for a proposed plan and what=E2=80=99s =
done on systemd-boot so far.

() Build systemd-boot without dependency on the rest of systemd (merged =
in OE master)

() wic plugin & wks for systemd-boot (merged in OE master)

() New test cases by QA (done)

() New test target by QA (done)

() Overall document update for the replacement (patch in bz9707, =
reviewed)

() Propose the plan (this letter)

() If you have any work derived from gummiboot like patches, scripts, =
recipes or bbclasses in your layers, you will have to migrate such work =
onto systemd-boot accordingly. If you find any features gummiboot =
supports but not available on systemd-boot yet, please let us know and =
we will re-evaluate the situation before taking the next step.

() Purge all implementation around gummiboot in OE after, say, 30 days. =
All gummiboot functions are still available in this period until =
cleaning up starts. Feel free to suggest us another time line if you =
need. Change in documentation could happen prior to this step.

To enable systemd-boot, use the same interface for gummiboot and other =
EFI bootloaders:
EFI_PROVIDER =3D "systemd-boot"

We appreciate help from groups (BSP dev, QA, documentation...) in this =
task.

Any feedback is welcome.

Thanks


