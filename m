Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A031D784C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:41:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0HGfvkI030745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 17 Jan 2018 16:41:58 GMT
Message-ID: <1516207317.29722.286.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 16:41:57 +0000
In-Reply-To: <2aef8a4f-9d0b-ab44-02ea-e1ad8a4e1810@linux.intel.com>
References: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1516202745-18231-3-git-send-email-richard.purdie@linuxfoundation.org>
	<2aef8a4f-9d0b-ab44-02ea-e1ad8a4e1810@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/4] lttng-modules: upgrade 2.9.5 -> 2.10.4
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
X-List-Received-Date: Wed, 17 Jan 2018 16:42:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-17 at 17:23 +0200, Alexander Kanavin wrote:
> On 01/17/2018 05:25 PM, Richard Purdie wrote:
> > 
> > LICENSE file contains a list of files and addtional files were
> > added to
> > the list, license was unchanged.
> I'd like to standardize this to a tag, and so the license change
> text 
> mentions a tag. Something like Otavio did:
> 
> License-checksum-change: added new contributors
> 
> The idea is to make the automatic check for this more reliable so we 
> don't have to ask contributors to explain the license changes all the
> time.

I'd suggest we use the form:

License-Change: Copyright years updates

which is shorter and is more similar in style to Upstream-Status: for
example...

Cheers,

Richard


