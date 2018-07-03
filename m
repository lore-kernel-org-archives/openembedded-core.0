Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7551878A4A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 12:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4675418249;
	Tue,  3 Jul 2018 14:01:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id d8qherkT8xdS; Tue,  3 Jul 2018 14:01:27 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0E262180D1;
	Tue,  3 Jul 2018 14:01:27 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFDDF1E08E;
	Tue,  3 Jul 2018 14:01:26 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3ECC1E056;
	Tue,  3 Jul 2018 14:01:26 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  3 Jul 2018 14:01:26 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id D79B72663;
	Tue,  3 Jul 2018 14:01:26 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id D06A69C0AD; Tue,  3 Jul 2018 14:01:26 +0200 (CEST)
Date: Tue, 3 Jul 2018 14:01:26 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20180703120126.2xrdx77jwcvvfn5b@axis.com>
Mail-Followup-To: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20180625092738.17962-1-olofjn@axis.com>
	<CANNYZj_kMAYH6=EcXM4ACwZhUp3qzzZdv9k6nev-v2oitWO6SQ@mail.gmail.com>
	<7693ed11-5b51-52f6-08f9-4e4f9b76fa90@windriver.com>
	<CANNYZj-MKfxraD-Ho6_Rej3R8dXSAWo3-JtZvQ4SanH183uWvA@mail.gmail.com>
	<CANNYZj_tSbtCh13rCUVYW0iqozQ65q+OufCgVGSW96J11wibEA@mail.gmail.com>
	<CANNYZj-8KYbZw-kcaAU0DQNd9=Lmy4eog75iY+6rtr2as5hEDA@mail.gmail.com>
	<20180629235346.qsg3sjhpsaqqqcxi@axis.com>
	<CANNYZj_t-68JsYddLZDu+8JMBCDggtNLKEEMFLpafDFfwn1WgQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_t-68JsYddLZDu+8JMBCDggtNLKEEMFLpafDFfwn1WgQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Tue, 03 Jul 2018 12:01:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18-06-30 08:37 +0200, Alexander Kanavin wrote:
> Ideally, "/" should've been replaced with rpmtsRootDir(ts), but ts is
> not accessible from the function, or from its parent, or parent
> parent. So yes, I concede this would be too invasive to pass that down
> the call stack. So if you can amend the above patch of mine with your
> change, commit message, and SOB, that should be best. These changes
> really belong together, as a custom fix for the oe build environment.

Thanks for the feedback, I just sent a v2 of the patch. Hope it
is in line with what you asked for.

-- 
olofjn

