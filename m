Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T71k2-0000U3-6q
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 12:12:52 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 03:00:22 -0700
Received: by obblz20 with SMTP id lz20so2904161obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 03:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=bSIejE2O+sZ5Of5ZurxD0BJCVFFeoVuKOgFmwqRjy0k=;
	b=JyL97VuWSjNZXVSae/91a5v+cSQvs86T93UUTcnrqOLxY40FUuIs/aUUWaXbPvuGL0
	+ER/6jvAGgzNHgIM0tEo2N3h8qn2Uku8cwjFkoOyFfVwlBjlXOaiRDvmpRwv/3jrmJX8
	t1EnLgmuF+nj3uZ93JpPrFq38W1t2BAcmM+DIUrP4y9DnYXvgWtjynhMph0y1EMrgDwk
	MStwANX6tqjlVtVY26dsQjD1ySNbJewegJixCYjrkfUcDrQuEZFZ0LVEv+lDo6q67nBD
	UsBkH9ubnsSgKc3th/7UWullGa/FX6rBa5cfSsmt++s9U71wq6FtYsG2WSRAG6ln45aA
	sjUQ==
Received: by 10.60.30.168 with SMTP id t8mr3697536oeh.89.1346320821789; Thu,
	30 Aug 2012 03:00:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 30 Aug 2012 03:00:01 -0700 (PDT)
In-Reply-To: <1346278937.4396.57.camel@x121e.pbcl.net>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Aug 2012 11:00:01 +0100
Message-ID: <CAJTo0LbxGJdx7fq3O0LngwsR1Sf_jpOytYJ89XJWqLePZduu3A@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQmgW52qY4msfG8QmgZ8g5gognZzg/7gNc638Iz674ptZVwgxYpnp/y9KnPQ0pfm1nINAATL
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Thu, 30 Aug 2012 10:12:52 -0000
Content-Type: text/plain; charset=UTF-8

On 29 August 2012 23:22, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-08-29 at 22:50 +0100, Burton, Ross wrote:
>> I'm curious if the people who want / and /usr on separate partitions
>> that Phil refers to are a hypothetical group of people, or people who
>> can chime in with their opinion.
>
> As far as I know, only Intel have ever expressed any real interest in
> having this feature work.  My recollection is that there are some
> supposed "carrier grade" systems where this is, for whatever reason, a
> requirement.  There's been some previous discussion on the list, see for
> example:

The interesting mail in that thread is
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/017373.html,
where Mark Hatle from Wind River not Intel (yeah, okay...) cites
carrier grade blade systems.  Then again I've had a few years away
from OE, and I've no idea what the "micro" system referred to in later
mails is.

Considering the modern oe-core boot rapidly reaches udev and thus can
silently break in subtle way with /usr unmounted, I'm not entirely
happy with claiming to support separate partitions unless you define
support as just "gets to a shell".

Ross


