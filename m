Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Su2ha-0000oF-7g
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 16:36:38 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 25 Jul 2012 07:25:07 -0700
Received: by ghbz12 with SMTP id z12so699412ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 07:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=tC/NXukxruxa709mD3vxESk8Pjo9YDeDPCQSHHdNpT0=;
	b=J/Bjy7K5J34o17oIKVpTcqJMBUgGzg7B4IF/4dnwZqzNj2W8PTqjCVy1bWVuyqP6yG
	PgzM+spVeGMC7po95yiHSck7BYfKLjdbV1sX8AAVEzqD/w15edC821jUN+ONApQqjT/K
	LysVyP9xRiOts5K4EGKd4KcTwInmgrNMJ16mcr/NDNIBC0wA/Otv4my+QWpeZ3pek9Zr
	E1wleLWAJFVLM98vqCj4tbpvhR7q2Ghjgl/qhwxUdbYJ+xX4DvjGVlKj/hFmLNSUKFtC
	uHm9ZqiyfPTbxPOU5WPdvBsGQARbr6Ko93cVjPQjpKnQlzUrVVufu0aI5rSltmkLZfYs
	A9kg==
Received: by 10.42.54.133 with SMTP id r5mr20588396icg.9.1343226306462; Wed,
	25 Jul 2012 07:25:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Wed, 25 Jul 2012 07:24:45 -0700 (PDT)
In-Reply-To: <1528039.fg9dttDzQG@helios>
References: <1343225031-19107-1-git-send-email-radu.moisan@intel.com>
	<E1C8B862-C08F-4098-93A4-9C7E6262038B@dominion.thruhere.net>
	<CAJTo0LbFcZYhBzgO4wEhnS4Dq+msQP9pu8Biagiy3cPGUoPGkA@mail.gmail.com>
	<1528039.fg9dttDzQG@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2012 15:24:45 +0100
Message-ID: <CAJTo0LaVmeVSj+2vOrOiv0M8Mr02ss+rmTHq641XgapT75AWyw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQkxjL4DgPFsYeS9+i25Eg9sab1tQZrmzvA5LA0y5yvY7FMs3GH/ZDueQQLALn3BgtWuXW5v
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Wed, 25 Jul 2012 14:36:38 -0000
Content-Type: text/plain; charset=UTF-8

On 25 July 2012 15:23, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Wednesday 25 July 2012 15:19:10 Burton, Ross wrote:
>> On 25 July 2012 15:17, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> > This breaks the upgrade path
>>
>> So how would the upgrade path be unbroken?  A dummy dbus-x11 package
>> that pulls in dbus, I suspect.
>
> RREPLACES_${PN} += "dbus-x11" ought to be enough...

Sweet (makes mental note)

Ross


