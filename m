Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E498670016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 23:05:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8QN5vSb030329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 27 Sep 2018 00:05:59 +0100
Message-ID: <d92bbf72bd1855ffa5fedfedcac3c5b8be94b836.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jeroen Hofstee <jhofstee@victronenergy.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2018 00:05:57 +0100
In-Reply-To: <1537806578-16616-1-git-send-email-jhofstee@victronenergy.com>
References: <1537806578-16616-1-git-send-email-jhofstee@victronenergy.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v2] bash: 4.4.18 -> 4.4.23
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
X-List-Received-Date: Wed, 26 Sep 2018 23:05:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 18:29 +0200, Jeroen Hofstee wrote:
> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
> ---
> v2: add patch subject prefix
> ---
>  meta/recipes-extended/bash/bash_4.4.18.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

I saw a question about why this hasn't merged yet. The reason is quite
simple, we're past feature freeze and we need a good reason to take
general upgrades.

There is nothing in this commit message which gives any idea how
important the issues between .18 and .23 are, therefore its duly being
ignored until 2.7.

If there is a good reason we should break general policy, it needs to
be in the commit message.

Cheers,

Richard

