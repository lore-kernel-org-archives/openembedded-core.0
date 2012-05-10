Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSWRW-0003Vi-FE
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 18:42:18 +0200
Received: by eaal1 with SMTP id l1so616976eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=dHlKRZr873rElXBPhhFbGj0lwRzHbiA9LvmJOztd+M4=;
	b=M7kWWYFXKs74tCwbwiVrlLIPFRr+RNQ/GW6M0t0ebQcXDsm9uO1xavDY4RPHBNhJ7+
	Ho/XdLNTJjzipM1qkTYDIr5/d1WNmsH+IhqZopafWViGrETD+yapgbnQVmxWsu0tyy2S
	R72jLGYzkNMFB574/e43UD0Ly+vG45w8jX7Bi8P+kxh/h+LsijctHc5RbV40PT5eySXt
	jx3TNAshpc5wLKJOw9JvCD/rJOF5kAzKQLxV3KjmPnA9PA4dOKwZLhIgTN9ARVmyN/xB
	lIJ0SAnPxOtv7oNY4j6lpZ7uGiMt+YnDZQ16pxIll+4F/gf+IEzrvTNPGMEdNYgkvrdK
	NQrw==
Received: by 10.213.115.193 with SMTP id j1mr1572266ebq.141.1336667544234;
	Thu, 10 May 2012 09:32:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 09:31:54 -0700 (PDT)
In-Reply-To: <4FABE8F1.1060909@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
	<CABcZANkTB3_QkBcMycY9Z+pZndz7JmOUAksvsQSSiwhHE7vZnQ@mail.gmail.com>
	<4FAB145D.4080001@linux.intel.com>
	<CABcZANkk1HSS1SeJK-qpALZukc4L8sDKozf-A08NRTDOw+dGKg@mail.gmail.com>
	<4FAB28B5.106@linux.intel.com> <4FAB31B6.1090307@linux.intel.com>
	<4FAB32A2.1020508@linux.intel.com>
	<CAMKF1sq1HM6Khi-G+OGrPFzuiXXuBkjvzWE6q3+DPf828mMHGg@mail.gmail.com>
	<4FABE8F1.1060909@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 09:31:54 -0700
Message-ID: <CAMKF1spgLvm1ALkAvkTqbY0S2Nfh7fXba-eoH8QfyAJs_Jes4g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/3] Shared state for all !
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
X-List-Received-Date: Thu, 10 May 2012 16:42:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 10, 2012 at 9:12 AM, Joshua Lock <josh@linux.intel.com> wrote:
>
> SSTATE_MIRRORS does this nicely and since it uses the fetcher code that can
> be a file:// URI or other.

yes figured yesterday night when I was thinking about it loud


