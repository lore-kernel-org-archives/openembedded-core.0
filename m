Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QILUh-0000fT-PB
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 15:54:59 +0200
Received: by vxd7 with SMTP id 7so4064194vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 06:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=f3jSkxjz+mj4iWZem+bjk6RpifP6DyNyPQKmhWYRTvk=;
	b=gUHDEKfDxdfv2horleY+GmkZv5e/5y60YGZKikA/iKsA/VjSpnlzy7ReU9nmeNjyLa
	XQPxUBJX1TF3hmp0gVaUP1iVA1QoXAUhWhAv+1upsVO8Vjq0Pq/3R1mr+n+DwWOf/VTR
	gEV4UVhcR5DXQVIvcKve68YHI9DIpbgM/Okq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=rQrDV2VzkEnOpkwHHQizOnUUnXr3g3bWfjYoUX+WKtX2shUvC8I6TifHism/nKCErX
	H4FzSRAneJHD7OTV6jmgcueEggIz44LzxfF2TbFMH+kdYhLQoXfXxb2QycrfvSE8UAIP
	bionTGqMyKOCZJk70rXEr8XaS/Lv8yRlA0Rdg=
Received: by 10.52.77.3 with SMTP id o3mr4854113vdw.101.1304689938211; Fri, 06
	May 2011 06:52:18 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.114.233 with HTTP; Fri, 6 May 2011 06:51:58 -0700 (PDT)
In-Reply-To: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 6 May 2011 06:51:58 -0700
X-Google-Sender-Auth: Y2dJcOXnubB6yABnXrg1RRrHATQ
Message-ID: <BANLkTimvbbU4yx_aWhaKp0DvYgV1mH-9pg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 13:55:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 6, 2011 at 6:39 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> And related to this: how do I get the "installed but not packaged" output back? The bitbake logging changes are hiding it now, which is counterproductive.

Could change those messages from info to warnings, then they'd show up.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


