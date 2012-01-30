Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rs0sX-0003DT-Nd
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 00:43:17 +0100
Received: by bke17 with SMTP id 17so27030bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 15:35:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.205.136.19 with SMTP id ii19mr9645141bkc.60.1327966195892;
	Mon, 30 Jan 2012 15:29:55 -0800 (PST)
Received: by 10.204.35.135 with HTTP; Mon, 30 Jan 2012 15:29:55 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <4F2715ED.9030109@linux.intel.com>
References: <1327957970-15159-1-git-send-email-steve@sakoman.com>
	<4F27108D.4090303@linux.intel.com>
	<4F2715ED.9030109@linux.intel.com>
Date: Mon, 30 Jan 2012 15:29:55 -0800
Message-ID: <CAOSpxdajJLZSuzZS5qb4UPpjuS55ZWB=RR3a0oi9hNDF8J++Fw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Saul Wold <sgw@linux.intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/3] zypper: support signed repositories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jan 2012 23:43:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 30, 2012 at 2:13 PM, Saul Wold <sgw@linux.intel.com> wrote:

> This would imply that we need to have a GPLv2 Version of the gnupg
> recipe also, Steve if you had to look at or handle the newer GPLv3 gnupg
> code itself, you may not be able to write the GPLv2 recipe or create patches
> for it, can you arrange for someone to create that patch?

OE-classic has a recipe for gnupg-1.4.10, so perhaps the safest
approach would be to import that recipe since I *have* browsed the
gnupg v2 code.

I know from experience that signed repositories won't work for that
version as-is.  Zypper explicitly uses gpg2.

It *may* be that gpg and gpg2 are compatible enough that you could get
away with a symlink and a v1.x version of gnupg.  Or perhaps one could
patch zypper to try gpg if gpg2 isn't present.  Thoughts?

Steve


