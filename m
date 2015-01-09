Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DDC9072730
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 16:11:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t09GBmwa019026
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Jan 2015 08:11:48 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 9 Jan 2015 08:11:47 -0800
Message-ID: <54AFFDC3.2030601@windriver.com>
Date: Fri, 9 Jan 2015 10:11:47 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.11.1501091107110.24628@localhost>
In-Reply-To: <alpine.LFD.2.11.1501091107110.24628@localhost>
Subject: Re: [PATCH] BAD_RECOMMENDATIONS also works for RPM packaging.
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
X-List-Received-Date: Fri, 09 Jan 2015 16:11:51 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

That is correct.. it was update to work with RPM a year or so ago.  Looks like
the docs were never updated.

--Mark

On 1/9/15 10:08 AM, Robert P. J. Day wrote:
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
>   unless i misread, BAD_RECOMMENDATIONS works for both IPK and RPM,
> but not for DEB.
> 
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 2ab86e1..3a918e8 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -77,7 +77,7 @@ AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies t
>  #B
> 
>  B[doc] = "The Build Directory. The OpenEmbedded build system places generated objects into the Build Directory during a recipe's build process."
> -BAD_RECOMMENDATIONS[doc] = "A list of packages not to install despite being recommended by a recipe. Support for this variable exists only when using the IPK packaging backend."
> +BAD_RECOMMENDATIONS[doc] = "A list of packages not to install despite being recommended by a recipe. Support for this variable exists only when using the IPK or RPM packaging backends."
>  BB_DANGLINGAPPENDS_WARNONLY[doc] = "Defines how BitBake handles situations where an append file (.bbappend) has no corresponding recipe file (.bb)."
>  BB_DISKMON_DIRS[doc] = "Monitors disk space and available inodes during the build and allows you to control the build based on these parameters."
>  BB_DISKMON_WARNINTERVAL[doc] = "Defines the disk space and free inode warning intervals. To set these intervals, define the variable in the conf/local.conf file in the Build Directory."
> 


