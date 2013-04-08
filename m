Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPFWZ-0002Hm-AY
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 19:06:36 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so3965748wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 09:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=fiyrjqzQkVqtUZ3JABJGVa8CSdoq2bLqu/t9Zf+OGVY=;
	b=X48vkWESMmr9W+c26tXDY0kTRRLyk+197gUPumTJqa7qMYuvcxjwt+EVtUaUOoYXc/
	D54/qxgXjKYceFto+a+iePVa6kUaiSsOE2/nP7eCcyIFg20eqZsUhwH/f7ke9nRl97gS
	wUolK4aUYvt1Rqcd6MF9CclJZ4qJwIm2y6v9PVVaqwQPMRk1PTmoq4CQGHV9Uk1mf2/C
	VaXg0yZz07qEoXwfGBH9Tdvq8mmyM5Ryk+X0jqc+ngkxRPXTEJeTFLKKN/8iLkVeg5rn
	8XQ4n7ne9StYmCcWQ+KHAm7FfvhSVHVjWnnUXT2WinROwrqpPher7pjFU+y0C7gkaYI+
	UGQQ==
MIME-Version: 1.0
X-Received: by 10.194.178.100 with SMTP id cx4mr32951222wjc.47.1365439752527; 
	Mon, 08 Apr 2013 09:49:12 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Mon, 8 Apr 2013 09:49:12 -0700 (PDT)
In-Reply-To: <1365176133-59915-1-git-send-email-maxin.john@enea.com>
References: <1365176133-59915-1-git-send-email-maxin.john@enea.com>
Date: Mon, 8 Apr 2013 12:49:12 -0400
Message-ID: <CAHUNapRZKmLop8di8doXCw-gwiXvtJs6R07Y+Mh3Vxs3NFDOKQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: maxin.john@enea.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample: Add info about -ptest package group
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
X-List-Received-Date: Mon, 08 Apr 2013 17:06:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 5, 2013 at 11:35 AM, <maxin.john@enea.com> wrote:
> +#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
> +#                     (useful if you want to run the package test suites)

Is there a simple way to discover which packages are ptest-enabled?


