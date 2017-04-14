Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EAA6977C22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 17:52:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3EHqrKc017399
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Apr 2017 10:52:53 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Apr 2017 10:52:52 -0700
To: <openembedded-core@lists.openembedded.org>
References: <655290B7709079438B7932553958E60D16D199CA@ESS-EX01.essvote.corp.local>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <7b44de40-fe30-474b-620f-4efec4bf5cac@windriver.com>
Date: Fri, 14 Apr 2017 12:52:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <655290B7709079438B7932553958E60D16D199CA@ESS-EX01.essvote.corp.local>
Subject: Re: Handling of users in multiple recipes.
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
X-List-Received-Date: Fri, 14 Apr 2017 17:52:53 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/14/17 11:49 AM, Davis, Michael wrote:
> I have a user that is added in a recipe using inherit useradd.
> 
> Previously in Morty I was able to include that recipe as a dependency to other
> recipes and chown files to that user during do_install.
> 
> In checking at master in prep for 2.3 I noticed those recipes no longer work
> stating the user is invalid.
> 

A patch for this issue was added yesterday to oe-core.  I'm not sure if it has
been merged to master, but should be soon if it has not already been.

Search the list archives for "base-passwd/useradd: Various improvements to
useradd with RSS".

--Mark

> 
> Is there a new mechanism in place to handle this use case or am I going to have
> to find some sort of other work around?
> 
>  
> 
> Thanks,
> 
> Mike
> 
>  
> 
>  
> 
>  
> 
> 
> 


