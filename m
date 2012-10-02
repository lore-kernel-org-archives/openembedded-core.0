Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJ0OG-0007rU-0i
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 13:11:52 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 02 Oct 2012 03:58:52 -0700
Received: by oagh1 with SMTP id h1so5702102oag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=4N9zqht0kTqyAwtkyahSNSpxy2+rkqgLH+XJ2B8aHQU=;
	b=nHEFb60GGv9K4CwGB5jQXWSEAxyvsVD3XbAL/xit69dYyFhYf9a1oRzCyhqjUnQ/XD
	/4FGB261DnaHDEFtGk3izzYuL91d2ng6zvUdFwwqu7J8773+sO1KX9jIEwb9kocaJ6oJ
	Ad+JnvqBLClv1VQ3QHThyA4I1n324G8nK7YQiTF7KVmEIp5/BnEiueBrJ7lbZxOyfwpn
	uvmywuuKDWrj19VGMErXnY2q7t/tBerA0BZwXCRaIoT0kypgM2drYJTHJOT9315BWN0s
	BDCwkJr46xjTCy3rPQe5AqtmeObFd7TIVAqBUjhWN71gqsJhyOBAU6sdd8IfQJc79Avw
	JVUg==
Received: by 10.182.147.8 with SMTP id tg8mr14259778obb.21.1349175531725; Tue,
	02 Oct 2012 03:58:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 2 Oct 2012 03:58:31 -0700 (PDT)
In-Reply-To: <1349175360.15753.134.camel@ted>
References: <1349092569-26895-1-git-send-email-ross.burton@intel.com>
	<20121001120203.GC3454@jama.jama.net>
	<CAJTo0LZogROfi=ShqZCCA+2mbOVm-iBS3NfSoLX=eC9CZEU2BQ@mail.gmail.com>
	<1349175360.15753.134.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Oct 2012 11:58:31 +0100
Message-ID: <CAJTo0LbApnmy7GRhp1wf=YNiLCFnrQHLTxL0-zf+wW3RLitjWA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQmJubWe0Yh1BzH65HMJ0N207im+TBHJTVnad8ANh3S0oDDc6LJSX0Z0iFGLBMt3hJq37Fxo
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libdrm: Remove Cairo dependency
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
X-List-Received-Date: Tue, 02 Oct 2012 11:11:52 -0000
Content-Type: text/plain; charset=UTF-8

On 2 October 2012 11:56, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Shouldn't we just disable the things to gain a small bit of build speed
> if they don't matter? :)

That means carrying a patch and the maintenance burden when upgrading.
 I'm not entirely sure you'll notice all ten lines of Cairo code being
compiled if cairo happens to be installed when libdrm2 builds.

Ross


