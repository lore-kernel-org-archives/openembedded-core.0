Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 408C371C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0CLg3P0030824; Thu, 12 Jan 2017 21:42:03 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u_Mhipc3sdqh; Thu, 12 Jan 2017 21:42:03 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0CLg12V030818
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Jan 2017 21:42:03 GMT
Message-ID: <1484257321.4367.238.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Juro Bystricky <juro.bystricky@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 21:42:01 +0000
In-Reply-To: <1484249086-36492-1-git-send-email-juro.bystricky@intel.com>
References: <1484249086-36492-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: jurobystricky@hotmail.com
Subject: Re: [PATCH] sanity.bbclass: Improved error message
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
X-List-Received-Date: Thu, 12 Jan 2017 21:42:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-01-12 at 11:24 -0800, Juro Bystricky wrote:
> When a non-existing MACHINE is specified, sanity check issues
> the following message:
> 
>     Please set a valid MACHINE in your local.conf or environment
> 
> However, MACHINE can also be set in multiconfig .conf file(s).
> Hence we may have several different MACHINE settings within one
> (multiconfig) build, so the present error message is fairly
> ambiguous.
> 
> This patch remedies this by explicitly naming the offending MACHINE
> and
> adding conf/multiconfig/*.conf to the list of places where this
> erroneous
> MACHINE definition could have originated.
> 
>     Invalid MACHINE=xyz. Please set a valid MACHINE in your
> local.conf, conf/multiconfig/*.conf or environment

Can we change this to:

"MACHINE=xyz is invalid. Please set a valid MACHINE in your local.conf,
environment or other configuration file."

I don't want to have to list all the possible places you could set
MACHINE.

Cheers,

Richard

