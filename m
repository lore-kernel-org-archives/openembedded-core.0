Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sce98-0006Zi-Au
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 16:57:10 +0200
Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 07 Jun 2012 07:46:40 -0700
Received: by qabj40 with SMTP id j40so213109qab.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2012 07:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=b6unZZ6Hvn7V5UJQ+vaffd/rbxg8Yrzh+xWnrhwMNhA=;
	b=HZp6BAjpIj/J53xCnG0bUWbESzDp8eSufYcUdWGhFJ/VVQ1cd9PsMqxOW5Xs92cW8h
	XbXOLtRwVJm1qR+HUHBRSbUcyjUTq2/Y8S6qOlgISnZPHPj8Go661uRs7QPrNvEpzzHg
	TTCMSaJQo+TTV0fyOSIq8ixhhpNOjHu/NvYr08G14H8FipNIjyXMXL8DiyTvrH/drxM4
	QiLAoUlTgn/+StzWU1EclS5G8fGUFl/VfYhmuXtWKiDYbB7da3JJ456ZNQ9uxmw0aYjk
	8xkJ+muOU0ZeWzBN9AJrxwxqqxkxrM3IkvCapUoWYqm5tkmYgGZ+wcgmDoav2OjiC1lY
	gtIg==
Received: by 10.229.135.131 with SMTP id n3mr771283qct.84.1339080399671; Thu,
	07 Jun 2012 07:46:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.53.212 with HTTP; Thu, 7 Jun 2012 07:46:18 -0700 (PDT)
In-Reply-To: <A2F8EA1D-12C9-4B15-854B-88D2EE83ED35@dominion.thruhere.net>
References: <cover.1339078729.git.ross.burton@intel.com>
	<5afc9f367cc3224e82bbe59fe9bda14f504b45c0.1339078729.git.ross.burton@intel.com>
	<A2F8EA1D-12C9-4B15-854B-88D2EE83ED35@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jun 2012 15:46:18 +0100
Message-ID: <CAJTo0Lbwo_NaBsqwwHGbgYnUhNEJSXj-q9t4BR8PYe9vaWeb=Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkooFPN3i2SHBf8y51H/U4hCdhX+zSKdaJ8VEd6iz+sixtOJORy/DsNM6kuTz30W/4KTp20
Subject: Re: [PATCH 1/3] connman: respect the 3g feature and enable/disable ofono support
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
X-List-Received-Date: Thu, 07 Jun 2012 14:57:10 -0000
Content-Type: text/plain; charset=UTF-8

On 7 June 2012 15:33, Koen Kooi <koen@dominion.thruhere.net> wrote:
> This one is missing a PR bump

Whoops, fixed and re-pushed.

Ross


