Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6E917785B1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 13:23:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA9DNTbN015434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 9 Nov 2017 13:23:31 GMT
Message-ID: <1510233809.3952.36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Nov 2017 13:23:29 +0000
In-Reply-To: <1510232672.22094.31.camel@intel.com>
References: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1510228551-11516-2-git-send-email-richard.purdie@linuxfoundation.org>
	<1510232672.22094.31.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/7] oeqa/runqemu: Only show stdout/stderr upon test failure
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
X-List-Received-Date: Thu, 09 Nov 2017 13:23:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-11-09 at 14:04 +0100, Patrick Ohly wrote:
> On Thu, 2017-11-09 at 11:55 +0000, Richard Purdie wrote:
> > 
> > +    # We only want to print runqemu stdout/stderr if there is a
> > test
> > case failure
> > +    buffer = True
> Does the value matter? The other code only seems to check for the
> presence of the "buffer" attribute.

True, I think I should tweak that other code so it passes on the
value...

Cheers,

Richard

