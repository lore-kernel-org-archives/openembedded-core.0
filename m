Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id A56B56E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 15:37:58 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so46075049pad.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 08:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=qowP41pYhvu3poaREqXJ4TyNZeHsNwQm0oWu/JXQ2Tc=;
	b=X7ZcQLr8tuzVUfPIwfj1PReFimLtBEYesfjbGvC+PdlWQdr1yBPSbj0vlVdgz285yn
	OHDzPvWA1RDXHqQjqTWOC9hoI1gZ0oF5r3XQLx5shQ70iXqHwjzW5jkrOBXamseQikEu
	gXxqa7xDx0+BPuyGGpv2/Ywu+OI1KNdOlSl41WGBsHlu58tvfLPBit1bd4l3+rMD2VsW
	zPfvOqfk/6K8pAaNDZY3JZXaIA5Tb2JrojkT+B5Z0bpdEgqF/STmdnZLtKE6r0g/m2a7
	n4Ls2UQkRKqcD3EMg4aeNMbKqgNQKtxY7oYY1e6OGXg4q/XNqXC8q6h7HD/sA4TglFga
	nlHA==
X-Received: by 10.66.253.129 with SMTP id aa1mr74318583pad.24.1441899478520;
	Thu, 10 Sep 2015 08:37:58 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:5888:bc0f:f0c6:30a3?
	([2601:202:4000:1239:5888:bc0f:f0c6:30a3])
	by smtp.googlemail.com with ESMTPSA id
	ki3sm12732124pbc.9.2015.09.10.08.37.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Sep 2015 08:37:57 -0700 (PDT)
Message-ID: <55F1A3D3.30106@gmail.com>
Date: Thu, 10 Sep 2015 08:37:55 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1441753511.git.raj.khem@gmail.com>	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>	<55F1679C.5090508@linux.intel.com>	<55F16E82.1070708@gmail.com>
	<55F172C9.3030601@linux.intel.com>
In-Reply-To: <55F172C9.3030601@linux.intel.com>
Subject: Re: Policy for 'Pending' patches (was Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close)
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
X-List-Received-Date: Thu, 10 Sep 2015 15:37:58 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 09/10/2015 05:08 AM, Alexander Kanavin wrote:
> On 09/10/2015 02:50 PM, Trevor Woerner wrote:
> 
>>> Then we can formulate a policy on top of that: for example, if a patch
>>> has been 'Pending' for 3 months, the person who added it gets a
>>> reminder to update the status; if the patch has been 'Pending' for 6
>>> months and the patch person has been unresponsive, no more patches are
>>> accepted from that person until he does the upstreaming of the ones he
>>> already got into oe-core. Something like that.
>>
>> With so many maintainers on so many different layers/etc we would need
>> some sort of billboard somewhere listing the names of people currently
>> on the "naughty" list ;-)
> 
> Yes, something similar to http://recipes.yoctoproject.org
> 
> And the autobuilder could automatically reject or flag a patch that adds
> custom 'Pending' patches, if the patch author is determined to be on the
> 'naughty' list :-)

That might just alter peoples behavior and change them to use
"Submitted" and still not do anything. It does not address the issue.

Having the ability to report a patch's status does have some merit. What
is done with it is a different story.

- armin

> 
> 
> Alex

