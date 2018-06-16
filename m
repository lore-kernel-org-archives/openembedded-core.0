Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1A22B74759
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 08:58:10 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5G8u8p5015507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 16 Jun 2018 09:56:10 +0100
Message-ID: <6f9107538063961f6ace4a680a998942b384e701.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jeremy Puhlman <jpuhlman@mvista.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2018 09:56:08 +0100
In-Reply-To: <1529110789-13035-1-git-send-email-jpuhlman@mvista.com>
References: <1529110789-13035-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] update-alternatives: Don't process duplicated entries
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
X-List-Received-Date: Sat, 16 Jun 2018 08:58:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-15 at 17:59 -0700, Jeremy Puhlman wrote:
> If ALTERNATIVE_<pkg> lists the same entry more then once, the
> update-alternatives identical install and remove actions are added
> for
> each repeated entry. This is exhibited when you add meta-selinux, and
> examine the busybox package, which installs every link twice because
> it
> alters the links to point to the shell replacements so selinux will
> work
> with them. This can generate warnings on do_rootfs about similarly
> prioritized alternatives. Given that at this point in the processing
> the addtions should always be identical there shouldn't be any good
> reason to add them twice.
> 
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  meta/classes/update-alternatives.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)

Shouldn't we detect and make this a fatal error in one of the other
sanity tests like we do for PACKAGES for example? Would there ever be a
valid use case for duplicate entries here?

Cheers,

Richard

