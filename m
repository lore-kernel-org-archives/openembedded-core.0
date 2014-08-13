Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7CC60EFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 13:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7DDHKER013756; Wed, 13 Aug 2014 14:17:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VVfW518UF2bE; Wed, 13 Aug 2014 14:17:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7DDHFZg013751
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 13 Aug 2014 14:17:17 +0100
Message-ID: <1407935836.22187.68.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Fleming <matt@console-pimps.org>
Date: Wed, 13 Aug 2014 14:17:16 +0100
In-Reply-To: <1407935023-9284-2-git-send-email-matt@console-pimps.org>
References: <1407935023-9284-1-git-send-email-matt@console-pimps.org>
	<1407935023-9284-2-git-send-email-matt@console-pimps.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Raymond Danks <ray.danks@se-eng.com>, Mihai Prica <mihai.prica@intel.com>,
	Matt Fleming <matt.fleming@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] recipes-extended: Add iasl recipe
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
X-List-Received-Date: Wed, 13 Aug 2014 13:17:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-08-13 at 14:03 +0100, Matt Fleming wrote:
>+NATIVE_INSTALL_WORKS = "1"
> +BBCLASSEXTEND = "native"

Please remove the NATIVE_INSTALL_WORKS, you don't need it!

You're making me feel old, I remember why that was added (by me iirc),
what it did and also removing it. Its never been needed with OE-Core and
if that is any any modern layers, it should be removed.

Cheers,

Richard


