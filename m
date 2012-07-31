Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sw8ZN-0003lL-NK
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 11:16:49 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 31 Jul 2012 02:05:10 -0700
Received: by mail-yw0-f52.google.com with SMTP id p61so5124659yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 02:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=4CZ12sqpqtKnd0Ymzd+getDz9tZFPXGqlCaakFu5UcE=;
	b=i1BCqFKwCh4mdSajEoAdSwtJWtkTvostYp6lbpzZGo7DpbLI7NVFGdFcOpeOcWmMOm
	0/1qNQOh/XuEUtbAyC+5fOIUw6gCQVErKSq4nXLjAFsqrbPZj/nC8hmYDH4p5fnTeXYi
	N3P2CcHMsy8lf/lcw+t6nGxclMbOnc4y9IS1IFyOcJ7sS832GZzuWi/T6esPwx0Fy4++
	y/gpBj74gYm9fxig/3sheCIgL7orA32ESkf/qUbnl55TrVQbNPyef/JCzHH2s8bSIyYW
	MWD6dWWqlQshW+AnLEE+q2cneJVUgiPcAT1uTJSl1FpKnZU+q/sgk/6ZJCES29xpeUsF
	sW6A==
Received: by 10.50.208.34 with SMTP id mb2mr82536igc.5.1343725509839; Tue, 31
	Jul 2012 02:05:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Tue, 31 Jul 2012 02:04:49 -0700 (PDT)
In-Reply-To: <1343725111-30135-1-git-send-email-radu.moisan@intel.com>
References: <1343725111-30135-1-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 31 Jul 2012 10:04:49 +0100
Message-ID: <CAJTo0LY9V8c=X0B06kD6UOAhPKLZyjHgiCgvDp_BSY7OHBY0BA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkwMUakGkYpInEdM+QTJ8ah5z8k6+AvCrqCsgJKzAaAHE0+BPExwexvzMXPp7l7nrdYNwxK
Subject: Re: [PATCH] atk: package update 2.2 -> 2.5
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
X-List-Received-Date: Tue, 31 Jul 2012 09:16:50 -0000
Content-Type: text/plain; charset=UTF-8

On 31 July 2012 09:58, Radu Moisan <radu.moisan@intel.com> wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../atk/{atk_2.2.0.bb => atk_2.5.4.bb}             |    8 ++++----

ATK is part of GNOME so follows the odd/even numbering scheme.  Unless
there's a need for the unstable release we should keep with stable
(even) releases, so 2.4.0.

Ross


