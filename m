Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0Dij-0003uz-Ev
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:07:49 +0100
Received: from mail-qe0-f69.google.com ([209.85.128.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 Jan 2013 07:50:31 -0800
Received: by mail-qe0-f69.google.com with SMTP id 7so664820qeb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 07:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=dmaiJAQAC+o2H55ErboNag7wkcik1q2HoiX+wIZN4zw=;
	b=duxtx+wQKT4cH7AuT4KzCdbEFNZl0hu+Mm6v6M3GIJEaskaVbxLj0JmR4nqaLfAsTP
	LHElC7hw2i8iOJBBeoC8ktQLsN7e66CE4BUJ8m8vyVjflhUj+wH4htHZN/ScPipHpBcC
	GEsnBQEeNhD9KBahvrdTHS8Y5x8O5fiX6J4YpoKG3SCbHHJAEbWdF79RWOX59xjPjngh
	jc8sEwEaAjjaU8vI49jMPJRlxlkDAQPj+TGrwzwljrOshFWfuXVHaY2xGcUW8Q5PRVsR
	mZD8dRyoW/qN3SblWvOqnJlgEvZgHMOM2ygP/qv8n31frpnk2DiXp4ni49WPp2ww+5L/
	0wBw==
X-Received: by 10.52.21.175 with SMTP id w15mr1263465vde.100.1359474702287;
	Tue, 29 Jan 2013 07:51:42 -0800 (PST)
X-Received: by 10.52.21.175 with SMTP id w15mr1263460vde.100.1359474702179;
	Tue, 29 Jan 2013 07:51:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Tue, 29 Jan 2013 07:51:22 -0800 (PST)
In-Reply-To: <1359473084-592-3-git-send-email-radu.moisan@intel.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
	<1359473084-592-3-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Jan 2013 15:51:22 +0000
Message-ID: <CAJTo0LbgsA2j1piyLZVpk4cQSt_40r4W3s24m10bWHn_Vno8Wg@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQnC5BpXoPtv4XaxYBvUCFQENvltDFj/y7J6JZmoN6r2syFyShNjB9jN+F1Du8eoluSALvXwkTPbeJBj2YDZUkZXQiKQvk4mKP6W2MeKBTdjaN+BEas6fLUpioJ40BNhDZ5OVEOxsUnhPN8uQ4oApfrAkslwtqSHYhXjSfefO9WXehB0NgHO5d/2pubs6eE197NT0IdJ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] avahi: Remove -systemd postfix
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
X-List-Received-Date: Tue, 29 Jan 2013 16:07:49 -0000
Content-Type: text/plain; charset=UTF-8

On 29 January 2013 15:24, Radu Moisan <radu.moisan@intel.com> wrote:
>-RDEPENDS_avahi-systemd = "avahi-daemon"
> +RDEPENDS_avahi = "avahi-daemon"

The avahi package isn't really used, so this chunk should just be deleted.

Ross


