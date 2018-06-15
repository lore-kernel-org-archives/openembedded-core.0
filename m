Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 06B44751F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 10:15:27 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5FAFQBh014278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 15 Jun 2018 11:15:27 +0100
Message-ID: <19c2948bb4636236596fd89ca6e940dab96a1323.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 11:15:26 +0100
In-Reply-To: <1528397320-32269-2-git-send-email-armccurdy@gmail.com>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
	<1528397320-32269-2-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/7] openssh: stop manually hiding libutil etc headers from configure
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
X-List-Received-Date: Fri, 15 Jun 2018 10:15:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-06-07 at 11:48 -0700, Andre McCurdy wrote:
> Since we now have recipe specific sysroots, drop old workarounds
> for non-deterministic detection of sysroot header files.
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 8 --------
>  1 file changed, 8 deletions(-)

Even if we have rss, I think showing/documenting these recipes
configure scripts autodetect is a good thing so I'd prefer not to drop
this kind of code if it isn't causing problems.

Cheers,

Richard

