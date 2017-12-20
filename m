Return-Path: <m.hoffmann@cartelsol.com>
X-Greylist: delayed 11788 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Dec 2017 00:51:10 UTC
Received: from ms-10.1blu.de (ms-10.1blu.de [178.254.4.101])
	by mail.openembedded.org (Postfix) with ESMTP id 09AB178679
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 00:51:10 +0000 (UTC)
Received: from [80.153.115.6] (helo=[10.17.123.139])
	by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2) (envelope-from <m.hoffmann@cartelsol.com>)
	id 1eRm0h-00035B-TF for openembedded-core@lists.openembedded.org;
	Wed, 20 Dec 2017 22:34:43 +0100
To: OE-core <openembedded-core@lists.openembedded.org>
From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Message-ID: <b4cc53ff-9653-a90e-92de-1e59f9dbbce8@cartelsol.com>
Date: Wed, 20 Dec 2017 22:34:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
X-Con-Id: 239684
X-Con-U: 0-mhoffmann
X-Originating-IP: 80.153.115.6
Subject: systemd PACKAGECONFIG = "lz4" leads to broken init
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
X-List-Received-Date: Thu, 21 Dec 2017 00:51:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Dear all,

when building poky with

PACKAGECONFIG_append_pn-systemd = "lz4"

in local.conf and
DISTRO_FEATURES_append = " systemd"
VIRTUAL-RUNTIME_init_manager = "systemd"
in bblayers.conf, init (=systemd) can't start because of a missing lz4
library:

/sbin/init: error while loading shared libraries: liblz4.so.1: cannot
open shared object file: No such file or directory

Best wishes,
Marcus Hoffmann

