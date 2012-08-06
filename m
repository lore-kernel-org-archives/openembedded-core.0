Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SyVcP-0003rS-5J
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 00:17:45 +0200
Received: by pbcwy7 with SMTP id wy7so2106635pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 15:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=woGyhJoK/ecuC6ylZ2dzKhM71/c3G7VgCaW8WCHuWv8=;
	b=XV+BkSObtCd5LbuA/kaMRbaqjHDaz7T/DscMgjbx+V4Eo/UyQg0MGWeEib94ESjvyW
	pQUYz8xKSUVNgYktWGTLhVtQsy1T0eXkz9SGUNPLVaC05WLcjl7MokeTN/2aH2T3dQMY
	sXH3jg2TbR8elH/YGKUJmOPKoB35dnLFkknH/wu8RdGFqWZuPUUorrtPJEeghFGL8ZSP
	6M8iVYKsnlER3zSetcdgaHQgGxknX3o4+Kv6Z/7soB09b68zCtjzzotMdgggz28tpUN1
	1DbnFmxLovb+SahYR8CdWW9Rc2U/uxvVTr0dFIJFUwMPoNYC9Qf+CxiSe0hCQXBN2XF+
	jztw==
MIME-Version: 1.0
Received: by 10.68.129.168 with SMTP id nx8mr22213753pbb.112.1344290759352;
	Mon, 06 Aug 2012 15:05:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.30.200 with HTTP; Mon, 6 Aug 2012 15:05:59 -0700 (PDT)
In-Reply-To: <50203D20.4040907@intel.com>
References: <8F29D6B095ED194EA1980491A5E029710C28379D@DFLE30.ent.ti.com>
	<50203D20.4040907@intel.com>
Date: Mon, 6 Aug 2012 19:05:59 -0300
X-Google-Sender-Auth: XsS_L0ElYUQ-HPG8AcGYA8mCv_o
Message-ID: <CAP9ODKoA8_W9Z_G_rgxvHj1m6CdrHAiEbVLno28uD8MrsBZ-KA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [denzil branch] Update to the latest version of psplash
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
X-List-Received-Date: Mon, 06 Aug 2012 22:17:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 6, 2012 at 6:54 PM, Scott Garman <scott.a.garman@intel.com> wrote:
> I'm inclined to take and backport the segfault patch into the current
> version of psplash in denzil (which is a git recipe fixed at e05374a).
> Bumping the SRCREV of the recipe and including the color definitions patch
> I'm not so sure about - vocal support from the community could tip the
> scales, though, so speak up if this would be of value to you.

I do think it is valuable however layers changing colors will have a
broken patch applying above it and I don't think it is the expected
for a stable release.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


