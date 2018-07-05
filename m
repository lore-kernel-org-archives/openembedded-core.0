Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5B16C7717B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 09:32:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w659WkCm029421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 5 Jul 2018 10:32:48 +0100
Message-ID: <87af19446a0ae84f556b5da5d209245da12f89c3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 05 Jul 2018 10:32:46 +0100
In-Reply-To: <1530621453-19618-1-git-send-email-alex.kiernan@gmail.com>
References: <1530621453-19618-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v2] openssh: Add dependency on ssh for sftp
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
X-List-Received-Date: Thu, 05 Jul 2018 09:32:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-07-03 at 12:37 +0000, Alex Kiernan wrote:
> Add missing dependency on the ssh binary for the sftp client to avoid
> failure at runtime if it's not been installed through another
> dependency
> chain.
> 
> This introduces a note if PREFERRED_RPROVIDER_ssh is not set and it
> can be satisfied by multiple providers (e.g. openssh and dropbear).
> 
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> 
> Changes in v2:
> - Depend on ssh not ${PN}-ssh so it can be satisfied by openssh or
> dropbear
> 
>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 1 +
>  1 file changed, 1 insertion(+)

Won't this patch still introduce build time warnings?

I have to agree with Mike's comments, I'm very worried this change is
going to introduce problems for a lot of people...

Cheers,

Richard

