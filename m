Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id D933C76710
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 00:06:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9T06HWH015297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 17:06:17 -0700
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Wed, 28 Oct 2015 17:06:16 -0700
To: <openembedded-core@lists.openembedded.org>
References: <56315EE5.3070100@balister.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <563162F8.3050102@windriver.com>
Date: Wed, 28 Oct 2015 19:06:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56315EE5.3070100@balister.org>
Subject: Re: Native patch appears broken on Fedora 21
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
X-List-Received-Date: Thu, 29 Oct 2015 00:06:19 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/28/15 6:48 PM, Philip Balister wrote:
> I've been chasing an annoying build failure in a clients u-boot recipe.
> 
> One of the patches adds an executable python script to the u-boot tools
> directory and runs it as part of the build.
> 
> With recent master on a Fedora 20 system, it works.
> 
> Recent master on Fedora 21, the script does not end up marked as
> executable so build fails.
> 
> After much thinking and poking and remembering how this is supposed to
> work I get the brilliant idea to copy the patch binary from the F20
> machine to the F21 machine. Problem goes away.
> 
> Something is weird here, I can't believe this is the only patch in the
> system that marks a file executable and runs it, but maybe it is.

Most of the time I patch things in, and then run a chmod to ensure it's
executable.  Then I'm sure it will work.  (Patch doing mode changes is 'fairly
new'...)

--Mark

> Versions of patch.
> 
> F20 GNU patch 2.7.1
> F21 GNU patch 2.7.5
> 
> Looking at the patch changelog didn't help.
> 
> Anyone have any ideas what to do about this?
> 
> Philip
> 


