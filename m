Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A736D6067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 20:06:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6MK6Wks018799
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 13:06:32 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 22 Jul 2016 13:06:31 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1469211845-21125-1-git-send-email-Liam.Howlett@WindRiver.com>
	<CAJTo0LbM1Jvcq59TPNHnU6NwOBwp2yfVEPE1KNMx2bw4YDfR-A@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <eed39ebb-55f2-5697-e839-46e2c9de8c69@windriver.com>
Date: Fri, 22 Jul 2016 15:06:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbM1Jvcq59TPNHnU6NwOBwp2yfVEPE1KNMx2bw4YDfR-A@mail.gmail.com>
Subject: Re: [PATCH] wget: Add --ssh-askpass support
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
X-List-Received-Date: Fri, 22 Jul 2016 20:06:34 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 7/22/16 2:21 PM, Burton, Ross wrote:
> 
> On 22 July 2016 at 19:24, Liam R. Howlett <Liam.Howlett@windriver.com
> <mailto:Liam.Howlett@windriver.com>> wrote:
> 
>     wget: Add --ssh-askpass support
> 
>     This adds the --ssh-askpass option which is disabled by default.
> 
>     --ssh-askpass will request the username and password for a given URL by
>     executing the external program pointed to by the environment variable
>     SSH_ASKPASS.  If the environment variable is not set, an error is
>     returned.  If an error occurs requesting the username or password, wget
>     will exit.
> 
>     Upstream-Status: Pending
> 
> 
> That's a fairly big patch to be carrying and forward porting everytime they
> release, have you sent this upstream?

That is actually one of the problem we're having.  Trying to figure out "where"
upstream actually is.. thus the 'pending'.

We suspect the right list is the 'bug-wget' list, even though this isn't a new
bug -- bug a feature.

--Mark

> Ross
> 
> 


