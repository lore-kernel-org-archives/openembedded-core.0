Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF7560DD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 01:23:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9D1Nnjm011425
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Oct 2014 18:23:49 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 12 Oct 2014 18:23:48 -0700
Date: Sun, 12 Oct 2014 20:23:46 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Message-ID: <20141012202346.19fa7caa@e6410-2>
In-Reply-To: <1413157795-1346-2-git-send-email-pab@pabigot.com>
References: <1413157795-1346-1-git-send-email-pab@pabigot.com>
	<1413157795-1346-2-git-send-email-pab@pabigot.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] pseudo: support --without-passwd-fallback configuration option
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
X-List-Received-Date: Mon, 13 Oct 2014 01:23:49 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Sun, 12 Oct 2014 18:49:53 -0500
"Peter A. Bigot" <pab@pabigot.com> wrote:

> +Inspection of pseudo_client shows the only other use of PSEUDO_ETC_FILE
> +to be protected against magic.  Applying the same shield to the
> +unprotected calls in pseudo_pwd_lck_{open,close} fixes the issue.

D'oh. This is clearly right. Depending, it may be better to merge this into
upstream and just switch to the branch that gets it (presumably 1.6.3), but
it's right either way.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

