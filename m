Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 50EF777FD2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 23:12:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4INCbp5030786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 19 May 2017 00:12:38 +0100
Message-ID: <1495149157.27342.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Lamego <jose.a.lamego@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 19 May 2017 00:12:37 +0100
In-Reply-To: <1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 19 May 2017 00:12:38 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] conf/bitbake.conf: include ed in hosttools
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
X-List-Received-Date: Thu, 18 May 2017 23:12:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-05-18 at 17:28 -0500, Jose Lamego wrote:
> Some recipes build fail due to missing ed command.
> 
> This change includes ed to the hosttools required to
> run builds with oe-core.
> 
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> tel.com>

We really don't want to add ed here. Which recipes are failing and why
do we need ed to build them? 

Cheers,

Richard



