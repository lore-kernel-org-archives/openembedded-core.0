Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJ4gk-0005C2-OW
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 17:47:14 +0200
Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 02 Oct 2012 08:33:52 -0700
Received: by iebc13 with SMTP id c13so15385200ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 08:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=bapQL9FT7Bgjoz7uBBZpOSdNbyUpIYVo1OXLEC7enHQ=;
	b=Y8E84J0vInoEMvuQnR+m2/shJdam3oJSmbYxVVTr9G5sdditYPIBJOEWJotAF73VEG
	Dr3wQJ52XqYnvdrTIvV7Riu6JKAwgB8K814wt9PyROjuitVi378LusQ/sVxGzlb+t23G
	Kiw9o4DzdIpxxndlHa4gYsGS7R7tcScMWecPPP1ewRujMObT8LXMIp6sKGGXPnwkkfLw
	K9HB02JRd6SJtLe0smu8j7T/JwofRKfx/e+WL//zkpSzxv0eZkoHwmUN4MArjh9Kn6XJ
	kOLCme9EGluzjoBlF8NiCsYC1JQS397ZMyFA4NxZMOrqQYZblzI1xiR3fN3Yv1HAKHJI
	cX9A==
Received: by 10.50.36.169 with SMTP id r9mr9063296igj.67.1349192031552; Tue,
	02 Oct 2012 08:33:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.141.70 with HTTP; Tue, 2 Oct 2012 08:33:31 -0700 (PDT)
In-Reply-To: <1349191549-26315-1-git-send-email-andrei.adrianx.dinu@intel.com>
References: <1349191549-26315-1-git-send-email-andrei.adrianx.dinu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Oct 2012 16:33:31 +0100
Message-ID: <CAJTo0LY=LdDvWvmX547SSeQAHfq-5CCSWO1jTsgmbZz0_=fcFA@mail.gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
X-Gm-Message-State: ALoCoQnQ6I/KO0HHJDoiO47n/qpUz+Ruay4/5gnlEwYP9KrjH5srWJmvj4G6azMcfNpi5FhUb1Z8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gypsy: package removed from meta
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
X-List-Received-Date: Tue, 02 Oct 2012 15:47:15 -0000
Content-Type: text/plain; charset=UTF-8

On 2 October 2012 16:25, Andrei Dinu <andrei.adrianx.dinu@intel.com> wrote:
> Removed package from meta/recipes-connectivity and also all the dependencies reffering to it.

This patch should be split into two - one touching meta and the other
touching meta-yocto (because the real repositories are oe-core for
meta/ and meta-yocto for meta-yocto/).

Ross


