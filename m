Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DBA1C78445
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:22:36 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5G9MZCT027886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 10:22:36 +0100
Message-ID: <1497604955.24449.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 10:22:35 +0100
In-Reply-To: <1497602780-1744-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497602780-1744-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 10:22:36 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] package_ipk: Clean up Source entry in ipk packages
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
X-List-Received-Date: Fri, 16 Jun 2017 09:22:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-06-16 at 09:46 +0100, Richard Purdie wrote:
> There is the potential for sensitive information to leak through the
> urls
> there and removing it brings this into the behavior of the other
> package
> backends since filtering it is likely error prone.
> 
> Since ipks don't appear to be generated at all if we don't set this,
> set
> the field to the recipe name used (basename only, no paths). This
> avoids
> information leaking. We may want to drop the field if opkg can allow
> that
> at a future point but the recipe name is a suitable identifier for
> now.
> 
> Reported-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package_ipk.bbclass | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Since this is rather important I have backported this to
pyro/morty/krogoth with the appropriate tweaks.

Cheers,

Richard

