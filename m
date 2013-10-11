Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 84ABD6CC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 14:35:49 +0000 (UTC)
Message-ID: <52580CC0.10808@communistcode.co.uk>
Date: Fri, 11 Oct 2013 15:35:44 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Setting root password
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2013 14:35:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

What is the best way to set the root password for an image during build
time?

I have come across this snippet:

ROOTFS_POSTPROCESS_COMMAND += " \
        sed 's%^root:[^:]*:%root:${PASSWD}:%' \
        < ${IMAGE_ROOTFS}/etc/shadow \
        > ${IMAGE_ROOTFS}/etc/shadow.new;\
        mv ${IMAGE_ROOTFS}/etc/shadow.new ${IMAGE_ROOTFS}/etc/shadow ;"

but it feels a bit hacky... is there no defined way to do this cleanly?

Cheers,
Jack.

