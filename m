Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Ty0dv-0001Vf-CQ
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 14:45:43 +0100
Received: (qmail 23721 invoked by uid 1003); 23 Jan 2013 13:29:59 -0000
Received: from unknown (HELO ?192.168.1.107?)
	(philip@opensdr.com@96.240.188.95)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	23 Jan 2013 13:29:59 -0000
Message-ID: <50FFE5D6.8020207@balister.org>
Date: Wed, 23 Jan 2013 08:29:58 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.5
Subject: UHD (from meta-oe) failure when rpm packaging selected
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 13:45:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The recipe builds fine with ipk only, but when you add rpm packaging the
recipe fails to build with:

so.5 libncurses.so.5
Processing files: uhd-dbg-3.5.0-r3.0.armv7a_vfp_neon
Finding  Provides:
/home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.provides
Finding  Requires:
/home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.requires
Processing files: uhd-dev-3.5.0-r3.0.armv7a_vfp_neon
Finding  Provides:
/home/balister/src/oe-core/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/uhd/1_3.5.0-r3.0/uhd.provides
error: line 719: Illegal char '-' in EVR:

error: Failed to find Provides:


RPM build errors:
    line 719: Illegal char '-' in EVR:

    Failed to find Provides:
DEBUG: Python function do_package_rpm finished

Any suggestions?

Philip


