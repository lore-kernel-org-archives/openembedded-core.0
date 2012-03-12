Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S7BEe-0000Rz-9o
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 20:48:48 +0100
Received: by lbbgi4 with SMTP id gi4so1198774lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 12:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=L/sXmwIFztfM3gfXyh76b5IBK3c0NUJ62ZtdG+biQvk=;
	b=AsCN8Bz5WBKtk6wqIKa1Azoq1lK+gQpQWF5Yi5jLitM8yEljboSFVpH1gDo8KY7piK
	OSAUjIwa3ii9rhGb3wHhlMEP79RDbJ73sYmK2F8raQs38OdM9gd3T6jq0el2MjI/Nnec
	1N8gLeB6tNruTpd9MDqwn8+MQg135g36yNkBU3C0vZ5CxoVfCChCviMNpCZTULmC2FAa
	WxcWz2S5lxA+txL2ZxDY4tNYnjGkY8Sx08sC5TKTNCU209VjXvF2QrPejKppeUmbNCZy
	NnOZ3y2GGe8wrUYQiQqc9RGMJkta8MSw0OoNmMepvWWTL94f/MvtwcFt+xoDJA01JEyE
	kxuw==
Received: by 10.152.132.132 with SMTP id ou4mr10177309lab.26.1331581204915;
	Mon, 12 Mar 2012 12:40:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 12 Mar 2012 12:39:33 -0700 (PDT)
In-Reply-To: <1532562.QfbElkX6OP@helios>
References: <cover.1331078069.git.paul.eggleton@linux.intel.com>
	<50d2b32b6d5367e5822c396d28a78ea54cb4ea40.1331078069.git.paul.eggleton@linux.intel.com>
	<4F56C49C.4000504@gmail.com> <1532562.QfbElkX6OP@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Mar 2012 12:39:33 -0700
Message-ID: <CAMKF1soP5xu5zt4WSQvqAvnnXjuFzAo-KNxYP9DhY0UsQqAm-w@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] formfactor: use full path to fbset
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
X-List-Received-Date: Mon, 12 Mar 2012 19:48:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 12, 2012 at 10:53 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> I guess our default is to not include /sbin and /usr/sbin in
> PATH for non-root users.

OK true. I get it now


