Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.11184.1586445454336869354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 419AB2E891B;
	Thu,  9 Apr 2020 10:17:33 -0500 (CDT)
Date: Thu, 9 Apr 2020 10:17:30 -0500
From: "Seebs" <seebs@seebs.net>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>, "pavelmn@axis.com" <pavelmn@axis.com>
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak
Message-ID: <20200409101730.579e5ef9@seebsdell>
In-Reply-To: <DM6PR11MB3817CF24D3A7FF01AE0C7BD9F1C10@DM6PR11MB3817.namprd11.prod.outlook.com>
References: <1586399921-418794-1-git-send-email-mingli.yu@windriver.com>
	<20200409002556.4eb074a2@seebsdell>
	<DM6PR11MB3817CF24D3A7FF01AE0C7BD9F1C10@DM6PR11MB3817.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Apr 2020 06:30:37 +0000
"Yu, Mingli" <mingli.yu@windriver.com> wrote:

> We are trying to fix the issue as
> http://bugzilla.yoctoproject.org/show_bug.cgi?id=13311 stated.

Hmm. I think there's a more subtle logic bug here, and also one
of the diagnostics there is a debug message I didn't notice when I
made the commit, but it never comes up unless you run with
PSEUDO_DEBUG_FILE.

I'm gonna think about it more. I'm now about half convinced that
the patch is actually fine as-is for clients, it's just on the server
side that I think we'd see problems.

-s
