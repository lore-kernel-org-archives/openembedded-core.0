Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPcda-0005mE-UR
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:47:19 +0200
Received: by mail-wg0-f46.google.com with SMTP id l18so7087211wgh.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 10:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=GGcz0z4EGbEaMZZtyEsXp1r1zYBvEdy+X/ZbE2Yb+Gw=;
	b=RqDI8RTazApeV5BwfRuE3lj0dtwTPAIsLv/fiaNYG9fskUGVaQYy2HIuYXuU+c55Sw
	oCgw4f0Zu1bGKm+5cGWoBGQRHAF3MMHNeg7Mqptn6ZUY+xF9SyXsnwPpiqvnbYaF51ub
	RVK/GMjgt1QJ5WZqKKMBczEPoefbg4I4ZSM8vpYgFH284SE6mKaDEaeUiheZfPdZmnX4
	0YrasITVDbC+/2xL837vr+jfgs0grccrobiFBNtcGWI2VGhI77BeYYFLELdwnHL/Ms62
	hT5/JpUgbO+ML/gPX/mR6UPn4KcFslU3YCaczauJNpjwymoJk0JdX4TcwoAx446GZel6
	/wyw==
MIME-Version: 1.0
X-Received: by 10.194.58.202 with SMTP id t10mr40523721wjq.4.1365528598664;
	Tue, 09 Apr 2013 10:29:58 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Tue, 9 Apr 2013 10:29:58 -0700 (PDT)
In-Reply-To: <3664366.6RB48HkoAG@helios>
References: <cover.1365179842.git.pkj@axis.com>
	<a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
	<CAHUNapRCw6pqVL1MfSkPqDZQL-adp-AHQba8+nGTPoi44BTguQ@mail.gmail.com>
	<3664366.6RB48HkoAG@helios>
Date: Tue, 9 Apr 2013 13:29:58 -0400
Message-ID: <CAHUNapTSbxqXuj7LOsNSrZL5Ank+ngvkXF=cnhvM7aUK-DQZZA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] oe-buildenv-internal: Only add to $PATH if needed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 17:47:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 8, 2013 at 1:48 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Unfortunately I think this is specific to bash, so it may not be portable.
> Maybe the equivalent can be achieved with sed however.

Under which shells do we expect a Yocto build to succeed? The latest
version of this change wouldn't work under tcsh, for example. (Not
that I'm suggesting it should!) Isn't there already an inherent
Bourne-ish expectation?


