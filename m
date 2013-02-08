Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3mqB-0006il-FW
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:14:03 +0100
Received: by mail-ve0-f182.google.com with SMTP id ox1so3232885veb.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 03:58:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=URIbjvGYAwDWkQM0XIu3TWtHQwPo1yDZSKzA3DLU+as=;
	b=gIW4kH4eLQ7C+qHz3TxPTqLAVr+4o5rs6yYvydkTgdpM02Otkf8FROdSuz6Vj4Pe+Z
	RVoCaqd5fixs2DVU5I13bbX0O2aIq7+oztholpKophvsqBKP/o3n/XcuLVaFyf2ayWUk
	AWawJDdKTgG4PlvK2W/zsSevfP9JufoC5gkgxiz5AXX30U3QsBINugz7AMft+Ra9gbxQ
	H7KpWEn9JUnFjpR0U73X3TNyg+k1McqFGdqXl6MhgUXgsmVwO3lXmzqnE+fD5vDuHZtu
	LpeUB/Bo2YIIV5Im0U08OZ2NP09htKcgcZn0OQDoNg82IavPUasLoXI1xmCq2Xk2uo3V
	qQsQ==
X-Received: by 10.220.116.5 with SMTP id k5mr6107459vcq.55.1360324689449; Fri,
	08 Feb 2013 03:58:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 03:57:49 -0800 (PST)
In-Reply-To: <1360318544-11013-1-git-send-email-koen@dominion.thruhere.net>
References: <1360318544-11013-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 11:57:49 +0000
Message-ID: <CAJTo0Lbd9uXC9B+VTO0SgbBSksqT+5XKiUUC62YgKadmRxqqdA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnWJTeXyat+TUmmCxVu7wVGB+UjkpCLh05GlCJsToX6spsONFj8pSNebmJz0ljwR0lqLRUl
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-danny][PATCH] xf86-video-modesetting: new recipe for gma500
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
X-List-Received-Date: Fri, 08 Feb 2013 12:14:03 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2013 10:15, Koen Kooi <koen@dominion.thruhere.net> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> I am trying to use gma500 driver for the noemgd BSPs. The current best
> xf86 driver for it is modesetting. This recipe provides that
> driver.

Big changes like this are generally avoided, but this is a pretty
important recipe. Merged into danny-next, should being doing a full
test build tonight.

Ross


