Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TEKeZ-0007Ox-Lk
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 15:49:23 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Sep 2012 06:36:23 -0700
Received: by obblz20 with SMTP id lz20so1063774obb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 06:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=pJKS+vh5M7G8/TXHtGmMVD+xMxqUeUrESI8TLoM80RE=;
	b=LnFN1K7rUeNRSw/gZbNy/aLWQBxADHFB8GceqYNVcgi2J8chb/ZlWyH6PppF3SehWw
	tgyTsocjmbs37qZ6z2xgW5MnU9tx+8SPseKAV5oD+Fz9rw4V3WomymSk9yKNiHumdIrd
	6xaonjSPYQ3KfTP0ToZYeVM+s5VXtE89devRLyQ7OJEGWkROidxhXZbTcGHCz7vQVsny
	6gGHGA5Xzk7vDudPsNgw9N+IKVAtToIGmSo0MuDORqw53kHAoyFSdedcjSmDaDLAxH46
	XM7xIeJtovLOpYXRaAoHcdBTBYO7sAqlxqqqYNq1Fnp430mtFU3rfKSSpgH1/5vLeTls
	SRsA==
Received: by 10.182.124.102 with SMTP id mh6mr2963983obb.48.1348061794368;
	Wed, 19 Sep 2012 06:36:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 19 Sep 2012 06:36:14 -0700 (PDT)
In-Reply-To: <854e4261283991cdc56f176c6f97dee9acf718fd.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<854e4261283991cdc56f176c6f97dee9acf718fd.1348052899.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Sep 2012 14:36:14 +0100
Message-ID: <CAJTo0La4o60k728vHB11Kv8yae4KpMStSS9iq9WLBCGzDc3ZXQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQnWk0yrYnUt344278JGEqLB3TbrwEUudrccrtSijkaofBZ2y0dEjKWYwADHlyUL5h3JXytF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 6/7] sato-icon-theme: make use of the gtk-icon-cache postinst scriptlet
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
X-List-Received-Date: Wed, 19 Sep 2012 13:49:23 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2012 12:49, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>  SECTION = "x11"
> -DEPENDS = ""
> +DEPENDS = "gtk+-native"

This recipe doesn't directly need gtk+-native, the class does and that
already adds gtk+-native to the dependencies.

Ross


