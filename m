Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCtbv-0002kJ-RF
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 16:17:03 +0100
Received: by mail-ve0-f172.google.com with SMTP id cz11so5797855veb.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 07:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=hAnIwW1D135/PgJ5xMv1PBacEzdC5FKxI9qXuGCtyMU=;
	b=kcu++llgfX3qQuUpLDZ7/CTy2HD5R215MFH4lBQSqhccD9do/iQlyCVFlFXp25/BqS
	30REr5wLxvyW/ZgjD82aRbY6aZN8bM3dBY0rldEkBGBHzRYOk/NgV+NdYrkc2OXSrs5M
	M368tZAh36k/1OFo1uhtvuC90i5RwGwTAyp2F/7d9q3EclLg9RpgCn2j4Br3nL2/4Y1/
	HQemRn8vHYNc9VLwrWE52F7yusm7ezRM8lbXfpvekZz+bR+bW3F6n6M8TO8ep6kBx3Vj
	zytsuMgExXrZfbaVJ62DlJ/yZdYMNQOjaCj9g60B+jS8tRiNJoeVoARoUtvnTNYDL9TY
	YXqg==
X-Received: by 10.52.69.74 with SMTP id c10mr8476848vdu.3.1362495630120; Tue,
	05 Mar 2013 07:00:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Tue, 5 Mar 2013 07:00:10 -0800 (PST)
In-Reply-To: <1362495026.22501.129.camel@phil-desktop.brightsign>
References: <1362494304-10179-1-git-send-email-laurentiu.palcu@intel.com>
	<1362494304-10179-2-git-send-email-laurentiu.palcu@intel.com>
	<1362495026.22501.129.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Mar 2013 15:00:10 +0000
Message-ID: <CAJTo0LbDi_P7t1Pof0UGLfKzFxnxsOi4ATR43x8KUVe9=Q44NA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQnxYAsoRCb8qixkACZVccTxIjGUINDeH0VJjPByvGxfiEUSCddOXxvr4wTe024/KB0l1hZd
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Tue, 05 Mar 2013 15:17:05 -0000
Content-Type: text/plain; charset=UTF-8

Man, Phil was quick today.  I'll throw away my draft and reply to this
instead...

On 5 March 2013 14:50, Phil Blundell <pb@pbcl.net> wrote:
>> -# for mesa-dri and mesa-xlib
>> +# for mesa and mesa-xlib
>>  FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
>
> Presumably you don't need that anymore.

I thought I had this fixed a month ago, but obviously it didn't get
merged - probably lost in the ELC madness.

>> -# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
>> +# this needs to be lower than -1 because all mesa have -1 and git version has highest PV, but shouldn't be default
>>  DEFAULT_PREFERENCE = "-2"
>
> Is that comment still true?

I was just saying to Laurentiu off-list that only mesa_git should have
a preference of -1, as there isn't mesa-dri/mesa-xlib to complicate
matters anymore.

> Also, the commit message for this patch is exceptionally terse.  Please
> explain why this renaming is a desirable thing.

It's desirable because "dri" is redundant, there isn't any
alternative.  It's a build of mesa, so let's call it mesa.

Ross


