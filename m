Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 954A96AE73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 15:45:23 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 21BDBF811E4; Fri, 17 Jan 2014 08:45:23 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 31CD4F811E2;
	Fri, 17 Jan 2014 08:45:21 -0700 (MST)
Message-ID: <52D95018.5010602@mlbassoc.com>
Date: Fri, 17 Jan 2014 08:45:28 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1389973156-9421-1-git-send-email-jplum@devonit.com>
In-Reply-To: <1389973156-9421-1-git-send-email-jplum@devonit.com>
Subject: Re: [Patch] lib/oe: copyhardlinktree - detect mount points
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
X-List-Received-Date: Fri, 17 Jan 2014 15:45:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-01-17 08:39, Jason Plum wrote:
>
> Add function getmount to detect the mount point of the path, as
> os.stat(path).st_dev in copyhardlinktree fails in lxc containers
> to detect different paths as separate mounted filesystems
> (cp -l failure)

Patch missing?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

