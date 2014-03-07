Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 324E66E766
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 13:42:09 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 610C0F811F4; Fri,  7 Mar 2014 06:42:10 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 913B1F811E9;
	Fri,  7 Mar 2014 06:42:09 -0700 (MST)
Message-ID: <5319CCB7.5070909@mlbassoc.com>
Date: Fri, 07 Mar 2014 06:42:15 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1393261909-14802-1-git-send-email-gary@mlbassoc.com>
In-Reply-To: <1393261909-14802-1-git-send-email-gary@mlbassoc.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [PATCH 0/3 v2] Improve setup scripts
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
X-List-Received-Date: Fri, 07 Mar 2014 13:42:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2014-02-24 10:11, Gary Thomas wrote:
> These changes improve the setup scripts which are initiated
> by the user via 'oe-init-build-env'.
> 
> Gary Thomas (3):
>   This script is only useful when sourced into a shell.  These    
>     changes improve the detection of this operation, no matter     how
>     the script is referenced.
>   Keeping track of the TEMPLATECONF variable in the build     tree will
>     let this script produce the same output when     listing
>     'conf-notes.txt' every time the script is run,     regardless of
>     whether or not TEMPLATECONF has been provided     by the user.
>   .templateconf: New file for customized template defaults
> 
>  .templateconf             |    2 ++
>  oe-init-build-env         |   42 +++++++++++++++++++++++-------------------
>  scripts/oe-setup-builddir |   10 +++++++++-
>  3 files changed, 34 insertions(+), 20 deletions(-)
>  create mode 100644 .templateconf
> 

Ping?  Any comments or discussion?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

