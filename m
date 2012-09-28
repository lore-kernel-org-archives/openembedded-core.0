Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1THXGI-0004Q0-CM
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 11:53:34 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2012 02:40:39 -0700
Received: by obceq6 with SMTP id eq6so2900279obc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 02:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=1KfH5TT3emFHBbrIKlk1VakQXJ8YohAgvL3Ibcl/4rw=;
	b=iU2FKmm1P6ROcCQaFfx/7uIptvOAXJU0wcmwcGbdblRoZh+1ufg3Jin2lVPEFZLev8
	rzawnKAIEKgxhUzD2mnQv5to1QGh//f6QM9iUEA/8gPLkI5Pqp8OEgpKljT7auAbt8eR
	jMoQeWJfZy+rkYXzaDrEMKEucUQqtFJX5BsT8Qas7RU5pXhAbjlj5CT4XFj5JvhS5vcW
	qUC9E66Qn0CEIqD4/VsXce0N55OtRZLdUI2EHDrJiUu7xYzdZUKw/y1U32H3UF6xbdgN
	1vZcAP2V4Y0D6TEYnHrkpQKIfeX2TpaSkcV+W1SSq8yvnUEkhbVnoNUgnCVN7lpZ3Vld
	9GNA==
Received: by 10.182.179.100 with SMTP id df4mr5440473obc.59.1348825238903;
	Fri, 28 Sep 2012 02:40:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Fri, 28 Sep 2012 02:40:18 -0700 (PDT)
In-Reply-To: <1348820316-20012-1-git-send-email-constantinx.musca@intel.com>
References: <1348820316-20012-1-git-send-email-constantinx.musca@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 28 Sep 2012 10:40:18 +0100
Message-ID: <CAJTo0LaDts7hbUCELdCvJ-Gbt1bcO-rQuYGPk744r-wUP1EFwA@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQnZhLZTbFPTYUo8jvDNdgvmF8roq+qNoEoW53P/KzW61LKzTjncHe0X+bsYjFOCBu0CGb9M
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libnss-mdns: fix mDNS resolving speed
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
X-List-Received-Date: Fri, 28 Sep 2012 09:53:34 -0000
Content-Type: text/plain; charset=UTF-8

On 28 September 2012 09:18, Constantin Musca
<constantinx.musca@intel.com> wrote:
> We need to fix the "hosts: files dns mdns4" nsswitch.conf line
> because for a .local lookup it does a DNS lookup first which will fail.
> The recommended solution is:
> hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4

Have you tested this works?  Last time I saw this worked on
(Christian, iirc) the "solution" wasn't actually working.

Ross


