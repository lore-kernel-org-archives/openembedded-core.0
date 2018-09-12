Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CED8C74573
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 08:43:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8C8huuB006300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 12 Sep 2018 09:43:57 +0100
Message-ID: <8cac505e74afa2e749668a042dcb25f3ac684eb7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 09:43:56 +0100
In-Reply-To: <045d8e01516bc793c571107c2766d033af758941.1536740787.git.liezhi.yang@windriver.com>
References: <cover.1536740787.git.liezhi.yang@windriver.com>
	<045d8e01516bc793c571107c2766d033af758941.1536740787.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/1] dump_cache.py: Move it from bitbake
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
X-List-Received-Date: Wed, 12 Sep 2018 08:43:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-09-12 at 16:27 +0800, Robert Yang wrote:
> Add it to oe-core can make it's easier to use, e.g., we don't need
> use
> /path/to/bitbake/contrib/dump_cache.py to run it, just use
> dump_cache.py after
> the build is initialized.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  scripts/dump_cache.py | 95
> +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100755 scripts/dump_cache.py

Since the script is heavily tied to bitbake itself, I don't think this
change makes sense. The name is also too generic just to insert into
PATH (dump which cache?).

We could move it within bitbake I guess but I have to ask the question,
how many people really need to run this and is the location therefore a
real problem? Any user needing this can like adjust their PATH or
figure out the right path to the script easily enough?

Cheers,

Richard

