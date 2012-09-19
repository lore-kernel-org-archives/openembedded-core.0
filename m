Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TEMBP-00008K-F7
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 17:27:27 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Sep 2012 08:14:29 -0700
Received: by oagn9 with SMTP id n9so1163374oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 08:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Oa8slfKjwMkaOfextmruC00in+nVljBi4LsC7nkntX4=;
	b=ZHUFLL3RPM3Rg0F9/ITqpbhonJZeO0Fx3zz6ukL5Kfqc3icsCXYL7imgZZdfI74RMB
	Zs8aYdrhHsoTZwjPuonyBR0RsAyGvjtCVvPv0D31G/bFgVdnWQ4qjCB4+gaz6H6y7ofd
	4HFOHmqp8lw3w3XvJbiuaV/KTRwqYUbYk3fhR7dpz6OM3mMAcbVjmgsvwWDJix5SCZ45
	SO3lt3GkS3+F63G39wyVZvq4caG1n98w4wSuRM7Djdkl32B3sXZLlvRX/q7x8yA6WhJe
	zYeFYXq6eEjlep9fgR7JJ2/F7Yk4+M8wJ9cgsoiHB8QvJ7U+89uD4W1/I6bIXaebpkVr
	H2ag==
Received: by 10.60.12.106 with SMTP id x10mr3090847oeb.103.1348067680105; Wed,
	19 Sep 2012 08:14:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Wed, 19 Sep 2012 08:14:19 -0700 (PDT)
In-Reply-To: <949436f21dca1d0f73ff55f2692d8c1459657fa2.1348052899.git.laurentiu.palcu@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<949436f21dca1d0f73ff55f2692d8c1459657fa2.1348052899.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Sep 2012 16:14:19 +0100
Message-ID: <CAJTo0LafLwJxBi4eG_CF+iviJbPT4HwtDdkssCAGeOgzv1t2XQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQlX1yEYMlnb63jOkrXQYC+jT/PJnY6kIUaFx8/JYyp7ujtqgSbseqcle1eLqyDZCVyHZckn
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
X-List-Received-Date: Wed, 19 Sep 2012 15:27:30 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2012 12:49, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> +ROOTFS_POSTPROCESS_COMMAND ?= "run_intercept_scriptlets"

From other examples, it looks like this should be "run_intercept_scriptlets;"

Also whilst this is a great proof of concept, maybe it should be
integrated into image.bblcass directly instead of being a postprocess
hook?  A postprocess hook might expect the postinstall scripts to have
been ran already, which they would have been if they were not
intercepted.

Ross


