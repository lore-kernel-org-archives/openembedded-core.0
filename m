Received: from mail-vb0-f43.google.com ([209.85.212.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U8Thw-0006mN-5k
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 11:48:56 +0100
Received: by mail-vb0-f43.google.com with SMTP id fs19so5609360vbb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 02:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=vWzm2KaEgI3OmTYUoPTobJu68EqC/3uOCRqOBIZ55Bk=;
	b=Lf+JkROrYMvVoB+tUAJUbzTPuL3xCBCeEu/Gz7rKXNp0RVyxpFllqCtiTo3zfDpOmJ
	ca40LiYI95yFoPJ1+j1m5uKt14JC3pLLvyQ5/fWz0JpUYRul6oNpOZAUcqhOCcrRQRlR
	d8mcf9JczTIdzy9mzhamOiS1CGyUB56n4tuARL5Zacx3gf6HJlMaO22Om2OdRdXo2YFK
	4QDhWZxXPIQR1B5iMGU8YbjB914r+5qzHQTF0caP/5IrzKW8kk3o/hIZujEpJSQqqOCa
	MPqwozzr7o1w/bkRHFshVZaCumk5ER0huqHxWt9ZxgnTLEGqeKWbNB4+RdU3QOmyuD+u
	//mA==
X-Received: by 10.52.74.34 with SMTP id q2mr26493675vdv.76.1361442763906; Thu,
	21 Feb 2013 02:32:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Thu, 21 Feb 2013 02:32:22 -0800 (PST)
In-Reply-To: <20130220231330.GY3300@jama>
References: <1361202441-22679-1-git-send-email-constantinx.musca@intel.com>
	<CAF6bG8dW=kCYM3c-_4A_hzNjiAQZjz6YKByZDjLYZR4y3j2-Aw@mail.gmail.com>
	<5124E661.5030004@intel.com>
	<CAJTo0LYmwDKSvJAUPD-PcTC2eUkgOmT67jM=7ZShVVC5JXuS-A@mail.gmail.com>
	<20130220231330.GY3300@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Feb 2013 10:32:22 +0000
Message-ID: <CAJTo0LaRrsYgXC5NnOQvxTwm=VtXR9ySaS1ky7+1uu3eoq0Xaw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQksZsZfi0d+Y51++t1Ot/ubv8mLZS/lzghknS2s5oLhHxZuRSKGocADnAqTkIJ/xa8ZfapN
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg: upgrade to 9
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
X-List-Received-Date: Thu, 21 Feb 2013 10:48:56 -0000
Content-Type: text/plain; charset=UTF-8

On 20 February 2013 23:13, Martin Jansa <martin.jansa@gmail.com> wrote:
>> But we can cherry-pick any libjpeg fixes until we've bitten the bullet
>> and integrated ruby.
>
> ruby-native is already in meta-ruby

Yes, "biting the bullet" means either committing to building WebKit in
oe-core or not.

Ross


