Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rnrf5-0003IO-Q6 for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 14:04:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JCub7C001796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 12:56:37 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00828-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 12:56:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JCuTSt001789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 12:56:31 GMT
Message-ID: <1326977788.2511.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 12:56:28 +0000
In-Reply-To: <09ab90b65169616911ae3811421b374158b6453d.1326976547.git.shane.wang@intel.com>
References: <cover.1326976547.git.shane.wang@intel.com>
	<09ab90b65169616911ae3811421b374158b6453d.1326976547.git.shane.wang@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] core-image-foo: add summary to each image bb file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2012 13:04:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Shane,

On Thu, 2012-01-19 at 20:38 +0800, Shane Wang wrote:
> Add SUMMARY to each image bb file according to poky reference manual for Hob2 use later.

I think this is good but shouldn't some of these be DESCRIPTIONs? The
difference is that summary should be a one line summary (~max 72 chars)
whilst DESCRIPTION can be multiple lines of text...

Cheers,

Richard




