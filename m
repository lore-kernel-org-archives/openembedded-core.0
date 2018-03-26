Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 788C07838D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 13:36:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2QDahWE026836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 26 Mar 2018 14:36:46 +0100
Message-ID: <1522071403.11431.62.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Victor Kamensky
	<kamensky@cisco.com>
Date: Mon, 26 Mar 2018 14:36:43 +0100
In-Reply-To: <CAJTo0LY4JsGtTM1a==RQiRaemZ3__LpbBmQkBOLBi_+gJfBmxg@mail.gmail.com>
References: <1522042927-29046-1-git-send-email-kamensky@cisco.com>
	<CAJTo0LY4JsGtTM1a==RQiRaemZ3__LpbBmQkBOLBi_+gJfBmxg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: fix qemuarm64 intermediate kernel hang in raid6_select_algo func
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
X-List-Received-Date: Mon, 26 Mar 2018 13:37:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-03-26 at 11:31 +0100, Burton, Ross wrote:
> An early winner of Patch of the Day in my books.

Indeed, getting this one fixed is great as it has been messing up a lot
of builds, thanks!

Cheers,

Richard

