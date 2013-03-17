Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UH3HB-000751-0s
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Mar 2013 03:24:50 +0100
Received: by mail-vc0-f181.google.com with SMTP id hv10so2193305vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2013 19:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=rdw69qmocyqkfyBLQN/g7pd63iQPJPz1u3gCSO4JigI=;
	b=Wfu6LXlNYcBqJUxkdtvxYU3p+bBi+4uk2zuTBnhZO0vSX+2wMUKezbNeBF+E8d3kdL
	PxAtJYiMWImElPOYoa82YI4RSiT8dd/CAGjUsb2ZEkBiZhn1wIoLYwtOoK924MD4CJUs
	DLCoJ02LEDaxKkoW06O+soGY2v54oMDck0/3EugsXbIeifix68TUB9u+HvIwxSssxZbn
	7d746Ho86osxfBmINarepaZinu2Txm/wnnHvLDP8X6MuaCwjERflHKxHJ8zP15roFboK
	WIyQDNyvxyhbUaMAD855syZmOKUmd5CsManTWUXcHM1/hn+WeCtVpX9P0rXrV7XpUzdy
	0Gew==
X-Received: by 10.52.155.5 with SMTP id vs5mr11724736vdb.24.1363486064970;
	Sat, 16 Mar 2013 19:07:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Sat, 16 Mar 2013 19:07:24 -0700 (PDT)
In-Reply-To: <CAJTo0LZdYx9RLJ9an7LnALUOL5PkeUapnrMA5GyiDROcgwXbKw@mail.gmail.com>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
	<1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
	<20130312070053.GE9724@jama.dyndns-home.com>
	<CAJTo0LZtUg+fUrLd6sVfSk1gQrauyq60ukMg5jh-_kcgeaK0Lg@mail.gmail.com>
	<20130312100713.GJ9724@jama.dyndns-home.com>
	<CAJTo0LZdYx9RLJ9an7LnALUOL5PkeUapnrMA5GyiDROcgwXbKw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 16 Mar 2013 19:07:24 -0700
Message-ID: <CAJTo0Laeywb_p6L974KGdxd4ei1DOO+EJv292sRVaruT9gN_yA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmeUPNZdWkVdJYNM2zUEws9RmoZ6zLDJkqPnVw42uB/Ab9h+BKQ5HPxR3MgtmLXkEoV6OSV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bluez5: new package for v5.3
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
X-List-Received-Date: Sun, 17 Mar 2013 02:24:52 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2013 08:13, Burton, Ross <ross.burton@intel.com> wrote:
>> Now they need to refine RREPLACES/RCONFLICTS/RPROVIDES combo in distro
>> config too when they do explicit decision to change bluez version.
>
> Yes, so bluez4 and bluez5 should explicitly conflict each other.  This
> should be be done.

Chatted with Saul and we concluded that the correct dependencies here
are RCONFLICTS and RREPLACES.  No PROVIDES as they are not
interchangeable, but without the replaces we expect that the package
manager will error out instead of removing bluez4 when the rest of the
system moves from bluez4 to bluez5.

Ross


