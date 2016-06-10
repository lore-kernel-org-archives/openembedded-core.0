Return-Path: <andrew.shadura@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id D443262136
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 21:36:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: andrewsh) with ESMTPSA id 92282260AE7
To: "Burton, Ross" <ross.burton@intel.com>
References: <1464357493-8652-1-git-send-email-andrew.shadura@collabora.co.uk>
	<CAP9ODKrhu4+XFZY5BeghTstiq4F2FeW52Yox0VqUusuq+p6tuA@mail.gmail.com>
	<575683F2.2050200@collabora.co.uk>
	<CAJTo0LZoFWfxU8D4bGW3gmXtQDT1hMCbhjcCBaYtrwzgDS0JYg@mail.gmail.com>
From: Andrew Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora Limited
Message-ID: <575B32BB.6010608@collabora.co.uk>
Date: Fri, 10 Jun 2016 23:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZoFWfxU8D4bGW3gmXtQDT1hMCbhjcCBaYtrwzgDS0JYg@mail.gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: Update to 2016.05 release
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
X-List-Received-Date: Fri, 10 Jun 2016 21:36:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10/06/16 17:33, Burton, Ross wrote:
> 
> On 7 June 2016 at 09:21, Andrew Shadura <andrew.shadura@collabora.co.uk
> <mailto:andrew.shadura@collabora.co.uk>> wrote:
> 
>     Any news on this? It still hasn't been merged, even though the other
>     patch has been.
> 
> 
> It's broken on hosts where the library loader doesn't  match where the
> OE distro puts it:
> 
> | cat ./Licenses/gpl-2.0.txt | gzip -9 -c | \
> | tools/bin2header license_gzip > ./include/license.h
> | /bin/sh: 2: tools/bin2header: not found
> 
> $ ./bin2header
> -bash: ./bin2header: No such file or directory
> 
> Classic symptom of target compiler flags being used in a build using
> CC_FOR_BUILD.

Is it something new in this version or is that something that's also
been broken for a while now?

-- 
Cheers,
  Andrew

