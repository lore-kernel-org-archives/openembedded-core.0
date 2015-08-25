Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6E69C65CCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PKqLNF028609; Tue, 25 Aug 2015 21:52:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mYWmGWttcGRj; Tue, 25 Aug 2015 21:52:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PKq5Et028603
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 25 Aug 2015 21:52:16 +0100
Message-ID: <1440535925.12105.445.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Tue, 25 Aug 2015 21:52:05 +0100
In-Reply-To: <1440521261-5444-1-git-send-email-ross.burton@intel.com>
References: <1440521261-5444-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][RFC] sstate: implement basic signing/validation
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
X-List-Received-Date: Tue, 25 Aug 2015 20:52:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-25 at 17:47 +0100, Ross Burton wrote:
> To provide some element of integrity to sstate archives, allow sstate archives
> to be GPG signed with a specified key (detached signature to a sidecar .sig
> file), and verify the signatures when sstate archives are unpacked.

Some random thoughts. We could add the signature into the tarball using
something like the --use-compress-program option  (see
https://www.gnu.org/software/tar/manual/html_chapter/tar_8.html and the
gpg references). That would mean we have one less separate file to worry
about.

Not sure which approach I prefer, just putting the idea out there...

> TODO: fetch .sig from remote sstate mirrors

We do something similar for siginfo already FWIW.

> Signed-off-by: Ross Burton <ross.burton@intel.com>

I'd also probably make these callable functions, then others can
override them and use them as hooks if they want to.

Cheers,

Richard



