Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UFi1H-0003U5-PK
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 10:31:01 +0100
Received: by mail-ee0-f44.google.com with SMTP id l10so340355eei.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 02:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=KxhQrXp70SdT0J2o5GR1UyeT25umdw/KeRbW0UXe9xU=;
	b=NtDKPcZ6nTX4qzrQ1puBL+cNP3L0+5nbyXpQgVXddrgh78zgm70c3nx0enZ+IO7LgX
	fToFcaaaVletpD8XVH85j2z4c6QUeIW5MXWLDaGsRaQn3RM2I75H6ytKuqokOw+HZ/j/
	E5M96w4JBux4xWvlAjixzo9z/YkjP6jWq0hV4FTXtVf7eOLHNcAp/WbAsXcfbq7Vl/KY
	IpYMFR0Eapg6BbOH4Sw/52Ic3XXnWMN8tpU6tYrnrPSPUHuIkJqu8yzJVaLQSfi0KrZL
	eW1KKpcpu0k2nHfiO5hBXpHhS99UfXqcNVqHMzm6Aaso7zAMcH9rHC7DbVE/bXQ7Te+K
	ELkg==
X-Received: by 10.14.110.68 with SMTP id t44mr7342114eeg.25.1363166047460;
	Wed, 13 Mar 2013 02:14:07 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d9f7:1f4c:8d6f:e720?
	([2001:610:612:0:d9f7:1f4c:8d6f:e720])
	by mx.google.com with ESMTPS id k7sm34630130een.8.2013.03.13.02.14.05
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 02:14:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LZdYx9RLJ9an7LnALUOL5PkeUapnrMA5GyiDROcgwXbKw@mail.gmail.com>
Date: Wed, 13 Mar 2013 10:14:05 +0100
Message-Id: <923A8385-1063-4C78-92ED-9441F19E338B@dominion.thruhere.net>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
	<1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
	<20130312070053.GE9724@jama.dyndns-home.com>
	<CAJTo0LZtUg+fUrLd6sVfSk1gQrauyq60ukMg5jh-_kcgeaK0Lg@mail.gmail.com>
	<20130312100713.GJ9724@jama.dyndns-home.com>
	<CAJTo0LZdYx9RLJ9an7LnALUOL5PkeUapnrMA5GyiDROcgwXbKw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlx31UtmdzSv8LO/YubsCfTGfuYUqKPQY5Dq86dO1EeY3Zgb3G6TfPw56wnEZetjgKGc74Q
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 13 Mar 2013 09:31:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 mrt. 2013, om 16:13 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 12 March 2013 03:07, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> You can't just upgrade from bluez4 to bluez5 like you'd upgrade from
>>> glib 2.10 to glib 2.12 - the API was totally rewritten and the =
reason
>>> that we're maintaining both is because removing bluez4 would mean
>>> removing bluetooth support is most of the integration points =
(connman
>>> being the notable exception).
>>>=20
>>> A distro upgrades from 4 to 5 when they've made the explicit =
decision
>>> to do so, and changes all of their dependencies to reflect this.
>>=20
>> That would work with bluez_5.3 with negative D_P too, wouldn't it?
>>=20
>> Now they need to refine RREPLACES/RCONFLICTS/RPROVIDES combo in =
distro
>> config too when they do explicit decision to change bluez version.
>=20
> Yes, so bluez4 and bluez5 should explicitly conflict each other.  This
> should be be done.
>=20
> Obviously both approaches are valid.  the approach of major-in-name
> was taken so that packages could depend on the version that they need
> for clarity.  As the linkage is over DBus there won't be any shlib
> dependencies, so it would be simple to build an image which contained
> bluezN but was using the bluezM APIs.

And I remember the pain and churn when bluez4 was renamed to bluez. I =
don't want to go through that again.=20

At the risk of sounding snarky while making a real recommendation: Why =
not do it oe-core style and completely remove bluez 4.x at the start of =
the 1.5 cycle and work through the breakage?  I guess that means I =
volunteer to help with that :)=


