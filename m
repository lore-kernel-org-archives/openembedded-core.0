Return-Path: <star@gmx.li>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id 90DFB60125
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 08:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1561969047;
	bh=UuRePCPn0Cm78z/2hi8xxt7JYTDVnGlZc8MHXA1ywjs=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=j/GSPanIFvEJE8OOzWmhni5Ci8ExcaeyvLR/Qg2S8A9xTVcVnQEpgpuRf5QVwl9N/
	ayjb0fSrcxBHp3oyxFBljxPJrkzFsujzDpe3bcwaV3q/BwLpQHyfBQ+OHe1DkwHcy9
	7OSLCTw4/b2PmqHykoqTFuQ79j5pRN1unk9E+JN0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [62.225.157.196] ([62.225.157.196]) by web-mail.gmx.net
	(3c-app-gmx-bs04.server.lan [172.19.170.53]) (via HTTP); Mon, 1 Jul 2019
	10:17:27 +0200
MIME-Version: 1.0
Message-ID: <trinity-3a6304bb-e764-4d32-8153-c59620778f0a-1561969047062@3c-app-gmx-bs04>
From: star@gmx.li
To: openembedded-core@lists.openembedded.org
Date: Mon, 1 Jul 2019 10:17:27 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:YCItuBnJN7rsoW/c6a64I1irUYrFq+Sj1ZOplXcdj9jQN2I1jqP/+LlAPuhVH6y0039eK
	QWTJS//txr8Nw1dyV2X/muwHYKieuQ46baxAH3tkgjxDCetK49OsRPYm8DDDlg4RAkO0gvnRrk8k
	ZfbgiJ0DwYktt1UfRwTZCqFASwr9z2XuNPIQ2gcn9vR5As+VZYr/NwNQWkGb10OsSMEWsXMzRlys
	MljwLXCybHCvTRPTP0Y49OeIMynbBeZgisAV0wEiFgbF+AHgAzvCsHJOK0P7pTk4jfXhYR13+H82
	Vc=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rqc3d5mQ5gg=:vWoZybhhpQocdDSEhvvlXi
	924nvtTImA4WtQU7GCxL+dlQ6vRg3SPSEI/m40U8Y4Q91/AzVK/jqtnX3HL1BoBLhEuZiBYrj
	48umt0xZ68MyrNPIDRNvgETJQssvMk742wpHT5qD5sxApyx36ct39hLKebsFtHHznwh5SXjXj
	V2hGN1wXLeAWC2KGIMSMWQ3SVtNrQheWYgRS6kAeeHiAJjctNgJS5mNhUAMY7F3zzT58Awqwr
	YhddQJcHyfGM7Dk9reWcLgOsdeGtB4nR7lZjkRAk6DtWysBRaX4r2VGVVKT+OneewFBQIrrfS
	o1UqWVIIDR5DCmEbygUeQSbtKnyIq07aA77mRdJazgsnB6nBL2PmiFUuRCnMHcJV2qknXiaQS
	nUN1IKOxfUssCmERqZn7vPhJBXQcPPpQUdxF7PdW44LQ2tgRV56RwDWmrPDY9pPbumy1XtjSH
	/5j4IZ7wiQ2svgS1XTbACWo/TuhH37n2X7EOOOhx1zrlzTc5XRA5a89JOVldZ+pmyN4nKIBuP
	rTafOHuwXi4NEYUDKYC0dW2XH8xtm3WgxtOPKT81X0OxN23MXjpdXkAiwnKNTXIgQWSqsHn/A
	3nHKj9/YpegVszaVEiJ10LVuehHFxibVKhGPfLfD+7htlyxeHshssENQ==
Subject: net-snmpd without PCI (Cannot open /proc/bus/pci)
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
X-List-Received-Date: Mon, 01 Jul 2019 08:17:27 -0000
Content-Type: text/plain; charset=UTF-8

I am using Yocto for generating my rootfs, including net-snmpd recipe from openembedded.
My ARM processor doesn't have a PCI bus. Do I have a chance to get rid of this message?
Does this attempt of probing PCI affect performance or is this message negligible at all?

The recipe has this line:
DEPENDS = "openssl libnl pciutils"

Thanks for your help.
Arno

