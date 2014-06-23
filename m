Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9EAEF65F14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 10:42:36 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id v10so5377128qac.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 03:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6HKEMm9oyEX/vDf7bPzKfEqhiSZPLrww8maQR143eY4=;
	b=A9R2z2+eWWeGkokpljmyneyd8pyNSH8lAsxQn26dxjchqz91swJZ7t0+ZciDy4N1BZ
	hkCvD+Y9SOe1yGht2FLd8/SF45JGP6z7AojDKJCYF7+GVk/QgY0pFe3gzZTZHz+ieDcI
	ptx5t6RcawPRRQcoxp4QYngwJ+cTlQPG/xkPNsfNM88S5MZa8PoPN6qPBKWDqv5J8O+t
	s4YUpMII10IZMHoC0grtICXVZ3a70UGbUG18jtqY9aCMWtPRrHkKw2J854K8cIs4ieDr
	B7l0T1P6iI4mq35pWSmDs4bABVfpDXaGIuu/uAbh6rvuglL9ZB4Qke6TxsUaO/61dq59
	Gu8Q==
X-Gm-Message-State: ALoCoQkO4s3Bc/Ttrczt+NsQywH0EtbPFyPna3IyeXGvyK/gi39aBsSLA+Vf+gzttxCi8zRyBPWC
X-Received: by 10.224.165.70 with SMTP id h6mr31120194qay.78.1403520157700;
	Mon, 23 Jun 2014 03:42:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Mon, 23 Jun 2014 03:42:17 -0700 (PDT)
In-Reply-To: <c33af6b8216db6c04c5a4114d818182a5438ed0e.1403490121.git.kai.kang@windriver.com>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<c33af6b8216db6c04c5a4114d818182a5438ed0e.1403490121.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jun 2014 11:42:17 +0100
Message-ID: <CAJTo0Lb-bcLx4T1HHOEzsY3uXmNW8NzdKO9sBQtnottgEfyzXw@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] iptables: add default rules
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
X-List-Received-Date: Mon, 23 Jun 2014 10:42:41 -0000
Content-Type: text/plain; charset=UTF-8

On 23 June 2014 03:32, Kai Kang <kai.kang@windriver.com> wrote:
> +# Firewall configuration written by system-config-securitylevel
> +# Manual customization of this file is not recommended.

That's just going to be confusing to anyone who doesn't know that this
file was copied directly from RedHat.

Also, is it sensible to ship a static firewall configuration?  The one
thing we're not is one-size-fits-all.

Ross

