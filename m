Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8856773AC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 17:22:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2BHMpkX021996
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 10:22:51 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Wed, 11 Mar 2015 10:22:50 -0700
Message-ID: <550079EA.7030500@windriver.com>
Date: Wed, 11 Mar 2015 12:22:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.11.1503111228420.5897@localhost>
In-Reply-To: <alpine.LFD.2.11.1503111228420.5897@localhost>
Subject: Re: how many ways to delete/de-activate a recipe's task?
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
X-List-Received-Date: Wed, 11 Mar 2015 17:22:50 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/11/15 11:30 AM, Robert P. J. Day wrote:
> 
>   i recall that richard purdie might have explained this once but i
> have no idea where that post is and i need to add something to it,
> anyway ... how many ways are there to "delete" a task from a recipe,
> and what are the differences?
> 
>   so far, i've seen:
> 
> 1) bitbake supports a "deltask" directive

The task and all it's dependencies go away.  So anything dependent on it and the
things it depends on, are no longer dependent.

> 2) you can use the [noexec] task flag

The task and it's dependencies remain, but nothing is executed.

> 3) i've also seen redefining the task with a no-op ":" command

The task is executed and does nothing.  (I believe this dumps a stamp file and
the noexec does not.. but I may be wrong.)

--Mark

>   so what are the differences, and when would someone use one over the
> others? thanks.
> 
> rday
> 


