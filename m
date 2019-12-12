Return-Path: <prvs=242d32312=Richard.Leitner@skidata.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Dec 2019 11:08:00 UTC
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id A71847F798
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1576148882; x=1607684882;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=3lx42krs39BVZX+dMPZRJsg1yDocgIH1DummSDvgtE0=;
	b=BHc1y0mozvK+vMnUlO9JhkKlhrRFL5laDgbFxE7fk6qD69HERgfLvvmi
	oMKyg/38kj5hCTRSqN8UdZI6kY6vdcYdJm7hvULigB6yjwKwLS77SSroq
	v27lCli51WS8C+sXB5dL9hO2y8V8ull7iiyqjrx17bWod4Xm1V6YOu7c3
	ZoxjAqfxK7b3irrU2itB+Z8A3l76mpF4/GgcCsJmZleHavlB2ZvOpiC0I
	nKuArpxwRvVoOgHU935UtJ6MmFdy5fn+44ZK6cgstwQEEz0I15jXjXBJb
	M6xOv+aL864XQM6qBqKIfozBNXovz0k6WP3VQOHeQQhRHkexLCLpq/TyM A==;
IronPort-SDR: FoMWbg5PoiihfJwfwZT+JsYS2Y1L7iVV9UAY4q2TxZ2Jfdhhurl00epeIypGpPglkwU4vTCMye
	ucXZn5v7nLpC8Om1tOhrA3QA2DfS6s6wR1R30swDgG+rTAo58Ys3kQxNfRI07Rb/BfB+nZ/tQ2
	FtVNJDtEg7124MoGKxKQKi8CetrkfWXxHrs6OIwpW2Key4Tw8XdMzWPqjPN6UQxfd2iLl7D59i
	fSCMInvOUd+WENjADbURUY8/i9Coq2E8iOSuIG8lwqhscd0Sd582rVHX/AuMwl4+msvyDmEE74
	BI0=
X-IronPort-AV: E=Sophos;i="5.69,305,1571695200"; d="scan'208";a="21471614"
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20191207072208.2773273-1-raj.khem@gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <a1e5a5f0-f27d-572a-c26f-1061d68aa09a@skidata.com>
Date: Thu, 12 Dec 2019 12:00:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191207072208.2773273-1-raj.khem@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: kbd: avoid vlock conflict with busybox
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
X-List-Received-Date: Thu, 12 Dec 2019 11:08:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/12/2019 08:22, Khem Raj wrote:
> busybox as well as vlock utility from meta-oe provides vlock utility
> which can conflict when with kbd if pam is a enabled distro_feature
> 
> Fixes image build errors
> 
> update-alternatives: Error: not linking <rootfs>/usr/bin/vlock to /bin/busybox.suid since <rootfs>/usr/bin/vlock exists and is not a link
> 
> ERROR: yoe-qt5-wayland-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
> then please place them into pkg_postinst_ontarget_${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Tested-by: Richard Leitner <richard.leitner@skidata.com>

