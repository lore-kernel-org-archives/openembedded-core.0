Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T3VVb-0000nT-4z
	for openembedded-core@openembedded.org; Mon, 20 Aug 2012 19:11:23 +0200
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 21E3B1F095;
	Mon, 20 Aug 2012 09:59:21 -0700 (PDT)
Message-ID: <50326CE8.6090206@windriver.com>
Date: Mon, 20 Aug 2012 09:59:20 -0700
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1345218791-28891-1-git-send-email-andy.ross@windriver.com>
	<1345218791-28891-2-git-send-email-andy.ross@windriver.com>
	<1345218791-28891-3-git-send-email-andy.ross@windriver.com>
	<1345370811.27428.86.camel@ted>
In-Reply-To: <1345370811.27428.86.camel@ted>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 2/2] libtool: normalize link paths before considering for RPATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 17:11:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2012 03:06 AM, Richard Purdie wrote:
> On Fri, 2012-08-17 at 08:53 -0700, Andy Ross wrote:
>> ++                libdir_norm=`echo $libdir \
>> ++                  | sed 's/\/\+\.\(\/\+\|$\)/\//g' \
>> ++                  | sed 's/[^\/]\+\/\+\.\.\(\/\+\|$\)//g' \
>> ++                  | sed 's/\/\+/\//g' \
>> ++                  | sed 's/\(.\)\/$/\1/g'`
>
> Can't we use func_norm_abspath here?

I have to admit I got a little confused reading that code (not that my
sed mess is significantly better, but at least I trust it because I
wrote it); but it looks to me like it's an abspath implementation on
the host filesystem (not the use of `pwd` in a few places).  That will
work for pruning in this case, since the problem case is already an
absolute path to a host directory.  But I don't see how it won't in
principle break things by expanding host paths.

Andy


