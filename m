Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C57A071E4C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 10:04:45 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w33A4iiA010992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 3 Apr 2018 11:04:45 +0100
Message-ID: <1522749884.11431.231.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 03 Apr 2018 11:04:44 +0100
In-Reply-To: <1522699721-2863-1-git-send-email-alejandr@xilinx.com>
References: <1522699721-2863-1-git-send-email-alejandr@xilinx.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] python3: Improve logging capabilities for do_create_manifest
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
X-List-Received-Date: Tue, 03 Apr 2018 10:04:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-04-02 at 13:08 -0700, Alejandro Enedino Hernandez
Samaniego wrote:
> Adds a couple of prints to get a nicer log, and creates a
> small summary or report after checking every module, it
> makes it more feasible for adoption, easier to debug why
> a module ended at a certain package and see how the
> manifest was created.
> 
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx
> .com>

Can you rebase against master please as this clashes with one of your
other changes which already merged!

Cheers,

Richard

