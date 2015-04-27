Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC2065CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 12:36:43 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so124753576ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 05:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DhsTOwZW3iVTCbh6w11bg6lEm/w0wRLdH+87ik0NINA=;
	b=Am8XxEsFaOMMwBs/dtY1JTjJPxhXXH6Ozi6xHElVfb+lKxfkibMKHW7eHCRVKt4CCu
	/czdQblu7oM+LkRLlCHCJ3FW9oMsmIYCB5He0fvSNq1qpNwZwNYOJPjlwLp1BDYZhwqH
	G2qCFO4RBti4Eq36MJMEEcfpJxWlyFsmjRrHsCVKX7VfFMzN2nCeudk8HwC/8/JYcSuu
	Pe9HIKyogqm2GR6DQv6nTXaCPnBn9Z/muIpUsxy8rXX0IlYIBF0OG2XmY+gC7IW7cvPI
	aRzIgXcAW2d0Lu/Ip9ecGj4LTVtNKglsXJB4wCW+DchiQzUpjk1FwSosZybzE28XK4w/
	Z5Xg==
MIME-Version: 1.0
X-Received: by 10.107.134.206 with SMTP id q75mr13251702ioi.27.1430138204756; 
	Mon, 27 Apr 2015 05:36:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 05:36:44 -0700 (PDT)
In-Reply-To: <1429921942-19804-2-git-send-email-psidhu@gateworks.com>
References: <1429921942-19804-1-git-send-email-psidhu@gateworks.com>
	<1429921942-19804-2-git-send-email-psidhu@gateworks.com>
Date: Mon, 27 Apr 2015 09:36:44 -0300
X-Google-Sender-Auth: 6OnTH6S4kWsubK8uufu8XuQzQMs
Message-ID: <CAP9ODKpua0=cpqyj9EF8+iNmFxDwcU7R+nCbpCCGoEPrdLUafA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: add support for multiple ubi sizes
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
X-List-Received-Date: Mon, 27 Apr 2015 12:36:46 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 24, 2015 at 9:32 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> Add new FSTYPE called 'multiubi'. This new type has the ability to
> create multple ubi's, something that's extremely useful on boards that
> can include varying flash sizes (e.g. 256MB vs 2GB).
>
> Because we don't want to reuse code, I extracted the mkfs and ubinize
> commands out to a new function that will handle the creation of both
> multiple ubi's, as well as the 'ubi' FSTYPE (so as not to break current
> boards).
>
> Due to the single processes nature of the OE when doing it's
> 'create_image', this new multiubi_mkfs function also creates it's own
> symlinks as well as cleans up it's own cfg file.
>
> Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>

It makes a lot of sense.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

