Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1MKV-0006hY-0U
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 20:31:21 +0100
Received: from mail-gh0-f198.google.com ([209.85.160.198])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 11:15:32 -0800
Received: by mail-gh0-f198.google.com with SMTP id r11so5989459ghr.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 11:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=c5x5dpTWQSCWSrA5sczHKRTUhK+AdyTKQkQ1ucQ/CdA=;
	b=mmZifbRBp/NqPCC+ebhzPbHSG+hqNVnBb6QdL9UXfTcPAPFinRFG5PVNcxltDqEz1j
	h15SMISnkcec3zKbITXBxkGc3rsdouNEzaOKVCCMiDpeMJQQ8SYkjzes12WSlnxM4U3w
	4qkCmGbMXeTjU14ThANqrj+uhDDQP7nE9KfV3c2l+wYWUTBAQ9P5kxfRx1BajTMEZ+6x
	QjYRVjWaUmEJDW2JeXp1+k6tlnPnIozloMoYb06i367mw9pn2N+Ay6/Y14z91NN0y0tH
	+fH8XLyhdymZ/5bUPP3mnQJ6o/eOF2VUAmGqb+suJfFbFD4kPkbOE/l5VFsZei152ZpB
	e+Zg==
X-Received: by 10.58.106.161 with SMTP id gv1mr8210023veb.35.1359746132051;
	Fri, 01 Feb 2013 11:15:32 -0800 (PST)
X-Received: by 10.58.106.161 with SMTP id gv1mr8210017veb.35.1359746131909;
	Fri, 01 Feb 2013 11:15:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 1 Feb 2013 11:15:10 -0800 (PST)
In-Reply-To: <CAJTo0LaM__O=HgwAAyATKcdxHFee5Aq-80XkU9aCKBkwG6=5ww@mail.gmail.com>
References: <510BD7AD.5090506@topic.nl> <1359732091.14071.66.camel@ted>
	<CAJTo0LaM__O=HgwAAyATKcdxHFee5Aq-80XkU9aCKBkwG6=5ww@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Feb 2013 19:15:10 +0000
Message-ID: <CAJTo0LZD9Sd0eFmLXhvZmRSPDxCczigu6_XpiddhRaFg4ymkMw@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQm4+uykbAQKcNUSUutQpwBIudDUZMBP+E+dYwTnG5VWFwRiUnllJeNHBR2tZKzMBIymmVJr3V7uklpdEPc0HT+5E0SV31xPpDouMaUAiBOO5K3jgWdp3s8Nwy/yS7ZeZUP+ATJ+WhzJdzdepf45I+dEwjusXhf9L18IsZ1qALNOQe4l64pMrAQWW0Wy51jZyRIJ+/Yq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What's up with "fontconfig"
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
X-List-Received-Date: Fri, 01 Feb 2013 19:31:33 -0000
Content-Type: text/plain; charset=UTF-8

On 1 February 2013 17:22, Burton, Ross <ross.burton@intel.com> wrote:
> For what it's worth, removing everything that looks dubious in
> EXTRA_OECONF and that do_configure_append results in a zero-difference
> buildhistory, so it at least compiles.  I'll kick off an image build
> now and see if fonts still work.

I've pushed a branch to poky-contrib:ross/fontconfig that removes
everything that looks dubious.  I can't test it right now so anyone
else testing it builds for them and works as expected would be most
useful.

Ross


