Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A3C326FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 15:58:29 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1EFwRgx026292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 14 Feb 2018 15:58:28 GMT
Message-ID: <1518623907.24236.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, robert_joslyn@selinc.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Feb 2018 15:58:27 +0000
In-Reply-To: <00ccda06-5caf-0aad-9df8-df46a8b40a9f@gmail.com>
References: <OFDC897003.15BD668A-ON88258232.006ED4D2-88258232.00742260@selinc.com>
	<00ccda06-5caf-0aad-9df8-df46a8b40a9f@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: Backport OpenSSL 1.0.2n
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
X-List-Received-Date: Wed, 14 Feb 2018 15:58:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-02-13 at 08:27 -0800, akuster808 wrote:
> 
> On 02/12/2018 01:08 PM, robert_joslyn@selinc.com wrote:
> > 
> > I'm working with the pyro release, and noticed that it's still
> > using 
> > openssl 1.0.2k. The latest version in the 1.0.2 series is 1.0.2n,
> > which is 
> > already available on master. Is there a reason that the newer
> > version 
> > hasn't made it back to pyro (or rocko, which is on 1.0.2m)? 
> openssl 1.1 was added and the openssl files got restructured making
> simple cherry-picking not an option for older releases.
> 
> 1.0.2n hit master 7 days ago, sorry for the delay.
> 
> 1.0.2n is now in stable/rocko-next and will migrate to rocko when
> appropriate.

It is? Not pushed maybe?

Cheers,

Richard

