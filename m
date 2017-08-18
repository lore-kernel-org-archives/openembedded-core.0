Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C799178529
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 09:51:40 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7I9pbC8023736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 18 Aug 2017 10:51:38 +0100
Message-ID: <1503049897.32591.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: cinly.ooi@intel.com, openembedded-core@lists.openembedded.org
Date: Fri, 18 Aug 2017 10:51:37 +0100
In-Reply-To: <1502846306-32417-1-git-send-email-cinly.ooi@intel.com>
References: <1502846306-32417-1-git-send-email-cinly.ooi@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 18 Aug 2017 10:51:38 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] Perl: No reference conversion for Porting/Glossary
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
X-List-Received-Date: Fri, 18 Aug 2017 09:51:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-08-16 at 09:18 +0800, cinly.ooi@intel.com wrote:
> From: Ooi Cinly <cinly.ooi@intel.com>
> 
> do_configure() will no longer convert references to
> /usr/include into /path/to/recipes-sysroot/usr/include
> for the file "Porting/Glossary".
> 
> [YOCTO #11243]
> 
> Signed-off-by: Ooi Cinly <cinly.ooi@intel.com>
> ---
>  meta/recipes-devtools/perl/perl_5.24.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've queued this, I just wanted to note that I had to tweak the
shortlog. Its not clear from reading the version above what the change
is doing. The recipe is perl, not Perl too. I changed it to:

"perl: Don't change /usr/include references in docs to sysroot paths"

Cheers,

Richard


