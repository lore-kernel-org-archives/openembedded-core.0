Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3C15771ADD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 11:52:16 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v57BqB8P009932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 7 Jun 2017 12:52:12 +0100
Message-ID: <1496836331.6630.213.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 07 Jun 2017 12:52:11 +0100
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1486734151-28331-1-git-send-email-amarnath.valluri@intel.com>
	<1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 07 Jun 2017 12:52:12 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Joshua Lock <joshua.g.lock@intel.com>
Subject: Re: [PATCH v2 01/25] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Wed, 07 Jun 2017 11:52:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-02-22 at 10:26 +0200, Amarnath Valluri wrote:
> From: Joshua Lock <joshua.g.lock@intel.com>
> 
> Modify bindir, libdir and sbindir to be exec_prefix/$d, rather than
> base_prefix/$d, when the usrmerge DISTRO_FEATURE is enabled.
> 
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  meta/conf/bitbake.conf | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

I was asked to clarify the status of this series. We've taken many of
the changes but the core changes to bitbake.conf haven't been merged.

Ross/I discussed it and we both feel that the bitbake.conf make the
file pretty unreadable. We'd therefore like to see this implemented as
a .inc file which gets included when the relevant DISTRO_FEATURE is set
(or could just be included by the appropriate distro configs). This
.inc file would then simply override the paths. I believe this would be
a lot more readable than the current approach which is a key concern in
the core config.

The merge of the rest of this feature is therefore pending on the
development of such a patch, or a discussion convincing Ross/I why we
shouldn't take that approach for some reason.

Cheers,

Richard

