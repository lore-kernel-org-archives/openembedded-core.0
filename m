Return-Path: <andy.ross@windriver.com>
Received: from plausible.org (li44-10.members.linode.com [72.14.181.10])
	by mail.openembedded.org (Postfix) with ESMTP id 40FA76AF25
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 19:47:38 +0000 (UTC)
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy)
	by plausible.org (Postfix) with ESMTPSA id B523B218FB2;
	Mon,  8 Jul 2013 12:47:37 -0700 (PDT)
Message-ID: <51DB1755.8070309@windriver.com>
Date: Mon, 08 Jul 2013 12:47:33 -0700
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1373267292.git.jackie.huang@windriver.com>
	<f3947aac42370ea5f114852fd677ff1689a9b7ca.1373267292.git.jackie.huang@windriver.com>
	<51DB148F.9020702@linux.intel.com>
In-Reply-To: <51DB148F.9020702@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] udev: add runtime dependency on blkid
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
X-List-Received-Date: Mon, 08 Jul 2013 19:47:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 07/08/2013 12:35 PM, Saul Wold wrote:
> On 07/08/2013 12:10 AM, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> udev requires blkid, but this wasn't explicit.  Note that the
>> dependency is on util-linux specifically, the one from e2fsprogs
>> won't work.
>>
> Doesn't udev use an internal builtin-blkid?  Or is the configure finding 
> that we have util-linux and using it instead of the built-in?

I think (I'm really stale here) I wrote that patch against a udev
version prior to the addition of the builtin.  And in any case didn't
I see that blkid got yanked from the e2fsprogs package at some point
anyway?  Pretty sure this is not needed in upstream oe-core.  Not sure
if it ever was.

Andy


