Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TEMk2-00015c-Ue
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 18:03:11 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Sep 2012 08:50:28 -0700
Received: by oagn9 with SMTP id n9so1206614oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 08:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=KJ7olHyqNVThRNXi3OJI2KO7NubVnkRgkB2DUAcOPKo=;
	b=mfyhKPa4T0F2EpOHW55k3y/jSC3H2XtdVJYc/AQSTB4Lv6xdFiF0feQpriMPPC2Hji
	1/v72VPt60KSwZ3PwJW1hS35iNa1/qs4C+sNWQozQPBtsm8PL/Q8EA52daP/wDo8jIjk
	p8dmFlqFEVmN3z3gxztj2h5Jel+ONOpzbShxsRITU741Af3OmEJbhtShIQHPXp1Q1yR3
	xiSYBr58VLEgmxLEr6xoJ3RLsZjoI1y5q+vzNdjj0JOHgMAs1SzXNiT9MqYIFEFiYXN2
	RJCx63xe6E4XOuAb7wKBzJnnEpEaakSf9Y1tZgEgT9t993oyIcIJKWHLwTlYFWRXtjYk
	KkYQ==
Received: by 10.60.28.162 with SMTP id c2mr3460951oeh.3.1348069825366; Wed, 19
	Sep 2012 08:50:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 19 Sep 2012 08:50:05 -0700 (PDT)
In-Reply-To: <5059E893.1060300@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<949436f21dca1d0f73ff55f2692d8c1459657fa2.1348052899.git.laurentiu.palcu@intel.com>
	<CAJTo0LafLwJxBi4eG_CF+iviJbPT4HwtDdkssCAGeOgzv1t2XQ@mail.gmail.com>
	<5059E893.1060300@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Sep 2012 16:50:05 +0100
Message-ID: <CAJTo0Laae2ZaE+8E_Co3rUQbYtQOtK41wGtBi8sRdWDWnXzjDg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQkMOsN7bg4CBOyGKwEYSbn4T/8xpgDqWgwWP9VTuC+dgsqR9w3OOJGYNa0rJAq0/T62CGrg
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 2/7] image.bbclass: run postinst scripts once, at rootfs time
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
X-List-Received-Date: Wed, 19 Sep 2012 16:03:11 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2012 16:45, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> I'm a little confused here... Technically, when the postprocess hooks
> are executed all the postinstall scripts were already executed. Ideally,
> the run-once scripts are created from inside the postinst scriptlets
> themselves. So, I don't really understand why using the postprocess hook
> isn't safe. Can you please elaborate?

My concern (and it's just a hunch) is that there could be a
post-process hook running before the intercepts are run which could be
expecting the post install phase to have been completed.  With
intercepts a portion of the post-install phase is happening later than
they previously did, so they haven't completely been ran yet.

Ross


