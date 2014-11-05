Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF54A71FD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 19:18:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA5JIZAR002956
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 11:18:36 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 5 Nov 2014 11:18:35 -0800
Message-ID: <545A780A.2070706@windriver.com>
Date: Wed, 5 Nov 2014 13:18:34 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1415212983.23396.57.camel@ted>
In-Reply-To: <1415212983.23396.57.camel@ted>
Subject: Re: [PATCH] base: Make PRINC warning an error
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
X-List-Received-Date: Wed, 05 Nov 2014 19:18:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/14, 12:43 PM, Richard Purdie wrote:
> Apparently 1.5 years of warnings isn't enough to get anyone to take any
> notice. We therefore make this an error so people can ignore it for
> another 6 months whereafter we can finally give up and remove the
> obsolete code.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index e1b25ff..f5b216b 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -375,7 +375,7 @@ python () {
>       # obsolete.  Return a warning to the user.
>       princ = d.getVar('PRINC', True)
>       if princ and princ != "0":
> -        bb.warn("Use of PRINC %s was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % (princ, d.getVar("FILE", True)))
> +        bb.error("Use of PRINC %s was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % (princ, d.getVar("FILE", True)))
>           pr = d.getVar('PR', True)
>           pr_prefix = re.search("\D+",pr)
>           prval = re.search("\d+",pr)
>
>

I'd suggest removing the code -after- the bb.error as well..

Make it an error.. and remove the functionality so it's -clear- you can't just 
make it a warning again.

--Mark

