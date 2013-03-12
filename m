Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UFR9o-0007I7-F5
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 16:30:31 +0100
Received: by mail-vc0-f173.google.com with SMTP id fl15so458284vcb.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 08:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=yoYQLKVoUkj2yALOuP8mXEiTTMvr16oaMDDgnqwJzqM=;
	b=hkcCkR8viUQ/bNCNpy4VqG3yshHd5Tx+bgwEf8vuKC6awD9sJauGI7Nx5NewnajaZX
	9ks8pjlpqoLNssVjz+5+0kwehKwHEDCIdvbicOpSth/MukqeTue7liP6nTyPxxCf6Jez
	CmxElOF7Owa8OUk+NGc/AgCIXgUdhTt6utgfj8UCRlJY4RGay8XWQNMrt/xlsGHajKgZ
	swfZKrOyslZ5yH3f9iDebTbRzJ7ZGtwrIDrJnHNjAGVLUApMz5VXxVP72N9/wyz1bmk9
	jBSaSlQVhiTsEy7gIKSs0TnPwhmz633hhOsXmh3jVVX3bodHw+6YehQyREttcvHCjnkT
	hV8w==
X-Received: by 10.52.155.5 with SMTP id vs5mr5753991vdb.24.1363101228543; Tue,
	12 Mar 2013 08:13:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.232.226 with HTTP; Tue, 12 Mar 2013 08:13:28 -0700 (PDT)
In-Reply-To: <20130312100713.GJ9724@jama.dyndns-home.com>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
	<1363010209-18220-3-git-send-email-cristian.iorga@intel.com>
	<20130312070053.GE9724@jama.dyndns-home.com>
	<CAJTo0LZtUg+fUrLd6sVfSk1gQrauyq60ukMg5jh-_kcgeaK0Lg@mail.gmail.com>
	<20130312100713.GJ9724@jama.dyndns-home.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Mar 2013 08:13:28 -0700
Message-ID: <CAJTo0LZdYx9RLJ9an7LnALUOL5PkeUapnrMA5GyiDROcgwXbKw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmVCfNXXBpXwRFW1ppUoXSuI4E8D0jJNhm+QC0ef9S0E2/u7rCzQu1/gN+NsfCrxG0Nyidt
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
X-List-Received-Date: Tue, 12 Mar 2013 15:30:31 -0000
Content-Type: text/plain; charset=UTF-8

On 12 March 2013 03:07, Martin Jansa <martin.jansa@gmail.com> wrote:
>> You can't just upgrade from bluez4 to bluez5 like you'd upgrade from
>> glib 2.10 to glib 2.12 - the API was totally rewritten and the reason
>> that we're maintaining both is because removing bluez4 would mean
>> removing bluetooth support is most of the integration points (connman
>> being the notable exception).
>>
>> A distro upgrades from 4 to 5 when they've made the explicit decision
>> to do so, and changes all of their dependencies to reflect this.
>
> That would work with bluez_5.3 with negative D_P too, wouldn't it?
>
> Now they need to refine RREPLACES/RCONFLICTS/RPROVIDES combo in distro
> config too when they do explicit decision to change bluez version.

Yes, so bluez4 and bluez5 should explicitly conflict each other.  This
should be be done.

Obviously both approaches are valid.  the approach of major-in-name
was taken so that packages could depend on the version that they need
for clarity.  As the linkage is over DBus there won't be any shlib
dependencies, so it would be simple to build an image which contained
bluezN but was using the bluezM APIs.

Ross


