Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 36D1B61B13
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Mar 2020 08:47:35 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v4so7291330wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Mar 2020 00:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ht8ps6nQmdG9+Wbp9lqyigkhaFomfprZ73e/el5r9SE=;
	b=kFw1zMFAg9CV4a+36hDzT6FN8uyyUcuJl0gYWuQFjTIlaAYKnT0h8Td5BS3TnuyWvJ
	0Q2YdafV9lIPWvwIOex+otxmPfkhvJPsj1IUSuxPs9QrdbKGJU9E8ZFezBasLlXRgh2h
	LyJXIJUuLtfWwlus7hTXBiTfxQoD/jtQzDmmVWipFMZtg5QMYMuppd6jwgafDxcyhU8b
	7zAaaN5k5JwAVrcfFj23fQ7CT93/S7DMpIYGFg9RwDdWO9+mPm0u2lWeUMddNP46gRc+
	zpJ4vLHlvzHAA4sWCO8VNJ1/p2U/IVSsX8MAGc+J09GFcvbiRPZ88WzOtSCUyzjb9r8V
	/wNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ht8ps6nQmdG9+Wbp9lqyigkhaFomfprZ73e/el5r9SE=;
	b=Ms8/WznuM9tzfE9/+Qd56U7vDI9rE/CpE81TuNUaKn8uYtqpZCD3GNdtN6IyL6WKpF
	PQpfuK2GECaeEPd5VtqZhCPV0Ef0Jt5/Uwl3mTU0PHwaCtO9cEEScwEzPopZWlD65LAV
	UW7A/8po0eI4GYpO96Vk4m/jiJ7q+RCJzU+k6HKgtY51E61kMrDRbMc8ALfmfj0H1WpV
	Rea9x3In2ke7CFvJ4LIG6NWSOkMSTfKKxt5J1p4pjxWT33U7PIQb4FRSadl0NMeU/0+d
	sV+mGc+GfEaz2Go8HOEj4KxSCoNMRNWttb6rVmQCh+7NO7ipGsgPxiJAapK8zpNYxpfz
	3Yhw==
X-Gm-Message-State: ANhLgQ25X2fTsT8u9nNErbU4KPiSOsxCqYNLZrwME5JT6hDnU6Bzv5I2
	jAgG7t8WnV71hooo7XkmUGM=
X-Google-Smtp-Source: ADFU+vsgq20qYH5BTWkLGRL4JuKMcPttC1uvnDH982uLHRCN8AOpUy7+lzgbyvy1YtR46LKWAEgt6A==
X-Received: by 2002:a5d:674c:: with SMTP id l12mr14868701wrw.351.1583657256625;
	Sun, 08 Mar 2020 00:47:36 -0800 (PST)
Received: from md2pfrec.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch.
	[82.192.240.69])
	by smtp.gmail.com with ESMTPSA id c3sm5143557wrw.95.2020.03.08.00.47.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 00:47:36 -0800 (PST)
Message-ID: <36f700e8bdf668d7e727a3b3afdfde2cdd1b1808.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 08 Mar 2020 09:47:34 +0100
In-Reply-To: <61c89136e75765e8cb188bf16b5fddd7ff28c8b3.camel@linuxfoundation.org>
References: <b73e07036162eab111213d9d3bd14c7436733039.camel@gmail.com>
	<8718ce405436564b3ad55fa52046e5e55ee562dd.camel@linuxfoundation.org>
	<06f78962af6ad632793a533a22d8f1b91e5a50fc.camel@gmail.com>
	<61c89136e75765e8cb188bf16b5fddd7ff28c8b3.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Extensible SDK improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Mar 2020 08:47:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Richard,

We are going to handle that in our own layer. That's fine. Thank you
for the timely clarification anyway.

Regards,
Adrian 

On Sat, 2020-03-07 at 16:20 +0000, Richard Purdie wrote:
> On Sat, 2020-03-07 at 15:55 +0100, Adrian Freihofer wrote:
> > On Sat, 2020-03-07 at 12:40 +0000, Richard Purdie wrote:
> > > On Sat, 2020-03-07 at 12:54 +0100, Adrian Freihofer wrote:
> > > > Hi Richard,
> > > > 
> > > > We have found two already supported ways to copy variables from
> > > > the
> > > > bitbake environment local.conf to the eSDK local.conf
> > > > 
> > > > If a variable is defined in the local.conf bitbake environment,
> > > > SDK_LOCAL_CONF_WHITELIST and SDK_LOCAL_CONF_BLACKLIST can be used
> > > > to
> > > > add it to the local.conf eSDK file.
> > > > 
> > > > If a variable should be statically defined for the eSDK but not
> > > > for
> > > > the
> > > > bitbake environment, sdk-extra.conf is useful.
> > > > 
> > > > Now we would like to add a third way to add variables which are
> > > > dynamically calculated by bitbake but need to be statically added
> > > > to
> > > > the eSDK local.conf. For example we would like to support
> > > > something
> > > > like that:
> > > > 
> > > > def get_version_from_git(d):
> > > >     version = d.getVar("GIT_VERSION", True)
> > > >     if version:
> > > >         return version                    # runs in eSDK
> > > >     else:
> > > >         return bb.process.run("git...     # runs in bitbake
> > > > 
> > > > GIT_VERSION := "${@get_version_from_git(d)}"
> > > > 
> > > > SDK_LOCAL_CONF_EXTRALIST_append = " GIT_VERSION"
> > > 
> > > This worries me a bit since it means the eSDK and the "real" build
> > > can
> > > behave differently. I appreciate that can happen even with the
> > > other
> > > variables and means of setting them but this takes it to a new
> > > level.
> > > 
> > That I understand. The usage of the SDK_LOCAL_CONF_EXTRALIST would be
> > very specific. Wrong usage would lead to a broken sstate in the eSDK.
> > 
> > > Ultimately I think we're aiming to have normal builds convert into
> > > an
> > > eSDK and vice versa more easily. This seems to pull us further away
> > > from that :/.
> > > 
> > > What is the reasoning for having them behaving differently?
> > 
> > Our goal is to equate the eSDK behavior with the behavior of the real
> > build, also for the example with the GIT_VERSION, which bitbake and
> > git
> > will dynamically evaluate at eSDK build time.
> > 
> > Suppose we want to compile the GIT_VERSION (last tag) from poky
> > without
> > any manual steps into the firmware. bitbake can simply call
> > 
> > $ describe git --tags --dirty
> > uninative-2,8-74-g56446f4570-dirty
> > 
> > With Bitbake the variable can change. But in eSDK the GIT_VERSION
> > must
> > be a constant. The above function behaves like a constant if
> > GIT_VERSION is defined in the local.conf for example. But it has a
> > dynamic behavior if GIT_VERSION is undefined. The only missing part
> > in
> > the current Poky, is a way to automatically write the value to the
> > local.conf of the eSDK. I don't think this would be much different
> > than
> > the already existing sdk-extra.conf file.
> 
> I've been thinking about this further. Why is any of this in local.conf
> in the first place?
> 
> I'd suggest the bulk of it should be in your distro or class files?
> 
> I understand we do need some simple changes to local.conf in many cases
> but any complex logic really should not be there. The above does look
> like more complex logic to me...
> 
> I'm therefore leaning towards saying no to this patch, its just going
> to cause us problems in the future.
> 
> Cheers,
> 
> Richard
> 
> 
> 


