Return-Path: <denis@denix.org>
X-Greylist: delayed 3600 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Apr 2016 02:49:56 UTC
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6202C731C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 02:49:56 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5G00ERA52X7X70@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2016 20:49:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=pQ1NxvdBEWUWmppR-P0A:9
	a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 3917d889; Mon, 11 Apr 2016 01:49:46 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 68CA9161F8A; Sun,
	10 Apr 2016 21:49:45 -0400 (EDT)
Date: Sun, 10 Apr 2016 21:49:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Robert Yang <liezhi.yang@windriver.com>
Message-id: <20160411014945.GL16135@denix.org>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
	<20160410225130.GK16135@denix.org> <570AFBA4.40201@windriver.com>
MIME-version: 1.0
In-reply-to: <570AFBA4.40201@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] unique -dev package
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
X-List-Received-Date: Mon, 11 Apr 2016 02:49:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 11, 2016 at 09:19:32AM +0800, Robert Yang wrote:
> On 04/11/2016 06:51 AM, Denys Dmytriyenko wrote:
> >On Tue, Apr 07, 2015 at 05:58:13AM -0700, Robert Yang wrote:
> >>Hello,
> >>
> >>I think that one recipe should only have one -dev package, I'm not sure
> >>whether this is right or not, please feel free to give your comments, we
> >
> >I know it is already 1 year since this change. But I can't seem to find any
> >discussion or any explanation to why this change was required and what
> >specific problem it was supposed to fix. Please point me to a clear reasoning
> >of this change. Thanks.
> 
> There is only one source package, so there should be only one pack of header
> files, dev libs, and so on, and they should be placed in a uniq pkg.

Since you are using "should" twice in the same sentence, can you please point 
me to a ratified RFC?

-- 
Denys

