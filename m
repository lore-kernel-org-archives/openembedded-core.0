Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id A9D4065C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 16:14:55 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A4046F811E4; Thu,  5 Mar 2015 09:14:56 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id DF777F811E3;
	Thu,  5 Mar 2015 09:14:55 -0700 (MST)
Message-ID: <54F88105.8020509@mlbassoc.com>
Date: Thu, 05 Mar 2015 09:15:01 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1425570531-9477-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0La0cGM+YSFjj5XmR7eex7m5o7xc0rkmz96z2GGvY-jeEQ@mail.gmail.com>
In-Reply-To: <CAJTo0La0cGM+YSFjj5XmR7eex7m5o7xc0rkmz96z2GGvY-jeEQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] opkg: Fix error when recompiled
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
X-List-Received-Date: Thu, 05 Mar 2015 16:14:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-03-05 08:52, Burton, Ross wrote:
> Hi Gary,
>
> On 5 March 2015 at 15:48, Gary Thomas <gary@mlbassoc.com <mailto:gary@mlbassoc.com>> wrote:
>
>     v2: Move the update of the opkg.conf file into 'do_install' which
>     will prevent any erroneous [multiple] options to be added to 'opkg.conf'
>
>
> Don't put commentary about v2 in the commit message, as when it's merged the content of v1 isn't relevant.

Noted.

> (I've removed it and merged to mut)

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

