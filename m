Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T737c-0004Rv-I9
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 13:41:18 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 04:28:57 -0700
Received: by obblz20 with SMTP id lz20so3017191obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 04:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=MV5QAsiCi4E2FvC6WITBudOE5HqYGVT4W/XtuJuiurw=;
	b=GVC0VJE+jfFvadAaPBU1bixCf1a8lv5+Kiqn8fKk5nFt7KBXdWrkgG2Co3GjiZuBNK
	JwmJAALoyaaRlwWnyULY+Lb09nAun0LY65RbabuW9kuioH5T6Bl4K4bUbC8dtbcOF7AK
	G71VOCwlcESgwroLY9SN4IrDJTAHfQg5stPEYmFhdfFcs7QtUGQTZiE9lKghXKdvyA0U
	BX+CzOXMaHrsIBOPl8NzdA10HISS+6FDOZOLgH05F4Ao+W/LU7TZPRJ8U/rIDjfyWGSU
	GWcv7Yv+x9qjS467p/DGNldKw+LlkWMak7odl+XUawmjoHj1/8+LbVYGgU4aFAePUD5C
	m7yQ==
Received: by 10.60.28.162 with SMTP id c2mr3978404oeh.3.1346326136820; Thu, 30
	Aug 2012 04:28:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 30 Aug 2012 04:28:36 -0700 (PDT)
In-Reply-To: <92175252-0A9C-401F-87F5-751E4CFB8611@dominion.thruhere.net>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
	<92175252-0A9C-401F-87F5-751E4CFB8611@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Aug 2012 12:28:36 +0100
Message-ID: <CAJTo0LY5=R5=7BGtt3LkstRhRb2Ycd1oDJFDoKygtc8KcC4W8w@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl7XEzLrLAsUeVJw2XN6Ia2P6hwpVDBYHwoHr54yCz8kCQOkzdC5Fmu+sieqDZA8/ijxoR9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xserver-xorg: ship the exa module in a separate package
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
X-List-Received-Date: Thu, 30 Aug 2012 11:41:19 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 17:51, Koen Kooi <koen@dominion.thruhere.net> wrote:
> FWIW, the idea of those subpackages was to split every module out, but I haven't kept up with xorg modules for some years now.

There's also a lot of work ensuring that the dependencies are in place
because they can't be automatically inferred.  I'm happy leaving
fb/fbdev/shadow/shadowfb in the main package for now...

Ross


